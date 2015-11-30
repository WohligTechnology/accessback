<?php
if ( !defined( 'BASEPATH' ) )
	exit( 'No direct script access allowed' );
class restapi_model extends CI_Model
{

    public function getmultipleoffer($userid)
    {
        $todaysdate=date("Y-m-d");
//          // latest offers 
        
            $abc->offer = array();
          $query1=$this->db->query("SELECT * FROM `offer` WHERE `startdate` <= '$todaysdate' AND `enddate` >= '$todaysdate'")->result();
        foreach($query1 as $row1)
        {
         $query=$this->db->query("SELECT `product` FROM `offerproduct` WHERE `offer`='$row1->id'")->result();
                $row1->offerproducts=array();
            foreach($query as $productid)
            {
              $offerproducts=$this->db->query("SELECT `product`.`id` as `productid`,`product`.`name`,`product`.`sku`,`product`.`url`,`product`.`price`
,`product`.`wholesaleprice`,`product`.`firstsaleprice`,`product`.`secondsaleprice`,`product`.`specialpriceto`,`product`.`specialpricefrom`,`image1`.`image` as `image1`,`image2`.`image` as `image2`,`product`.`quantity` FROM `product`
LEFT OUTER JOIN `productimage` as `image2` ON `image2`.`product`=`product`.`id` AND `image2`.`order`=0 
LEFT OUTER JOIN `productimage` as `image1` ON `image1`.`product`=`product`.`id` AND `image1`.`order`=1 WHERE `product`.`visibility`=1 AND `product`.`status`=1 AND `product`.`id` = '$productid->product'")->row();
                        array_push($row1->offerproducts,$offerproducts);
            }
            
        }
          array_push($abc->offer, $query1);
        
        //PAST OFFER PRODUCTS
        $abc->pastoffer = array();
         
            $query2=$this->db->query("SELECT * FROM `offer` WHERE `enddate` < '$todaysdate' ORDER BY `timestamp` DESC")->row(); 
          array_push( $abc->pastoffer,$query2);  
            $abc->pastofferproducts = array();
         $pastoffer=$this->db->query("SELECT `product` FROM `offerproduct` WHERE `offer`='$query2->id'")->result();
            foreach($pastoffer as $productid)
            {
              $pastofferproducts=$this->db->query("SELECT `product`.`id` as `productid`,`product`.`name`,`product`.`sku`,`product`.`url`,`product`.`price`
,`product`.`wholesaleprice`,`product`.`firstsaleprice`,`product`.`secondsaleprice`,`product`.`specialpriceto`,`product`.`specialpricefrom`,`image1`.`image` as `image1`,`image2`.`image` as `image2`,`product`.`quantity` FROM `product`
LEFT OUTER JOIN `productimage` as `image2` ON `image2`.`product`=`product`.`id` AND `image2`.`order`=0 
LEFT OUTER JOIN `productimage` as `image1` ON `image1`.`product`=`product`.`id` AND `image1`.`order`=1 WHERE `product`.`visibility`=1 AND `product`.`status`=1 AND `product`.`id` = '$productid->product'")->row();
               
                    array_push($abc->pastofferproducts,$pastofferproducts);    
                 
            }

        
        //UPCOMING OFFER PRODUCTS
        $abc->upcomingoffer = array();
         $query3=$this->db->query("SELECT * FROM `offer` WHERE `startdate` > '$todaysdate' ORDER BY `timestamp` DESC")->row(); 
        array_push( $abc->upcomingoffer,$query3);
            $abc->upcomingofferproducts = array();
         $upcomingoffer=$this->db->query("SELECT `product` FROM `offerproduct` WHERE `offer`='$query3->id'")->result();
            foreach($upcomingoffer as $productid)
            {
              $upcomingofferproducts=$this->db->query("SELECT `product`.`id` as `productid`,`product`.`name`,`product`.`sku`,`product`.`url`,`product`.`price`
,`product`.`wholesaleprice`,`product`.`firstsaleprice`,`product`.`secondsaleprice`,`product`.`specialpriceto`,`product`.`specialpricefrom`,`image1`.`image` as `image1`,`image2`.`image` as `image2`,`product`.`quantity` FROM `product`
LEFT OUTER JOIN `productimage` as `image2` ON `image2`.`product`=`product`.`id` AND `image2`.`order`=0 
LEFT OUTER JOIN `productimage` as `image1` ON `image1`.`product`=`product`.`id` AND `image1`.`order`=1 WHERE `product`.`visibility`=1 AND `product`.`status`=1 AND `product`.`id` = '$productid->product'")->row();
                        array_push($abc->upcomingofferproducts,$upcomingofferproducts);
            }
        
        return $abc;
    }
    
    public function getofferproducts($offerid){
         $abc->offerproducts = array();
          $abc->offerdetails=$this->db->query("SELECT * FROM `offer` WHERE `id`=$offerid")->row();
     $query=$this->db->query("SELECT `product` FROM `offerproduct` WHERE `offer`='$offerid'")->result();
         foreach($query as $productid)
            {
              $offerproducts=$this->db->query("SELECT `product`.`id` as `productid`,`product`.`name`,`product`.`sku`,`product`.`url`,`product`.`price`
,`product`.`wholesaleprice`,`product`.`firstsaleprice`,`product`.`secondsaleprice`,`product`.`specialpriceto`,`product`.`specialpricefrom`,`image1`.`image` as `image1`,`image2`.`image` as `image2`,`product`.`quantity` FROM `product`
LEFT OUTER JOIN `productimage` as `image2` ON `image2`.`product`=`product`.`id` AND `image2`.`order`=0 
LEFT OUTER JOIN `productimage` as `image1` ON `image1`.`product`=`product`.`id` AND `image1`.`order`=1 WHERE `product`.`visibility`=1 AND `product`.`status`=1 AND `product`.`id` = '$productid->product'")->row();
                        array_push($abc->offerproducts,$offerproducts);
            }
        return $abc;
    }
    public function removefromwishlist($user, $product){
        $query=$this->db->query(" DELETE FROM `userwishlist` WHERE `user`='$user' AND `product`='$product'");
        if($query){
        return 1;
        }
        else{
        return false;
        }
    }
    
    public function getsubscribe($email){
        $query1=$this->db->query("SELECT * FROM `subscribe` WHERE `email`='$email'");
        $num=$query1->num_rows();
        if($num>0)
        {
        return 0;
        }
        else{
        $this->db->query("INSERT INTO `subscribe`(`email`) VALUE('$email')");
        $id=$this->db->insert_id();
        if($id)
        return true;
        else
        return false;
        }
    }
    public function getallcategory(){
    $query=$this->db->query("SELECT `id`, `name`, `parent`, `status`, `order`, `image1`, `image2` FROM `category` WHERE `parent`=0")->result();
        $query->subcategory=array();
        foreach($query as $row){
            
             $row->subcategory=$this->db->query("SELECT `id`, `name`, `parent`, `status`, `order`, `image1`, `image2` FROM `category` WHERE `parent`=$row->id")->result();
//            print_r($query1);
            array_push($query->subcategory,$row->subcategory);
        }
        return $query;
    }
    
    public function orderhistory(){
         $userid=$this->session->userdata("id");
    $query=$this->db->query("SELECT `order`.`id`, `order`.`user`, `order`.`firstname`, `order`.`lastname`, `order`.`email`, `order`.`billingaddress`, `order`.`billingcity`, `order`.`billingstate`, `order`.`billingcountry`, `order`.`shippingaddress`, `order`.`shippingcity`, `order`.`shippingcountry`, `order`.`shippingstate`, `order`.`shippingpincode`, `order`.`defaultcurrency`, `order`.`timestamp`, `order`.`totalamount`, `order`.`discountamount`, `order`.`finalamount`, `order`.`discountcoupon`, `order`.`paymentmethod`, `order`.`orderstatus`, `order`.`currency`, `order`.`trackingcode`, `order`.`billingpincode`, `order`.`shippingmethod`, `order`.`shippingname`, `order`.`shippingtel`, `order`.`customernote`, `order`.`billingcontact`, `order`.`shippingcontact`,`orderitems`.`id` as `orderitemsid`, `orderitems`.`order` as `orderitemsorder`, `orderitems`.`product` as `orderitemsproduct`, `orderitems`.`quantity` as `orderitemsquantity`, `orderitems`.`price` as `orderitemsprice`, `orderitems`.`discount` as `orderitemsdiscount`, `orderitems`.`finalprice` as `orderitemsfinalprice`,`product`.`id`, `product`.`name`, `product`.`sku`, `product`.`description`, `product`.`url`, `product`.`visibility`, `product`.`price`, `product`.`wholesaleprice`, `product`.`firstsaleprice`, `product`.`secondsaleprice`, `product`.`specialpriceto`, `product`.`specialpricefrom`, `product`.`metatitle`, `product`.`metadesc`, `product`.`metakeyword`, `product`.`quantity`, `product`.`status`, `product`.`modelnumber`, `product`.`brandcolor`, `product`.`eanorupc`, `product`.`eanorupcmeasuringunits`, `product`.`type`, `product`.`compatibledevice`, `product`.`compatiblewith`, `product`.`material`, `product`.`color`, `product`.`design`, `product`.`width`, `product`.`height`, `product`.`depth`, `product`.`portsize`, `product`.`packof`, `product`.`salespackage`, `product`.`keyfeatures`, `product`.`videourl`, `product`.`modelname`, `product`.`finish`, `product`.`weight`, `product`.`domesticwarranty`,`product`.`domesticwarrantymeasuringunits`, `product`.`internationalwarranty`, `product`.`internationalwarrantymeasuringunits`, `product`.`warrantysummary`, `product`.`warrantyservicetype`,`product`.`coveredinwarranty`, `product`.`notcoveredinwarranty`, `product`.`size`,`productimage`.`product`, `productimage`.`image`, `productimage`.`is_default`, `productimage`.`order`, `productimage`.`status`
FROM `order` 
LEFT OUTER JOIN `orderitems` ON `orderitems`.`order`=`order`.`id`
LEFT OUTER JOIN `product` ON `product`.`id`=`orderitems`.`product`
LEFT OUTER JOIN `productimage` ON `productimage`.`product`=`product`.`id`
WHERE `order`.`user`='$userid'")->result();
        return $query;
    }
    
    public function getsinglecategory($categoryid){
        $query=$this->db->query("SELECT `id`, `name`, `parent`, `status`, `order`, `image1`, `image2` FROM `category` WHERE `parent`='$categoryid'")->result();
       
        return $query;
        
    }
    public function getHomeProducts(){
      $query=$this->db->query("SELECT `productwaiting`.`product`,`product`.`name`,`product`.`id`, `product`.`name`,  `product`.`price` FROM `productwaiting` LEFT OUTER JOIN `product` ON `product`.`id`=`productwaiting`.`product` ")->result();
        foreach($query as $row){
            $row->images=array();
            $product=$row->product;
            $image=$this->db->query("SELECT `id`, `product`, `image`, `is_default`, `order`, `status` FROM `productimage` WHERE `product`='$product'")->result();
            
            array_push( $row->images,$image);
        }
        return $query;
        
    }
    public function getFilters($catid,$brandid)
    {
        $where = " INNER JOIN `productcategory` ON `productcategory`.`product` = `product`.`id`  AND  `productcategory`.`category` = '$catid'
INNER JOIN `category` ON `category`.`id` = `productcategory`.`category` ";

        if($catid == 0)
        {
            $where = " 
            INNER JOIN `productbrand` ON `productbrand`.`product` = `product`.`id`  AND  `productbrand`.`brand` = '$brandid'
            INNER JOIN `brand` ON `brand`.`id` = `productbrand`.`brand` ";
        }

       $query['color']=$this->db->query("SELECT DISTINCT  `product`.`color` FROM `product` 
        $where
ORDER BY `color`
 ")->result();
        $query['price']=$this->db->query("SELECT MIN(`price`) as `min`,MAX(`price`) as `max` FROM `product` 
$where
 ")->row();
        $query['price']->min = floatval($query['price']->min);
        $query['price']->max = floatval($query['price']->max);
        
        
        $query['type']=$this->db->query("SELECT DISTINCT  `type`.`id`,`type`.`name` FROM `product` 
$where
INNER JOIN `producttype` ON `producttype`.`product` = `product`.`id`
INNER JOIN `type` ON `type`.`id` = `producttype`.`type`")->result(); 
        
        $query['material']=$this->db->query("SELECT DISTINCT `product`.`material` FROM `product`
         $where")->result();
        
        $query['design']=$this->db->query("SELECT DISTINCT `product`.`design` FROM `product` $where")->result(); 
        $query['finish']=$this->db->query("SELECT DISTINCT `product`.`finish` FROM `product` $where")->result();
        $query['size']=$this->db->query("SELECT DISTINCT `product`.`size` FROM `product` $where")->result();
        $query['microphone']=$this->db->query("SELECT DISTINCT `product`.`microphone` FROM `product` $where")->result();
        $query['clength']=$this->db->query("SELECT DISTINCT `product`.`length` as `clength` FROM `product` $where")->result();
        $query['voltage']=$this->db->query("SELECT DISTINCT `product`.`voltage` FROM `product` $where")->result();
        $query['capacity']=$this->db->query("SELECT DISTINCT `product`.`capacity` FROM `product` $where")->result();
        $query['compatibledevice']=$this->db->query("SELECT DISTINCT `product`.`compatibledevice` FROM `product` $where
            ")->result(); 
        $query['compatiblewith']=$this->db->query("SELECT DISTINCT `product`.`compatiblewith` FROM `product` 
            $where")->result();
        $query1=$this->db->query("SELECT DISTINCT  `product`.`id` FROM `product` 
            $where
 ")->result();
        if($brandid != 0)
        {
        $query['category']=$this->db->query("SELECT DISTINCT `category`.`id`,`category`.`name` FROM `product` 
        INNER JOIN `productcategory` ON `productcategory`.`product` = `product`.`id` 
        INNER JOIN `category` ON `category`.`id` = `productcategory`.`category` 
        INNER JOIN `productbrand` ON `productbrand`.`product` = `product`.`id` AND `productbrand`.`brand` = '$brandid'
        INNER JOIN `brand` ON `brand`.`id` = `productbrand`.`brand`")->result();
        }
        else
        {
        $query['brand']=$this->db->query("SELECT DISTINCT  `brand`.`id`,`brand`.`name` FROM `product` 
INNER JOIN `productcategory` ON `productcategory`.`product` = `product`.`id`  AND  `productcategory`.`category` = '$catid'
INNER JOIN `category` ON `category`.`id` = `productcategory`.`category`
INNER JOIN `productbrand` ON `productbrand`.`product` = `product`.`id`
INNER JOIN `brand` ON `brand`.`id` = `productbrand`.`brand`")->result();   
        }
        
      return $query;
    }
    
    public function getFiltersLater($query) {
        
        $query2 = "SELECT `id` FROM ($query) as `tab1` "; 
        
        $query3['category'] = $this->db->query(" SELECT DISTINCT `category`.`id`,`category`.`name` FROM `category` INNER JOIN `productcategory` ON `category`.`id` = `productcategory`.`category` AND `productcategory`.`product` IN ($query2)")->result();
        
        $query3['brand'] = $this->db->query(" SELECT DISTINCT `brand`.`id`,`brand`.`name` FROM `brand` INNER JOIN `productbrand` ON `brand`.`id` = `productbrand`.`brand` AND `productbrand`.`product` IN ($query2)")->result(); 
        
        $query3['type'] = $this->db->query(" SELECT DISTINCT `type`.`id`,`type`.`name` FROM `type` INNER JOIN `producttype` ON `type`.`id` = `producttype`.`type` AND `producttype`.`product` IN ($query2)")->result();
        
        
        $query3['price'] = $this->db->query(" SELECT MIN(`price`) as `min`,MAX(`price`) as `max` FROM ($query) as `tab3` ")->result();
        $query3['microphone'] = $this->db->query(" SELECT DISTINCT `product`.`microphone` as `microphone` FROM ($query) as `tab3` INNER JOIN `product` ON `product`.`id` =`tab3`.`id` ")->result();
        $query3['color'] = $this->db->query(" SELECT DISTINCT `product`.`color` as `color` FROM ($query) as `tab3` INNER JOIN `product` ON `product`.`id` =`tab3`.`id` ")->result();
        $query3['material'] = $this->db->query(" SELECT DISTINCT `product`.`material` as `material` FROM ($query) as `tab3` INNER JOIN `product` ON `product`.`id` =`tab3`.`id` ")->result();
        $query3['design'] = $this->db->query(" SELECT DISTINCT `product`.`design` as `design` FROM ($query) as `tab3` INNER JOIN `product` ON `product`.`id` =`tab3`.`id` ")->result();
        $query3['finish'] = $this->db->query(" SELECT DISTINCT `product`.`finish` as `finish` FROM ($query) as `tab3` INNER JOIN `product` ON `product`.`id` =`tab3`.`id` ")->result();
        $query3['size'] = $this->db->query(" SELECT DISTINCT `product`.`size` as `size` FROM ($query) as `tab3` INNER JOIN `product` ON `product`.`id` =`tab3`.`id` ")->result();
        $query3['clength'] = $this->db->query(" SELECT DISTINCT `product`.`length` as `clength` FROM ($query) as `tab3` INNER JOIN `product` ON `product`.`id` =`tab3`.`id` ")->result();
        $query3['voltage'] = $this->db->query(" SELECT DISTINCT `product`.`voltage` as `voltage` FROM ($query) as `tab3` INNER JOIN `product` ON `product`.`id` =`tab3`.`id` ")->result();
        $query3['capacity'] = $this->db->query(" SELECT DISTINCT `product`.`capacity` as `capacity` FROM ($query) as `tab3` INNER JOIN `product` ON `product`.`id` =`tab3`.`id` ")->result();
        $query3['compatibledevice'] = $this->db->query(" SELECT DISTINCT `product`.`compatibledevice` as `compatibledevice` FROM ($query) as `tab3` INNER JOIN `product` ON `product`.`id` =`tab3`.`id` ")->result();
        $query3['compatiblewith'] = $this->db->query(" SELECT DISTINCT `product`.`compatiblewith` as `compatiblewith` FROM ($query) as `tab3` INNER JOIN `product` ON `product`.`id` =`tab3`.`id` ")->result();
        
        return $query3;
        
        
    }
    
    public function getHomeSlider(){
         $query=$this->db->query("SELECT `id`, `order`, `image`,`product` FROM `homeslider`")->result();
        return $query;
    }
     public function checkstatus($orderid){
      $query=$this->db->query("SELECT * FROM `order` WHERE `id`='$orderid'")->row;
        $orderstatus=$query->orderstatus;
        if($orderstatus==1){
        return 1;
        }
        else
        {
        return 0;
        }
    }
    public function updateorderstatusafterpayment($orderid,$transactionid){
          $query=$this->db->query("UPDATE `paymentorder` SET `orderstatus`=2,`transactionid`='$transactionid' WHERE `id`='$orderid'");
        return 1;
    
    }
}
?>