<?php
$data= $this->db->fa("SELECT visip.ip,visip.name,vises.*,
DATE_FORMAT(FROM_UNIXTIME(vises.started), '%Y-%m-%d %H:%i') as sessions,
(vises.last_active - vises.started) as duration
FROM vises LEFT JOIN visip ON vises.visip_id=visip.id WHERE vises.ended=0 ORDER BY vises.last_active DESC");
?>