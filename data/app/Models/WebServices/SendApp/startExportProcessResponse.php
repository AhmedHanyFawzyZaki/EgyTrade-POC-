<?php

class startExportProcessResponse {

    /**
     * @var StartExportProcessOut $StartExportProcessOut
     */
    protected $StartExportProcessOut = null;

    public function __construct() {
        
    }

    /**
     * @return StartExportProcessOut
     */
    public function getStartExportProcessOut() {
        return $this->StartExportProcessOut;
    }

    /**
     * @param StartExportProcessOut $StartExportProcessOut
     * @return startExportProcessResponse
     */
    public function setStartExportProcessOut($StartExportProcessOut) {
        $this->StartExportProcessOut = $StartExportProcessOut;
        return $this;
    }

}
