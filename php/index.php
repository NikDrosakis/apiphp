<?php
include "boot.php";
$apilink= "https://nikosdrosakis.gr/api/";
header('Access-Control-Allow-Origin: '.$apilink);
header("Access-Control-Allow-Method: GET,POST");
header("Access-Control-Allow-Credentials: true");
header("Authorization: Basic " . base64_encode($_COOKIE['uid'] . $_COOKIE['grp']));
$conf=json2array(SITE_ROOT.'setup.json');
//xecho($conf);
$api=new API($conf);
$api->response();


