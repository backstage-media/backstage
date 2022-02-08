<?php

namespace App\Listeners;

use App\Events\ContractSent;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class SendContractManager
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  \App\Events\ContractSent  $event
     * @return void
     */
    public function handle(ContractSent $event)
    {
        //
    }
}
