<?php

class Attachments {

    /**
     * @var string $Name
     */
    protected $Name = null;

    /**
     * @var string $URL
     */
    protected $URL = null;

    public function __construct() {
        
    }

    /**
     * @return string
     */
    public function getName() {
        return $this->Name;
    }

    /**
     * @param string $Name
     * @return Attachments
     */
    public function setName($Name) {
        $this->Name = $Name;
        return $this;
    }

    /**
     * @return string
     */
    public function getURL() {
        return $this->URL;
    }

    /**
     * @param string $URL
     * @return Attachments
     */
    public function setURL($URL) {
        $this->URL = $URL;
        return $this;
    }

}
