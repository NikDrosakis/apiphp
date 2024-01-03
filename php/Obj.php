<?php
/*

Object Class created with GD library
as a static library
by Nikos Drosakis (c)2015
for SpeedEmployer.com

object types
1: pimage
2: bgimage
3: photos
4: cv attachments
5: agent contract with employer
6: agent contract with employee
7: CONTRACT JOB OFFER
8: agent attach contract certification
9: ads
10: ads
11: ads
*/

class Obj extends SPD{

    //need to be here, else every time that an agent method runs through $spd->agent(), SPD constructors runs
//    public function __construct(){
//
//    }

    public function select($type='',$userid='',$clause=''){
        $idi=$userid !='' ? $userid : SPID;
        $typeQ=$type !='' ? "AND type=$type" : '';
        $selecti = $this->fetchAll("SELECT * FROM obj WHERE uid=? $typeQ $clause",array($idi));
        if(empty($selecti)){return false;}else{	return $selecti; }
    }

    static function mode($filename,$mode='size'){
        if($mode=='size'){
            return filesize($filename);
        }else{
            list($width,$height) = getimagesize($filename);
            return (int)$$mode;
        }
    }

    //updated!
//	public function get($img,$typ='profile',$buscat=0,$grp=2){
//	global $GLOBAL;
//	switch($typ){
//	case 'profile':
//		if (!empty($img) && link_exist(UPLOADS_ROOTPATH.$img)){
//			return (UPLOADS.$img.'?'.time());
//
//		} else {
//		if ($grp==2){
//		return IMAGES_PATH."icons_profile/".$GLOBAL['business_pimages'][$buscat];
//			} else {
//		return IMAGES_PATH."icons_profile/general.jpg".'?'.time();
//		}
//		}
//	break;
//	case 'bgimage':
//		if (!empty($img) && link_exist(UPLOADS_ROOTPATH.$img)){
//		return (UPLOADS.$img.'?'.time());
//		} else {
//			if ($grp==2){
//		return IMAGES_PATH."background_profile/".$GLOBAL['business_pimages'][$buscat];
//			} else {
//		return IMAGES_PATH."icons_profile/general1.jpg".'?'.time();
//			}
//		}
//	break;
//	}
//	}

    /*
    PROFILE IMG
    a) profile image file
    b) default image link according to business category if company
    c) avatar link if selected if person
    */
    //update added into memcache()d
    public function profile($userid='',$usergroup=SPGROUP,$rootpath=false,$thumb=true){
        global $GLOBAL;
        $uid=$userid !='' ? $userid : SPID;
        $cimg= $this->get('pimage_'.$uid);
        //$u= $usergroup==1 ? 'user1' : 'user2';
        if($cimg!=false && $rootpath==false && $thumb==true){
            return $cimg;
        }else{
            //check if img exists in db
            $obj_query="SELECT obj.name,ur.grp FROM obj
            LEFT JOIN ur ON obj.uid=ur.uid
			WHERE obj.uid=$uid AND obj.type=1 AND obj.status=2";

            $img = $this->fetch($obj_query);
            $grp=$usergroup !='' ? $usergroup : $img['grp'];
            //PERSON check avatar
            if($grp==1){
                $av= $this->fetch("SELECT avatar_profile FROM ur WHERE uid=?",array($uid));
                if ($av['avatar_profile']!=0){
                    $pimage= ($rootpath==true ? AVATAR_ROOTPATH :AVATAR_PATH).$av['avatar_profile'].'a.jpg' ;
                }else{
                    $null_link=($rootpath==true ? IMAGES_ROOTPATH :IMAGES_PATH)."icons_profile/general.jpg";
                    if(empty($img)){
                        $pimage= $null_link;
                    }else{
                        if (link_exist(UPLOADS_ROOTPATH_ICON.'icon_'.$img['name'])){
//						if (link_exist(UPLOADS_ROOTPATH.$img['name'])){
                            $pimage= $thumb==true
                                ? (($rootpath==true ? UPLOADS_ROOTPATH_ICON : UPLOADS_ICON).'icon_'.$img['name'])
                                : (($rootpath==true ? UPLOADS_ROOTPATH : UPLOADS).$img['name']);
//						$pimage= UPLOADS.$img['name'];
                        }else{
                            $pimage= $null_link;
                        }
                    }
                }
                //COMPANY
            }else{
                $img = $this->fetch($obj_query);
                $bs= $this->fetch("SELECT business_category FROM ur WHERE uid=?",array($uid)); if(!empty($bs)){extract($bs);}

                $buscat_link=($rootpath==true ? IMAGES_ROOTPATH :IMAGES_PATH) ."icons_profile/".$GLOBAL['business_pimages'][$this->btype_from_buscat($business_category)];

                if(empty($img)){
                    $pimage= $buscat_link;
                }else{
                    if (link_exist(UPLOADS_ROOTPATH_ICON.'icon_'.$img['name'])){
                        $pimage= $thumb==true
                            ? ($rootpath==true ? UPLOADS_ROOTPATH_ICON : UPLOADS_ICON).'icon_'.$img['name']
                            : ($rootpath==true ? UPLOADS_ROOTPATH : UPLOADS).$img['name'];
                    }else{
                        $pimage= $buscat_link;
                    }
                }
            }

            if($rootpath==false && $thumb==true){$this->set('pimage_'.$uid,$pimage);}
            return $pimage;
        }
    }
    /*
        BG IMG
        a) BGIMAGE file
        b) default image link according to business category if company
        c) avatar link if selected if person
    UPDATE ROOTPATH FOR uploads is /VAR/WWW/UPLOAS while on IMAGES IS /var/www/spd3/public_html/img
        */
    public function bg($userid='',$usergroup=null,$icon=true,$rootpath=false){
        global $GLOBAL;

        //check if img exists in db
        $uid=$userid !='' ? $userid : SPID;
        $grp=$usergroup !='' ? $usergroup : SPGROUP;
        //$u= $usergroup==1 ? 'user1' : 'user2';
        $cimg=$this->get('bgimage_'.$uid);

        if($cimg!=false && $rootpath==false){
            return $cimg;
        }else{
            $obj_query = "SELECT name FROM obj WHERE uid=$uid AND type=2 AND status=2 ORDER BY created DESC";
            //PERSON check avatar

            if ($grp == 1) {

                $av = $this->fetch("SELECT avatar_bg FROM ur WHERE uid=?", array($uid));
                extract($av);
                if ($avatar_bg != 0) {
                    $link = ($rootpath==true ? AVATAR_ROOTPATH :AVATAR_PATH) . $avatar_bg . 'b.jpg';
                } else {
                    $img = $this->fetch($obj_query);
                    $null_link = ($rootpath==true ? IMAGES_ROOTPATH :IMAGES_PATH) . "icons_profile/general1.jpg";
                    if (empty($img)) {
                        $link = $null_link;
                    } else {
                        if (link_exist(UPLOADS_ROOTPATH_ICON.'icon_'.$img['name'])){
//					if (link_exist(UPLOADS_ROOTPATH . $img['name'])) {
                            $link = $icon == true
                                ? ($rootpath==true ? UPLOADS_ROOTPATH_ICON : UPLOADS_ICON) . 'icon_' . $img['name']
                                : ($rootpath==true ? UPLOADS_ROOTPATH : UPLOADS) . $img['name'];
//						$link = $icon == true ? UPLOADS . $img['name'] : UPLOADS . $img['name'];
                        } else {
                            $link = $null_link;
                        }
                    }
                }
                //COMPANY
            } else {
                $img = $this->fetch($obj_query);
                $bs = $this->fetch("SELECT business_category FROM ur WHERE uid=?", array($uid));
                extract($bs);

                $link = ($rootpath==true ? IMAGES_ROOTPATH :IMAGES_PATH) . "background_profile/" . $GLOBAL['business_pimages'][$this->btype_from_buscat($business_category)];

                if (!empty($img)) {
                    if (link_exist(UPLOADS_ROOTPATH . $img['name'])) {
//					$link = $icon == true ? UPLOADS_ICON . 'icon_' . $img['name'] : UPLOADS . $img['name'];
                        $link = $icon == true ? ($rootpath==true ? UPLOADS_ROOTPATH : UPLOADS)  . $img['name'] : ($rootpath==true ? UPLOADS_ROOTPATH : UPLOADS)  . $img['name'];
                    }
                }
            }
            //set cache()
            if($rootpath==false){$this->set('bgimage_'.$uid,$link);}
            return $link;

        }
    }


    /*
    RESIZE
    set PROPER SIZE to be acceptable for upload
    - set percent to resize according to original size
    - set size
    */
    static function resize($filename,$size=1){

        // Content type
        header('Content-Type: image/jpeg');

        list($width,$height)= getimagesize($filename);

        // new sizes according to percent
        if (is_array($size)){
            $newwidth = $size[0];
            $newheight =$size[1];
        }else{
            $newwidth =  $width * $size;
            $newheight = $height * $size;
        }


        // Load
        $thumb = imagecreatetruecolor($newwidth, $newheight);
        $source = imagecreatefromjpeg($filename);

        // Resize
        imagecopyresized($thumb, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
        //imagecopyresampled($thumb, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);

        // Output and free memory
        imagejpeg($thumb);
        imagedestroy($thumb);
    }


    /*
    create img
    - set $label
    - set $color array(red,green,blue) - default is black(0,0,0)
    - set $size
    */
    public static function create($filename,$label="",$color=array(0,0,0),$size=array(109,110)){
        $my_img = imagecreate($size[0],$size[1]);
        $background = imagecolorallocate( $my_img, $color[0],$color[1],$color[2]);
        $text_colour = imagecolorallocate( $my_img, 255, 255, 0 );
        $line_colour = imagecolorallocate( $my_img, 128, 255, 0 );
        imagestring( $my_img, 3, 2, 25, $label, $text_colour );
        imagesetthickness ( $my_img, 2 );
        imageline( $my_img, 5, 45, 100, 45, $line_colour );

        /* header( "Content-type: image/png" );
        imagepng( $my_img );
        imagecolordeallocate( $line_color );
        imagecolordeallocate( $text_color );
        imagecolordeallocate( $background ); */

        imagejpeg($my_img, $filename);

        // Free up memory
        imagedestroy( $my_img );
//echo $my_img;
    }


    static function thumbnail($path,$size=50){

        //if file link

        $ext=explode('.',$path);
        //$path = $_FILES['image']['name'];
        //$ext = pathinfo($path, PATHINFO_EXTENSION);
        $thumbnail_dir=IMAGES_PATH.'file_extensions/';
        $images_array=array('jpg','jpeg','png','tif','gif');
        if(in_array($ext[1],$images_array)){
            return ATTACHMENTS.$path;
        }else{
            return $thumbnail_dir= $thumbnail_dir.$ext[1].'.png';
        }
    }

    public function get_pie($data){
        //fill this array with your data
        $total=array_sum($data);
        for($i=0;$i<count($data);$i++)
        {
            $arc[$i]=$data[$i]*360/$total;
        }

        // create image
        $image = imagecreatetruecolor(550,550);
        $style=IMG_ARC_PIE;
        // allocate some colors
        $white    = imagecolorallocate($image, 0xFF, 0xFF, 0xFF);
        $gray     = imagecolorallocate($image, 0xC0, 0xC0, 0xC0);
        $darkgray = imagecolorallocate($image, 0x90, 0x90, 0x90);
        $navy     = imagecolorallocate($image, 0x00, 0x00, 0x80);
        $darknavy = imagecolorallocate($image, 0x00, 0x00, 0x50);
        $red      = imagecolorallocate($image, 0xFF, 0x00, 0x00);
        $darkred  = imagecolorallocate($image, 0x90, 0x00, 0x00);
        $colors=array($red,$gray,$navy,$red );
        $darkcolors=array($darkred,$darkgray,$darknavy,$darkred );
        $start=0;
        // make the 3D effect
        for ($i = 60; $i > 50; $i--)
        {
            for($j=0;$j<count($data);$j++)
            {
                imagefilledarc($image, 250, $i*5, 500, 250, $start, $start+$arc[$j],$darkcolors[$j], $style);
                $start=$start+$arc[$j];
            }

        }
        for($j=0;$j<count($data);$j++)
        {
            imagefilledarc($image, 250, 250, 500, 250, $start, $start+$arc[$j], $colors[$j], $style);
            $start=$start+$arc[$j];
        }

        // flush image
        header('Content-type: image/png');
        imagepng($image);
        imagedestroy($image);
    }

    public function url2Image(){
        if($_POST){
            $url = $_POST['url'];
            //$name = basename($url);
            //list($txt, $ext) = explode(".", $name);

            //$name = $name.".".$ext;
            $upload = file_put_contents(UPLOADS_ROOTPATH.$url,file_get_contents($url));
            //check success
            if($upload)  echo "Success: <a href='".UPLOADS.'01.jpg'."' target='_blank'>Check Uploaded</a>"; else "please check your folder permission";
        }
        ?>
        <form method="post" >
            Your URL: <input type="text" name="url" enctype="multipart/form-data"/>
            <input type="submit" name="furl" />
        </form>
    <?php }

    //attachments files
    public static function icon($file,$icon=false,$rootpath=false){
        $path_parts = pathinfo(UPLOADS.$file);
        $ext=$path_parts['extension'];
        $icons=array('doc'=>'doc','docx'=>'doc','rtf'=>'doc','pdf'=>'pdf','xls'=>'xls','csv'=>'xls','xlsx'=>'xls','zip'=>'zip','rar'=>'zip','gz'=>'zip','mp3'=>'audio','wav'=>'audio','mp4'=>'video','wma'=>'video','flv'=>'video','avi'=>'video','mpg'=>'video','html'=>'html','txt'=>'txt','ppt'=>'ppt','pptx'=>'ppt');
        $thumbs=array('jpg','png','gif','jpeg');

        if (in_array($ext,array_keys($icons))){
            return ($rootpath==true ? SITE_ROOT : SITE_URL).'img/file_extensions/'.$icons[$ext].'.png';

        }elseif(in_array($ext,$thumbs)){
            return ($icon==true ? ($rootpath==true ? UPLOADS_ROOTPATH_ICON : UPLOADS_ICON).'icon_'.$file : UPLOADS.$file);

        }else{
            return SITE_URL.'img/file_extensions/Me.png';
        }
    }


//IMAGE UPLOADER FUNCTIONS
#####  This function will proportionally resize image #####
    static function normal_resize_image($source, $destination, $image_type, $max_size, $image_width, $image_height, $quality){

        if($image_width <= 0 || $image_height <= 0){return '';} //return false if nothing to resize

        //do not resize if image is smaller than max size
        if($image_width <= $max_size && $image_height <= $max_size){
            if(self::save_image($source, $destination, $image_type, $quality)){
                return true;
            }
        }

        //Construct a proportional size of new image
        $image_scale	= min($max_size/$image_width, $max_size/$image_height);
        $new_width		= ceil($image_scale * $image_width);
        $new_height		= ceil($image_scale * $image_height);

        $new_canvas		= imagecreatetruecolor( $new_width, $new_height ); //Create a new true color image

        //Copy and resize part of an image with resampling
        if(imagecopyresampled($new_canvas, $source, 0, 0, 0, 0, $new_width, $new_height, $image_width, $image_height)){
            self::save_image($new_canvas, $destination, $image_type, $quality); //save resized image
        }

        return true;
    }

##### This function corps image to create exact square, no matter what its original size! ######
    public static function crop_image_square($image_name,$source, $destination, $image_type, $square_size, $image_width, $image_height, $quality){
        if($image_width <= 0 || $image_height <= 0){return false;} //return false if nothing to resize

        if( $image_width > $image_height ){
            //echo $image_width;
            //echo '<br/>';
            //echo $image_height;
            //echo '<br/>';
            $x_offset = 0;
            $y_offset = -(($image_width - $image_height) / 2);
//echo '<br/>';
            $s_size 	= $image_width - ($x_offset * 2);
        }else{
            $x_offset = 0;
            $y_offset = ($image_height - $image_width) / 2;
            $s_size = $image_height - ($y_offset * 2);
        }

        $new_canvas	= imagecreatetruecolor($square_size, $square_size); //Create a new true color image
        //Copy and resize part of an image with resampling
        if(imagecopyresampled($new_canvas, $source, 0, 0, $x_offset, $y_offset, $square_size, $square_size, $s_size, $s_size)){

            //fill white if not png gif
            $image_info = pathinfo($image_name);
            $image_extension = strtolower($image_info["extension"]);

            //if (!in_array($image_extension,array('gif','png'))){
            $backgroundColor = imagecolorallocate($new_canvas, 255, 255, 255);
            imagefill($new_canvas, 0, 0, $backgroundColor);
            //imagecopy($new_canvas,$source, 0, 0, $x_offset, $y_offset, $square_size, $square_size, $s_size, $s_size);
            @imagecopy($new_canvas,$source, 0, 0, $x_offset, $y_offset, $square_size, $square_size, $s_size, $s_size);
            //}
            self::save_image($new_canvas, $destination, $image_type, $quality);
        }

        return true;
    }

    static function save_image($source, $destination, $image_type, $quality){
        switch(strtolower($image_type)){//determine mime type
            case 'image/png':
                imagepng($source, $destination); return true; //save png file
                break;
            case 'image/gif':
                imagegif($source, $destination); return true; //save gif file
                break;
            case 'image/jpeg': case 'image/pjpeg':
            imagejpeg($source, $destination, $quality); return true; //save jpeg file
            break;
            default: return false;
        }
    }

}