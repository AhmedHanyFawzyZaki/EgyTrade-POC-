<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Applications extends Model {
    use \App\Traits\ApplicationTrait;

    /**
     * get company relationship
     * @return type
     */
    public function getCompany() {
        return $this->belongsTo(Companies::class, 'company_id');
    }
    
    /**
     * get user relationship
     * @return type
     */
    public function getCreatedBy() {
        return $this->belongsTo(User::class, 'created_by');
    }

    /**
     * get recipient country relationship
     * @return type
     */
    public function getRecipientCountry() {
        return $this->belongsTo(Countries::class, 'sd_recipient_country');
    }

}
