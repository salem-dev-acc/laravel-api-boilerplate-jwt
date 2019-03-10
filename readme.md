## Laravel API Boilerplate (JWT Edition) for Laravel 5.6


Laravel API Boilerplate is a "starter kit" you can use to build your first API in seconds. As you can easily imagine, it is built on top of the awesome Laravel Framework. This version is built on Laravel 5.6!

It is built on top of three big guys:

* JWT-Auth - [tymondesigns/jwt-auth](https://github.com/tymondesigns/jwt-auth)
* Dingo API - [dingo/api](https://github.com/dingo/api)
* Laravel-CORS [barryvdh/laravel-cors](http://github.com/barryvdh/laravel-cors)
* Swagger [darkaonline/l5-swagger](https://github.com/DarkaOnLine/L5-Swagger)
* Mail Local Driver [mailhog/mailhog](https://github.com/mailhog/MailHog)
* Debugbar [barryvdh/laravel-debugbar](https://github.com/barryvdh/laravel-debugbar)

What I made is really simple: an integration of these three packages and a setup of some authentication and credentials recovery methods.

## Main Features

### Ready-To-Use Authentication Controllers

You don't have to worry about authentication and password recovery anymore. I created four controllers you can find in the `App\Api\V1\Controllers` for those operations.

For each controller there's an already setup route in `routes/api.php` file:

* `POST api/auth/login`, to do the login and get your access token;
* `POST api/auth/refresh`, to refresh an existent access token by getting a new one;
* `POST api/auth/signup`, to create a new user into your application;
* `POST api/auth/recovery`, to recover your credentials;
* `POST api/auth/reset`, to reset your password after the recovery;
* `POST api/auth/logout`, to log out the user by invalidating the passed token;
* `GET api/auth/me`, to get current user data;

### Separate File for Routes

All the API routes can be found in the `routes/api.php` file. This also follow the Laravel 5.5 convention.

### Secrets Generation

Every time you create a new project starting from this repository, the _php artisan jwt:generate_ command will be executed.

## Configuration

You can find all the boilerplate specific settings in the `config/boilerplate.php` config file.

```php
<?php

return [

    // these options are related to the sign-up procedure
    'sign_up' => [
        
        // this option must be set to true if you want to release a token
        // when your user successfully terminates the sign-in procedure
        'release_token' => env('SIGN_UP_RELEASE_TOKEN', false),
    ],

    // these options are related to the password recovery procedure
    'reset_password' => [
        
        // this option must be set to true if you want to release a token
        // when your user successfully terminates the password reset procedure
        'release_token' => env('PASSWORD_RESET_RELEASE_TOKEN', false),
    ]

];
```

As I already said before, this boilerplate is based on _dingo/api_ and _tymondesigns/jwt-auth_ packages. So, you can find many informations about configuration <a href="https://github.com/tymondesigns/jwt-auth/wiki/Configuration" target="_blank">here</a> and <a href="https://github.com/dingo/api/wiki/Configuration">here</a>.

However, there are some extra options that I placed in a _config/boilerplate.php_ file:

* `sign_up.release_token`: set it to `true` if you want your app release the token right after the sign up process;
* `reset_password.release_token`: set it to `true` if you want your app release the token right after the password reset process;

There are also the validation rules for every action (login, sign up, recovery and reset). Feel free to customize it for your needs.

## Creating Endpoints

You can create endpoints in the same way you could to with using the single _dingo/api_ package. You can <a href="https://github.com/dingo/api/wiki/Creating-API-Endpoints" target="_blank">read its documentation</a> for details. After all, that's just a boilerplate! :)

However, I added some example routes to the `routes/api.php` file to give you immediately an idea.

## Cross Origin Resource Sharing

If you want to enable CORS for a specific route or routes group, you just have to use the _cors_ middleware on them.

Thanks to the _barryvdh/laravel-cors_ package, you can handle CORS easily. Just check <a href="https://github.com/barryvdh/laravel-cors" target="_blank">the docs at this page</a> for more info.

## Tests 

Tests are performed with using sqlite database driver. In order to customize settings make changes to phpunit.xml file.

To run tests:

* run `vendor/bin/phpunit`;

## Code styling

Tools focuses on finding errors in your code without actually running it.

It catches whole classes of bugs even before you write tests for the code.
It moves PHP closer to compiled languages in the sense that the correctness of each line of the code can be checked before you run the actual line.

* run `vendor/bin/phpstan analyse -- app`
* run `vendor/squizlabs/php_codesniffer/bin/phpcs -p --standard=PSR2 --colors app/`
or
* run `make lint`