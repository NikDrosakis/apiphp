<?php
ini_set('display_errors',1);
error_reporting(E_ERROR | E_WARNING | E_PARSE);
@ini_set('memory_limit','-1');
@ini_set('xdebug.max_nesting_level', 10000);
@ini_set('output_buffering', 'on');
@ini_set('max_execution_time', 600000);
@ini_set("allow_url_fopen",1);
@ini_set('upload_max_filesize', '8M');
@ini_set('post_max_size','8M');
@ini_set('date.timezone', 'Europe/Athens');
@ini_set( 'session.cookie_httponly', 1 );
date_default_timezone_set('Europe/Athens');
session_cache_limiter('private, must-revalidate');
session_cache_expire(60);
$time=time();
@ini_set("session.use_cookies", "on");
@ini_set("session.use_trans_sid", "on");
@ini_set('gd.jpeg_ignore_warning', true);
@define('SERVERNAME', $_SERVER['SERVER_NAME']);
@define ('URL_FILE', basename($_SERVER['PHP_SELF']));
@define ('URL_PAGE', basename(URL_FILE, ".php"));
@define ('SELF_NONURL', $_SERVER['PHP_SELF'].($_SERVER['QUERY_STRING']!="" ? '?'.$_SERVER['QUERY_STRING']:''));
@define('CURRENT', getcwd());
@define('CUR_DIR',basename(dirname($_SERVER['PHP_SELF'])));
@define('CUR_FOLDER',basename(dirname(__FILE__)));
@define ('SITE_ROOT',dirname(dirname(__FILE__)) . '/');
@define ('SITE',basename(SITE_ROOT));
@define ('SQLITE',SITE_ROOT."admin/db/");

@define ('DOMAINAME',php_uname("n")=='main' ? 'spd4' : 'dev.speedemployer');
define('LOC',$_GET['LOC']);
$_SERVER['HTTP_HOST']= DOMAINAME.'.'.LOC;
@define('SITE_URL',"https://".$_SERVER['HTTP_HOST'].'/');
@define ('CSS', SITE_URL."css/");
@define ('JS', SITE_URL."js/");
@define ('LIBS', SITE_URL."libs/");
@define ('AJAX', SITE_URL."ajax/");
@define ('IMAGES_PATH', SITE_URL."img/");
@define ('ADMIN_IMAGES', SITE_URL."admin/public/img/");
@define ('HELP_PATH', IMAGES_PATH."help/");
@define ('UPLOADS', SITE_URL."uploads/");
@define ('UPLOADS_ICON', SITE_URL."uploads/thumbs/");
@define ('UPLOADS_ROOTPATH', "/var/www/uploadsdev/");
@define ('UPLOADS_ROOTPATH_ICON', "/var/www/uploadsdev/thumbs/");
@define ('AVATAR_PATH', SITE_URL.'img/avatar/');
@define ('ICONS_PROFILE', SITE_URL.'img/icons_profile/');
@define('CURRENT_TIMESTAMP', "UNIX_TIMESTAMP(CURDATE())");
include (SITE_ROOT."php/generic.php");

$GLOBAL=array();
$gets=array('uname','pname','page','mode','type','code','auth','id','cid','p','aid','iid','eid','pid','ep','orderid','ticket','flag','desc','action');
foreach($gets as $get){
    $GLOBAL[$get]= isset($_REQUEST[$get]) ? trim($_REQUEST[$get]) : "";
}
$GLOBAL['mobile']= $ismobile || SUBDOM=='m';
$GLOBAL['referer'] = REFERER;
$GLOBAL['SUBDOM'] = SUBDOM;
$GLOBAL['SERVERNAME'] = SERVERNAME;
$GLOBAL['SERVERBASE'] = SERVERBASE;
$GLOBAL['SUBDOM_EXIST'] = SUBDOM_EXIST;
$GLOBAL['DOM_EXT'] = DOM_EXT;
$GLOBAL['ISLOCAL'] = ISLOCAL;
$GLOBAL['CUR_DIR'] = CUR_DIR;
$GLOBAL['URL_FILE'] = URL_FILE;
$GLOBAL['URL_PAGE'] = URL_PAGE;
$GLOBAL['SITE_URL'] = SITE_URL;
$GLOBAL['LOC'] = LOC;
$GLOBAL['SITE_ROOT'] = SITE_ROOT;
$GLOBAL['UPLOADS_ROOTPATH'] = UPLOADS_ROOTPATH;
$GLOBAL['SERVER'] = $_SERVER;
$GLOBAL['CONF'] = config('dev.speedemployer.gr');
$GLOBAL['spd_uid'] = array(12=>1,32=>79089);
$GLOBAL['pages']=array('home','message','eoi','contact','interview','support','activity');
$GLOBAL['profile_pages']=array('account','agent','blocked','membership','quotes','stream','upgrade','promotion','information','photos','marketplace');
$GLOBAL['memberships']=array(
    1=>'annual',
    5=>'smallbusiness',
    6=>'professional',
    7=>'corporate',
    10=>'agent',
    11=>'agentgov'
);


//AUTOLOAD THE core class SYSTEM
spl_autoload_register(function ($className) {
    if(file_exists("/var/www/spd4/class/".$className.".php"))
        include ("/var/www/spd4/class/".$className.".php");
});
$time=time();
$spd=new SPD('sys',SITE.'.'.LOC);

$globkeys= $spd->keys('isf_*');
if(count($globkeys) == 0) {   //read from redis
    $spd->isf('*');
}
//global forms get from cache else mysql
$globs= $spd->fetchRowList('name','setting',"WHERE tag='globs'");
foreach ($globs as $globid => $globname) {
    if(empty($GLOBAL[$globname])) {
        $GLOBAL[$globname] = $spd->isf($globname);
    }
}

