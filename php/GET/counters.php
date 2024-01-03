<?php
//GET from REDIS
//$data=$this->counters($this->id,$this->grp,array(),$this->status);

$c=new Count;
$data = $c->data($this->action,$this->id,$this->grp);

//$data = $_COOKIE;
//        $this->redis->subscribe(array('chan-1', 'chan-2', 'chan-3'), 'f');
//$data= $spd->counters($this->id,$this->grp);