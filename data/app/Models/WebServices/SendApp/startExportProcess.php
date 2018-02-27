<?php

class startExportProcess {

    /**
     * @var StartExportProcessIn $StartExportProcessIn
     */
    protected $StartExportProcessIn = null;

    public function __construct() {
        
    }

    /**
     * @return StartExportProcessIn
     */
    public function getStartExportProcessIn() {
        return $this->StartExportProcessIn;
    }

    /**
     * @param StartExportProcessIn $StartExportProcessIn
     * @return startExportProcess
     */
    public function setStartExportProcessIn($StartExportProcessIn) {
        $this->StartExportProcessIn = $StartExportProcessIn;
        return $this;
    }

}
