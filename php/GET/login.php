<?php
$user= $this->db->f("SELECT * FROM user WHERE name=? AND pass=?",array($this->name,$this->pass));
if(!empty($user)){
$user= $this->db->f("SELECT * FROM user WHERE name=? AND pass=?",array($this->name,$this->pass));
coo('uid',$user['id']);
coo('grp',$user['grp']);
$data='OK';
}else{
$data='NO';
}