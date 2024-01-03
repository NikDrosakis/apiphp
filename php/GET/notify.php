<?php
//$spd=new SPD();
$data=array();
$data= $spd->fetch("SELECT * FROM ur WHERE uid=?",array($this->id));
$grp= $data['grp'];
//$data2= $spd->fetch("SELECT * FROM ur WHERE uid=?",array($this->id));

$N=new Count;
$e=$N->data('get',$data['id']);
$data['counters'] = $e;
$data['notify']= SPGROUP==1
    // ? e('c_message_chat'] + e('c_message_inbox'] + e('n_eoi_accepted'] + e('nishortlisted'] + e('nifinalisted'] + e('c_interview'] + e('nihotlist'] + e('c_contact_joboffer_request']
    ? $e['c_message_chat'] + $e['c_message_inbox'] + $e['n_eoi_accepted'] + $e['c_eoi_received'] + $e['nishortlisted'] + $e['nifinalisted'] + $e['c_interview'] + $e['nihotlist']
    // : $e['c_message_chat'] + $e['c_message_inbox'] + $e['n_eoi_accepted'] + $e['nishortlisted'] + $e['nifinalisted'] + $e['n_interview'] + $e['nihotlist'] + $e['c_contact_joboffer_acceptedunread'];
    : $e['c_message_chat'] + $e['c_message_inbox'] + $e['n_eoi_accepted'] + $e['nishortlisted'] + $e['nifinalisted'] + $e['n_interview'] + $e['nihotlist'];
//$data['notify']= (int)$data2['tactivity'];
include "/var/www/spd4/local/dicen.php";
$data['dic']= $dic;
$data['profileimg']= $spd->obj()->profile($data['id'], $data['grp']);
$data['bgimg']= $spd->obj()->bg($data['id'], $data['grp']);
$data['fullname']= $spd->userfullname($data['id'], $data['grp']);
?>