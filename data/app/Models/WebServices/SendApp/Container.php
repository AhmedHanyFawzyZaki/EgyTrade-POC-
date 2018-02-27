<?php

class Container {

    /**
     * @var string $ContainerType
     */
    protected $ContainerType = null;

    /**
     * @var string $ContainerNumber
     */
    protected $ContainerNumber = null;

    /**
     * @var string $ContainerOwner
     */
    protected $ContainerOwner = null;

    /**
     * @var string $ContainerCapacity
     */
    protected $ContainerCapacity = null;

    public function __construct() {
        
    }

    /**
     * @return string
     */
    public function getContainerType() {
        return $this->ContainerType;
    }

    /**
     * @param string $ContainerType
     * @return Container
     */
    public function setContainerType($ContainerType) {
        $this->ContainerType = $ContainerType;
        return $this;
    }

    /**
     * @return string
     */
    public function getContainerNumber() {
        return $this->ContainerNumber;
    }

    /**
     * @param string $ContainerNumber
     * @return Container
     */
    public function setContainerNumber($ContainerNumber) {
        $this->ContainerNumber = $ContainerNumber;
        return $this;
    }

    /**
     * @return string
     */
    public function getContainerOwner() {
        return $this->ContainerOwner;
    }

    /**
     * @param string $ContainerOwner
     * @return Container
     */
    public function setContainerOwner($ContainerOwner) {
        $this->ContainerOwner = $ContainerOwner;
        return $this;
    }

    /**
     * @return string
     */
    public function getContainerCapacity() {
        return $this->ContainerCapacity;
    }

    /**
     * @param string $ContainerCapacity
     * @return Container
     */
    public function setContainerCapacity($ContainerCapacity) {
        $this->ContainerCapacity = $ContainerCapacity;
        return $this;
    }

}
