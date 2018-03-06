<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateApplicationsTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::table('applications', function (Blueprint $table) {
            $table->unsignedInteger('sd_reg_custom')->nullable()->change();
            $table->foreign('sd_reg_custom')->references('id')->on('shipping_ports');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::table('applications', function (Blueprint $table) {
            $table->dropColumn(['sd_reg_custom']);
        });
    }

}
