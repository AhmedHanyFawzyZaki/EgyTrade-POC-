<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHsCodesTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('hs_codes', function(Blueprint $table) {
            $table->increments('id');
            $table->string('hs_code')->unique();
            $table->string('hs_desc');
            $table->string('hs_desc_ar')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::drop('hs_codes');
    }

}
