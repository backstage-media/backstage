<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class CreateUserTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_types', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('type_name');
        });

        // Insert some production data
        DB::table('user_types')->insert(
            ['type_name' => 'Creator']
        );

        DB::table('user_types')->insert(
            ['type_name' => 'Manager']
        );
        
        DB::table('user_types')->insert(
            ['type_name' => 'Admin']
        );
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_types');
    }
}
