<?php

class Conseignmnet {

    /**
     * @var string $HSCode
     */
    protected $HSCode = null;

    /**
     * @var string $Quantity
     */
    protected $Quantity = null;

    /**
     * @var string $UnitPrice
     */
    protected $UnitPrice = null;

    /**
     * @var string $isGOIECApproved
     */
    protected $isGOIECApproved = null;

    /**
     * @var string $isCustomApproved
     */
    protected $isCustomApproved = null;

    /**
     * @var string $GOIECComment
     */
    protected $GOIECComment = null;

    /**
     * @var string $CustomComment
     */
    protected $CustomComment = null;

    public function __construct() {
        
    }

    /**
     * @return string
     */
    public function getHSCode() {
        return $this->HSCode;
    }

    /**
     * @param string $HSCode
     * @return Conseignmnet
     */
    public function setHSCode($HSCode) {
        $this->HSCode = $HSCode;
        return $this;
    }

    /**
     * @return string
     */
    public function getQuantity() {
        return $this->Quantity;
    }

    /**
     * @param string $Quantity
     * @return Conseignmnet
     */
    public function setQuantity($Quantity) {
        $this->Quantity = $Quantity;
        return $this;
    }

    /**
     * @return string
     */
    public function getUnitPrice() {
        return $this->UnitPrice;
    }

    /**
     * @param string $UnitPrice
     * @return Conseignmnet
     */
    public function setUnitPrice($UnitPrice) {
        $this->UnitPrice = $UnitPrice;
        return $this;
    }

    /**
     * @return string
     */
    public function getIsGOIECApproved() {
        return $this->isGOIECApproved;
    }

    /**
     * @param string $isGOIECApproved
     * @return Conseignmnet
     */
    public function setIsGOIECApproved($isGOIECApproved) {
        $this->isGOIECApproved = $isGOIECApproved;
        return $this;
    }

    /**
     * @return string
     */
    public function getIsCustomApproved() {
        return $this->isCustomApproved;
    }

    /**
     * @param string $isCustomApproved
     * @return Conseignmnet
     */
    public function setIsCustomApproved($isCustomApproved) {
        $this->isCustomApproved = $isCustomApproved;
        return $this;
    }

    /**
     * @return string
     */
    public function getGOIECComment() {
        return $this->GOIECComment;
    }

    /**
     * @param string $GOIECComment
     * @return Conseignmnet
     */
    public function setGOIECComment($GOIECComment) {
        $this->GOIECComment = $GOIECComment;
        return $this;
    }

    /**
     * @return string
     */
    public function getCustomComment() {
        return $this->CustomComment;
    }

    /**
     * @param string $CustomComment
     * @return Conseignmnet
     */
    public function setCustomComment($CustomComment) {
        $this->CustomComment = $CustomComment;
        return $this;
    }

}
