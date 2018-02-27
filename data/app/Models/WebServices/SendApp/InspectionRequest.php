<?php

class InspectionRequest {

    /**
     * @var string $InspectionLocation
     */
    protected $InspectionLocation = null;

    /**
     * @var string $InspectionDate
     */
    protected $InspectionDate = null;

    /**
     * @var string $InspectionAddress
     */
    protected $InspectionAddress = null;

    public function __construct() {
        
    }

    /**
     * @return string
     */
    public function getInspectionLocation() {
        return $this->InspectionLocation;
    }

    /**
     * @param string $InspectionLocation
     * @return InspectionRequest
     */
    public function setInspectionLocation($InspectionLocation) {
        $this->InspectionLocation = $InspectionLocation;
        return $this;
    }

    /**
     * @return string
     */
    public function getInspectionDate() {
        return $this->InspectionDate;
    }

    /**
     * @param string $InspectionDate
     * @return InspectionRequest
     */
    public function setInspectionDate($InspectionDate) {
        $this->InspectionDate = $InspectionDate;
        return $this;
    }

    /**
     * @return string
     */
    public function getInspectionAddress() {
        return $this->InspectionAddress;
    }

    /**
     * @param string $InspectionAddress
     * @return InspectionRequest
     */
    public function setInspectionAddress($InspectionAddress) {
        $this->InspectionAddress = $InspectionAddress;
        return $this;
    }

}
