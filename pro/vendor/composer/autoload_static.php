<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit2bc4f313dba415539e266f7ac2c87dcd
{
    public static $files = array (
        '320cde22f66dd4f5d3fd621d3e88b98f' => __DIR__ . '/..' . '/symfony/polyfill-ctype/bootstrap.php',
        'a9ed0d27b5a698798a89181429f162c5' => __DIR__ . '/..' . '/khanamiryan/qrcode-detector-decoder/lib/Common/customFunctions.php',
        '9b552a3cc426e3287cc811caefa3cf53' => __DIR__ . '/..' . '/topthink/think-helper/src/helper.php',
        '1cfd2761b63b0a29ed23657ea394cb2d' => __DIR__ . '/..' . '/topthink/think-captcha/src/helper.php',
        'ddc3cd2a04224f9638c5d0de6a69c7e3' => __DIR__ . '/..' . '/topthink/think-migration/src/config.php',
        'cc56288302d9df745d97c934d6a6e5f0' => __DIR__ . '/..' . '/topthink/think-queue/src/common.php',
    );

    public static $prefixLengthsPsr4 = array (
        't' => 
        array (
            'think\\worker\\' => 13,
            'think\\oracle\\' => 13,
            'think\\mongo\\' => 12,
            'think\\migration\\' => 16,
            'think\\helper\\' => 13,
            'think\\composer\\' => 15,
            'think\\captcha\\' => 14,
            'think\\' => 6,
        ),
        'a' => 
        array (
            'app\\' => 4,
        ),
        'Z' => 
        array (
            'Zxing\\' => 6,
        ),
        'W' => 
        array (
            'Workerman\\' => 10,
        ),
        'S' => 
        array (
            'Symfony\\Polyfill\\Ctype\\' => 23,
            'Symfony\\Component\\PropertyAccess\\' => 33,
            'Symfony\\Component\\OptionsResolver\\' => 34,
            'Symfony\\Component\\Inflector\\' => 28,
        ),
        'P' => 
        array (
            'Phinx\\' => 6,
        ),
        'M' => 
        array (
            'MyCLabs\\Enum\\' => 13,
        ),
        'E' => 
        array (
            'Endroid\\QrCode\\' => 15,
        ),
        'D' => 
        array (
            'DASPRiD\\Enum\\' => 13,
        ),
        'B' => 
        array (
            'BaconQrCode\\' => 12,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'think\\worker\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-worker/src',
        ),
        'think\\oracle\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-oracle/src',
        ),
        'think\\mongo\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-mongo/src',
        ),
        'think\\migration\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-migration/src',
        ),
        'think\\helper\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-helper/src',
        ),
        'think\\composer\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-installer/src',
        ),
        'think\\captcha\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-captcha/src',
        ),
        'think\\' => 
        array (
            0 => __DIR__ . '/../..' . '/thinkphp/library/think',
            1 => __DIR__ . '/..' . '/topthink/think-image/src',
            2 => __DIR__ . '/..' . '/topthink/think-queue/src',
        ),
        'app\\' => 
        array (
            0 => __DIR__ . '/../..' . '/application',
        ),
        'Zxing\\' => 
        array (
            0 => __DIR__ . '/..' . '/khanamiryan/qrcode-detector-decoder/lib',
        ),
        'Workerman\\' => 
        array (
            0 => __DIR__ . '/..' . '/workerman/workerman',
        ),
        'Symfony\\Polyfill\\Ctype\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/polyfill-ctype',
        ),
        'Symfony\\Component\\PropertyAccess\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/property-access',
        ),
        'Symfony\\Component\\OptionsResolver\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/options-resolver',
        ),
        'Symfony\\Component\\Inflector\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/inflector',
        ),
        'Phinx\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-migration/phinx/src/Phinx',
        ),
        'MyCLabs\\Enum\\' => 
        array (
            0 => __DIR__ . '/..' . '/myclabs/php-enum/src',
        ),
        'Endroid\\QrCode\\' => 
        array (
            0 => __DIR__ . '/..' . '/endroid/qr-code/src',
        ),
        'DASPRiD\\Enum\\' => 
        array (
            0 => __DIR__ . '/..' . '/dasprid/enum/src',
        ),
        'BaconQrCode\\' => 
        array (
            0 => __DIR__ . '/..' . '/bacon/bacon-qr-code/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit2bc4f313dba415539e266f7ac2c87dcd::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit2bc4f313dba415539e266f7ac2c87dcd::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}