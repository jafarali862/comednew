<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Illuminate\Pagination\Paginator;
use Laravel\Passport\Passport;
use Illuminate\Support\Facades\View;
use App\Models\CompanyLogo;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot()
    {
         Paginator::useBootstrap();
         View::share('companyLogo', CompanyLogo::latest()->first());
    }
}
