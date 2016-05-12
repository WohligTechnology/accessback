<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class orderproduct_model extends CI_Model
{
public function create($product,$order,$quantity,$price)
{
$data=array("product" => $product,"order" => $order,"quantity" => $quantity,"price" => $price);
$query=$this->db->insert( "dea_orderproduct", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("dea_orderproduct")->row();
return $query;
}
function getsingleorderproduct($id){
$this->db->where("id",$id);
$query=$this->db->get("dea_orderproduct")->row();
return $query;
}
public function edit($id,$product,$order,$quantity,$price)
{
$data=array("product" => $product,"order" => $order,"quantity" => $quantity,"price" => $price);
$this->db->where( "id", $id );
$query=$this->db->update( "dea_orderproduct", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `dea_orderproduct` WHERE `id`='$id'");
return $query;
}
}
?>
