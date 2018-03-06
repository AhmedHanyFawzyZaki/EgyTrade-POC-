<?php

function autoload_5d04bb37b5955646ddd7f965e5f44b51($class) {
    $classes = array(
        'ACME_Export_POCflowPortalInterfacesStartProcessWSDL' => __DIR__ . '/ACME_Export_POCflowPortalInterfacesStartProcessWSDL.php',
        'startExportProcess' => __DIR__ . '/startExportProcess.php',
        'StartExportProcessIn' => __DIR__ . '/StartExportProcessIn.php',
        'ECD' => __DIR__ . '/ECD.php',
        'SenderDetails' => __DIR__ . '/SenderDetails.php',
        'ConseignmentDetails' => __DIR__ . '/ConseignmentDetails.php',
        'Conseignmnet' => __DIR__ . '/Conseignmnet.php',
        'InspectionRequest' => __DIR__ . '/InspectionRequest.php',
        'ContainerDetails' => __DIR__ . '/ContainerDetails.php',
        'Container' => __DIR__ . '/Container.php',
        'PackingDetails' => __DIR__ . '/PackingDetails.php',
        'Packing' => __DIR__ . '/Packing.php',
        'OriginatorDetails' => __DIR__ . '/OriginatorDetails.php',
        'FreightDetails' => __DIR__ . '/FreightDetails.php',
        'TransportationDetails' => __DIR__ . '/TransportationDetails.php',
        'Attachments' => __DIR__ . '/Attachments.php',
        'startExportProcessResponse' => __DIR__ . '/startExportProcessResponse.php',
        'StartExportProcessOut' => __DIR__ . '/StartExportProcessOut.php'
    );
    if (!empty($classes[$class])) {
        include $classes[$class];
    };
}

spl_autoload_register('autoload_5d04bb37b5955646ddd7f965e5f44b51');

// Do nothing. The rest is just leftovers from the code generation.
{
    
}
