<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class deaorder_model extends CI_Model
{
public function create($store,$paymentstatus,$sales,$firstname,$lastname,$email,$billingcity,$billingstate,$billingcountry,$billingcontact,$billingpincode,$shippingcity,$shippingstate,$shippingcountry,$shippingcontact,$shippingpincode,$long,$password,$creationdate,$modificationdate,$billingaddress,$shippingaddress)
{
$data=array("store" => $store,"paymentstatus" => $paymentstatus,"sales" => $sales,"firstname" => $firstname,"lastname" => $lastname,"email" => $email,"billingcity" => $billingcity,"billingstate" => $billingstate,"billingcountry" => $billingcountry,"billingcontact" => $billingcontact,"billingpincode" => $billingpincode,"shippingcity" => $shippingcity,"shippingstate" => $shippingstate,"shippingcountry" => $shippingcountry,"shippingcontact" => $shippingcontact,"shippingpincode" => $shippingpincode,"long" => $long,"password" => $password,"creationdate" => $creationdate,"modificationdate" => $modificationdate,"billingaddress" => $billingaddress,"shippingaddress" => $shippingaddress);
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
public function edit($id,$store,$paymentstatus,$sales,$firstname,$lastname,$email,$billingcity,$billingstate,$billingcountry,$billingcontact,$billingpincode,$shippingcity,$shippingstate,$shippingcountry,$shippingcontact,$shippingpincode,$long,$password,$creationdate,$modificationdate,$billingaddress,$shippingaddress)
{
$data=array("store" => $store,"paymentstatus" => $paymentstatus,"sales" => $sales,"firstname" => $firstname,"lastname" => $lastname,"email" => $email,"billingcity" => $billingcity,"billingstate" => $billingstate,"billingcountry" => $billingcountry,"billingcontact" => $billingcontact,"billingpincode" => $billingpincode,"shippingcity" => $shippingcity,"shippingstate" => $shippingstate,"shippingcountry" => $shippingcountry,"shippingcontact" => $shippingcontact,"shippingpincode" => $shippingpincode,"long" => $long,"password" => $password,"creationdate" => $creationdate,"modificationdate" => $modificationdate,"billingaddress" => $billingaddress,"shippingaddress" => $shippingaddress);
$this->db->where( "id", $id );
$query=$this->db->update( "dea_order", $data );

if($password != "")
  $data['password']=md5($password);
$this->db->where( 'id', $id );
$query=$this->db->update( 'user', $data );
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
    $return[$row->id]=$row->name;
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
}
?>
