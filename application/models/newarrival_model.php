<?php
if ( !defined( 'BASEPATH' ) )
	exit( 'No direct script access allowed' );
class newarrival_model extends CI_Model
{
    public function create($product,$order)
	{
		$data  = array(
			'product' => $product,
			'order' => $order
		);
		$query=$this->db->insert( 'newarrival', $data );
		return  1;
	}
	function viewnewarrival()
	{
		$query=$this->db->query("SELECT `newarrival`.`id` AS `newarrivalid`,`newarrival`.`product`,`newarrival`.`order`,`product`.`name` FROM `newarrival` LEFT OUTER JOIN `product` ON `product`.`id`=`newarrival`.`product` 
		ORDER BY `newarrival`.`id` ASC")->result();
//        print_r($query);
		return $query;
	}
	public function beforeedit( $id )
	{
		$this->db->where( 'id', $id );
		$query=$this->db->get( 'newarrival' )->row();
		return $query;
	}
	
	public function edit( $id,$product,$order)
	{
		$data = array(
			'product' => $product,
			'order' => $order
		);
		$this->db->where( 'id', $id );
		$this->db->update( 'newarrival', $data );
		return 1;
	}
	function deletenewarrival($id)
	{
		$query=$this->db->query("DELETE FROM `newarrival` WHERE `id`='$id'");
	}
    function gettypedropdown(){
    $type= array(
			 "1" => "Exclusive"
			);
		return $type;
    }
	
}
?>