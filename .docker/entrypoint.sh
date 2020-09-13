#!/bin/bash

composer install
php artisan generate:key
php artisan migrate
php-fpm
