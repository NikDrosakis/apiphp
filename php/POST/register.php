<?php
$q= $this->register("UPDATE user SET phase=0 WHERE uid=? AND regid=?", array($this->id,$this->regid));
if(!$q){ $data='NO';}else{
    $data='OK';
}