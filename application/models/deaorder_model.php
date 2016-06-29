<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class deaorder_model extends CI_Model
{
public function create($store,$paymentstatus,$sales,$firstname,$lastname,$email,$billingcity,$billingstate,$billingcountry,$billingcontact,$billingpincode,$shippingcity,$shippingstate,$shippingcountry,$shippingcontact,$shippingpincode,$long,$password,$creationdate,$modificationdate,$billingaddress,$shippingaddress,$approve)
{
$data=array("store" => $store,"paymentstatus" => $paymentstatus,"sales" => $sales,"firstname" => $firstname,"lastname" => $lastname,"email" => $email,"billingcity" => $billingcity,"billingstate" => $billingstate,"billingcountry" => $billingcountry,"billingcontact" => $billingcontact,"billingpincode" => $billingpincode,"shippingcity" => $shippingcity,"shippingstate" => $shippingstate,"shippingcountry" => $shippingcountry,"shippingcontact" => $shippingcontact,"shippingpincode" => $shippingpincode,"long" => $long,"password" => $password,"creationdate" => $creationdate,"modificationdate" => $modificationdate,"billingaddress" => $billingaddress,"shippingaddress" => $shippingaddress,"approve" => $approve);
$query=$this->db->insert( "dea_order", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("dea_order")->row();
return $query;
}
function getsingleorder($id){
$this->db->where("id",$id);
$query=$this->db->get("dea_order")->row();
return $query;
}
public function edit($id,$store,$paymentstatus,$sales,$firstname,$lastname,$email,$billingcity,$billingstate,$billingcountry,$billingcontact,$billingpincode,$shippingcity,$shippingstate,$shippingcountry,$shippingcontact,$shippingpincode,$long,$password,$creationdate,$modificationdate,$billingaddress,$shippingaddress,$saledealer,$approve)
{

  $editquery=$this->db->query("SELECT * FROM `dea_order` WHERE `id`='$id'")->row();
  $sales=$editquery->sales;
$data=array("store" => $store,"paymentstatus" => $paymentstatus,"sales" => $sales,"firstname" => $firstname,"lastname" => $lastname,"email" => $email,"billingcity" => $billingcity,"billingstate" => $billingstate,"billingcountry" => $billingcountry,"billingcontact" => $billingcontact,"billingpincode" => $billingpincode,"shippingcity" => $shippingcity,"shippingstate" => $shippingstate,"shippingcountry" => $shippingcountry,"shippingcontact" => $shippingcontact,"shippingpincode" => $shippingpincode,"long" => $long,"password" => $password,"creationdate" => $creationdate,"modificationdate" => $modificationdate,"billingaddress" => $billingaddress,"shippingaddress" => $shippingaddress,"saledealer" => $saledealer,"approve" => $approve);
$this->db->where( "id", $id );
$query=$this->db->update( "dea_order", $data );

if($approve==1){
  $data=array("approve" => 1);
  $this->db->where( "order", $id );
  $query=$this->db->update( "dea_orderproduct", $data );
}
// if($password != "")
//   $data['password']=md5($password);
// $this->db->where( 'id', $id );
// $query=$this->db->update( 'user', $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `dea_order` WHERE `id`='$id'");
return $query;
}
public function getstoredropdown()
{
  $query=$this->db->query("SELECT * FROM `dea_store`  ORDER BY `id` ASC")->result();
  $return=array(

  );
  foreach($query as $row)
  {
    $return[$row->id]=$row->storename;
  }

  return $return;
}
public function getsalesdropdown()
{
  $query=$this->db->query("SELECT * FROM `dea_sales`  ORDER BY `id` ASC")->result();
  $return=array(

  );
  foreach($query as $row)
  {
    $return[$row->id]=$row->ownername;
  }

  return $return;
}
public function getpaymentstatusdropdown()
{
  $status= array(
     "1" => "Full Payment",
     "2" => "Advance Payment"
    );
  return $status;
}
public function getapprovedropdown()
{
  $status= array(
     " " => "Select",
     "1" => "Approve",
     "2" => "Disapprove"
    );
  return $status;
}

public function getdeaorderdropdown()
{
  $query=$this->db->query("SELECT * FROM `dea_order`  ORDER BY `id` ASC")->result();
  $return=array(

  );
  foreach($query as $row)
  {
    $return[$row->id]=$row->id;
  }

  return $return;
}
public function getsaledealerdropdown()
{
  $query=$this->db->query("SELECT * FROM `dea_store` WHERE `accesslevel`=1  ORDER BY `id` ASC ")->result();
  $return=array(
"" =>"Select"
  );
  foreach($query as $row)
  {
    $return[$row->id]=$row->storename;
  }

  return $return;
}
}
?>
