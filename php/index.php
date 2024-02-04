<?php
include "boot.php";
header("Access-Control-Allow-Origin: https://192.168.2.3:3000");
header("Access-Control-Allow-Method: GET,POST,PUT,DELETE");
header("Access-Control-Allow-Credentials: true");
header("Authorization: Basic " . base64_encode('mysecrettoken17')); //bXlzZWNyZXR0b2tlbjE3
$conf=json2array(SITE_ROOT.'setup.json');
$api=new API($conf);
$api->response();


