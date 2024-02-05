<?php
$table=$this->method;
//xecho($_GET);
if(!isset($this->id)){
    $data= $this->db->fa("SELECT * FROM $table");
}else{
    $data= $this->db->f("SELECT * FROM $table WHERE id=?",array($this->id));
}