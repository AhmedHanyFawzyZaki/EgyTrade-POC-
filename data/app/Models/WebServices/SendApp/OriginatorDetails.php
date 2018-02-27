<?php

class OriginatorDetails {

    /**
     * @var string $CountryOfOrigin
     */
    protected $CountryOfOrigin = null;

    public function __construct() {
        
    }

    /**
     * @return string
     */
    public function getCountryOfOrigin() {
        return $this->CountryOfOrigin;
    }

    /**
     * @param string $CountryOfOrigin
     * @return OriginatorDetails
     */
    public function setCountryOfOrigin($CountryOfOrigin) {
        $this->CountryOfOrigin = $CountryOfOrigin;
        return $this;
    }

}
