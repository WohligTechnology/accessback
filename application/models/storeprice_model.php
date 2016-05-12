<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class storeprice_model extends CI_Model
{
public function create($storeid,$productid,$price,$orderid,$creationdate,$modificationdate)
{
$data=array("storeid" => $storeid,"productid" => $productid,"price" => $price,"orderid" => $orderid,"creationdate" => $creationdate,"modificationdate" => $modificationdate);
$query=$this->db->insert( "dea_storeprice", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("dea_storeprice")->row();
return $query;
}
function getsinglestoreprice($id){
$this->db->where("id",$id);
$query=$this->db->get("dea_storeprice")->row();
return $query;
}
public function edit($id,$storeid,$productid,$price,$orderid,$creationdate,$modificationdate)
{
$data=array("storeid" => $storeid,"productid" => $productid,"price" => $price,"orderid" => $orderid,"creationdate" => $creationdate,"modificationdate" => $modificationdate);
$this->db->where( "id", $id );
$query=$this->db->update( "dea_storeprice", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `dea_storeprice` WHERE `id`='$id'");
return $query;
}
}
?>
