<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BaseModel extends Model {

    /**
     * Used to return a the model attribute based on the current language
     * @param type $field
     * @param type $field_ar
     * @return type
     */
    public function getFieldTranslation($field, $field_ar) {
        return $field_ar ? $this->$field_ar : $this->$field;
    }

}
