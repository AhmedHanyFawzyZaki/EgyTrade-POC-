<?php

class PackingDetails {

    /**
     * @var string $NumberOfPackages
     */
    protected $NumberOfPackages = null;

    /**
     * @var Packing[] $PackingList
     */
    protected $PackingList = null;

    public function __construct() {
        
    }

    /**
     * @return string
     */
    public function getNumberOfPackages() {
        return $this->NumberOfPackages;
    }

    /**
     * @param string $NumberOfPackages
     * @return PackingDetails
     */
    public function setNumberOfPackages($NumberOfPackages) {
        $this->NumberOfPackages = $NumberOfPackages;
        return $this;
    }

    /**
     * @return Packing[]
     */
    public function getPackingList() {
        return $this->PackingList;
    }

    /**
     * @param Packing[] $PackingList
     * @return PackingDetails
     */
    public function setPackingList(array $PackingList = null) {
        $this->PackingList = $PackingList;
        return $this;
    }

}
