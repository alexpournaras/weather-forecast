<?php

use Illuminate\Support\Facades\Schedule;

Schedule::command('fetch:weather-forecast')->daily();
