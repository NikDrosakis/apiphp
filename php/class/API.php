<?php
/*
Main class of REST API
UPDATED 4-2-2024
*/
class API {

    public $db;
    public $maria;
    public $obj;
    public $status_message;
    public $method;
    public $conf;
    public $verb;
    public $q;
    //create status message with $REST['status_message']
    public function __construct($conf){
        $this->conf=$conf;
        $this->db=new DB($conf['maria'],'maria',$conf);
       // xecho($this->maria);
        //insert folder to obj table
     //   $folder="/var/www/nikosdrosakis.gr/portal/public/media/";
       // foreach(glob($folder."*") as $file){
         //   $this->db->inse("obj",["uid"=>1,"objgroupid"=>1,"filename"=>basename($file)]);
        //}
   }
//$_SERVER['REQUEST_METHOD'] === 'DELETE' or $_SERVER['REQUEST_METHOD'] === 'PUT'.
    public function response(){
        $this->status_message = $this->conf['status_message'];
//       $this->verb = !empty($_POST) ? 'POST' : (!empty($_GET) ? 'GET' : '');
      // xecho($_SERVER);
       $this->verb = $_SERVER['REQUEST_METHOD'];
//        switch ($this->verb) {
//            case 'POST':$request = $_POST;break;
//            case 'GET':$request = $_GET;break;
//            case 'DELETE':$request = $_DELETE;break;
//            case 'PUT':
//            case 'PATCH':
//                parse_str(file_get_contents('php://input'), $request);
//                //if the information received cannot be interpreted as an arrangement it is ignored.
//                if (!is_array($request)) {$request = array();}break;
//            default:
//                $request = array();
//                break;
//        }
        foreach($_REQUEST as $key =>$val){
            $this->{$key}=$val;
        }

        if($this->verb=='GET' && $this->method=='login') {
            header("Content-Type: application/json; charset=UTF-8");
            require_once SITE_ROOT . "GET/login.php";
            $response = array();
            if($data==='NO'){
                $status = 403;
                $status_message = $this->status_message[$status];
            }else if($data==='OK'){
                $status = 202;
                $status_message = $this->status_message[$status];
            }
            $response['status'] = $status;
            $response['status_message'] = $status_message;
            $response['operation'] = $this->verb;
            header("HTTP/2 $status $status_message");
            $response['val'] = $data;
            echo json_encode($response, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
        }elseif (empty($this->method)){
           include 'view.php';
        } else {
            $token=base64_encode('mysecrettoken17'); //read token from db bXlzZWNyZXR0b2tlbjE3
            header("Content-Type: application/json; charset=UTF-8");
         //   if(!isset($_GET['token']) || $this->token!=$token){
          //      $status = 401;
         //       $status_message = $this->status_message[$status];
        //    }else{
                //authenticate function
             //   if($this->token==$token){
                    if ($this->verb != "") {
                        $sel = $this->{$this->verb}();
                        if (!empty($sel)) {
                            $status = 200;
                            $status_message = $this->status_message[$status];
                        } else {
                            $status = 200;
                            $status_message = 'Νο results found';
                        }
                    } else {
                        $status = 400;
                        $status_message = $this->status_message[$status];
                    }
            //    } else {
           //         $status = 403;
            //        $status_message = $this->status_message[$status];
            //    }
        //    }
            $response = array();
            header("HTTP/2 $status $status_message");
            $response['status'] = $status;
            $response['status_message'] = $status_message;
            $response['operation'] = $this->verb;
            $response['val'] = $sel;
            echo json_encode($response, JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT);
        }
    }


    /*
     * API METHODS
     * */
    public function GET($db='this')   {
        $table_array = ["user", "post","obj","objgroup","tax","comment"];
        if (in_array($this->method, $table_array)) {
                require_once SITE_ROOT . "GET/table.php";
            }elseif (file_exists(SITE_ROOT . "GET/$this->method.php")) {
                require_once SITE_ROOT . "GET/$this->method.php";
            } else {
                require_once "GET/q.php";
            }
            return $data;
        }

    public function POST($db='this'){
        if(file_exists("POST/$this->method.php")) {
            require_once "POST/$this->method.php";
            return $data;
        }else{
            return;
        }
    }

    public function DELETE(){
        if(file_exists("DELETE/$this->method.php")) {
            require_once "DELETE/$this->method.php";
            return $data;
        }else{
            return;
        }
    }

    public function PUT(){
        if(file_exists("PUT/$this->method.php")) {
            require_once "PUT/$this->method.php";
            return $data;
        }else{
            return;
        }
    }

    public function register($rtype = 'regSubmit'){
        $time = time();
        $name = trim($_POST['username']);
        $firstname = trim($_POST['firstname']);
        $lastname = trim($_POST['lastname']);
        $GRP = $_POST['grp'];
        $pass = trim($_POST['pass']);
        $mail = trim($_POST['mail']);
        //DEFAULT vars
        $addresszip = json_encode(array(1 => $_POST['addresszip1'], 2 => $_POST['addresszip2']));
        $afm = $_POST['afm'];
        $tel = json_encode(array(1 => $_POST['tel'], 2 => ''));
        $registered = $time;
        $lang = $_POST['lang']; //according to cookie
//        $authentication = $a == 'regSubmit' ? (!isset($_COOKIE['affiliate']) ? sha1($name) : '1') : '1';
        $authentication = $_POST['a'] == 'regSubmit' ? (!isset($_COOKIE['affiliate']) ? ($_POST['price'] > 0 || $_COOKIE['SPAUTH']=='3' ? '3' : '1') : '1') : '1';
        $modified = $time;
        $uid=!isset($_POST['id']) ? $_COOKIE['SPREGID'] :$_POST['id'];
//regural REGISTRATION
        if ($rtype == 'regSubmit') {
            $uid = $this->db->inse("ur", array(
                "grp" => $grp,
                "name" => $name,
                "firstname" => $firstname,
                "lastname" => $lastname,
                "pass" => $pass,
                "mail" => $mail,
                "mpack" => $packs,
                "addresszip" => $addresszip,
                "afm" => $afm,
                "tel" => $tel,
                "authentication" => $authentication,
                "streams" => $streams,
                "status" => 1,
                "registered" => $registered,
                "modified" => $modified
            ));
        }
        $data["uid"]=$uid;
        $data["grp"]=$grp;
        $data["message"]= !$uid ? "NO" : "OK";
        return $data;
    }
    //add to cache
    /*
     * CHECK IF LOGGEDIN
     *	cache islogged
     * phase : 0 inactive 1 in visibility close 2 in visibility open
     *
     * */
//    public function is_logged()	{
//        global $GLOBAL;
//        if(!empty($_COOKIE['sid']) && !empty($_COOKIE['session-group'])) {
//            $grp = $_COOKIE['session-group'];
//            $fetch = $this->db->f("SELECT phase FROM user{$grp} WHERE uid=?", array($_COOKIE['sid']));
//            return $fetch['phase'] == 0 ? false : true;
//        }else{
//            return false;
//        }
//    }

    /************JSON***************/
//    public function getJSON($filename,$format='array',$lang=''){
////		if (CUR_DIR != 'ajax') {
//        $l = $lang != '' ? $lang : (!empty($_COOKIE['LANG']) ? $_COOKIE['LANG']:'en');
//        //if cache()
//        if (in_array($filename, array('buscat', 'classif', 'experience', 'help', 'lang', 'languages', 'countries', 'education', 'profession', 'subclassif', 'subclassifbyid', 'professionbyid', 'terms'))) {
//
//            $cache= $format=='json' ? $this->redis->get($filename . '_' . $l,'json') : $this->redis->get($filename . '_' . $l);
//            if ($cache!=false) {
//                return $cache;
//            } else {
//                $str = file_get_contents(SITE_ROOT . 'globs/' . $l . '/' . $filename . '_' . $l . '.json');
//                $this->set($filename . '_' . $l, $str);
//                return json_decode($str, true);
//            }
//        }elseif (in_array($filename, array('province', 'provincebyid','location','provincecitylist','locationbyid'))) {
//            $cache= $format=='json' ? $this->redis->get($filename . '_' . $l . '_' . LOC,'json') : $this->redis->get($filename . '_' . $l . '_' . LOC);
//            if ($cache!=false) {
//                return $cache;
//            } else {
//                $str = file_get_contents(SITE_ROOT. 'globs/' . $l . '/' . LOC . '/' . $filename . '_' . LOC . '.json');
//                $this->set($filename . '_' . $l. '_' . LOC, $str);
//                return json_decode($str, true);
//            }
//        }
////		}
//    }

    //update added into memcache()d

   public function userfullname($id,$grp){
//        $u= $grp==1 ? 'user1' : 'user2';

       $sel = $this->db->f("SELECT firstname,lastname,grp FROM user WHERE id=? AND grp=?", array($id,$grp));

//        $group = $grp == '' ? ($sel['usergroup'] == 1 ? 1 : 2) : $grp;
//        $contact = $cid != '' ? $this->db->f("SELECT fullnameP FROM contact WHERE id=?", array($cid)) : '';
//
//        if ($group == 1) {
//            $person = $this->db->f("SELECT alias FROM user1 WHERE uid=? ", array($id));
//
//
//            if ($contact != '' && $contact['fullnameP'] == 1) {
//                $fullname = $sel['firstname'] . ' ' . $sel['lastname'];
//            } else {
//                $fullname = $sel['fullnameP'] == 2 ? $sel['firstname'] . ' ' . $sel['lastname']
//                    : ($sel['fullnameP'] == 1
//                        ? $sel['firstname'] . ' ' . substr($sel['lastname'], 0, 1) . '.'
//                        : ($person['alias'] != '' ? $person['alias'] : $sel['firstname'] . ' ' . substr($sel['lastname'], 0, 1) . '.')
//                    );
//            }
//
////					if($contact!=''){
////						if($contact['fullnameP']==1) {
////							$fullname .= $sel['lastname'];
////						}else{
////							$fullname .=' '.substr($sel['lastname'], 0, 1).'.';
////						}
////					}elseif($sel['fullnameP'] == 0){
////						$fullname .= ' '.substr($sel['lastname'], 0, 1).'.';
////					}else{
////						$fullname .= ' '.$sel['lastname'];
////					}
//        } else {
//            $selecti = $this->db->f("SELECT trade,official FROM user2 WHERE uid=? ", array($id));
//            $fullname = $selecti['trade'] != "" ? $selecti['trade'] : $selecti['official'];
//        }
        return $sel['firstname'] . ' ' . $sel['lastname'];
//
    }

    /*
PROFILE IMG
a) profile image file
b) default image link according to business category if company
c) avatar link if selected if person
*/
    //update added into memcache()d
    public function profile($userid='',$usergroup=SPGROUP,$thumb=true){
        global $GLOBAL;
        $uid=$userid !='' ? $userid : SPID;
        //$u= $usergroup==1 ? 'user1' : 'user2';
        //check if img exists in db
        $obj_query="SELECT obj.name,ur.grp FROM obj
            LEFT JOIN ur ON obj.uid=ur.uid
			WHERE obj.uid=$uid AND obj.type=1 AND obj.status=2";

        $img = $this->db->f($obj_query);
        $grp=$usergroup !='' ? $usergroup : $img['grp'];
        //PERSON check avatar
        if($grp==1){
            $av= $this->db->f("SELECT avatar FROM ur WHERE uid=?",array($uid));
            if ($av['avatar']!=0){
                $pimage= AVATAR_PATH.$av['avatar'].'a.jpg' ;
            }else{
                $null_link=IMAGES_PATH."icons_profile/general.jpg";
                if(empty($img)){
                    $pimage= $null_link;
                }else{
                    if (link_exist(UPLOADS_ICON.'icon_'.$img['name'])){
//						if (link_exist(UPLOADS_ROOTPATH.$img['name'])){
                        $pimage= $thumb==true
                            ? UPLOADS_ICON.'icon_'.$img['name']
                            : UPLOADS.$img['name'];
//						$pimage= UPLOADS.$img['name'];
                    }else{
                        $pimage= $null_link;
                    }
                }
            }
            //COMPANY
        }else{
            $img = $this->db->f($obj_query);
            $bs= $this->db->f("SELECT buscat FROM ur WHERE uid=?",array($uid)); if(!empty($bs)){extract($bs);}

            $buscat_link=IMAGES_PATH ."icons_profile/".$GLOBAL['business_pimages'][$this->btype_from_buscat($buscat)];

            if(empty($img)){
                $pimage= $buscat_link;
            }else{
                if (link_exist(UPLOADS_ROOTPATH_ICON.'icon_'.$img['name'])){
                    $pimage= $thumb==true
                        ? UPLOADS_ICON.'icon_'.$img['name']
                        : UPLOADS.$img['name'];
                }else{
                    $pimage= $buscat_link;
                }
            }
        }
        return $pimage;
    }
    /*
        BG IMG
        a) BGIMAGE file
        b) default image link according to business category if company
        c) avatar link if selected if person
    UPDATE ROOTPATH FOR uploads is /VAR/WWW/UPLOAS while on IMAGES IS /var/www/spd3/public_html/img
        */
//    public function bg($userid='',$usergroup=null,$icon=true){
//        global $GLOBAL;
//
//        //check if img exists in db
//        $uid=$userid !='' ? $userid : SPID;
//        $grp=$usergroup !='' ? $usergroup : SPGROUP;
//        $u= $usergroup==1 ? 'user1' : 'user2';
//        $obj_query = "SELECT name FROM obj WHERE uid=$uid AND type=2 AND status=2 ORDER BY created DESC";
//        //PERSON check avatar
//
//        if ($grp == 1) {
//
//            $av = $this->db->f("SELECT avatarbg FROM user1 WHERE uid=?", array($uid));
//            extract($av);
//            if ($avatarbg != 0) {
//                $link = AVATAR_PATH . $avatarbg . 'b.jpg';
//            } else {
//                $img = $this->db->f($obj_query);
//                $null_link = IMAGES_PATH . "icons_profile/general1.jpg";
//                if (empty($img)) {
//                    $link = $null_link;
//                } else {
//                    if (link_exist(UPLOADS_ICON.'icon_'.$img['name'])){
////					if (link_exist(UPLOADS_ROOTPATH . $img['name'])) {
//                        $link = $icon == true
//                            ? UPLOADS_ICON . 'icon_' . $img['name']
//                            : UPLOADS . $img['name'];
////						$link = $icon == true ? UPLOADS . $img['name'] : UPLOADS . $img['name'];
//                    } else {
//                        $link = $null_link;
//                    }
//                }
//            }
//            //COMPANY
//        } else {
//            $img = $this->db->f($obj_query);
//            $bs = $this->db->f("SELECT buscat FROM user2 WHERE uid=?", array($uid));
//            extract($bs);
//
//            $link = IMAGES_PATH . "background_profile/" . $GLOBAL['business_pimages'][$this->btype_from_buscat($buscat)];
//
//            if (!empty($img)) {
//                if (link_exist(UPLOADS . $img['name'])) {
////					$link = $icon == true ? UPLOADS_ICON . 'icon_' . $img['name'] : UPLOADS . $img['name'];
//                    $link = $icon == true ? UPLOADS . $img['name'] : UPLOADS.$img['name'];
//                }
//            }
//        }
//        return $link;
//    }

//    public function btype_from_buscat($b)
//    {
//
//        if ($b < 13) {
//            return 1;
//        } elseif ($b == 13) {
//            return 2;
//        } elseif ($b == 14) {
//            return 3;
//        } elseif ($b > 14 && $b < 21) {
//            return 4;
//        } elseif ($b > 20 && $b < 25) {
//            return 5;
//        } elseif ($b > 24 && $b < 39) {
//            return 6;
//        } elseif ($b > 38 && $b < 49) {
//            return 7;
//        } elseif ($b > 48 && $b < 98) {
//            return 8;
//        } elseif ($b > 97 && $b < 105) {
//            return 9;
//        } elseif ($b > 104 && $b < 118) {
//            return 10;
//        } elseif ($b > 117 && $b < 129) {
//            return 11;
//        } elseif ($b > 128 && $b < 147) {
//            return 12;
//        } elseif ($b > 146 && $b < 155) {
//            return 13;
//        } elseif ($b > 154 && $b < 158) {
//            return 14;
//        } elseif ($b > 157 && $b < 165) {
//            return 15;
//        } elseif ($b > 164 && $b < 167) {
//            return 16;
//        } elseif ($b > 166 && $b < 170) {
//            return 17;
//        } elseif ($b > 169 && $b < 174) {
//            return 18;
//        } elseif ($b > 173 && $b < 177) {
//            return 19;
//        } elseif ($b > 176 && $b < 183) {
//            return 20;
//        } elseif ($b > 182 && $b < 187) {
//            return 21;
//        } elseif ($b > 186 && $b < 190) {
//            return 22;
//        } elseif ($b > 189 && $b < 199) {
//            return 23;
//        } elseif ($b == 199) {
//            return 24;
//        }
//
//    }
//
//    public function curl_url($url){
//        $ch = curl_init();
//        curl_setopt($ch, CURLOPT_URL, $url);
//        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
//        curl_setopt($ch, CURLOPT_MAXREDIRS, 3);
//        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
//        $data = curl_exec($ch);
//        return $data;
//    }

//    public function counters($me = SPID, $grp = SPGROUP, $selection = array(),$status='save'){
//
//        if ($status == 'saved') { //only cache
//            $keys = $this->redis->keys("N$me.*"); //use lrange insteat
//            if (!empty($keys)) {
//                foreach ($keys as $k) {
//                    $key = explode('.', $k)[1];
//                    $counter[$key] = $this->redis->get($k);
//                }
//            }
//        } elseif ($status == 'save') {
//            $array_of_all = get_class_methods_noparent('Counters');
//            $counters = new Counters();
//            //the loop
//            foreach ($array_of_all as $meth) {
//                if (empty($selection) || in_array($meth, $selection)) {
//                        $counter[$meth] = $counters->$meth($me, $grp);
//                        //save to redis
//                        $this->redis->set('N' . $me . '.' . $meth, $counter[$meth]);
//                        //publish to api N
//                        $this->redis->publish('N','set.'.$meth.'.'.$counter[$meth]);
//                    }
//            }
//        }
//        return $counter;
//    }

}