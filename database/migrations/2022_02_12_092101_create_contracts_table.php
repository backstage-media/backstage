<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContractsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contracts', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->unsignedBigInteger('manager_id');
            $table->foreign('manager_id')->references('id')->on('managers');
            $table->unsignedBigInteger('creator_id');
            $table->foreign('creator_id')->references('id')->on('creators');
            // Define if the contract is already accepted or not
            $table->boolean('status')->default(false);
            $table->unsignedBigInteger('agreement_id')->nullable();
            $table->foreign('agreement_id')->references('id')->on('agreements');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contracts');
    }
}
