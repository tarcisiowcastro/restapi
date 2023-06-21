<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('check_list__item_details', function (Blueprint $table) {
            $table->id();
            $table->string('message');                        
            $table->datetime('dt_start');                        
            $table->datetime('dt_end');                        
            $table->float('price');                                    
            $table->foreignId('check_list_id')->constrained()->onDelete('cascade')->onUpdate('no action');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('check_list__item_details');
    }
};
