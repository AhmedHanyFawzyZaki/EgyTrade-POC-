<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ApplicationSteps extends BaseModel {
    //

    /**
     * Used to get application steps diagram
     * @param type $currentStep
     * @return string
     */
    public function getStepColor($currentStep) {
        $colorClass = '';
        if ($this->id == $currentStep) {
            $colorClass = 'btn-current';
        } elseif ($this->id < $currentStep) {
            $colorClass = 'btn-done';
        } else {
            $colorClass = '';
        }
        return $colorClass;
    }

}
