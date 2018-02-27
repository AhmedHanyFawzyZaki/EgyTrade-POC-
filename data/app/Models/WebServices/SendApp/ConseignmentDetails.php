<?php

class ConseignmentDetails {

    /**
     * @var Conseignmnet[] $Conseignments
     */
    protected $Conseignments = null;

    /**
     * @var string $ConseignmentGrossWeight
     */
    protected $ConseignmentGrossWeight = null;

    /**
     * @var string $NumberOfCommodities
     */
    protected $NumberOfCommodities = null;

    /**
     * @var string $BillingINCOTerms
     */
    protected $BillingINCOTerms = null;

    /**
     * @var string $TypeOfCargo
     */
    protected $TypeOfCargo = null;

    public function __construct() {
        
    }

    /**
     * @return Conseignmnet[]
     */
    public function getConseignments() {
        return $this->Conseignments;
    }

    /**
     * @param Conseignmnet[] $Conseignments
     * @return ConseignmentDetails
     */
    public function setConseignments(array $Conseignments = null) {
        $this->Conseignments = $Conseignments;
        return $this;
    }

    /**
     * @return string
     */
    public function getConseignmentGrossWeight() {
        return $this->ConseignmentGrossWeight;
    }

    /**
     * @param string $ConseignmentGrossWeight
     * @return ConseignmentDetails
     */
    public function setConseignmentGrossWeight($ConseignmentGrossWeight) {
        $this->ConseignmentGrossWeight = $ConseignmentGrossWeight;
        return $this;
    }

    /**
     * @return string
     */
    public function getNumberOfCommodities() {
        return $this->NumberOfCommodities;
    }

    /**
     * @param string $NumberOfCommodities
     * @return ConseignmentDetails
     */
    public function setNumberOfCommodities($NumberOfCommodities) {
        $this->NumberOfCommodities = $NumberOfCommodities;
        return $this;
    }

    /**
     * @return string
     */
    public function getBillingINCOTerms() {
        return $this->BillingINCOTerms;
    }

    /**
     * @param string $BillingINCOTerms
     * @return ConseignmentDetails
     */
    public function setBillingINCOTerms($BillingINCOTerms) {
        $this->BillingINCOTerms = $BillingINCOTerms;
        return $this;
    }

    /**
     * @return string
     */
    public function getTypeOfCargo() {
        return $this->TypeOfCargo;
    }

    /**
     * @param string $TypeOfCargo
     * @return ConseignmentDetails
     */
    public function setTypeOfCargo($TypeOfCargo) {
        $this->TypeOfCargo = $TypeOfCargo;
        return $this;
    }

}
