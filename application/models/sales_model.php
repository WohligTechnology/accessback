<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class sales_model extends CI_Model
{
public function create($name,$image,$email,$password,$creationdate,$modificationdate)
{
$data=array("name" => $name,"image" => $image,"email" => $email,"password" => $password,"creationdate" => $creationdate,"modificationdate" => $modificationdate);
$query=$this->db->insert( "dea_sales", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("dea_sales")->row();
return $query;
}
function getsinglesales($id){
$this->db->where("id",$id);
$query=$this->db->get("dea_sales")->row();
return $query;
}
public function edit($id,$name,$image,$email,$password,$creationdate,$modificationdate)
{
$data=array("name" => $name,"image" => $image,"email" => $email,"password" => $password,"creationdate" => $creationdate,"modificationdate" => $modificationdate);
$this->db->where( "id", $id );
$query=$this->db->update( "dea_sales", $data );

if($password != "")
  $data['password']=md5($password);
$this->db->where( 'id', $id );
$query=$this->db->update( 'user', $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `dea_sales` WHERE `id`='$id'");
return $query;
}
public function getimagebyid($id)
{
$query=$this->db->query("SELECT `image` FROM `dea_sales` WHERE `id`='$id'");
return $query;
}
}
?>
