<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateApplicationCnTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('application_cn', function(Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('application_id');
            $table->foreign('application_id')->references('id')->on('applications');
            $table->unsignedInteger('cn_hs_code_id');
            $table->foreign('cn_hs_code_id')->references('id')->on('hs_codes');
            $table->decimal('cn_quantity', 10, 2);
            $table->decimal('cn_unit_price', 10, 2)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::drop('application_cn');
    }

}
