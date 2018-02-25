<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateApplicationsTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('applications', function(Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('company_id');
            $table->foreign('company_id')->references('id')->on('companies');
            $table->unsignedInteger('created_by');
            $table->foreign('created_by')->references('id')->on('user');
            $table->unsignedInteger('current_step');
            $table->foreign('current_step')->references('id')->on('application_steps');

            $table->string('sd_consignee_name')->nullable();
            $table->string('sd_cus_ref_num')->nullable();
            $table->string('sd_vat')->nullable();
            $table->string('sd_consignee_address')->nullable();
            $table->unsignedInteger('sd_recipient_country')->nullable();
            $table->foreign('sd_recipient_country')->references('id')->on('countries');
            $table->string('sd_recipient_name')->nullable();
            $table->string('sd_recipient_address')->nullable();
            $table->string('sd_reg_custom')->nullable();

            $table->decimal('cn_gross_weight', 10, 2)->nullable();
            $table->decimal('cn_comm_num', 10, 2)->nullable();
            $table->unsignedInteger('cn_billing_terms_id')->nullable();
            $table->foreign('cn_billing_terms_id')->references('id')->on('billing_terms');
            $table->unsignedInteger('cn_cargo_type_id')->nullable();
            $table->foreign('cn_cargo_type_id')->references('id')->on('cargo_types');

            $table->unsignedInteger('ir_inspection_loc')->nullable();
            $table->foreign('ir_inspection_loc')->references('id')->on('inspection_locations');
            $table->date('ir_inspection_date')->nullable();
            $table->string('ir_inspection_address')->nullable();

            $table->unsignedInteger('od_country')->nullable();
            $table->foreign('od_country')->references('id')->on('countries');

            $table->string('att_agreement')->nullable();
            $table->string('att_ecd_invoice')->nullable();
            $table->string('did_num')->nullable();

            $table->string('td_car_license')->nullable();
            $table->string('td_driver_license')->nullable();
            $table->string('td_driver_name')->nullable();
            $table->decimal('td_car_total_weight', 10, 2)->nullable();
            $table->decimal('td_car_net_weight', 10, 2)->nullable();

            $table->string('fd_bill_num')->nullable();
            $table->string('fd_vessel_name')->nullable();
            $table->string('fd_call_sign')->nullable();
            $table->string('fd_imo_num')->nullable();
            $table->decimal('fd_total_weight', 10, 2)->nullable();
            $table->decimal('fd_net_sign', 10, 2)->nullable();
            $table->unsignedInteger('fd_fr_line_id')->nullable();
            $table->foreign('fd_fr_line_id')->references('id')->on('freight_lines');
            $table->unsignedInteger('fd_shipping_port')->nullable();
            $table->foreign('fd_shipping_port')->references('id')->on('shipping_ports');
            $table->unsignedInteger('fd_final_dest')->nullable();
            $table->foreign('fd_final_dest')->references('id')->on('shipping_ports');
            $table->date('fd_expected_arr_date')->nullable();
            $table->date('fd_shippment_date')->nullable();
            $table->string('fd_trip_num')->nullable();
            $table->string('fd_forwarder_name')->nullable();
            $table->string('fd_forwarder_address')->nullable();
            $table->string('fd_agent_name')->nullable();
            $table->string('fd_agent_address')->nullable();

            $table->string('att_ini_shippment')->nullable();
            $table->string('att_pack')->nullable();

            $table->string('sad_num')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::drop('applications');
    }

}
