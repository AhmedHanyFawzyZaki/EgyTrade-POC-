<style>
    body {
        background: #eeeeee;
    }
    .panel {
        width: 100%;
        display: inline-block;
        background: #ffffff;
        box-shadow:0px 0px 5px 5px #C9C9C9;
        -webkit-box-shadow:2px 2px 5px 5x #C9C9C9;
        -moz-box-shadow:2px 2px 5px 5px #C9C9C9;
        padding: 10px;
    }
    table{
        padding: .3%;
    }
    th, td {
        padding: 5px;
        border: 1px solid #ddd;
        /*
height: 25px;
border: 1px solid #ddd;
margin: 5px;*/
    }
    h3{
    }
    tr th{
        text-align: right;
        color: #954120;
    }
    tr td{
        text-align: right;
    }
    p{
        text-align:center !important;
        /*width:100%;
font-size: 22px;
color: #343f94;*/
    }
    h1{
        text-align: center;
        color: #954120;

    }
    h3{
        color: #343f94; 
    }
    h3 span{
        color: #000;
    }
    span{
    }
</style>
<br>
<div dir='rtl' style='margin-left: 40px'>
    <div id='G' style='text-align: center' class='panel'>

        <table> 
            <tbody>
                <tr style='text-align: right'>
                    <th style="color: #954120"> شركة التخليص  : </th><td> {{ $application->getCreatedBy->getCompany->name }}</td>
                </tr>
                <tr style='text-align: right'>
                    <th style="color: #954120"> رقم القيد الجمركي : </th><td> {{ $application->getCreatedBy->getCompany->customs_ref_num }}</td>
                </tr>
                <tr style='text-align: right'>
                    <th style="color: #954120"> اسم المخلص الجمركي : </th><td> {{ $username }}</td>
                </tr>
            </tbody>
        </table>



    </div>
    <div id='SD' style='text-align: center' class='panel'>
        <h1 style="margin-left: 150px">بيانات المصدر</h1>
        <hr>
        <div style='text-align: right'>
            <table> 
                <tbody>
                    <tr style='text-align: right'>
                        <th style="color: #954120"> اسم المصدر: </th><td> {{ $application->sd_consignee_name }}</td>
                        <th>رقم التعامل الجمركي: </th><td> {{$application->sd_cus_ref_num }}</td>
                    </tr>
                    <tr>
                        <th>رقم التسجيل في ض. القيمة المضافة: </th><td> {{$application->sd_vat }}</td>
                        <th>عنوان المصدر: </th><td> {{ $application->sd_consignee_address }}</td>
                    </tr>
                    <tr>
                        <th>الدولة المصدر اليها: </th><td>{{(isset($application->sd_recipient_country_rel->name_ar)?$application->sd_recipient_country_rel->name_ar:'')}}</td>
                        <th>اسم المستورد : </th><td>{{$application->sd_recipient_name }}</td>
                    </tr>
                    <tr>
                        <th>عنوان المستورد: </th><td>{{$application->sd_recipient_address }}</td>
                        <th>جمرك القيد: </th><td>{{$application->sd_reg_custom_rel->name_ar }}</td>
                    </tr>



                </tbody>
            </table>
        </div>

    </div>
    <div id='CN' style='text-align: center' class='panel'>
        <h1>بيانات الشحنة</h1>
        <hr>
        <table> 
            <tbody>

                <tr>
                    <th>عدد انواع السلع: </th><td> {{count($application->application_cns) }}</td>
                </tr>

                <tr>
                    <th>بضائع عامة \ حاويات: </th><td>{{(isset($application->cn_cargo_type_id_rel->name_ar)?$application->cn_cargo_type_id_rel->name_ar:'')}} </td>
                </tr>



            </tbody>
        </table>


        <hr>



        <table style="width: 100%;  " > 
            <thead>
                <tr>
                    <th style='text-align: center'><p>رقم البند الجمركي</p></th>
                    <th style='text-align: center'><p>الكمية</p></th>
                    <th style='text-align: center'><p>سعر الوحدة</p></th>
                </tr>


            </thead>
            <tbody>
                <?php $sum = 0 ?>
                @foreach($application->application_cns as $app)
                <?php $sum += $app->cn_quantity ?>
                <tr>
                    <td style='text-align: center'><p>{{$app->getHsCode->hs_desc_ar}}</p></td>
                    <td style='text-align: center'><p>{{$app->cn_quantity}}</p></td>
                    <td style='text-align: center'><p>{{$app->cn_unit_price}}</p></td>
                </tr>
                @endforeach
                <tr style='text-align: center'>
                    <th style='text-align: center'><p>وزن البضائع الاجمالي:</p></th><td style='text-align: center'><p>{{$sum }}</p></td>
                </tr>

            </tbody>

        </table>

    </div>
    <div id='IR' style='text-align: center' class='panel'>

        <h1>طلب فحص</h1>
        <table> 
            <tbody>
                <tr style='text-align: right'>
                    <th>شروط الدفع: </th><td>{{(isset($application->cn_billing_terms_id_rel->name_ar)?$application->cn_billing_terms_id_rel->name_ar:'')}}</td>
                </tr>
                <tr>
                    <th>موقع الفحص: </th><td> {{(isset($application->ir_inspection_loc_rel->name_ar)?$application->ir_inspection_loc_rel->name_ar:'')}}</td>
                </tr>
                <tr>
                    <th>تاريخ الفحص: </th><td>{{$application->ir_inspection_date }}</td>
                </tr>
                <tr>
                    <th>عنوان موقع الفحص: </th><td>{{$application->ir_inspection_address}} </td>
                </tr>



            </tbody>
        </table>

        <hr>

    </div>

    <div id='OD' style='text-align: center' class='panel'>
        <h1>بيانات المنشأ</h1>
        <hr>
        <table> 
            <tbody>
                <tr style='text-align: right'>
                    <th style="color: #954120"> بلد المنشأ : </th><td> {{(isset($application->od_country_rel->name_ar)?$application->od_country_rel->name_ar:'')}}</td>
                </tr>

            </tbody>
        </table>




    </div>

    <div id='CR' style='text-align: center' class='panel'>
        <h1>بيانات الحاويات</h1>
        <hr>
        <table> 
            <tbody>
                <tr style='text-align: right'>
                    <th style="color: #954120"> عدد الحاويات : </th><td> {{$application->application_crs->count()}}</td>
                </tr>

            </tbody>
        </table>
        <hr>	
        <table > 
            <thead>
                <tr>
                    <th><p>رقم الحاوية</p></th>
                    <th><p>مالك الحاوية</p></th>
                    <th><p>نوع الحاوية</p></th>
                    <th><p>سعة الحاوية </p></th>
                </tr>


            </thead>
            <tbody>
                @foreach($application->application_crs as $app)
                <tr>
                    <td><p>{{$app->cr_num_rel->cr_num}}</p></td>
                    <td><p>{{isset($app->cr_num_rel->getOwner->name_ar) ? $app->cr_num_rel->getOwner->name_ar : ''}}</p></td>
                    <td><p>{{isset($app->cr_num_rel->getType->name_ar) ? $app->cr_num_rel->getType->name_ar : ''}}</p></td>
                    <td><p>{{isset($app->cr_num_rel->getCapacity->name_ar) ? $app->cr_num_rel->getCapacity->name_ar : ''}}</p></td>
                </tr>
                @endforeach

            </tbody>

        </table>
    </div>

    <div id='TD' style='text-align: center' class='panel'>
        <h1>بيانات النقل</h1>
        <hr>

        <table> 
            <tbody>
                <tr style='text-align: right'>
                    <th style="color: #954120"> رقم رخصة السيارة : </th><td> {{$application->td_car_license }}</td>
                </tr>
                <tr style='text-align: right'>
                    <th style="color: #954120"> رقم رخصة السائق : </th><td> {{$application->td_driver_license }}</td>
                </tr>

                <tr style='text-align: right'>
                    <th style="color: #954120"> اسم السائق : </th><td> {{$application->td_driver_name}}</td>
                </tr>

                <tr style='text-align: right'>
                    <th style="color: #954120">الوزن القائم للسيارة: </th><td> {{$application->td_car_total_weight}}</td>
                </tr>

                <tr style='text-align: right'>
                    <th style="color: #954120"> الوزن الصافي للسيارة: </th><td> {{$application->td_car_net_weight}}</td>
                </tr>



            </tbody>
        </table>


    </div>

    <div id='FD' style='text-align: center' class='panel'>
        <h1>بيانات الشحن</h1>
        <hr>
        <table>
            <tbody>
                <tr style='text-align: right'>
                    <th style="color: #954120"> رقم  اذن الشحن: </th><td> {{$application->fd_bill_num }}</td>
                </tr>
                <tr>
                    <th>اسم السفينة: </th><td> {{$application->fd_vessel_name }}</td>
                </tr>
                <tr>
                    <th>شارة التعريف: </th><td>{{$application->fd_call_sign}}</td>
                </tr>
                <tr>
                    <th>رقم IMO: </th><td>{{$application->fd_imo_num}} </td>
                </tr>
                <tr style='text-align: right'>
                    <th style="color: #954120"> الوزن الكلي: </th><td> {{ $application->fd_total_weight }}</td>
                </tr>
                <tr>
                    <th>الوزن الصافي: </th><td> {{$application->fd_net_sign}}</td>
                </tr>
                <tr>
                    <th>اسم الخط الملاحي: </th><td>{{(isset($application->fd_fr_line_id_rel->name_ar)?$application->fd_fr_line_id_rel->name_ar:'')}}</td>
                </tr>
                <tr>
                    <th>ميناء الشحن: </th><td>{{(isset($application->fd_shipping_port_rel->name_ar)?$application->fd_shipping_port_rel->name_ar:'')}} </td>
                </tr>



                <tr style='text-align: right'>
                    <th style="color: #954120"> الميناء النهائي: </th><td> {{(isset($application->fd_final_dest_rel->name_ar)?$application->fd_final_dest_rel->name_ar:'')}}</td>
                </tr>
                <tr>
                    <th>تاريخ الوصول المتوقع: </th><td> {{$application->fd_expected_arr_date}}</td>
                </tr>
                <tr>
                    <th>تاريخ الشحن: </th><td>{{$application->fd_shippment_date}}</td>
                </tr>
                <tr>
                    <th>رقم الرحلة: </th><td>{{$application->fd_trip_num}} </td>
                </tr>
                <tr style='text-align: right'>
                    <th style="color: #954120"> اسم وكيل الشحن: </th><td> {{$application->fd_forwarder_name}}</td>
                </tr>
                <tr>
                    <th>عنوان وكيل الشحن: </th><td> {{$application->fd_forwarder_address}} </td>
                </tr>
                <tr>
                    <th>اسم مندوب وكيل الشحن: </th><td>{{$application->fd_agent_name}}</td>
                </tr>
                <tr>
                    <th>عنوان مندوب وكيل الشحن: </th><td>{{$application->fd_agent_address}} </td>
                </tr>

            </tbody>
        </table>


    </div>

    <div id='PX' style='text-align: center;' class='panel'>
        <h1>قائمة العبوات</h1>

        <hr>
        <table > 
            <thead>
                <tr>
                    <th><p>عدد العبوات</p></th>
                    <th><p>نوع العبوة</p></th>
                    <th><p>وزن العبوة</p></th>
                    <th><p>اجمالي الوزن للبند</p></th>
                </tr>


            </thead>
            <tbody>
                <?php $result = 0; ?>
                @foreach($application->application_pxs as $app)
                <tr>
                    <td><p>{{$app->px_num}}</p></td>
                    <td><p>{{isset($app->px_type_id_rel->name_ar)?$app->px_type_id_rel->name_ar:''}}</p></td>
                    <td><p>{{$app->px_weight}}</p></td>
                    <td><p>{{ $app->px_num * $app->px_weight}}</p></td>
                    <?php $result += $app->px_num * $app->px_weight; ?>
                </tr>
                @endforeach
                <tr style='text-align: center'>
                    <th style='text-align: center'><p>الوزن الاجمالي للشحنة:</p></th><td style='text-align: center'><p>{{$result }}</p></td>
                </tr>
            </tbody>

        </table>


    </div>


</div>
