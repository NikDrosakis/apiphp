<?php
//$spd=new SPD();
$user= $spd->fetch("SELECT * FROM ur WHERE name=? AND pass=?",array($this->name,$this->pass));
//
if(!empty($user)){
$user['profileimg']= $spd->obj()->profile($user['uid'], $user['grp']);
$user['bgimg']= $spd->obj()->bg($user['uid'], $user['grp']);
$user['fullname']= $spd->userfullname($user['uid'], $user['grp']);

$data=$user;
    $data['userid']= $user['uid'];
    $data['regid']= $this->id;
    $N=new Count;
    $e=$N->data('get',$user['uid']);
    $dn= $user['grp']==1
        // ? e('c_message_chat'] + e('c_message_inbox'] + e('n_eoi_accepted'] + e('nishortlisted'] + e('nifinalisted'] + e('c_interview'] + e('nihotlist'] + e('c_contact_joboffer_request']
        ? $e['c_message_chat'] + $e['c_message_inbox'] + $e['n_eoi_accepted'] + $e['c_eoi_received'] + $e['nishortlisted'] + $e['nifinalisted'] + $e['c_interview'] + $e['nihotlist']
        // : $e['c_message_chat'] + $e['c_message_inbox'] + $e['n_eoi_accepted'] + $e['nishortlisted'] + $e['nifinalisted'] + $e['n_interview'] + $e['nihotlist'] + $e['c_contact_joboffer_acceptedunread'];
        : $e['c_message_chat'] + $e['c_message_inbox'] + $e['n_eoi_accepted'] + $e['nishortlisted'] + $e['nifinalisted'] + $e['n_interview'] + $e['nihotlist'];
    //$data['notify']= (int)$data2['tactivity'];
    $data['notify']=!$dn ? 0 : (int)$dn;
    $userapp1= $spd->fetch("SELECT * FROM user_app WHERE regid=? AND uid=?",array($this->id,$user['uid']));
    if(!empty($userapp1)) {
        $q = $spd->query("UPDATE user_app SET loggedin=1,badge=? WHERE regid=? AND uid=?", array($data['notify'],$this->id,$user['uid']));
    }
    $userapp2 = $spd->fetch("SELECT * FROM user_app WHERE regid=? AND uid=0", array($this->id));
    if(!empty($userapp2)) {
        $q= $spd->query("UPDATE user_app SET uid=?, loggedin=1,badge=? WHERE regid=? AND uid=0", array($user['uid'],$data['notify'],$this->id));
    }
    if(empty($userapp1) && empty($userapp2)){
        $q= $spd->query("INSERT INTO user_app (uid,regid,loggedin,badge) VALUES(?,?,1,?)", array($user['uid'],$this->id,$data['notify']));
    }

    $spd->redis->set("NB".$user['uid'],$data['notify']);
    $spd->redis->rpush('NotifyList',$user['uid']);

}else{
$data='No';
}