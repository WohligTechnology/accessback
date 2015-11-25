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
      $query=$this->db->query("SELECT `productwaiting`.`id` as `id`,`productwaiting`.`product`,`product`.`name`,`product`.`id`, `product`.`name`, `product`.`sku`, `product`.`description`, `product`.`url`, `product`.`visibility`, `product`.`price`, `product`.`wholesaleprice`, `product`.`firstsaleprice`, `product`.`secondsaleprice`, `product`.`specialpriceto`, `product`.`specialpricefrom`, `product`.`metatitle`, `product`.`metadesc`, `product`.`metakeyword`, `product`.`quantity`, `product`.`status`, `product`.`modelnumber`, `product`.`brandcolor`, `product`.`eanorupc`, `product`.`eanorupcmeasuringunits`, `product`.`type`, `product`.`compatibledevice`, `product`.`compatiblewith`, `product`.`material`, `product`.`color`, `product`.`design`, `product`.`width`, `product`.`height`, `product`.`depth`, `product`.`portsize`, `product`.`packof`, `product`.`salespackage`, `product`.`keyfeatures`, `product`.`videourl`, `product`.`modelname`, `product`.`finish`, `product`.`weight`, `product`.`domesticwarranty`, `product`.`domesticwarrantymeasuringunits`, `product`.`internationalwarranty`, `product`.`internationalwarrantymeasuringunits`, `product`.`warrantysummary`, `product`.`warrantyservicetype`, `product`.`coveredinwarranty`, `product`.`notcoveredinwarranty`, `product`.`size`, `product`.`typename` FROM `productwaiting` LEFT OUTER JOIN `product` ON `product`.`id`=`productwaiting`.`product`")->result();
        
        return $query;
        
    }
    
	
}
?>