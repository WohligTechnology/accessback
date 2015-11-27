<?php
if ( !defined( 'BASEPATH' ) )
	exit( 'No direct script access allowed' );
class homeslider_model extends CI_Model
{
	//homeslider
	public function createhomeslider($order,$image)
	{
		$data  = array(
			'order' => $order,
			'image' => $image
		);
		$query=$this->db->insert( 'homeslider', $data );
		return  1;
	}
	function viewhomeslider()
	{
		$query=$this->db->query("SELECT `homeslider`.`id`,`homeslider`.`name`,`homeslider`.`product`,`homeslider`.`image`,`homeslider`.`order` FROM `homeslider` 
		ORDER BY `homeslider`.`id` ASC")->result();
		return $query;
	}
	public function beforeedithomeslider( $id )
	{
		$this->db->where( 'id', $id );
		$query=$this->db->get( 'homeslider' )->row();
		return $query;
	}
	
	public function edithomeslider( $id,$order,$image)
	{
		$data = array(
			'order' => $order,
			'image' => $image
		);
		if($image != "")
			$data['image']=$image;
		$this->db->where( 'id', $id );
		$this->db->update( 'homeslider', $data );
		return 1;
	}
	function deletehomeslider($id)
	{
		$this->load->helper("file");
		$this->load->helper("url");
		$q = $this->db->query("SELECT `image` FROM `homeslider` WHERE `id`='$id'")->row();
		if($q->image != "")
		{
			
			unlink("uploads/".$q->image);
		}
		$query=$this->db->query("DELETE FROM `homeslider` WHERE `id`='$id'");
	}
	public function gethomesliderdropdown()
	{
		$query=$this->db->query("SELECT * FROM `homeslider`  ORDER BY `id` ASC")->result();
		$return=array(
		"" => ""
		);
		foreach($query as $row)
		{
			$return[$row->id]=$row->name;
		}
		
		return $return;
	}
	public function getstatusdropdown()
	{
		$status= array(
			 "1" => "Enabled",
			 "0" => "Disabled",
			);
		return $status;
	}
}
?>