<?php

class FreightDetails {

    /**
     * @var string $BillOfLadingNumber
     */
    protected $BillOfLadingNumber = null;

    /**
     * @var string $VesselName
     */
    protected $VesselName = null;

    /**
     * @var string $CallSign
     */
    protected $CallSign = null;

    /**
     * @var string $IMONumber
     */
    protected $IMONumber = null;

    /**
     * @var string $TotalWeight
     */
    protected $TotalWeight = null;

    /**
     * @var string $NetWeight
     */
    protected $NetWeight = null;

    /**
     * @var string $NameOfFreightLine
     */
    protected $NameOfFreightLine = null;

    /**
     * @var string $ShippingPort
     */
    protected $ShippingPort = null;

    /**
     * @var string $FinalDestinationPort
     */
    protected $FinalDestinationPort = null;

    /**
     * @var string $ExpectedArrivalDate
     */
    protected $ExpectedArrivalDate = null;

    /**
     * @var string $DateOfShipment
     */
    protected $DateOfShipment = null;

    /**
     * @var string $TripNumber
     */
    protected $TripNumber = null;

    /**
     * @var string $FreightForwarderName
     */
    protected $FreightForwarderName = null;

    /**
     * @var string $FreightForwarderAddress
     */
    protected $FreightForwarderAddress = null;

    /**
     * @var string $FreightAgentName
     */
    protected $FreightAgentName = null;

    /**
     * @var string $FreightAgentAddress
     */
    protected $FreightAgentAddress = null;

    public function __construct() {
        
    }

    /**
     * @return string
     */
    public function getBillOfLadingNumber() {
        return $this->BillOfLadingNumber;
    }

    /**
     * @param string $BillOfLadingNumber
     * @return FreightDetails
     */
    public function setBillOfLadingNumber($BillOfLadingNumber) {
        $this->BillOfLadingNumber = $BillOfLadingNumber;
        return $this;
    }

    /**
     * @return string
     */
    public function getVesselName() {
        return $this->VesselName;
    }

    /**
     * @param string $VesselName
     * @return FreightDetails
     */
    public function setVesselName($VesselName) {
        $this->VesselName = $VesselName;
        return $this;
    }

    /**
     * @return string
     */
    public function getCallSign() {
        return $this->CallSign;
    }

    /**
     * @param string $CallSign
     * @return FreightDetails
     */
    public function setCallSign($CallSign) {
        $this->CallSign = $CallSign;
        return $this;
    }

    /**
     * @return string
     */
    public function getIMONumber() {
        return $this->IMONumber;
    }

    /**
     * @param string $IMONumber
     * @return FreightDetails
     */
    public function setIMONumber($IMONumber) {
        $this->IMONumber = $IMONumber;
        return $this;
    }

    /**
     * @return string
     */
    public function getTotalWeight() {
        return $this->TotalWeight;
    }

    /**
     * @param string $TotalWeight
     * @return FreightDetails
     */
    public function setTotalWeight($TotalWeight) {
        $this->TotalWeight = $TotalWeight;
        return $this;
    }

    /**
     * @return string
     */
    public function getNetWeight() {
        return $this->NetWeight;
    }

    /**
     * @param string $NetWeight
     * @return FreightDetails
     */
    public function setNetWeight($NetWeight) {
        $this->NetWeight = $NetWeight;
        return $this;
    }

    /**
     * @return string
     */
    public function getNameOfFreightLine() {
        return $this->NameOfFreightLine;
    }

    /**
     * @param string $NameOfFreightLine
     * @return FreightDetails
     */
    public function setNameOfFreightLine($NameOfFreightLine) {
        $this->NameOfFreightLine = $NameOfFreightLine;
        return $this;
    }

    /**
     * @return string
     */
    public function getShippingPort() {
        return $this->ShippingPort;
    }

    /**
     * @param string $ShippingPort
     * @return FreightDetails
     */
    public function setShippingPort($ShippingPort) {
        $this->ShippingPort = $ShippingPort;
        return $this;
    }

    /**
     * @return string
     */
    public function getFinalDestinationPort() {
        return $this->FinalDestinationPort;
    }

    /**
     * @param string $FinalDestinationPort
     * @return FreightDetails
     */
    public function setFinalDestinationPort($FinalDestinationPort) {
        $this->FinalDestinationPort = $FinalDestinationPort;
        return $this;
    }

    /**
     * @return string
     */
    public function getExpectedArrivalDate() {
        return $this->ExpectedArrivalDate;
    }

    /**
     * @param string $ExpectedArrivalDate
     * @return FreightDetails
     */
    public function setExpectedArrivalDate($ExpectedArrivalDate) {
        $this->ExpectedArrivalDate = $ExpectedArrivalDate;
        return $this;
    }

    /**
     * @return string
     */
    public function getDateOfShipment() {
        return $this->DateOfShipment;
    }

    /**
     * @param string $DateOfShipment
     * @return FreightDetails
     */
    public function setDateOfShipment($DateOfShipment) {
        $this->DateOfShipment = $DateOfShipment;
        return $this;
    }

    /**
     * @return string
     */
    public function getTripNumber() {
        return $this->TripNumber;
    }

    /**
     * @param string $TripNumber
     * @return FreightDetails
     */
    public function setTripNumber($TripNumber) {
        $this->TripNumber = $TripNumber;
        return $this;
    }

    /**
     * @return string
     */
    public function getFreightForwarderName() {
        return $this->FreightForwarderName;
    }

    /**
     * @param string $FreightForwarderName
     * @return FreightDetails
     */
    public function setFreightForwarderName($FreightForwarderName) {
        $this->FreightForwarderName = $FreightForwarderName;
        return $this;
    }

    /**
     * @return string
     */
    public function getFreightForwarderAddress() {
        return $this->FreightForwarderAddress;
    }

    /**
     * @param string $FreightForwarderAddress
     * @return FreightDetails
     */
    public function setFreightForwarderAddress($FreightForwarderAddress) {
        $this->FreightForwarderAddress = $FreightForwarderAddress;
        return $this;
    }

    /**
     * @return string
     */
    public function getFreightAgentName() {
        return $this->FreightAgentName;
    }

    /**
     * @param string $FreightAgentName
     * @return FreightDetails
     */
    public function setFreightAgentName($FreightAgentName) {
        $this->FreightAgentName = $FreightAgentName;
        return $this;
    }

    /**
     * @return string
     */
    public function getFreightAgentAddress() {
        return $this->FreightAgentAddress;
    }

    /**
     * @param string $FreightAgentAddress
     * @return FreightDetails
     */
    public function setFreightAgentAddress($FreightAgentAddress) {
        $this->FreightAgentAddress = $FreightAgentAddress;
        return $this;
    }

}
