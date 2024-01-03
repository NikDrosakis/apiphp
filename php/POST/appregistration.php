<?php
$user= $spd->fetch("SELECT uid,loggedin FROM user_app WHERE regid=?",array($this->id));
if(empty($user)){
//    $q= $spd->query("INSERT INTO user_app (regid,loggedin) VALUES(?,1)", array($this->id));
    $q= $spd->query("INSERT INTO user_app (regid) VALUES(?)", array($this->id));
}
    $data='ok';

