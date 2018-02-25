<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompanies extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('companies', function(Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('customs_ref_num')->nullable();
            $table->string('vat')->nullable();
            $table->string('address')->nullable();
            $table->unsignedInteger('company_type_id');
            $table->foreign('company_type_id')->references('id')->on('company_types');
            $table->unsignedInteger('created_by');
            $table->foreign('created_by')->references('id')->on('user');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::drop('companies');
    }

}
