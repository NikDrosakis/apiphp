<?php
$q= $spd->query("UPDATE user_app SET loggedin=0 WHERE uid=? AND regid=?", array($this->id,$this->regid));
if(!$q){ $data='no';}else{
    $spd->redis->del("NB".$this->id);
    $data='ok';
}