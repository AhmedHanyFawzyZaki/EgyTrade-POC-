<?php

class ACME_Export_POCflowPortalInterfacesStartProcessWSDL extends \SoapClient {

    /**
     * @var array $classmap The defined classes
     */
    private static $classmap = array(
        'startExportProcess' => '\\startExportProcess',
        'StartExportProcessIn' => '\\StartExportProcessIn',
        'ECD' => '\\ECD',
        'SenderDetails' => '\\SenderDetails',
        'ConseignmentDetails' => '\\ConseignmentDetails',
        'Conseignmnet' => '\\Conseignmnet',
        'InspectionRequest' => '\\InspectionRequest',
        'ContainerDetails' => '\\ContainerDetails',
        'Container' => '\\Container',
        'PackingDetails' => '\\PackingDetails',
        'Packing' => '\\Packing',
        'OriginatorDetails' => '\\OriginatorDetails',
        'FreightDetails' => '\\FreightDetails',
        'TransportationDetails' => '\\TransportationDetails',
        'Attachments' => '\\Attachments',
        'startExportProcessResponse' => '\\startExportProcessResponse',
        'StartExportProcessOut' => '\\StartExportProcessOut',
    );

    /**
     * @param array $options A array of config values
     * @param string $wsdl The wsdl file to use
     */
    public function __construct(array $options = array(), $wsdl = null) {

        foreach (self::$classmap as $key => $value) {
            if (!isset($options['classmap'][$key])) {
                $options['classmap'][$key] = $value;
            }
        }
        $options = array_merge(array(
            'features' => 1,
                ), $options);
        if (!$wsdl) {
            $wsdl = 'http://35.188.149.214:5555/ws/ACME_Export_POC.flow.PortalInterfaces:StartProcessWSDL?WSDL';
        }
        parent::__construct($wsdl, $options);
    }

    /**
     * @param startExportProcess $parameters
     * @return startExportProcessResponse
     */
    public function startExportProcess(startExportProcess $parameters) {
        return $this->__soapCall('startExportProcess', array($parameters));
    }

}
