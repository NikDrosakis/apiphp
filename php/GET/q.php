<?php
//Todo UPDATE WITH uid request in an array of tables
$data=array();
$table= $this->method; //t for table
$id= $this->id;

if($table=='user') {
    $query = "SELECT * FROM user WHERE uid=?";
    $dat=array();
    $dat= $this->db->f($query,array($id));
    //$grp= $dat['grp'];
    $dat[]= $this->db->f("SELECT * FROM ur WHERE uid=?",array($dat['id']));

}else{
    $query = "SELECT * FROM $table WHERE uid=?";
    $dat= $this->db->f($query,array($id));
}

if(empty($dat) || !$dat){
    $data=$query;
}else{
    $data=$dat;
}
?>