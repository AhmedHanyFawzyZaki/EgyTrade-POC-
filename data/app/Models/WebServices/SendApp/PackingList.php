<?php

class PackingList {

    /**
     * @var string $PackagesType
     */
    protected $PackagesType = null;

    /**
     * @var string $PackageWeight
     */
    protected $PackageWeight = null;

    /**
     * @var string $TotalWeightPerItem
     */
    protected $TotalWeightPerItem = null;

    public function __construct() {
        
    }

    /**
     * @return string
     */
    public function getPackagesType() {
        return $this->PackagesType;
    }

    /**
     * @param string $PackagesType
     * @return Packing
     */
    public function setPackagesType($PackagesType) {
        $this->PackagesType = $PackagesType;
        return $this;
    }

    /**
     * @return string
     */
    public function getPackageWeight() {
        return $this->PackageWeight;
    }

    /**
     * @param string $PackageWeight
     * @return Packing
     */
    public function setPackageWeight($PackageWeight) {
        $this->PackageWeight = $PackageWeight;
        return $this;
    }

    /**
     * @return string
     */
    public function getTotalWeightPerItem() {
        return $this->TotalWeightPerItem;
    }

    /**
     * @param string $TotalWeightPerItem
     * @return Packing
     */
    public function setTotalWeightPerItem($TotalWeightPerItem) {
        $this->TotalWeightPerItem = $TotalWeightPerItem;
        return $this;
    }

}
