<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notifications', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->unsignedBigInteger('from_user');
            $table->foreign('from_user')->references('id')->on('users');
            $table->unsignedBigInteger('to_user');
            $table->foreign('to_user')->references('id')->on('users');
            $table->unsignedBigInteger('notification_type');
            $table->foreign('notification_type')->references('id')->on('notification_types');
            $table->text('message');
            // Target to the notification, for instance if this is a notification about a Video Privacy change. It is going to have the ID of the Video as value.
            $table->text('target_id');
            $table->boolean('read')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('notifications');
    }
}
