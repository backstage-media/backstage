<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class CreateNotificationTypeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notification_types', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('type_name');
        });

        // Insert some production data
        DB::table('notification_types')->insert(
            ['type_name' => 'Content Comment'],
        );
        DB::table('notification_types')->insert(
            ['type_name' => 'Content Change']
        );
        DB::table('notification_types')->insert(
            ['type_name' => 'Private Message']
        );
    
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('notification_types');
    }
}
