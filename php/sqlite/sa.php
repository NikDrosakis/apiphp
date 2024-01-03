<?php
/*
  Αν μπει ένα νέο domain υπάρχουν
 Το .gr γιατί χρειάζεται api kai repo
 Το vhost.json πρέπει να έχει το Local data έξω απ' το setup.json
 1 vhosts > create table connecting all sqlite tables
 2 vhosts > create new and edit function and new parameter [add field fs]
 3 export to json function


  */


define('SQLITE','');
$sa=new DB('sa','sqlite');
$doms= $sa->fa("SELECT * from domains");
$ips= $sa->fa("SELECT * from ips");
$servers= $sa->fa("SELECT * from servers");
$subdoms= $sa->fa("SELECT * from subdomains");
$vhosts= $sa->fa("SELECT * from vhosts");
xecho($doms);
xecho($ips);
xecho($servers);
xecho($subdoms);
?>
<br/>
<table>
    <tr>
        <th>id</th>
        <th>vhost</th>
        <th></th>
    <tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
    <tr>
</table>