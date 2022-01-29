<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRolesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('roles', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->unsignedBigInteger('user_type_id');
            $table->unsignedBigInteger('manager_id');
            $table->unsignedBigInteger('creator_id');
            $table->foreign('user_type_id')->references('id')->on('user_types');
            $table->foreign('manager_id')->references('id')->on('managers');
            $table->foreign('creator_id')->references('id')->on('creators');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('roles');
    }
}
