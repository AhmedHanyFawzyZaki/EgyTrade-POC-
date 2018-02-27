<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateApplicationNotificationsTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::table('application_notifications', function (Blueprint $table) {
            $table->string('message');
            $table->string('message_ar');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::table('application_notifications', function (Blueprint $table) {
            $table->dropColumn(['created_at', 'updated_at', 'message', 'message_ar']);
        });
    }

}
