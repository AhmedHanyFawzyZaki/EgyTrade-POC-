<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateApplicationPxTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('application_px', function(Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('application_id');
            $table->foreign('application_id')->references('id')->on('applications');
            $table->unsignedInteger('px_type_id');
            $table->foreign('px_type_id')->references('id')->on('px_types');
            $table->unsignedInteger('application_cn_id');
            $table->foreign('application_cn_id')->references('id')->on('application_cn');
            $table->decimal('px_weight', 10, 2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::drop('application_px');
    }

}
