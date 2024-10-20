<?php

return [
    // 'class' => 'yii\db\Connection',
    // 'dsn' => 'mysql:host=localhost;dbname=yii2basic',
    // 'username' => 'root',
    // 'password' => '',
    // 'charset' => 'utf8',

    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=db;dbname=yii2db', // 'db' refers to the Docker service
    'username' => 'yii2user',
    'password' => 'yii2password',
    'charset' => 'utf8',

    // Schema cache options (for production environment)
    //'enableSchemaCache' => true,
    //'schemaCacheDuration' => 60,
    //'schemaCache' => 'cache',
];
