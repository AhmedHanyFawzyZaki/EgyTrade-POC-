<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContainerNumbersTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('container_numbers', function(Blueprint $table) {
            $table->increments('id');
            $table->string('cr_num');
            $table->unsignedInteger('cr_owner');
            $table->foreign('cr_owner')->references('id')->on('container_owners');
            $table->unsignedInteger('cr_type');
            $table->foreign('cr_type')->references('id')->on('container_types');
            $table->unsignedInteger('cr_capacity');
            $table->foreign('cr_capacity')->references('id')->on('container_capacities');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::drop('container_numbers');
    }

}
