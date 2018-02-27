<?php

namespace App\Traits;

trait ApplicationTrait {

    public function application_cns() {
        return $this->hasMany('\App\Models\ApplicationCn', 'application_id');
    }

    public function application_crs() {
        return $this->hasMany('\App\Models\ApplicationCr', 'application_id');
    }

    public function application_pxs() {
        return $this->hasMany('\App\Models\ApplicationPx', 'application_id');
    }

    /*     * ********************************************************* */

    public function apiSendAppRequest() {
        require_once __DIR__ . '/../Models/WebServices/SendApp/autoload.php';

        $params = array(
            'soap_version' => SOAP_1_1,
            'trace' => 1,
            'exceptions' => 1,
            'cache_wsdl' => WSDL_CACHE_NONE
        );

        // A class will generated representing the service.
        // It is named after the element in the WSDL and has a method for each operation.
        $client = new \ACME_Export_POCflowPortalInterfacesStartProcessWSDL($params);
        $request = new \startExportProcess();
        $process = new \StartExportProcessIn();
        $process->setECD($this->apiSendAppGetECDData());
        $request->setStartExportProcessIn($process);
        $response = $client->startExportProcess($request);

//         Set status and notify the user
        if ($response->getStartExportProcessOut()->getErrorCode() == 0) {
            \App\Models\ApplicationNotifications::create([
                'application_id' => $this->id,
                'notif_status_id' => 2,
                'seen' => 0,
                'has_attachment' => 0,
                'message' => trans('notifications.notfication_2', ['date' => $this->created_at->addDays(2)]),
                'message_ar' => trans('notifications.notfication_2', ['date' => $this->created_at->addDays(2)])
            ]);
        }

        echo '<h1>WSDL URL</h1>';
        dump(env('API_SEND_APP_URL'));
        echo '<h1>Response</h1>';
        dump($response);
        $doc = new \DomDocument('1.0');
        $doc->preserveWhiteSpace = false;
        $doc->formatOutput = true;
        $doc->loadXML($client->__getLastRequest());
        $xml_string = $doc->saveXML();
        echo '<h1>Request message</h1>';
        echo '<textarea cols="150" rows="20" readonly>' . htmlentities($xml_string) . '</textarea>';
        \Storage::put('/api_send_app/request.wsdl', $xml_string);
        $doc = new \DomDocument('1.0');
        $doc->preserveWhiteSpace = false;
        $doc->formatOutput = true;
        $doc->loadXML($client->__getLastResponse());
        $xml_string = $doc->saveXML();
        echo '<h1>Response message</h1>';
        echo '<textarea cols="150" rows="20" readonly>' . htmlentities($xml_string) . '</textarea>';
        \Storage::put('/api_send_app/response.wsdl', $xml_string);
        dd("- End -");
    }

    public function apiSendAppGetECDData() {
        $ecd = new \ECD();
        // Sender Details
        $sender_details = new \SenderDetails();
        $sender_details->setConsigneeName($this->sd_consignee_name);
        $sender_details->setEGYCustomRefNumber($this->sd_cus_ref_num);
        $sender_details->setVATinPercent($this->sd_vat);
        $sender_details->setConsigneeAddress($this->sd_consignee_address);
        $sender_details->setRecipientCountry($this->sd_recipient_country);
        $sender_details->setRecipientName($this->sd_recipient_name);
        $sender_details->setRecipientAddress($this->sd_recipient_address);
        $sender_details->setRegistrationCustoms($this->sd_reg_custom);
        $ecd->setSenderDetails($sender_details);

        // Conseignments Details
        $conseignment_details = new \ConseignmentDetails();
        $cns = [];
        foreach ($this->application_cns as $cn_d) {
            $cn_o = new \Conseignmnet();
            $cn_o->setHSCode($cn_d->cn_hs_code_id);
            $cn_o->setQuantity($cn_d->cn_quantity);
            $cn_o->setUnitPrice($cn_d->cn_unit_price);
            $cn_o->setIsGOIECApproved('');
            $cn_o->setIsCustomApproved('');
            $cns[] = $cn_o;
        }
        $conseignment_details->setConseignments($cns);
        $conseignment_details->setConseignmentGrossWeight($this->cn_gross_weight);
        $conseignment_details->setNumberOfCommodities($this->cn_comm_num);
        $conseignment_details->setBillingINCOTerms($this->cn_billing_terms_id);
        $conseignment_details->setTypeOfCargo($this->cn_cargo_type_id);
        $ecd->setConseignmentDetails($conseignment_details);

        // Inspection Request
        $inspection_request = new \InspectionRequest();
        $inspection_request->setInspectionLocation($this->ir_inspection_loc);
        $inspection_request->setInspectionDate($this->ir_inspection_date);
        $inspection_request->setInspectionAddress($this->ir_inspection_address);
        $ecd->setInspectionRequest($inspection_request);

        // Container Details
        $container_details = new \ContainerDetails();
        $crs = [];
        foreach ($this->application_crs as $cr_d) {
            $cr_o = new \Container();
            $cr_o->setContainerType($cr_d->cr_type);
            $cr_o->setContainerNumber($cr_d->cr_num);
            $cr_o->setContainerOwner($cr_d->cr_owner);
            $cr_o->setContainerCapacity($cr_d->cr_capacity);
            $crs[] = $cr_o;
        }
        $container_details->setContainers($crs);
        $container_details->setNumberOfContainers($this->application_crs->count());
        $ecd->setContainerDetails($container_details);

        // Packaging Details
        $packaging_details = new \PackingDetails();
        $pxs = [];
        foreach ($this->application_pxs as $px_d) {
            $px_o = new \PackingList();
            $px_o->setPackagesType($px_d->px_type_id);
            $px_o->setPackageWeight($px_d->px_weight);
            $px_o->setTotalWeightPerItem('');
            $pxs[] = $px_o;
        }
        $packaging_details->setPackingLists($pxs);
        $packaging_details->setNumberOfPackages($this->application_pxs->count());
        $ecd->setPackingDetails($packaging_details);


        // Originator Details
        $originator_details = new \OriginatorDetails();
        $originator_details->setCountryOfOrigin($this->od_country);
        $ecd->setOriginatorDetails($originator_details);

        //Freight Details
        $freight_details = new \FreightDetails();
        $freight_details->setBillOfLadingNumber($this->fd_bill_num);
        $freight_details->setVesselName($this->fd_vessel_name);
        $freight_details->setCallSign($this->fd_call_sign);
        $freight_details->setIMONumber($this->fd_imo_num);
        $freight_details->setTotalWeight($this->fd_total_weight);
        $freight_details->setNetWeight($this->fd_net_weight);
        $freight_details->setNameOfFreightLine($this->fd_fr_line_id);
        $freight_details->setShippingPort($this->fd_shipping_port);
        $freight_details->setFinalDestinationPort($this->fd_final_dest);
        $freight_details->setExpectedArrivalDate($this->fd_expected_arr_date);
        $freight_details->setDateOfShipment($this->fd_shippment_date);
        $freight_details->setTripNumber($this->fd_trip_num);
        $freight_details->setFreightForwarderName($this->fd_forwarder_name);
        $freight_details->setFreightForwarderAddress($this->fd_forwarder_address);
        $freight_details->setFreightAgentName($this->fd_agent_name);
        $freight_details->setFreightAgentAddress($this->fd_agent_address);
        $ecd->setFreightDetails($freight_details);

        // Transportation Details
        $transportation_details = new \TransportationDetails();
        $transportation_details->setCarLicenseNumber($this->td_car_license);
        $transportation_details->setDriverName($this->td_driver_name);
        $transportation_details->setDriverLicense($this->td_driver_license);
        $transportation_details->setCarNetWeight($this->td_car_net_weight);
        $transportation_details->setCarTotalWeight($this->td_car_total_weight);
        $ecd->setTransportationDetails($transportation_details);

        // Attachments
        $atts = [];
        $atts[0] = new \Attachments();
        $atts[0]->setName('Agreement');
        $atts[0]->setURL(url('/images/'));
        $atts[1] = new \Attachments();
        $atts[1]->setName('ECD Invoice');
        $atts[1]->setURL(url('/images/'));
        $atts[2] = new \Attachments();
        $atts[2]->setName('INI Shipment');
        $atts[2]->setURL(url('/images/'));
        $atts[3] = new \Attachments();
        $atts[3]->setName('Pack');
        $atts[3]->setURL(url('/images/'));
        $ecd->setAttachments($atts);

        // General Info
        $ecd->setDID($this->did_num);
        return $ecd;
    }

    public function apiSendAppReponse($app) {
        return (object) ['status' => 1, 'errorCode' => 0, 'errorDescription' => 'Request Received'];
    }

    public function apiSendAppSetDIDNotify() {
        \App\Models\ApplicationNotifications::create([
            'application_id' => $this->id,
            'notif_status_id' => 1,
            'seen' => 0,
            'has_attachment' => 0,
            'message' => trans('notifications.notfication_1', ['did' => $this->did_num]),
            'message_ar' => trans('notifications.notfication_1', ['did' => $this->did_num])
        ]);
    }

    /*     * ********************************************************* */

    public function apiUpdateAppStatusRequest($did_r, $notif_status_id_r) {
        // options for ssl in php 5.6.5
        // initialize SOAP client and call web service function
        $params = array(
            'encoding' => 'UTF-8',
            'verifypeer' => false,
            'verifyhost' => false,
            'soap_version' => SOAP_1_1,
            'trace' => 1,
            'exceptions' => 1,
            'connection_timeout' => 180,
            'stream_context' => stream_context_create([
                'ssl' => [
                    'ciphers' => 'RC4-SHA',
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'crypto_method' => STREAM_CRYPTO_METHOD_TLS_CLIENT
                ]
            ]),
            'cache_wsdl' => WSDL_CACHE_NONE
        );


        $client = new \SoapClient(env('API_UPDATE_APP_STATUS_URL'), $params);

        $data = [
            'did' => $did_r,
            'notif_status_id' => $notif_status_id_r,
//            'metadata' => '',
        ];

        $response = $client->apiUpdateAppStatusResponse((object) $data);

        echo '<h1>WSDL URL</h1>';
        dump(env('API_UPDATE_APP_STATUS_URL'));
        echo '<h1>Response</h1>';
        dump($response);
        $doc = new \DomDocument('1.0');
        $doc->preserveWhiteSpace = false;
        $doc->formatOutput = true;
        $doc->loadXML($client->__getLastRequest());
        $xml_string = $doc->saveXML();
        echo '<h1>Request message</h1>';
        echo '<textarea cols="150" rows="20" readonly>' . htmlentities($xml_string) . '</textarea>';
        \Storage::put('/api_update_app_status/request.wsdl', $xml_string);
        $doc = new \DomDocument('1.0');
        $doc->preserveWhiteSpace = false;
        $doc->formatOutput = true;
        $doc->loadXML($client->__getLastResponse());
        $xml_string = $doc->saveXML();
        echo '<h1>Response message</h1>';
        echo '<textarea cols="150" rows="20" readonly>' . htmlentities($xml_string) . '</textarea>';
        \Storage::put('/api_update_app_status/response.wsdl', $xml_string);
        dd("- End -");
    }

    public function apiUpdateAppStatusResponse($data) {
        $app = \App\Models\Applications::where('did_num', $data->did)->first();
        if (!$app)
            return (object) ['status' => 0, 'errorCode' => 1, 'errorDescription' => 'Wrong DID number'];

        \App\Models\ApplicationNotifications::create([
            'application_id' => $app->id,
            'notif_status_id' => $data->notif_status_id,
            'seen' => 0,
            'has_attachment' => 0,
//            'metadata' => (isset($data->metadata)) ? $data->metadata : '',
            'message' => trans('notifications.notfication_' . $data->notif_status_id),
            'message_ar' => trans('notifications.notfication_' . $data->notif_status_id),
        ]);

        if($data->notif_status_id == '4') {
            $app->sad_num = date('ymd').rand(1000000000, 9999999999);
            $app->save();
        }
        if (isset($data->metadata)) {
            $metadata = json_decode($data->metadata, true);
            $app->update($metadata);
        }
        return (object) ['status' => 1, 'errorCode' => 0, 'errorDescription' => 'Request Received'];
    }

    /*
      public function apiSendAppGetAdjustedDataOld() {
      $data = [];
      $collect = collect($this->toArray());
      // General
      $data = $collect->filter(function ($value, $key) {
      return !in_array(substr($key, 0, 3), ['sd_', 'cn_', 'cr_', 'px_', 'ir_', 'od_', 'td_', 'fd_']) && substr($key, 0, 4) != 'att_';
      })->toArray();

      // SD
      $data['SenderDetails'] = (Object) $collect->filter(function ($value, $key) {
      return substr($key, 0, 3) == 'sd_';
      })->toArray();

      //        dd($data);
      // CN
      $data['ConseignmentDetails'] = (Object) $collect->filter(function ($value, $key) {
      return substr($key, 0, 3) == 'cn_';
      })->toArray();
      $data['ConseignmentDetails']->application_cns_count = $this->application_cns->count();
      $data['ConseignmentDetails']->Conseignments = (Object) $this->application_cns->map(function ($value) {
      return (Object) $value->toArray();
      });

      // CR
      $data['ContainerDetails'] = (Object) $collect->filter(function ($value, $key) {
      return substr($key, 0, 3) == 'cr_';
      })->toArray();
      $data['ContainerDetails']->application_crs_count = $this->application_crs->count();
      $data['ContainerDetails']->Containers = (Object) $this->application_crs->map(function ($value) {
      return (Object) $value->toArray();
      });

      // PX
      $data['PackingDetails'] = (Object) $collect->filter(function ($value, $key) {
      return substr($key, 0, 3) == 'px_';
      })->toArray();
      $data['PackingDetails']->application_pxs_count = $this->application_pxs->count();
      $data['PackingDetails']->PackingList = (Object) $this->application_pxs->map(function ($value) {
      return (Object) $value->toArray();
      });

      // IR
      $data['InspectionRequest'] = (Object) $collect->filter(function ($value, $key) {
      return substr($key, 0, 3) == 'ir_';
      })->toArray();

      // OD
      $data['OriginatorDetails'] = (Object) $collect->filter(function ($value, $key) {
      return substr($key, 0, 3) == 'od_';
      })->toArray();

      // Att
      $data['Attachments'] = (Object) $collect->filter(function ($value, $key) {
      return substr($key, 0, 4) == 'att_';
      })->toArray();

      // TD
      $data['TransportationDetails'] = (Object) $collect->filter(function ($value, $key) {
      return substr($key, 0, 3) == 'td_';
      })->toArray();

      // FD
      $data['FreightDetails'] = (Object) $collect->filter(function ($value, $key) {
      return substr($key, 0, 3) == 'fd_';
      })->toArray();

      $temp['ECD'] = $data;
      //        dd((Object) $temp);
      return (Object) $temp;
      }
     */
}
