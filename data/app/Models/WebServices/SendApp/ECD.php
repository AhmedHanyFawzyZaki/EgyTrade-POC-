<?php

class ECD {

    /**
     * @var SenderDetails $SenderDetails
     */
    protected $SenderDetails = null;

    /**
     * @var ConseignmentDetails $ConseignmentDetails
     */
    protected $ConseignmentDetails = null;

    /**
     * @var InspectionRequest $InspectionRequest
     */
    protected $InspectionRequest = null;

    /**
     * @var ContainerDetails $ContainerDetails
     */
    protected $ContainerDetails = null;

    /**
     * @var PackingDetails $PackingDetails
     */
    protected $PackingDetails = null;

    /**
     * @var OriginatorDetails $OriginatorDetails
     */
    protected $OriginatorDetails = null;

    /**
     * @var FreightDetails $FreightDetails
     */
    protected $FreightDetails = null;

    /**
     * @var TransportationDetails $TransportationDetails
     */
    protected $TransportationDetails = null;

    /**
     * @var Attachments[] $Attachments
     */
    protected $Attachments = null;

    /**
     * @var string $DID
     */
    protected $DID = null;

    public function __construct() {
        
    }

    /**
     * @return SenderDetails
     */
    public function getSenderDetails() {
        return $this->SenderDetails;
    }

    /**
     * @param SenderDetails $SenderDetails
     * @return ECD
     */
    public function setSenderDetails($SenderDetails) {
        $this->SenderDetails = $SenderDetails;
        return $this;
    }

    /**
     * @return ConseignmentDetails
     */
    public function getConseignmentDetails() {
        return $this->ConseignmentDetails;
    }

    /**
     * @param ConseignmentDetails $ConseignmentDetails
     * @return ECD
     */
    public function setConseignmentDetails($ConseignmentDetails) {
        $this->ConseignmentDetails = $ConseignmentDetails;
        return $this;
    }

    /**
     * @return InspectionRequest
     */
    public function getInspectionRequest() {
        return $this->InspectionRequest;
    }

    /**
     * @param InspectionRequest $InspectionRequest
     * @return ECD
     */
    public function setInspectionRequest($InspectionRequest) {
        $this->InspectionRequest = $InspectionRequest;
        return $this;
    }

    /**
     * @return ContainerDetails
     */
    public function getContainerDetails() {
        return $this->ContainerDetails;
    }

    /**
     * @param ContainerDetails $ContainerDetails
     * @return ECD
     */
    public function setContainerDetails($ContainerDetails) {
        $this->ContainerDetails = $ContainerDetails;
        return $this;
    }

    /**
     * @return PackingDetails
     */
    public function getPackingDetails() {
        return $this->PackingDetails;
    }

    /**
     * @param PackingDetails $PackingDetails
     * @return ECD
     */
    public function setPackingDetails($PackingDetails) {
        $this->PackingDetails = $PackingDetails;
        return $this;
    }

    /**
     * @return OriginatorDetails
     */
    public function getOriginatorDetails() {
        return $this->OriginatorDetails;
    }

    /**
     * @param OriginatorDetails $OriginatorDetails
     * @return ECD
     */
    public function setOriginatorDetails($OriginatorDetails) {
        $this->OriginatorDetails = $OriginatorDetails;
        return $this;
    }

    /**
     * @return FreightDetails
     */
    public function getFreightDetails() {
        return $this->FreightDetails;
    }

    /**
     * @param FreightDetails $FreightDetails
     * @return ECD
     */
    public function setFreightDetails($FreightDetails) {
        $this->FreightDetails = $FreightDetails;
        return $this;
    }

    /**
     * @return TransportationDetails
     */
    public function getTransportationDetails() {
        return $this->TransportationDetails;
    }

    /**
     * @param TransportationDetails $TransportationDetails
     * @return ECD
     */
    public function setTransportationDetails($TransportationDetails) {
        $this->TransportationDetails = $TransportationDetails;
        return $this;
    }

    /**
     * @return Attachments[]
     */
    public function getAttachments() {
        return $this->Attachments;
    }

    /**
     * @param Attachments[] $Attachments
     * @return ECD
     */
    public function setAttachments(array $Attachments = null) {
        $this->Attachments = $Attachments;
        return $this;
    }

    /**
     * @return string
     */
    public function getDID() {
        return $this->DID;
    }

    /**
     * @param string $DID
     * @return ECD
     */
    public function setDID($DID) {
        $this->DID = $DID;
        return $this;
    }

}
