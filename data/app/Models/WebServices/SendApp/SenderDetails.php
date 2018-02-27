<?php

class SenderDetails {

    /**
     * @var string $ConsigneeName
     */
    protected $ConsigneeName = null;

    /**
     * @var string $EGYCustomRefNumber
     */
    protected $EGYCustomRefNumber = null;

    /**
     * @var string $VATinPercent
     */
    protected $VATinPercent = null;

    /**
     * @var string $ConsigneeAddress
     */
    protected $ConsigneeAddress = null;

    /**
     * @var string $RecipientCountry
     */
    protected $RecipientCountry = null;

    /**
     * @var string $RecipientName
     */
    protected $RecipientName = null;

    /**
     * @var string $RecipientAddress
     */
    protected $RecipientAddress = null;

    /**
     * @var string $RegistrationCustoms
     */
    protected $RegistrationCustoms = null;

    public function __construct() {
        
    }

    /**
     * @return string
     */
    public function getConsigneeName() {
        return $this->ConsigneeName;
    }

    /**
     * @param string $ConsigneeName
     * @return SenderDetails
     */
    public function setConsigneeName($ConsigneeName) {
        $this->ConsigneeName = $ConsigneeName;
        return $this;
    }

    /**
     * @return string
     */
    public function getEGYCustomRefNumber() {
        return $this->EGYCustomRefNumber;
    }

    /**
     * @param string $EGYCustomRefNumber
     * @return SenderDetails
     */
    public function setEGYCustomRefNumber($EGYCustomRefNumber) {
        $this->EGYCustomRefNumber = $EGYCustomRefNumber;
        return $this;
    }

    /**
     * @return string
     */
    public function getVATinPercent() {
        return $this->VATinPercent;
    }

    /**
     * @param string $VATinPercent
     * @return SenderDetails
     */
    public function setVATinPercent($VATinPercent) {
        $this->VATinPercent = $VATinPercent;
        return $this;
    }

    /**
     * @return string
     */
    public function getConsigneeAddress() {
        return $this->ConsigneeAddress;
    }

    /**
     * @param string $ConsigneeAddress
     * @return SenderDetails
     */
    public function setConsigneeAddress($ConsigneeAddress) {
        $this->ConsigneeAddress = $ConsigneeAddress;
        return $this;
    }

    /**
     * @return string
     */
    public function getRecipientCountry() {
        return $this->RecipientCountry;
    }

    /**
     * @param string $RecipientCountry
     * @return SenderDetails
     */
    public function setRecipientCountry($RecipientCountry) {
        $this->RecipientCountry = $RecipientCountry;
        return $this;
    }

    /**
     * @return string
     */
    public function getRecipientName() {
        return $this->RecipientName;
    }

    /**
     * @param string $RecipientName
     * @return SenderDetails
     */
    public function setRecipientName($RecipientName) {
        $this->RecipientName = $RecipientName;
        return $this;
    }

    /**
     * @return string
     */
    public function getRecipientAddress() {
        return $this->RecipientAddress;
    }

    /**
     * @param string $RecipientAddress
     * @return SenderDetails
     */
    public function setRecipientAddress($RecipientAddress) {
        $this->RecipientAddress = $RecipientAddress;
        return $this;
    }

    /**
     * @return string
     */
    public function getRegistrationCustoms() {
        return $this->RegistrationCustoms;
    }

    /**
     * @param string $RegistrationCustoms
     * @return SenderDetails
     */
    public function setRegistrationCustoms($RegistrationCustoms) {
        $this->RegistrationCustoms = $RegistrationCustoms;
        return $this;
    }

}
