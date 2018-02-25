<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateApplicationCrTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('application_cr', function(Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('application_id');
            $table->foreign('application_id')->references('id')->on('applications');
            $table->string('cr_num');
            $table->unsignedInteger('cr_owner');
            $table->foreign('cr_owner')->references('id')->on('container_owners');
            $table->unsignedInteger('cr_type');
            $table->foreign('cr_type')->references('id')->on('container_types');
            $table->unsignedInteger('cr_capacity');
            $table->foreign('cr_capacity')->references('id')->on('container_capacities');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::drop('application_cr');
    }

}
