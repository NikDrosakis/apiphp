<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge; chrome=1; IE=9; IE=8; IE=7">
    <title>Gaia APIphp</title>
</head>
<body>
<div id="wrapper" style="width:80%">
<?php
$id=$_COOKIE['uid'];
$grp=$_COOKIE['grp'];
$loggedin=isset($_COOKIE['uid']) && isset($_COOKIE['grp']);
?>
<h3>Gaia Apiphp page - Guest </h3>
<?php
if($loggedin){ ?>
<h3>Gaia Apiphp page - <?=$this->userfullname($id,$grp); ?></h3>
<?php
    $Parsedown = new Parsedown();

    echo $Parsedown->text(file_get_contents("README.md"));
//endpoints reference
}else{
    echo "Authentication needed to access page";
}
?>
</div>
</body>
</html>