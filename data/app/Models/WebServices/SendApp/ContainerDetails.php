<?php

class ContainerDetails {

    /**
     * @var Container[] $Containers
     */
    protected $Containers = null;

    /**
     * @var string $NumberOfContainers
     */
    protected $NumberOfContainers = null;

    public function __construct() {
        
    }

    /**
     * @return Container[]
     */
    public function getContainers() {
        return $this->Containers;
    }

    /**
     * @param Container[] $Containers
     * @return ContainerDetails
     */
    public function setContainers(array $Containers = null) {
        $this->Containers = $Containers;
        return $this;
    }

    /**
     * @return string
     */
    public function getNumberOfContainers() {
        return $this->NumberOfContainers;
    }

    /**
     * @param string $NumberOfContainers
     * @return ContainerDetails
     */
    public function setNumberOfContainers($NumberOfContainers) {
        $this->NumberOfContainers = $NumberOfContainers;
        return $this;
    }

}
