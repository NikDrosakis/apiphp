<?php
$sel= $this->db->fa("SELECT *,
(SELECT SUM(last_active - started) as duration FROM vises WHERE visip_id=visip.id) as duration
FROM visip WHERE (SELECT SUM(last_active - started) as duration FROM vises WHERE visip_id=visip.id) IS NOT null");
$data=array();
for($i=0;$i<count($sel);$i++){
$data[$i]=$sel[$i];
$ip= $sel[$i]['ip'];
$data[$i]['browser']=$this->db->fl(array('browser','vises'),"WHERE visip_id={$sel[$i]['id']} GROUP BY browser");
$data[$i]['sessions']=$this->db->fl(array("DATE_FORMAT(FROM_UNIXTIME(started), '%Y-%m-%d %H:%i')"),'vises',"WHERE visip_id={$sel[$i]['id']}");
$data[$i]['uid']=$this->db->fl('uid','vises',"WHERE visip_id={$sel[$i]['id']}");
}
?>