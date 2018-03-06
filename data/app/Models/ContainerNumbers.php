<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ContainerNumbers extends Model {

    /**
     * get capacity relationship
     * @return type
     */
    public function getCapacity() {
        return $this->belongsTo(ContainerCapacities::class, 'cr_capacity');
    }

    /**
     * get owner relationship
     * @return type
     */
    public function getOwner() {
        return $this->belongsTo(ContainerOwners::class, 'cr_owner');
    }

    /**
     * get type relationship
     * @return type
     */
    public function getType() {
        return $this->belongsTo(ContainerTypes::class, 'cr_type');
    }

}
