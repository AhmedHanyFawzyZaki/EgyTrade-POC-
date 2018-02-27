<?php

class StartExportProcessIn {

    /**
     * @var ECD $ECD
     */
    protected $ECD = null;

    public function __construct() {
        
    }

    /**
     * @return ECD
     */
    public function getECD() {
        return $this->ECD;
    }

    /**
     * @param ECD $ECD
     * @return StartExportProcessIn
     */
    public function setECD($ECD) {
        $this->ECD = $ECD;
        return $this;
    }

}
