<?php

class StartExportProcessOut {

    /**
     * @var string $status
     */
    protected $status = null;

    /**
     * @var string $errorCode
     */
    protected $errorCode = null;

    /**
     * @var string $errorDesciption
     */
    protected $errorDesciption = null;

    public function __construct() {
        
    }

    /**
     * @return string
     */
    public function getStatus() {
        return $this->status;
    }

    /**
     * @param string $status
     * @return StartExportProcessOut
     */
    public function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    /**
     * @return string
     */
    public function getErrorCode() {
        return $this->errorCode;
    }

    /**
     * @param string $errorCode
     * @return StartExportProcessOut
     */
    public function setErrorCode($errorCode) {
        $this->errorCode = $errorCode;
        return $this;
    }

    /**
     * @return string
     */
    public function getErrorDesciption() {
        return $this->errorDesciption;
    }

    /**
     * @param string $errorDesciption
     * @return StartExportProcessOut
     */
    public function setErrorDesciption($errorDesciption) {
        $this->errorDesciption = $errorDesciption;
        return $this;
    }

}
