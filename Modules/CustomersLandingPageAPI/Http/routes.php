<?php

Route::group(['middleware' => 'web', 'prefix' => 'customerslandingpageapi', 'namespace' => 'Modules\CustomersLandingPageAPI\Http\Controllers'], function()
{
    Route::get('/', 'CustomersLandingPageAPIController@index');
});
