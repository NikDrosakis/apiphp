<?php
$table=$this->method;
//xecho($_GET);
$id=isset($this->id) || isset($this->uid);
if(!$id){
    $data= $this->db->fa("SELECT * FROM $table");
}else{
    $key=isset($this->id) ? "id":"uid";
    $data= $this->db->f("SELECT * FROM $table WHERE $key=?",array($id));
}
