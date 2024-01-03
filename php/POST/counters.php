<?php
//POST FROM $spd->counters() Counters class -from mysql
//$data=$this->counters($this->id,$this->grp,array(),$this->status);
$c=new Count;
$data = $c->data($this->action,$this->id,$this->grp);

//        $this->redis->subscribe(array('chan-1', 'chan-2', 'chan-3'), 'f');
//$data= $spd->counters($this->id,$this->grp);