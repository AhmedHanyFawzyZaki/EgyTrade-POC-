<?php

class PackingDetails {

    /**
     * @var string $NumberOfPackages
     */
    protected $NumberOfPackages = null;

    /**
     * @var PackingList[] $PackingLists
     */
    protected $PackingLists = null;

    public function __construct() {
        
    }

    /**
     * @return PackingList[]
     */
    public function getPackingLists() {
        return $this->PackingLists;
    }

    /**
     * @param PackingList[] $PackingLists
     * @return PackingDetails
     */
    public function setPackingLists(array $PackingLists = null) {
        $this->PackingLists = $PackingLists;
        return $this;
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

}
