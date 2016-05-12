<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class store_model extends CI_Model
{
public function create($storename,$image,$ownername,$city,$state,$pincode,$phone,$email,$lat,$long,$creationdate,$modificationdate,$address)
{
$data=array("storename" => $storename,"image" => $image,"ownername" => $ownername,"city" => $city,"state" => $state,"pincode" => $pincode,"phone" => $phone,"email" => $email,"lat" => $lat,"long" => $long,"creationdate" => '',"address" => $address);
$query=$this->db->insert( "dea_store", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("dea_store")->row();
return $query;
}
function getsinglestore($id){
$this->db->where("id",$id);
$query=$this->db->get("dea_store")->row();
return $query;
}
public function edit($id,$storename,$image,$ownername,$city,$state,$pincode,$phone,$email,$lat,$long,$creationdate,$modificationdate,$address)
{
$data=array("storename" => $storename,"image" => $image,"ownername" => $ownername,"city" => $city,"state" => $state,"pincode" => $pincode,"phone" => $phone,"email" => $email,"lat" => $lat,"long" => $long,"modificationdate" => $modificationdate,"address" => $address);
$this->db->where( "id", $id );
$query=$this->db->update( "dea_store", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `dea_store` WHERE `id`='$id'");
return $query;
}
public function getimagebyid($id)
{
$query=$this->db->query("SELECT `image` FROM `dea_store` WHERE `id`='$id'");
return $query;
}
}
?>
