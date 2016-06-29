<?php
if ( !defined( 'BASEPATH' ) )
	exit( 'No direct script access allowed' );
class Product_model extends CI_Model
{
	//product
    function addtowishlist($user,$product)
    {
        if($user!="")
        {
            $userwishlist=$this->db->query("SELECT * FROM `userwishlist` WHERE `user`='$user' AND `product`='$product'")->row();
            if(empty($userwishlist))
            {
                $query=$this->db->query("INSERT INTO `userwishlist`(`user`,`product`) VALUES ('$user','$product')");
                return $query;
            }
            else
            {
                return 0;
            }
        }

        return 0;

//        $query=$this->db->query("INSERT INTO `userwishlist`(`user`,`product`) VALUES ('$user','$product')");
//        return $query;
    }
	public function createproduct($name,$sku,$description,$url,$visibility,$price,$wholesaleprice,$firstsaleprice,$secondsaleprice,$specialpricefrom,$specialpriceto,$metatitle,$metadesc,$metakeyword,$quantity,$status,$category,$relatedproduct,$brand,$type,$modelnumber,$brandcolor,$eanorupc,$eanorupcmeasuringunits,$compatibledevice,$compatiblewith,$material,$color,$width,$height,$depth,$salespackage,$keyfeatures,$videourl,$modelname,$finish,$weight,$domesticwarranty,$warrantysummary,$size,$typename,$dimension,$colormatch,$microphone,$length,$capacity,$voltage,$tax)
	{
		$data  = array(
			'name' => $name,
			'sku' => $sku,
			'description' => $description,
			'url' => $url,
			'visibility' => 1,
			'price' => $price,
			'wholesaleprice' => $wholesaleprice,
			'firstsaleprice' => $firstsaleprice,
			'secondsaleprice' => $secondsaleprice,
			'specialpricefrom' => $specialpricefrom,
			'specialpriceto' => $specialpriceto,
			'metatitle' => $metatitle,
			'metadesc' => $metadesc,
			'metakeyword' => $metakeyword,
			'quantity' => $quantity,
			'status' => $status,
            'modelnumber' => $modelnumber,
			'brandcolor' => $brandcolor,
			'eanorupc' => $eanorupc,
			'eanorupcmeasuringunits' => $eanorupcmeasuringunits,
			'compatibledevice' => $compatibledevice,
			'compatiblewith' => $compatiblewith,
			'material' => $material,
			'color' => $color,
			'width' => $width,
			'height' => $height,
			'depth' => $depth,
			'salespackage' => $salespackage,
			'keyfeatures' => $keyfeatures,
			'videourl' => $videourl,
			'modelname' => $modelname,
			'finish' => $finish,
			'weight' => $weight,
			'domesticwarranty' => $domesticwarranty,
			'warrantysummary' => $warrantysummary,
			'size' => $size,
			'typename' => $typename,
			'dimension' => $dimension,
			'colormatch' => $colormatch,
			'microphone' => $microphone,
			'length' => $length,
			'capacity' => $capacity,
			'voltage' => $voltage,
			'tax' => $tax
		);
		$query=$this->db->insert( 'product', $data );
		$id=$this->db->insert_id();
        $productid=$id;
        foreach($brand AS $key=>$value)
        {
            $this->product_model->createproductbrand($value,$productid);
        }

        foreach($type AS $key=>$value)
        {
            $this->product_model->createproducttype($value,$productid);
        }

		if(!empty($category))
		{
			foreach($category as $key => $cat)
			{
				$data1  = array(
					'product' => $id,
					'category' => $cat,
				);
				$query=$this->db->insert( 'productcategory', $data1 );
			}
		}
		if($query)
		{
			$this->saveproductlog($id,"Product Created");
		}
		/*
		if(!empty($relatedproduct))
		{
			foreach($relatedproduct as $key => $pro)
			{
				$data2  = array(
					'product' => $id,
					'relatedproduct' => $pro,
				);
				$query=$this->db->insert( 'relatedproduct', $data2 );
			}
		}*/
		return  1;
	}

    public function createproductbrand($value,$productid)
	{
		$data  = array(
			'brand' => $value,
			'product' => $productid
		);
		$query=$this->db->insert( 'productbrand', $data );
		return  1;
	}
    public function createproducttype($value,$productid)
	{
		$data  = array(
			'type' => $value,
			'product' => $productid
		);
		$query=$this->db->insert( 'producttype', $data );
		return  1;
	}
    function deleteall($id)
    {

        foreach($id as $idu)
        {
            $query=$this->db->query("DELETE FROM `product` WHERE `id`='$idu'");
        }
        if($query){
            return 1;
        }else{
            return 0;
        }
    }
	function viewproduct()
	{
	$query=$this->db->query("SELECT `product`.`id`,`product`.`name`,`product`.`sku`,`product`.`price`,`product`.`quantity` FROM `product`
		ORDER BY `product`.`id` ASC")->result();
		return $query;
	}
	public function beforeeditproduct( $id )
	{
		$this->db->where( 'id', $id );
		$query['product']=$this->db->get( 'product' )->row();
		$product_category=$this->db->query("SELECT `category` FROM `productcategory` WHERE `productcategory`.`product`='$id'")->result();
		$query['product_category']=array();
		foreach($product_category as $cat)
		{
			$query['product_category'][]=$cat->category;
		}
		$related_product=$this->db->query("SELECT `relatedproduct` FROM `relatedproduct` WHERE `relatedproduct`.`product`='$id'")->result();
		$query['related_product']=array();
		foreach($related_product as $pro)
		{
			$query['related_product'][]=$pro->relatedproduct;
		}
		return $query;
	}

	public function editproduct( $id,$name,$sku,$description,$url,$visibility,$price,$wholesaleprice,$firstsaleprice,$secondsaleprice,$specialpricefrom,$specialpriceto,$metatitle,$metadesc,$metakeyword,$quantity,$status,$category,$relatedproduct,$brand,$type,$modelnumber,$brandcolor,$eanorupc,$eanorupcmeasuringunits,$compatibledevice,$compatiblewith,$material,$color,$width,$height,$depth,$salespackage,$keyfeatures,$videourl,$modelname,$finish,$weight,$domesticwarranty,$warrantysummary,$size,$typename,$dimension,$colormatch,$microphone,$length,$capacity,$voltage,$tax)
	{
		$data = array(
			'name' => $name,
			'sku' => $sku,
			'description' => $description,
			'url' => $url,
			'visibility' => 1,
			'price' => $price,
			'wholesaleprice' => $wholesaleprice,
			'firstsaleprice' => $firstsaleprice,
			'secondsaleprice' => $secondsaleprice,
			'specialpricefrom' => $specialpricefrom,
			'specialpriceto' => $specialpriceto,
			'metatitle' => $metatitle,
			'metadesc' => $metadesc,
			'metakeyword' => $metakeyword,
			'quantity' => $quantity,
			'status' => $status,
            'modelnumber' => $modelnumber,
			'brandcolor' => $brandcolor,
			'eanorupc' => $eanorupc,
			'eanorupcmeasuringunits' => $eanorupcmeasuringunits,
			'compatibledevice' => $compatibledevice,
			'compatiblewith' => $compatiblewith,
			'material' => $material,
			'color' => $color,
			'width' => $width,
			'height' => $height,
			'depth' => $depth,
			'salespackage' => $salespackage,
			'keyfeatures' => $keyfeatures,
			'videourl' => $videourl,
			'modelname' => $modelname,
			'finish' => $finish,
			'weight' => $weight,
			'domesticwarranty' => $domesticwarranty,
			'warrantysummary' => $warrantysummary,
			'size' => $size,
			'typename' => $typename,
			'dimension' => $dimension,
			'colormatch' => $colormatch,
            'microphone' => $microphone,
			'length' => $length,
			'capacity' => $capacity,
			'voltage' => $voltage,
			'tax' => $tax
		);
		$this->db->where( 'id', $id );
		$q=$this->db->update( 'product', $data );
		$this->db->query("DELETE FROM `productcategory` WHERE `product`='$id'");
		$this->db->query("DELETE FROM `relatedproduct` WHERE `product`='$id'");
		$this->db->query("DELETE FROM `productbrand` WHERE `product`='$id'");
		$this->db->query("DELETE FROM `producttype` WHERE `product`='$id'");

        foreach($brand AS $key=>$value)
        {
            $this->product_model->createproductbrand($value,$id);
        }

        foreach($type AS $key=>$value)
        {
            $this->product_model->createproducttype($value,$id);
        }

		if(!empty($category))
		{
			foreach($category as $key => $cat)
			{
				$data1  = array(
					'product' => $id,
					'category' => $cat,
				);
				$query=$this->db->insert( 'productcategory', $data1 );
			}
		}
		if($q)
		{
			$this->saveproductlog($id,"Product Details Edited");
		}
		/*
		if(!empty($relatedproduct))
		{
			foreach($relatedproduct as $key => $pro)
			{
				$data2  = array(
					'product' => $id,
					'relatedproduct' => $pro,
				);
				$query=$this->db->insert( 'relatedproduct', $data2 );
			}
		}*/

		return 1;
	}
	function deleteproduct($id)
	{
		$query=$this->db->query("DELETE FROM `product` WHERE `id`='$id'");
		$this->db->query("DELETE FROM `productcategory` WHERE `product`='$id'");
		$this->db->query("DELETE FROM `relatedproduct` WHERE `product`='$id'");
		$this->db->query("DELETE FROM `productimage` WHERE `product`='$id'");
		$this->db->query("DELETE FROM `productbrand` WHERE `product`='$id'");
	}
	public function getcategorydropdown()
	{
		$query=$this->db->query("SELECT * FROM `category`  ORDER BY `id` ASC")->result();
//		$return=array(
//		"" => "Select Category"
//		);
		foreach($query as $row)
		{
            if($row->parent==0){
                $return[$row->id]=$row->name;
            }
            else{
                $query1=$this->db->query("SELECT `name` FROM `category`  WHERE `id`='$row->parent'")->row();
                $categoryname=$query1->name;
                $return[$row->id]=$categoryname." - ".$row->name;
            }

		}

		return $return;
	}
	public function getproductdropdown()
	{
		$query=$this->db->query("SELECT * FROM `product`  ORDER BY `id` ASC")->result();
		$return=array(

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
	public function getvisibility()
	{
		$status= array(
			 "1" => "Yes",
			 "0" => "No",
			);
		return $status;
	}
	function viewallimages($id)
	{
		$query=$this->db->query(" SELECT `productimage`.`id` as `id`, `productimage`.`image` as `productimage`,`productimage`.`product` as `productid`,`productimage`.`is_default` as `is_default`,`productimage`.`order` as `order`  FROM `productimage` WHERE `productimage`.`product`='$id' ORDER BY `productimage`.`order` ")->result();
		return $query;
	}
	function addimage($id,$uploaddata)
	{
		$productimage	= $uploaddata[ 'file_name' ];
		$path = $uploaddata[ 'full_path' ];
		$nextorder=$this->db->query("SELECT IFNULL(MAX(`order`)+1,0) AS `nextorder` FROM `productimage` WHERE `product`='$id'")->row();
		$nextorder= $nextorder->nextorder;

		if($nextorder=="0")
		$isdefault="1";
		else
		$isdefault="0";
		$data  = array(
			'image' => $productimage,
			'product' => $id,
			'is_default' => $isdefault,
			'order' => $nextorder,
			);
		$query=$this->db->insert( 'productimage', $data );
		if($query)
		{
			$this->saveproductlog($id,"Product Image Added");
		}

	}
	function deleteimage($productimageid,$id)
	{
		$query=$this->db->query("DELETE FROM `productimage` WHERE `product`='$id' AND `id`='$productimageid'");
		if($query)
		{
			$this->saveproductlog($id,"Product Image Deleted");
		}
	}
	function defaultimage($productimageid,$id)
	{
		$order=$this->db->query("SELECT `order` FROM `productimage` WHERE `id`='$productimageid'")->row();
		$order=$order->order;

		$this->db->query(" UPDATE `productimage` SET `order`='$order' WHERE `is_default`='1' ");
		$this->db->query(" UPDATE `productimage` SET `is_default`='0' WHERE `productimage`.`product`='$id' ");

		$query=$this->db->query(" UPDATE `productimage` SET `is_default`='1',`order`='0' WHERE `productimage`.`id`='$productimageid' AND `productimage`.`product`='$id' ");
		if($query)
		{
			$this->saveproductlog($id,"Product Image set to default");
		}
	}
	function changeorder($productimageid,$order,$product)
	{
		$query=$this->db->query("UPDATE `productimage` SET `order`='$order' WHERE `id`='$productimageid' ");
		if($query)
		{
			$this->saveproductlog($product,"Product Image Order Edited");
		}
	}
	function savequantity($product,$quantity)
	{
		$data = array(
			'quantity' => $quantity,
		);
		$this->db->where( 'id', $product );
		$query=$this->db->update( 'product', $data );

		if($query)
		{
			$this->saveproductlog($product,"Product Quantity Updated ,Quantity:$quantity");
		}
		if($query)
			return 1;
		else
			return 0;
	}
	function editprice($id,$price,$wholesaleprice,$firstsaleprice,$secondsaleprice,$specialpricefrom,$specialpriceto)
	{
		$data = array(
			'price' => $price,
			'wholesaleprice' => $wholesaleprice,
			'firstsaleprice' => $firstsaleprice,
			'secondsaleprice' => $secondsaleprice,
			'specialpricefrom' => $specialpricefrom,
			'specialpriceto' => $specialpriceto,

		);
		$this->db->where( 'id', $id );
		$query=$this->db->update( 'product', $data );
		if($query)
		{
			$this->saveproductlog($id,"Product Price Edited");
		}
		return 1;
	}
	function editrelatedproduct($id,$relatedproduct)
	{
		$this->db->query("DELETE FROM `relatedproduct` WHERE `product`='$id'");

		if(!empty($relatedproduct))
		{
			foreach($relatedproduct as $key => $pro)
			{
				$data2  = array(
					'product' => $id,
					'relatedproduct' => $pro,
				);
				$query=$this->db->insert( 'relatedproduct', $data2 );
			}
		}

		{
			$this->saveproductlog($id,"Related Product updated");
		}
		return 1;
	}
	public function getproducts($product)
	{
		$query=$this->db->query("SELECT `id`,`name` FROM `product` WHERE `id` NOT IN ($product)  ORDER BY `id` ASC")->result();


		return $query;
	}
	function viewproductwaiting()
	{
		$query=$this->db->query("SELECT `productwaiting`.`id` as `id`,`productwaiting`.`product`,`product`.`name` FROM `productwaiting` LEFT OUTER JOIN `product` ON `product`.`id`=`productwaiting`.`product` WHERE 1")->result();
		return $query;
	}
	function saveproductlog($id,$action)
	{
		$user = $this->session->userdata('id');
		$data2  = array(
			'product' => $id,
			'user' => $user,
			'action' => $action,
		);
		$query2=$this->db->insert( 'productlog', $data2 );
	}
	function getproductbycategory($category,$color,$price1,$price2)
	{

		$where = "";
		if($price1!="")
		{
		$pricefilter="AND (`product`.`price` BETWEEN $price1 AND $price2 OR `product`.`price`=$price1 OR `product`.`price`=$price2)";
		}
		else
		{
		$pricefilter="";
		}
		$q3 = $this->db->query("SELECT COUNT(*) as `cnt` FROM `category` WHERE `category`.`parent`= '$category'")->row();
		if($q3->cnt > 0)
			$where .= " OR `category`.`parent`='$category' ";
		$query['category']=$this->db->query("SELECT `category`.`name` ,`category`.`image1` FROM `category`
		WHERE `category`.`id`='$category'")->row();



		$query['product']=$this->db->query("SELECT `product`.`id`,`product`.`name`,`product`.`sku`,`product`.`url`,`product`.`price`,`product`.`wholesaleprice`,`product`.`firstsaleprice`,`product`.`secondsaleprice`,`product`.`specialpriceto`,`product`.`specialpricefrom`,`productimage`.`image` FROM `product`
		INNER JOIN `productcategory` ON `product`.`id`=`productcategory`.`product`
		INNER JOIN `category` ON `category`.`id`=`productcategory`.`category`
		LEFT JOIN `productimage` ON `productimage`.`product`=`product`.`id`
		WHERE  `product`.`quantity` > 0 AND `product`.`name` LIKE '%$color%' $pricefilter
        AND (   `productcategory`.`category`=$category $where )
		GROUP BY `product`.`sku`
		ORDER BY `product`.`id` DESC")->result();

		foreach($query['product'] as $p_row)
		{
			$productid = $p_row->id;
			$p_row->productimage=$this->db->query("SELECT `productimage`.`image` FROM `productimage`
			WHERE `productimage`.`product`='$productid'
			ORDER BY `productimage`.`order`
			LIMIT 0,2")->result();
		}
		foreach($query['product'] as $p_row)
		{
			$productid = $p_row->id;
			$query5=$this->db->query("SELECT count(`category`) as `isnew`  FROM `productcategory`
			WHERE  `productcategory`.`category`='31' AND `product`='$productid'
			LIMIT 0,1")->row();
			$p_row->isnew=$query5->isnew;

		}
		/*$query['subcategory']=$this->db->query("SELECT `category`.`name`,`category`.`image1`,`category`.`image2` FROM `category`
		WHERE `category`.`parent`='$category' AND `category`.`status`=1
		ORDER BY `category`.`order`")->result();*/
		$query['subcategory'] = $this->db->query("SELECT `tab1`.`id`,`tab1`.`name`,`tab1`.`image1`,`tab1`.`image2`,COUNT(`tab2`.`id`) as `cnt` FROM
		(
		SELECT `category`.`name`,`category`.`id`,`category`.`image1`,`category`.`image2`,`category`.`order` FROM `category`
			WHERE `category`.`parent`='$category' AND `category`.`status`=1
		) as `tab1`
		INNER JOIN `productcategory` ON `productcategory`.`category`=`tab1`.`id`
		INNER JOIN `product`  as `tab2` ON `productcategory`.`product`=`tab2`.`id` AND `tab2`.`status`=1
		GROUP BY `tab1`.`id`
		ORDER BY `tab1`.`order` ")->result();
		$query['template']=new StdClass();
		$query['breadcrumbs']=$this->getparentcategories($category);
		$query['currentcategory']=$category;
		$query['template']->pageurl = "partials/product.html";
		return $query;
	}
	function getproductdetails($product,$user)
	{
        $query['product']=$this->db->query("SELECT `product`.`id`, `product`.`name`, `product`.`sku`, `product`.`description`, `product`.`url`, `product`.`visibility`, `product`.`price`, `product`.`wholesaleprice`, `product`.`firstsaleprice`, `product`.`secondsaleprice`, `product`.`specialpriceto`, `product`.`specialpricefrom`, `product`.`metatitle`, `product`.`metadesc`, `product`.`metakeyword`, `product`.`quantity`, `product`.`status`, `product`.`modelnumber`, `product`.`brandcolor`, `product`.`eanorupc`, `product`.`eanorupcmeasuringunits`, `product`.`type`, `product`.`compatibledevice`, `product`.`compatiblewith`, `product`.`material`, `product`.`color`, `product`.`design`, `product`.`width`, `product`.`height`, `product`.`depth`, `product`.`portsize`, `product`.`packof`, `product`.`salespackage`, `product`.`keyfeatures`, `product`.`videourl`, `product`.`modelname`, `product`.`finish`, `product`.`weight`, `product`.`domesticwarranty`,`product`.`domesticwarrantymeasuringunits`, `product`.`internationalwarranty`, `product`.`microphone`, `product`.`length` as `clength`, `product`.`internationalwarrantymeasuringunits`, `product`.`warrantysummary`, `product`.`capacity`,`product`.`voltage`, `product`.`warrantyservicetype`,`product`.`coveredinwarranty`, `product`.`notcoveredinwarranty`, `product`.`size`, `product`.`colormatch`, `product`.`dimension`,`userwishlist`.`user` FROM `product` LEFT OUTER JOIN `userwishlist` ON `userwishlist`.`product`=`product`.`id` AND `userwishlist`.`user`='$user'
		WHERE `product`.`id`='$product'")->row();

		$query['productimage'] = $this->db->query("SELECT `image` ,`productimage`.`order` FROM `productimage`
		WHERE `product`='$product'
		ORDER BY `productimage`.`order`")->result();

        $colormatch=$query['product']->colormatch;
        if($colormatch!="")
        {
        $query['samecolor'] = $this->db->query("SELECT `id`, `name`, `sku`, `description`, `url`, `visibility`, `price`, `wholesaleprice`, `firstsaleprice`, `secondsaleprice`, `specialpriceto`, `specialpricefrom`, `metatitle`, `metadesc`, `metakeyword`, `quantity`, `status`, `modelnumber`, `brandcolor`, `eanorupc`, `eanorupcmeasuringunits`, `type`, `compatibledevice`, `compatiblewith`, `material`, `color`, `design`, `width`, `height`, `depth`, `portsize`, `packof`, `salespackage`, `keyfeatures`, `videourl`, `modelname`, `finish`, `weight`, `domesticwarranty`, `domesticwarrantymeasuringunits`, `internationalwarranty`, `internationalwarrantymeasuringunits`, `warrantysummary`, `warrantyservicetype`, `coveredinwarranty`, `notcoveredinwarranty`, `size` FROM `product` WHERE `colormatch`='$colormatch'
")->result();
        foreach($query['samecolor'] as $row){
           $row->samecolorimages = array();
        $prodid=$row->id;
            $query3=$this->db->query("SELECT `image` ,`productimage`.`order` FROM `productimage`
		WHERE `product`='$prodid'
		ORDER BY `productimage`.`order`")->result();
             array_push($row->samecolorimages ,$query3);
        }
        }

		return $query;
	}
	public function getchildrencategories($category)
	{
		$children=array();
		$children[]=$category;
		$query=$this->db->query("SELECT `id` as `children` FROM `category` WHERE `category`.`parent`='$category' ");
		if ( $query->num_rows() <= 0 ) {
			return $children;
		}
		else {

			$query=$query->result();
			//print_r($query);
			foreach($query as $row)
			{
				$other=array();
				$other=$this->getchildrencategories($row->children);
				$children=array_merge($children, $other);

			}
			return $children;
		}
	}
	public function getparentcategories($categoryid)
	{
		$parents=array();
		$q = $this->db->query("SELECT `name` FROM `category` WHERE `id`='$categoryid'")->row();
        $c=new stdClass();
		$c->id=$categoryid;
		$c->name=$q->name;

		do
		{
			$row=$this->db->query("SELECT `category`.`parent` as `category`,`tab2`.`name` FROM `category`
			LEFT JOIN `category` as `tab2` ON `category`.`parent`=`tab2`.`id`
			WHERE `category`.`id`='$categoryid'")->row();
			//echo ($row->category);
			$category = new StdClass();
			$category->id=$row->category;
			$category->name=$row->name;
			if($row->category != 0 || $row->category != "0")
			{

				array_push($parents,$category);
			}
			$categoryid = $row->category;

		}while($categoryid!=0) ;
		//$parents[]=$c;
		array_push($parents,$c);

		return $parents;
	}
    public function addproductwaitinglist($email,$product)
    {
        $this->db->query("INSERT INTO `productwaiting`(`email`,`user`,`product`) VALUES ('$email','','$product')");
        return true;
    }

	public function beforeeditproductwaiting( $id )
	{
		$this->db->where( 'id', $id );
		$query=$this->db->get( 'productwaiting' )->row();
		return $query;
	}

	public function editproductwaiting($id,$product,$user,$email)
	{
		$data = array(
			'product' => $product,
			'user' => $user,
			'email' => $email,
			'timestamp' => NULL
		);
		$this->db->where( 'id', $id );
		$q=$this->db->update( 'productwaiting', $data );

		return 1;
	}
    public function createproductwaiting($product,$user,$email)
	{
		$data = array(
			'product' => $product,
			'user' => $user,
			'email' => $email
		);
		$q=$this->db->insert( 'productwaiting', $data );
		return 1;
	}

	function deleteproductwaiting($id)
	{
		$query=$this->db->query("DELETE FROM `productwaiting` WHERE `id`='$id'");
	}

    function exportproductcsv()
	{
		$this->load->dbutil();
		$query=$this->db->query("SELECT  `product`.`id`  AS `id` ,  `product`.`name`  AS `Name`,`product`.`description` as `Product description`, GROUP_CONCAT(DISTINCT(`brand`.`name`)) AS `Brand`, `product`.`modelnumber`, `product`.`brandcolor`, `product`.`eanorupc`, `product`.`eanorupcmeasuringunits`, GROUP_CONCAT(DISTINCT(`type`.`name`)) AS `Type`, `product`.`compatibledevice`,`product`.`compatiblewith` ,  `product`.`price`  AS `price` ,  `product`.`wholesaleprice`  AS `wholesaleprice` ,  `product`.`firstsaleprice`  AS `firstsaleprice` ,  `product`.`secondsaleprice`  AS `secondsaleprice` ,  `product`.`specialpriceto`  AS `specialpriceto` ,  `product`.`specialpricefrom`  AS `specialpricefrom` , GROUP_CONCAT(DISTINCT(`productimage`.`image`)) AS `image`, GROUP_CONCAT(DISTINCT(`category`.`name`)) AS `category`, `product`.`quantity`  AS `quantity` , `product`.`colormatch`  AS `colormatch` , `product`.`dimension`  AS `dimension` ,`product`.`microphone`  AS `microphone` ,`product`.`length`  AS `length` ,`product`.`capacity`  AS `capacity` ,`product`.`voltage`  AS `voltage`,`product`.`tax`  AS `tax`
FROM `product`
INNER JOIN `productcategory` ON `product`.`id`=`productcategory`.`product`
INNER JOIN `category` ON `category`.`id`=`productcategory`.`category`
INNER JOIN `producttype` ON `product`.`id`=`producttype`.`product`
INNER JOIN `type` ON `type`.`id`=`producttype`.`type`
INNER JOIN `productbrand` ON `product`.`id`=`productbrand`.`product`
INNER JOIN `brand` ON `brand`.`id`=`productbrand`.`brand`
LEFT OUTER JOIN `productimage` ON `productimage`.`product`=`product`.`id`
GROUP BY `product`.`id` ORDER BY  `product`.`id` DESC");

$content= $this->dbutil->csv_from_result($query);
//$data = 'Some file data';
$timestamp=new DateTime();
$timestamp=$timestamp->format('Y-m-d_H.i.s');
if ( ! write_file("./uploads/productfile_$timestamp.csv", $content))
{
//  echo 'Unable to write the file';
}
else
{
redirect(base_url("uploads/productfile_$timestamp.csv"));
 // echo 'File written!';
}



//        $content= $this->dbutil->csv_from_result($query);
//         //$data = 'Some file data';
// $timestamp=new DateTime();
//         $timestamp=$timestamp->format('Y-m-d_H.i.s');
// //        file_put_contents("gs://magicmirroruploads/products_$timestamp.csv", $content);
// //		redirect("http://magicmirror.in/servepublic?name=products_$timestamp.csv", 'refresh');
//         if ( ! write_file('./csvgenerated/productfile.csv', $content))
//         {
//              echo 'Unable to write the file';
//         }
//         else
//         {
//             redirect(base_url('csvgenerated/productfile.csv'), 'refresh');
//              echo 'File written!';
//         }
//		file_put_contents("gs://lylafiles/product_$timestamp.csv", $content);
//		redirect("http://lylaloves.co.uk/servepublic?name=product_$timestamp.csv", 'refresh');
	}

	public function createbycsv($file)
	{
//        echo "in Model";

        foreach ($file as $row)
        {

            if($row['Special Price From'] != "")
				$specialpricefrom = date("Y-m-d",strtotime($row['Special Price From']));
			if($row['Special Price To'] != "")
				$specialpriceto = date("Y-m-d",strtotime($row['Special Price To']));
            $sku=$row['SKU'];
            $productfeatures=$row['Product Features'];
            $image1=$row['Image1'];
            $image2=$row['Image2'];
            $image3=$row['Image3'];
            $image4=$row['Image4'];
            $image5=$row['Image5'];
            $image6=$row['Image6'];
            $image7=$row['Image7'];
            $category=$row['Category'];
//            $allcategories=explode(",",$category);

            $name=$row['Name'];
            $description=$row['Description'];
            $url=$row['url'];
            $metatitle=$row['Meta Title'];
            $metadescription=$row['Meta Description'];
            $metakeyword=$row['Meta Keyword'];
            $quantity=$row['Quantity'];
            $price=$row['Price'];
            $wholesaleprice=$row['Wholesale Price'];
            $firstsaleprice=$row['Firstsale Price'];
            $secondsaleprice=$row['Secondsale Price'];

            $brand=$row['Brand'];

            $allbrand=explode(",",$brand);

            $modelnumber=$row['Model Number'];
            $brandcolor=$row['Brand Color'];
            $eanorupc=$row['EAN/UPC'];
            $eanorupcmeasuringunits=$row['EAN/UPC-Measuring Unit'];

            $type=$row['Type'];
            $alltype=explode(",",$type);

            $compatibledevice=$row['Compatible Device'];
            $compatiblewith=$row['Compatible With'];
            $material=$row['Material'];
            $color=$row['Color'];
            $design=$row['Design'];
            $width=$row['Width'];
            $height=$row['Height'];
            $depth=$row['Depth'];
            $portsize=$row['Port Size'];
            $packof=$row['Pack Of'];
            $salespackage=$row['Sales Package'];
            $keyfeatures=$row['Key Features'];
            $videourl=$row['Video URL'];
            $modelname=$row['Model Type'];
            $finish=$row['Finish'];
            $weight=$row['Weight'];
            $domesticwarranty=$row['Warranty'];
            $domesticwarrantymeasuringunits=$row['Domestic Warranty Measuring Units'];
            $internationalwarranty=$row['Internation Warranty'];
            $internationalwarrantymeasuringunits=$row['International Warranty Measuring Units'];
            $warrantysummary=$row['Warranty Summary'];
            $warrantyservicetype=$row['Warranty Service Type'];
            $coveredinwarranty=$row['Covered In Warranty'];
            $notcoveredinwarranty=$row['Not Covered In Warranty'];
            $size=$row['Size'];
            $subcategory=$row['Sub-Category'];
            $dimension=$row['Dimension'];
            $colormatch=$row['Color Match'];
            $microphone=$row['Microphone'];
            $length=$row['Length'];
            $capacity=$row['Capacity'];
            $voltage=$row['Voltage'];
            $tax=$row['Tax'];
            $allsubcategory=explode(",",$subcategory);

            $q="INSERT INTO `product`( `name`, `sku`, `description`, `url`, `visibility`, `price`, `wholesaleprice`, `firstsaleprice`, `secondsaleprice`, `specialpriceto`, `specialpricefrom`, `metatitle`, `metadesc`, `metakeyword`, `quantity`, `status`,`dimension`,`colormatch`,`microphone`,`length`,`capacity`,`voltage`) VALUES ('$name','$sku','$description','$url','1','$price','$wholesaleprice','$firstsaleprice','$secondsaleprice','$specialpriceto','$specialpricefrom','$metatitle','$metadescription','$metakeyword','$quantity',1,'$dimension','$colormatch','$microphone','$length','$capacity','$voltage')";

            $data  = array(
			'name' => $row['name'],
			'sku' => $row['sku'],
			'description' => $row['description'],
			'url' => $row['url'],
			'visibility' => 1,
			'price' => $row['price'],
			'wholesaleprice' => $row['wholesaleprice'],
			'firstsaleprice' => $row['firstsaleprice'],
			'secondsaleprice' => $row['secondsaleprice'],
			'specialpricefrom' => $specialpricefrom,
			'specialpriceto' => $specialpriceto,
			'metatitle' => $row['metatitle'],
			'metadesc' => $row['metadescription'],
			'metakeyword' => $row['metakeyword'],
			'quantity' => $row['quantity'],
			'status' => 1
		);
//            $q1="SELECT COUNT(`id`) as `count1` FROM `product` WHERE `name` LIKE '$name'";

            $checkproductpresent=$this->db->query("SELECT COUNT(`id`) as `count1` FROM `product` WHERE `name` LIKE '$name'")->row();

            if($checkproductpresent->count1 == 0)
            {
                $query=$this->db->query("INSERT INTO `product`( `name`, `sku`, `description`, `url`, `visibility`, `price`, `wholesaleprice`, `firstsaleprice`, `secondsaleprice`, `specialpriceto`, `specialpricefrom`, `metatitle`, `metadesc`, `metakeyword`, `quantity`, `status`, `modelnumber`, `brandcolor`, `eanorupc`, `eanorupcmeasuringunits`, `type`, `compatibledevice`, `compatiblewith`, `material`, `color`, `design`, `width`, `height`, `depth`, `portsize`, `packof`, `salespackage`, `keyfeatures`, `videourl`, `modelname`, `finish`, `weight`, `domesticwarranty`, `domesticwarrantymeasuringunits`, `internationalwarranty`, `internationalwarrantymeasuringunits`, `warrantysummary`, `warrantyservicetype`, `coveredinwarranty`, `notcoveredinwarranty`,`size`,`dimension`,`colormatch`,`microphone`,`length`,`capacity`,`voltage`,`tax`) VALUES ('$name','$sku','$description','$url','1','$price','$wholesaleprice','$firstsaleprice','$secondsaleprice','$specialpriceto','$specialpricefrom','$metatitle','$metadescription','$metakeyword','$quantity',1,'$modelnumber','$brandcolor','$eanorupc','$eanorupcmeasuringunits','$type','$compatibledevice','$compatiblewith','$material','$color','$design','$width','$height','$depth','$portsize','$packof','$salespackage','$keyfeatures','$videourl','$modelname','$finish','$weight','$domesticwarranty','$domesticwarrantymeasuringunits','$internationalwarranty','$internationalwarrantymeasuringunits','$warrantysummary','$warrantyservicetype','$coveredinwarranty','$notcoveredinwarranty','$size','$dimension','$colormatch','$microphone','$length','$capacity','$voltage','$tax')");
                $productid=$this->db->insert_id();
//                echo "pid".$productid;
                if($image1!=""){
				$dataimg  = array(
					'image' => $image1,
					'product' => $productid,
					'order' => 0
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image2!=""){
				$dataimg  = array(
					'image' => $image2,
					'product' => $productid,
					'order' => 1
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image3!=""){
				$dataimg  = array(
					'image' => $image3,
					'product' => $productid,
                    'order' => 2
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image4!=""){
				$dataimg  = array(
					'image' => $image4,
					'product' => $productid,
                    'order' => 3
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image5!=""){
				$dataimg  = array(
					'image' => $image5,
					'product' => $productid,
                    'order' => 4
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image6!=""){
				$dataimg  = array(
					'image' => $image6,
					'product' => $productid,
                    'order' => 5
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image7!=""){
				$dataimg  = array(
					'image' => $image7,
					'product' => $productid,
                    'order' => 6
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                $category=trim($category);
                $categoryquery=$this->db->query("SELECT * FROM `category` where `name`LIKE '$category'")->row();
                if(empty($categoryquery))
                {
                    $this->db->query("INSERT INTO `category`(`name`) VALUES ('$category')");
                    $categoryid=$this->db->insert_id();
                    $allsubcategory=trim($allsubcategory);
                    // INSERT MULTIPLE SUBCATEGORIES
                    foreach($allsubcategory as $key => $subcategory)
			         {
                        $subcategoryquery=$this->db->query("SELECT * FROM `category` where `name` LIKE '$subcategory'")->row();
                        if(empty($subcategoryquery))
                        {
                            $this->db->query("INSERT INTO `category`(`name`,`parent`) VALUES ('$subcategory','$categoryid')");
                            $subcategoryid=$this->db->insert_id();
                        }
                        else
                        {
                            $subcategoryid=$subcategoryquery->id;
                             $data2  = array(
                            'product' => $productid,
                            'category' => $subcategoryid,
                        );
                        $queryproductsubcategory=$this->db->insert( 'productcategory', $data2 );
                        }

			         }

                    $data2  = array(
					'product' => $productid,
					'category' => $categoryid,
                    );
                    $queryproductcategory=$this->db->insert( 'productcategory', $data2 );

                }
                else
                {
                    $categoryid=$categoryquery->id;
                    $data2  = array(
					'product' => $productid,
					'category' => $categoryid,
                    );
                    $queryproductcategory=$this->db->insert( 'productcategory', $data2 );
                    // INSERT MULTIPLE SUBCATEGORIES
                    foreach($allsubcategory as $key => $subcategory)
			         {
                        $subcategoryquery=$this->db->query("SELECT * FROM `category` where `name` LIKE '$subcategory'")->row();
                        if(empty($subcategoryquery))
                        {
                            $this->db->query("INSERT INTO `category`(`name`,`parent`) VALUES ('$subcategory','$categoryid')");
                            $subcategoryid=$this->db->insert_id();
                        }
                        else
                        {
                            $subcategoryid=$subcategoryquery->id;
                            $data2  = array(
                            'product' => $productid,
                            'category' => $subcategoryid,
                        );
                        $queryproductsubcategory=$this->db->insert( 'productcategory', $data2 );
                        }
			         }
                }




			foreach($allbrand as $key => $brand)
			{
                $brand=trim($brand);
                $brandquery=$this->db->query("SELECT * FROM `brand` where `name` LIKE '$brand'")->row();
                if(empty($brandquery))
                {
                    $this->db->query("INSERT INTO `brand`(`name`) VALUES ('$brand')");
                    $brandid=$this->db->insert_id();
                }
                else
                {
                    $brandid=$brandquery->id;
                }

				$data2  = array(
					'product' => $productid,
					'brand' => $brandid,
				);
				$queryproductbrand=$this->db->insert( 'productbrand', $data2 );
			}

			foreach($alltype as $key => $type)
			{
                $type=trim($type);
                $typequery=$this->db->query("SELECT * FROM `type` where `name` LIKE '$type'")->row();
                if(empty($typequery))
                {
                    $this->db->query("INSERT INTO `type`(`name`) VALUES ('$type')");
                    $typeid=$this->db->insert_id();
                }
                else
                {
                    $typeid=$typequery->id;
                }

				$data2  = array(
					'product' => $productid,
					'type' => $typeid,
				);
				$queryproducttype=$this->db->insert( 'producttype', $data2 );
			}

            }   //product insert end
            else
            {
                // update product

                $getprod=$this->db->query("SELECT * FROM `product` WHERE `name` LIKE '$name'")->row();
                $getprodid=$getprod->id;
                $data = array(
               'name' => $name,
			'sku' => $sku,
			'description' => $description,
			'url' => $url,
			'visibility' => 1,
			'wholesaleprice' => $wholesaleprice,
			'firstsaleprice' => $firstsaleprice,
			'secondsaleprice' => $secondsaleprice,
			'specialpricefrom' => $specialpricefrom,
			'specialpriceto' => $specialpriceto,
			'metatitle' => $metatitle,
			'metadesc' => $metadesc,
			'metakeyword' => $metakeyword,
			'status' => 1,
            'modelnumber' => $modelnumber,
			'brandcolor' => $brandcolor,
			'eanorupc' => $eanorupc,
			'eanorupcmeasuringunits' => $eanorupcmeasuringunits,
			'compatibledevice' => $compatibledevice,
			'compatiblewith' => $compatiblewith,
			'material' => $material,
			'color' => $color,
			'width' => $width,
			'height' => $height,
			'depth' => $depth,
			'salespackage' => $salespackage,
			'keyfeatures' => $keyfeatures,
			'videourl' => $videourl,
			'modelname' => $modelname,
			'finish' => $finish,
			'weight' => $weight,
			'domesticwarranty' => $domesticwarranty,
			'warrantysummary' => $warrantysummary,
			'size' => $size,
			'type' => $type,
			'design' => $design,
			'portsize' => $portsize,
			'packof' => $packof,
			'domesticwarrantymeasuringunits' => $domesticwarrantymeasuringunits,
			'internationalwarranty' => $internationalwarranty,
			'internationalwarrantymeasuringunits' => $internationalwarrantymeasuringunits,
			'warrantyservicetype' => $warrantyservicetype,
			'coveredinwarranty' => $coveredinwarranty,
			'notcoveredinwarranty' => $notcoveredinwarranty,
			'dimension' => $dimension,
			'colormatch' => $colormatch,
            'microphone' => $microphone,
			'length' => $length,
			'capacity' => $capacity,
			'voltage' => $voltage,
			'tax' => $tax
            );

                $this->db->where('name', $name);
                $this->db->update('product', $data);

                //UPDATE IMAGE

                $query=$this->db->query("DELETE FROM `productimage` WHERE `product`='$getprodid'");

                if($image1!=""){
				$dataimg  = array(
					'image' => $image1,
					'product' => $getprodid,
					'order' => 0
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image2!=""){
				$dataimg  = array(
					'image' => $image2,
					'product' => $getprodid,
					'order' => 1
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image3!=""){
				$dataimg  = array(
					'image' => $image3,
					'product' => $getprodid,
                    'order' => 2
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image4!=""){
				$dataimg  = array(
					'image' => $image4,
					'product' => $getprodid,
                    'order' => 3
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image5!=""){
				$dataimg  = array(
					'image' => $image5,
					'product' => $getprodid,
                    'order' => 4
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image6!=""){
				$dataimg  = array(
					'image' => $image6,
					'product' => $getprodid,
                    'order' => 5
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }
                if($image7!=""){
				$dataimg  = array(
					'image' => $image7,
					'product' => $getprodid,
                    'order' => 6
				);
				$queryproductimage=$this->db->insert( 'productimage', $dataimg );
                }

        }
        }
		if(!$query)
			return  0;
		else
			return  1;

    }
    //new functions by avinash

    function deleteallselectedproducts($id)
    {

        foreach($id as $idu)
        {
            $query=$this->db->query("DELETE FROM `product` WHERE `id`='$idu'");
            $query=$this->db->query("DELETE FROM `productcategory` WHERE `product`='$idu'");
        }
        if($query){
            return 1;
        }else{
            return 0;
        }
    }

    function productimagereorderbyid($id)
    {
        $allimages=$this->db->query("SELECT * FROM `productimage` WHERE `product`='$id' ORDER BY `order`")->result();
        if(!empty($allimages))
        {
            foreach($allimages as $key=>$row)
            {
                $productimageid=$row->id;
                $order=$row->order;
                $updatequery=$this->db->query("UPDATE `productimage` SET `order`='$key' WHERE `id`='$productimageid'");
            }
            $selectproductimagecroncheck=$this->db->query("SELECT * FROM `productimagecroncheck` WHERE `product`='$id'")->row();
            if(!empty($selectproductimagecroncheck))
            {
                $productimagecroncheckid=$selectproductimagecroncheck->id;
                $update=$this->db->query("UPDATE `productimagecroncheck` SET `timestamp`=NULL WHERE `id`='$productimagecroncheckid'");
            }
            else
            {
                $message="Images for productid ".$id." are reordered";
                $insert=$this->db->query("INSERT INTO `productimagecroncheck`( `product`, `message`, `timestamp`) VALUES ('$id','$message',NULL)");
            }
        }
        else
        {
            return 0;
        }
        return 1;

    }

    function getproductsforimageorderchange()
    {
        $query=$this->db->query("SELECT * FROM `product`")->result();
        return $query;
    }

}
?>
