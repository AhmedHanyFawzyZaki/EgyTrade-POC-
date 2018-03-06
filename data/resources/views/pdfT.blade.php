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
        margin: 10px;
        padding: 10px;
    }
    table{
        padding: .3%;
    }
    th, td {
        height: 25px;
        border: 1px solid #ddd;
        margin: 5px;
    }
    h3{
    }
    th{
        color: #954120;
    }
    td p{
        font-size: 22px;
        color: #343f94;
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
</style>
<br>
<div dir='rtl' style='margin-left: 40px'>
<h1 style="color: black"><span style="color: #954120"> السيد/ </span>{{ $username }} </h1>
<h1 style="color: #954120"> نحيط   علم سيادتكم بأن موعد تسليم المستندات الخاصة ب  <span style="color: black">{{ $application->sd_consignee_name }}</span> يوم / <span style="color: black">{{ $date }} </span>  في العاشرة صباحا فى جمرك<span style="color: black"> {{$application->sd_reg_custom_rel->name_ar}}</span></h1>
</div>

