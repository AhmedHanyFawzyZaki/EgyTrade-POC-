<?php

class TransportationDetails {

    /**
     * @var string $CarLicenseNumber
     */
    protected $CarLicenseNumber = null;

    /**
     * @var string $DriverName
     */
    protected $DriverName = null;

    /**
     * @var string $DriverLicense
     */
    protected $DriverLicense = null;

    /**
     * @var string $CarNetWeight
     */
    protected $CarNetWeight = null;

    /**
     * @var string $CarTotalWeight
     */
    protected $CarTotalWeight = null;

    public function __construct() {
        
    }

    /**
     * @return string
     */
    public function getCarLicenseNumber() {
        return $this->CarLicenseNumber;
    }

    /**
     * @param string $CarLicenseNumber
     * @return TransportationDetails
     */
    public function setCarLicenseNumber($CarLicenseNumber) {
        $this->CarLicenseNumber = $CarLicenseNumber;
        return $this;
    }

    /**
     * @return string
     */
    public function getDriverName() {
        return $this->DriverName;
    }

    /**
     * @param string $DriverName
     * @return TransportationDetails
     */
    public function setDriverName($DriverName) {
        $this->DriverName = $DriverName;
        return $this;
    }

    /**
     * @return string
     */
    public function getDriverLicense() {
        return $this->DriverLicense;
    }

    /**
     * @param string $DriverLicense
     * @return TransportationDetails
     */
    public function setDriverLicense($DriverLicense) {
        $this->DriverLicense = $DriverLicense;
        return $this;
    }

    /**
     * @return string
     */
    public function getCarNetWeight() {
        return $this->CarNetWeight;
    }

    /**
     * @param string $CarNetWeight
     * @return TransportationDetails
     */
    public function setCarNetWeight($CarNetWeight) {
        $this->CarNetWeight = $CarNetWeight;
        return $this;
    }

    /**
     * @return string
     */
    public function getCarTotalWeight() {
        return $this->CarTotalWeight;
    }

    /**
     * @param string $CarTotalWeight
     * @return TransportationDetails
     */
    public function setCarTotalWeight($CarTotalWeight) {
        $this->CarTotalWeight = $CarTotalWeight;
        return $this;
    }

}
