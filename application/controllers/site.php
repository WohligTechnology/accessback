<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Site extends CI_Controller
{
	public function __construct( )
	{
		parent::__construct();

		$this->is_logged_in();
	}
	function is_logged_in( )
	{
		$is_logged_in = $this->session->userdata( 'logged_in' );
		if ( $is_logged_in !== 'true' || !isset( $is_logged_in ) ) {
			redirect( base_url() . 'index.php/login', 'refresh' );
		} //$is_logged_in !== 'true' || !isset( $is_logged_in )
	}
	function checkaccess($access)
	{
		$accesslevel=$this->session->userdata('accesslevel');
		if(!in_array($accesslevel,$access))
			redirect( base_url() . 'index.php/site?alerterror=You do not have access to this page. ', 'refresh' );
	}
	public function index()
	{
		//$access = array("1","2");
		$access = array("1","2");
		$this->checkaccess($access);
		$data[ 'page' ] = 'dashboard';
		$data[ 'usercount' ] = $this->user_model->getusercount();
		$data[ 'subscribecount' ] = $this->subscribe_model->subscribecount();
         $data[ 'monthlysales' ] = $this->user_model->getmonthlysales();
		$data["base_url"]=site_url("site/viewdashboardjson");
		$data[ 'title' ] = 'Welcome';
		$this->load->view( 'template', $data );
	}
    public function getDate()
	{
		//$access = array("1","2");
		$access = array("1","2");
		$this->checkaccess($access);
        $orderdate=$this->input->get_post('orderdate');
        $month=$this->input->get_post('month');
        $year=$this->input->get_post('year');
        $data['orderdate']=$orderdate;
        $data[ 'usercount' ] = $this->user_model->getusercount();
         $data[ 'monthlysales' ] = $this->user_model->getmonthlysales();
				 $data[ 'subscribecount' ] = $this->subscribe_model->subscribecount();
		$data[ 'page' ] = 'dashboard';
        $data["base_url"]=site_url("site/viewdashboardjson?date=".$orderdate);
		$data[ 'title' ] = 'Welcome';
		$this->load->view( 'template', $data );
	}
    function viewdashboardjson()
    {
        $orderdate=$this->input->get('date');
        if($orderdate !=""){
            $where="WHERE DATE(`order`.`timestamp`)='$orderdate'";
        }
        else{
            $where="WHERE 0";
        }

        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`order`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="Order No";
        $elements[0]->alias="order";

        $elements[1]=new stdClass();
        $elements[1]->field="`product`.`name`";
        $elements[1]->sort="1";
        $elements[1]->header="Product";
        $elements[1]->alias="product";

        $elements[2]=new stdClass();
        $elements[2]->field="`orderitems`.`quantity`";
        $elements[2]->sort="1";
        $elements[2]->header="Quantity";
        $elements[2]->alias="quantity";

        $elements[3]=new stdClass();
        $elements[3]->field="`product`.`id`";
        $elements[3]->sort="1";
        $elements[3]->header="Product Id";
        $elements[3]->alias="productid";

        $elements[4]=new stdClass();
        $elements[4]->field="`order`.`timestamp`";
        $elements[4]->sort="1";
        $elements[4]->header="timestamp";
        $elements[4]->alias="timestamp";

        $elements[5]=new stdClass();
        $elements[5]->field="`productimage`.`image`";
        $elements[5]->sort="1";
        $elements[5]->header="Image";
        $elements[5]->alias="image";

				$elements[6]=new stdClass();
        $elements[6]->field="`orderstatus`.`name`";
        $elements[6]->sort="1";
        $elements[6]->header="Order Status";
        $elements[6]->alias="orderstatus";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
        $maxrow=20;
        }
        if($orderby=="")
        {
        $orderby="id";
        $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `order`
LEFT OUTER JOIN `orderitems` ON `orderitems`.`order`=`order`.`id`
LEFT OUTER JOIN `product` ON `product`.`id`=`orderitems`.`product`
LEFT OUTER JOIN `productimage` ON `productimage`.`product`=`product`.`id`
LEFT OUTER JOIN `orderstatus` ON `orderstatus`.`id`=`order`.`orderstatus`","$where","GROUP BY `product`.`id`");
        $this->load->view("json",$data);
    }
	public function createuser()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['accesslevel']=$this->user_model->getaccesslevels();
		$data[ 'status' ] =$this->user_model->getstatusdropdown();
		$data[ 'country' ] =$this->user_model->getcountry();
		$data[ 'currency' ] =$this->currency_model->getcurrencydropdown();
		$data[ 'page' ] = 'createuser';
		$data[ 'title' ] = 'Create User';
		$this->load->view( 'template', $data );
	}
	function createusersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('password','Password','trim|required|min_length[6]|max_length[30]');
		$this->form_validation->set_rules('confirmpassword','Confirm Password','trim|required|matches[password]');
		$this->form_validation->set_rules('accessslevel','Accessslevel','trim');
		$this->form_validation->set_rules('name','name','trim');
		$this->form_validation->set_rules('firstname','Firstname','trim|required');
		$this->form_validation->set_rules('lastname','Lastname','trim|required');
		$this->form_validation->set_rules('companyname','Companyname','trim|required');
		$this->form_validation->set_rules('companyregistrationno','Company Registration Number','trim|required');
		$this->form_validation->set_rules('vatnumber','VAT Number','trim|required');
		$this->form_validation->set_rules('country','Country','trim|required');
		$this->form_validation->set_rules('email','Email','trim|required|valid_email|is_unique[user.email]');
		$this->form_validation->set_rules('phone','Phone','trim');
		$this->form_validation->set_rules('billingaddress','billingaddress','trim');
		$this->form_validation->set_rules('billingcity','billingcity','trim');
		$this->form_validation->set_rules('billingstate','billingstate','trim');
		$this->form_validation->set_rules('billingcountry','billingcountry','trim');
		$this->form_validation->set_rules('shippingaddress','shippingaddress','trim');
		$this->form_validation->set_rules('shippingcity','shippingcity','trim');
		$this->form_validation->set_rules('shippingstate','shippingstate','trim');
		$this->form_validation->set_rules('shippingcountry','shippingcountry','trim');
		$this->form_validation->set_rules('shippingpincode','shippingpincode','trim');
		$this->form_validation->set_rules('currency','currency','trim');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->user_model->getstatusdropdown();
			$data['accesslevel']=$this->user_model->getaccesslevels();
			$data[ 'country' ] =$this->user_model->getcountry();
			$data[ 'currency' ] =$this->currency_model->getcurrencydropdown();
			$data['page']='createuser';
			$data['title']='Create New User';
			$this->load->view('template',$data);
		}
		else
		{
            $companyname=$this->input->post('companyname');
            $companyregistrationno=$this->input->post('companyregistrationno');
            $vatnumber=$this->input->post('vatnumber');
            $country=$this->input->post('country');
			$password=$this->input->post('password');
			$name=$this->input->post('name');
			$firstname=$this->input->post('firstname');
			$lastname=$this->input->post('lastname');
			$accesslevel=$this->input->post('accesslevel');
			$email=$this->input->post('email');
			$phone=$this->input->post('phone');
			$billingaddress=$this->input->post('billingaddress');
			$billingcity=$this->input->post('billingcity');
			$billingstate=$this->input->post('billingstate');
			$billingcountry=$this->input->post('billingcountry');
			$shippingaddress=$this->input->post('shippingaddress');
			$shippingcity=$this->input->post('shippingcity');
			$shippingstate=$this->input->post('shippingstate');
			$shippingcountry=$this->input->post('shippingcountry');
			$currency=$this->input->post('currency');
			$status=$this->input->post('status');
			if($this->user_model->create($name,$firstname,$lastname,$password,$accesslevel,$email,$phone,$status,$billingaddress,$billingcity,$billingstate,$billingcountry,$shippingaddress,$shippingcity,$shippingstate,$shippingcountry,$currency,$companyname,$companyregistrationno,$vatnumber,$country)==0)
			$data['alerterror']="New user could not be created.";
			else
			$data['alertsuccess']="User created Successfully.";

			$data['table']=$this->user_model->viewusers();
			$data['redirect']="site/viewusers";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
//	function viewusers()
//	{
//		$access = array("1");
//		$this->checkaccess($access);
//		$data['table']=$this->user_model->viewusers();
//		$data['page']='viewusers';
//		$data['title']='View Users';
//		$this->load->view('template',$data);
//	}
    public function viewusers()
    {
        $access=array("1");
        $this->checkaccess($access);
		$data['page']='viewusers';
        $data["base_url"]=site_url("site/viewuserjson");
        $data["title"]="View user";
        $this->load->view("template",$data);
    }
    function viewuserjson()
    {
        $query="SELECT `user`.`id` as `id`,`user`.`name` as `name`,`user`.`firstname` as `firstname`,`user`.`lastname` as `lastname`,`user`.`status` as `status`,`accesslevel`.`name` as `accesslevel`,`user`.`companyname`,`user`.`country`,`country`.`name` as `countryname` FROM `user`
		LEFT JOIN `accesslevel` ON `user`.`accesslevel` = `accesslevel`.`id`
		LEFT JOIN `country` ON `user`.`country` = `country`.`id`
		ORDER BY `user`.`id` ASC";

        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`user`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`user`.`firstname`";
        $elements[1]->sort="1";
        $elements[1]->header="firstname";
        $elements[1]->alias="firstname";

        $elements[2]=new stdClass();
        $elements[2]->field="`user`.`lastname`";
        $elements[2]->sort="1";
        $elements[2]->header="lastname";
        $elements[2]->alias="lastname";

        $elements[3]=new stdClass();
        $elements[3]->field="`user`.`name`";
        $elements[3]->sort="1";
        $elements[3]->header="name";
        $elements[3]->alias="name";

        $elements[4]=new stdClass();
        $elements[4]->field="`user`.`status`";
        $elements[4]->sort="1";
        $elements[4]->header="status";
        $elements[4]->alias="status";

        $elements[5]=new stdClass();
        $elements[5]->field="`accesslevel`.`name`";
        $elements[5]->sort="1";
        $elements[5]->header="accesslevel";
        $elements[5]->alias="accesslevel";

        $elements[6]=new stdClass();
        $elements[6]->field="`user`.`companyname`";
        $elements[6]->sort="1";
        $elements[6]->header="companyname";
        $elements[6]->alias="companyname";

        $elements[7]=new stdClass();
        $elements[7]->field="`country`.`name`";
        $elements[7]->sort="1";
        $elements[7]->header="country";
        $elements[7]->alias="country";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `user` LEFT JOIN `accesslevel` ON `user`.`accesslevel` = `accesslevel`.`id` LEFT JOIN `country` ON `user`.`country` = `country`.`id`");
        $this->load->view("json",$data);
    }

	function edituser()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->user_model->getstatusdropdown();
		$data['accesslevel']=$this->user_model->getaccesslevels();
		$data[ 'country' ] =$this->user_model->getcountry();
		$data[ 'currency' ] =$this->currency_model->getcurrencydropdown();
		$data['before']=$this->user_model->beforeedit($this->input->get('id'));
		$data['page']='edituser';
		$data['page2']='block/userblock';
		$data['title']='Edit User';
		$this->load->view('template',$data);
	}
	function editusersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('password','Password','trim|min_length[6]|max_length[30]');
		$this->form_validation->set_rules('confirmpassword','Confirm Password','trim|matches[password]');
		$this->form_validation->set_rules('accesslevel','Accesslevel','trim');
		$this->form_validation->set_rules('name','name','trim');

        $this->form_validation->set_rules('companyname','Companyname','trim|required');
		$this->form_validation->set_rules('companyregistrationno','Company Registration Number','trim|required');
		$this->form_validation->set_rules('vatnumber','VAT Number','trim|required');
		$this->form_validation->set_rules('country','Country','trim|required');

		$this->form_validation->set_rules('dob','Date of birth','trim');
		$this->form_validation->set_rules('email','Email','trim|valid_email');
		$this->form_validation->set_rules('phone','Phone','trim');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->user_model->getstatusdropdown();
			$data['accesslevel']=$this->user_model->getaccesslevels();
			$data[ 'country' ] =$this->user_model->getcountry();
			$data[ 'currency' ] =$this->currency_model->getcurrencydropdown();
			$data['before']=$this->user_model->beforeedit($this->input->post('id'));
			$data['page']='edituser';
			$data['page2']='block/userblock';
			$data['title']='Edit User';
			$this->load->view('template',$data);
		}
		else
		{
            $companyname=$this->input->post('companyname');
            $companyregistrationno=$this->input->post('companyregistrationno');
            $vatnumber=$this->input->post('vatnumber');
            $country=$this->input->post('country');
			$id=$this->input->post('id');
			$password=$this->input->post('password');
			$name=$this->input->post('name');
			$firstname=$this->input->post('firstname');
			$lastname=$this->input->post('lastname');
			$accesslevel=$this->input->post('accesslevel');
			$email=$this->input->post('email');
			$phone=$this->input->post('phone');
			$billingaddress=$this->input->post('billingaddress');
			$billingcity=$this->input->post('billingcity');
			$billingstate=$this->input->post('billingstate');
			$billingcountry=$this->input->post('billingcountry');
			$shippingaddress=$this->input->post('shippingaddress');
			$shippingcity=$this->input->post('shippingcity');
			$shippingstate=$this->input->post('shippingstate');
			$shippingcountry=$this->input->post('shippingcountry');
			$currency=$this->input->post('currency');
			$status=$this->input->post('status');
			if($this->user_model->edit($id,$name,$firstname,$lastname,$password,$accesslevel,$email,$phone,$status,$billingaddress,$billingcity,$billingstate,$billingcountry,$shippingaddress,$shippingcity,$shippingstate,$shippingcountry,$currency,$companyname,$companyregistrationno,$vatnumber,$country)==0)
			$data['alerterror']="User Editing was unsuccesful";
			else
			$data['alertsuccess']="User edited Successfully.";

			$data['redirect']="site/viewusers";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);

		}
	}

	function addcredits()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->user_model->beforeedit($this->input->get('id'));
		$data['page']='addcredits';
		$data['page2']='block/userblock';
		$data['title']='Add Credits';
		$this->load->view('template',$data);
	}
	function deleteall()
	{
		$access = array("1");
		$this->checkaccess($access);
        //print_r($this->input->post('ids'));
		$data['table']=$this->product_model->deleteall($this->input->post('ids'));
		$data['alertsuccess']="products Deleted Successfully";
		$data['page']='viewproduct';
		$data['title']='View product';
		//$this->load->view('template',$data);
	}
	function deletenewsletter()
	{
		$access = array("1");
		$this->checkaccess($access);
        //print_r($this->input->post('ids'));
		$this->newsletter_model->deletenewsletter($this->input->get('id'));
		$data['table']=$this->newsletter_model->viewnewsletter();
		$data['alertsuccess']="Newsletter Deleted Successfully";
		$data['page']='viewnewsletter';
		$data['title']='View Newsletter';
		$this->load->view('template',$data);

	}
	function deletelimitedstock()
	{
		$access = array("1");
		$this->checkaccess($access);
        //print_r($this->input->post('ids'));
		$this->newsletter_model->deletelimitedstock($this->input->get('id'));
		$data['table']=$this->newsletter_model->limitedstock();
		$data['alertsuccess']="Offer Deleted Successfully";
		$data['page']='limitedstock';
		$data['title']='View Limited Stock Offer';
		$this->load->view('template',$data);

	}
	function deletecontact()
	{
		$access = array("1");
		$this->checkaccess($access);
        //print_r($this->input->post('ids'));
		$this->newsletter_model->deletecontact($this->input->get('id'));
		$data['table']=$this->newsletter_model->viewcontact();
		$data['alertsuccess']="Contact Deleted Successfully";
		$data['page']='viewcontact';
		$data['title']='View Contact';
		$this->load->view('template',$data);

	}
	function addcreditssubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('credits','credits','trim');

		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->user_model->beforeedit($this->input->post('id'));
			$data['page']='edituser';
			$data['page2']='block/userblock';
			$data['title']='Edit User';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$credits=$this->input->post('credits');
			if($this->user_model->addcredits($id,$credits)==0)
			$data['alerterror']="User Editing was unsuccesful";
			else
			$data['alertsuccess']="User edited Successfully.";
			$data['table']=$this->user_model->viewusers();
			$data['redirect']="site/addcredits?id=".$id;
			//$data['other']="template=$template";
			$this->load->view("redirect2",$data);

		}
	}
	function editaddress()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->user_model->getstatusdropdown();
		$data['accesslevel']=$this->user_model->getaccesslevels();
		$data[ 'country' ] =$this->user_model->getcountry();
		$data['before']=$this->user_model->beforeedit($this->input->get('id'));
		$data['page']='editaddress';
		$data['page2']='block/userblock';
		$data['title']='Edit User';
		$this->load->view('template',$data);
	}
	function editaddresssubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('billingaddress','billingaddress','trim');
		$this->form_validation->set_rules('billingcity','billingcity','trim');
		$this->form_validation->set_rules('billingstate','billingstate','trim');
		$this->form_validation->set_rules('billingcountry','billingcountry','trim');
		$this->form_validation->set_rules('shippingaddress','billingaddress','trim');
		$this->form_validation->set_rules('shippingstate','shippingstate','trim');
		$this->form_validation->set_rules('shippingcity','shippingcity','trim');
		$this->form_validation->set_rules('shippingcountry','shippingcountry','trim');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->user_model->getstatusdropdown();
			$data['accesslevel']=$this->user_model->getaccesslevels();
			$data[ 'country' ] =$this->user_model->getcountry();
			$data['before']=$this->user_model->beforeedit($this->input->post('id'));
			$data['page']='edituser';
			$data['page2']='block/userblock';
			$data['title']='Edit User';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$billingaddress=$this->input->post('billingaddress');
			$billingcity=$this->input->post('billingcity');
			$billingstate=$this->input->post('billingstate');
			$billingcountry=$this->input->post('billingcountry');
			$shippingaddress=$this->input->post('shippingaddress');
			$shippingcity=$this->input->post('shippingcity');
			$shippingstate=$this->input->post('shippingstate');
			$shippingcountry=$this->input->post('shippingcountry');
			$shippingpincode=$this->input->post('shippingpincode');
			if($this->user_model->editaddress($id,$billingaddress,$billingcity,$billingstate,$billingcountry,$shippingaddress,$shippingcity,$shippingstate,$shippingcountry,$shippingpincode)==0)
			$data['alerterror']="User Editing was unsuccesful";
			else
			$data['alertsuccess']="User edited Successfully.";
			$data['table']=$this->user_model->viewusers();
			$data['redirect']="site/editaddress?id=".$id;
			//$data['other']="template=$template";
			$this->load->view("redirect2",$data);

		}
	}
	function deleteuser()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->user_model->deleteuser($this->input->get('id'));
//		$data['table']=$this->user_model->viewusers();
		$data['alertsuccess']="User Deleted Successfully";
//		$data['page']='viewusers';
//		$data['title']='View Users';
		$data['redirect']="site/viewusers";
			//$data['other']="template=$template";
        $this->load->view("redirect",$data);
	}
	function changeuserstatus()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->user_model->changestatus($this->input->get('id'));
		$data['table']=$this->user_model->viewusers();
		$data['alertsuccess']="Status Changed Successfully";
		$data['page']='viewusers';
		$data['title']='View Users';
		$this->load->view('template',$data);
	}




	//category
	public function createcategory()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->user_model->getstatusdropdown();
		$data['category']=$this->category_model->getcategorydropdown();
		$data[ 'page' ] = 'createcategory';
		$data[ 'title' ] = 'Create category';
		$this->load->view( 'template', $data );
	}
	function createcategorysubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('parent','parent','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->user_model->getstatusdropdown();
			$data['category']=$this->category_model->getcategorydropdown();
			$data[ 'page' ] = 'createcategory';
			$data[ 'title' ] = 'Create category';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$parent=$this->input->post('parent');
			$status=$this->input->post('status');
			$order=$this->input->post('order');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image1";
			$image1="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image1=$uploaddata['file_name'];
			}
			$filename="image2";
			$image2="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image2=$uploaddata['file_name'];
			}
			if($this->category_model->createcategory($name,$parent,$status,$order,$image1,$image2)==0)
			$data['alerterror']="New category could not be created.";
			else
			$data['alertsuccess']="category  created Successfully.";
			$data['table']=$this->category_model->viewcategory();
			$data['redirect']="site/viewcategory";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewcategory()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->category_model->viewcategory();
		$data['page']='viewcategory';
		$data['title']='View category';
		$this->load->view('template',$data);
	}
	function editcategory()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->category_model->beforeeditcategory($this->input->get('id'));
		$data['category']=$this->category_model->getcategorydropdown();
		$data[ 'status' ] =$this->user_model->getstatusdropdown();
		$data['page']='editcategory';
		$data['title']='Edit category';
		$this->load->view('template',$data);
	}
	function editcategorysubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('parent','parent','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->user_model->getstatusdropdown();
			$data['category']=$this->category_model->getcategorydropdown();
			$data['before']=$this->category_model->beforeeditcategory($this->input->post('id'));
			$data['page']='editcategory';
			$data['title']='Edit category';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$parent=$this->input->post('parent');
			$status=$this->input->post('status');
			$order=$this->input->post('order');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image1";
			$image1="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image1=$uploaddata['file_name'];
			}
			$filename="image2";
			$image2="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image2=$uploaddata['file_name'];
			}
			if($this->category_model->editcategory($id,$name,$parent,$status,$order,$image1,$image2)==0)
			$data['alerterror']="category Editing was unsuccesful";
			else
			$data['alertsuccess']="category edited Successfully.";
			$data['table']=$this->category_model->viewcategory();
			$data['redirect']="site/viewcategory";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['page']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deletecategory()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->category_model->deletecategory($this->input->get('id'));
		$data['table']=$this->category_model->viewcategory();
		$data['alertsuccess']="category Deleted Successfully";
		$data['page']='viewcategory';
		$data['title']='View category';
		$this->load->view('template',$data);
	}
	//product
	public function createproduct()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->product_model->getstatusdropdown();
		$data['relatedproduct']=$this->product_model->getproductdropdown();
		$data['category']=$this->product_model->getcategorydropdown();
		$data['visibility']=$this->product_model->getvisibility();
        $data['brand']=$this->brand_model->getbranddropdown();
        $data['type']=$this->brand_model->gettypedropdown();
		$data[ 'page' ] = 'createproduct';
		$data[ 'title' ] = 'Create product';
		$this->load->view( 'template', $data );
	}
	function createproductsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('sku','sku','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('description','description','trim|');
		$this->form_validation->set_rules('url','url','trim|');
		$this->form_validation->set_rules('visibility','visibility','trim|');
		$this->form_validation->set_rules('price','price','trim|');
		$this->form_validation->set_rules('wholesaleprice','wholesaleprice','trim|');
		$this->form_validation->set_rules('firstsaleprice','firstsaleprice','trim|');
		$this->form_validation->set_rules('secondsaleprice','secondsaleprice','trim|');
		$this->form_validation->set_rules('specialpricefrom','specialpricefrom','trim|');
		$this->form_validation->set_rules('specialpriceto','specialpriceto','trim|');
		$this->form_validation->set_rules('metatitle','metatitle','trim|');
		$this->form_validation->set_rules('metadesc','metadesc','trim|');
		$this->form_validation->set_rules('metakeyword','metakeyword','trim|');
		$this->form_validation->set_rules('quantity','quantity','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->product_model->getstatusdropdown();
			$data['relatedproduct']=$this->product_model->getproductdropdown();
			$data['category']=$this->product_model->getcategorydropdown();
			$data['visibility']=$this->product_model->getvisibility();
			$data[ 'page' ] = 'createproduct';
			$data[ 'title' ] = 'Create product';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$sku=$this->input->post('sku');
			$status=$this->input->post('status');
			$description=$this->input->post('description');
			$url=$this->input->post('url');
			$visibility=$this->input->post('visibility');
			$price=$this->input->post('price');
			$wholesaleprice=$this->input->post('wholesaleprice');
			$firstsaleprice=$this->input->post('firstsaleprice');
			$secondsaleprice=$this->input->post('secondsaleprice');
			$specialpricefrom=$this->input->post('specialpricefrom');
			$specialpriceto=$this->input->post('specialpriceto');
			$metatitle=$this->input->post('metatitle');
			$metadesc=$this->input->post('metadesc');
			$metakeyword=$this->input->post('metakeyword');
			$quantity=$this->input->post('quantity');
			$category=$this->input->post('category');
			$relatedproduct=$this->input->post('relatedproduct');
			$brand=$this->input->post('brand');
			$type=$this->input->post('type');

			$modelnumber=$this->input->post('modelnumber');
			$brandcolor=$this->input->post('brandcolor');
			$eanorupc=$this->input->post('eanorupc');
			$eanorupcmeasuringunits=$this->input->post('eanorupcmeasuringunits');
			$compatibledevice=$this->input->post('compatibledevice');
			$compatiblewith=$this->input->post('compatiblewith');
			$material=$this->input->post('material');
			$color=$this->input->post('color');
			$width=$this->input->post('width');
			$height=$this->input->post('height');
			$depth=$this->input->post('depth');
			$salespackage=$this->input->post('salespackage');
			$keyfeatures=$this->input->post('keyfeatures');
			$videourl=$this->input->post('videourl');
			$modelname=$this->input->post('modelname');
			$finish=$this->input->post('finish');
			$weight=$this->input->post('weight');
			$domesticwarranty=$this->input->post('domesticwarranty');
			$warrantysummary=$this->input->post('warrantysummary');
			$size=$this->input->post('size');
			$typename=$this->input->post('typename');
			$dimension=$this->input->post('dimension');
			$colormatch=$this->input->post('colormatch');
			$microphone=$this->input->post('microphone');
			$length=$this->input->post('length');
			$capacity=$this->input->post('capacity');
			$voltage=$this->input->post('voltage');
			$tax=$this->input->post('tax');

			if($specialpricefrom != "")
				$specialpricefrom = date("Y-m-d",strtotime($specialpricefrom));
			if($specialpriceto != "")
				$specialpriceto = date("Y-m-d",strtotime($specialpriceto));
			if($this->product_model->createproduct($name,$sku,$description,$url,$visibility,$price,$wholesaleprice,$firstsaleprice,$secondsaleprice,$specialpricefrom,$specialpriceto,$metatitle,$metadesc,$metakeyword,$quantity,$status,$category,$relatedproduct,$brand,$type,$modelnumber,$brandcolor,$eanorupc,$eanorupcmeasuringunits,$compatibledevice,$compatiblewith,$material,$color,$width,$height,$depth,$salespackage,$keyfeatures,$videourl,$modelname,$finish,$weight,$domesticwarranty,$warrantysummary,$size,$typename,$dimension,$colormatch,$microphone,$length,$capacity,$voltage,$tax)==0)
			$data['alerterror']="New product could not be created.";
			else
			$data['alertsuccess']="product  created Successfully.";
			$data['table']=$this->product_model->viewproduct();
			$data['redirect']="site/viewproduct";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
//	function viewproduct()
//	{
//		$access = array("1");
//		$this->checkaccess($access);
//		$data['table']=$this->product_model->viewproduct();
//		$data['page']='viewproduct';
//		$data['title']='View product';
//		$this->load->view('template',$data);
//	}
    public function viewproduct()
    {
        $access=array("1");
        $this->checkaccess($access);
//        $data['yesview']=1;
        $data["page"]="viewproductnew";
        $data["base_url"]=site_url("site/viewproductjson");
        $data["title"]="View product";
        $this->load->view("template",$data);
    }
    public function viewproductdisabled()
    {
        $access=array("1");
        $this->checkaccess($access);
//        $data['yesview']=2;
        $data["page"]="viewproductnewdisable";
        $data["base_url"]=site_url("site/viewproductdisabledjson");
        $data["title"]="View product";
        $this->load->view("template",$data);
    }
    function viewproductdisabledjson()
    {
        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`product`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`product`.`name`";
        $elements[1]->sort="1";
        $elements[1]->header="name";
        $elements[1]->alias="name";

        $elements[2]=new stdClass();
        $elements[2]->field="`product`.`sku`";
        $elements[2]->sort="1";
        $elements[2]->header="sku";
        $elements[2]->alias="sku";

        $elements[3]=new stdClass();
        $elements[3]->field="`product`.`price`";
        $elements[3]->sort="1";
        $elements[3]->header="price";
        $elements[3]->alias="price";

        $elements[4]=new stdClass();
        $elements[4]->field="`product`.`quantity`";
        $elements[4]->sort="1";
        $elements[4]->header="quantity";
        $elements[4]->alias="quantity";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `product`","WHERE `product`.`status`=0");
        $this->load->view("json",$data);
    }
    function viewproductjson()
    {
        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`product`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`product`.`name`";
        $elements[1]->sort="1";
        $elements[1]->header="name";
        $elements[1]->alias="name";

        $elements[2]=new stdClass();
        $elements[2]->field="`product`.`sku`";
        $elements[2]->sort="1";
        $elements[2]->header="sku";
        $elements[2]->alias="sku";

        $elements[3]=new stdClass();
        $elements[3]->field="`product`.`price`";
        $elements[3]->sort="1";
        $elements[3]->header="price";
        $elements[3]->alias="price";

        $elements[4]=new stdClass();
        $elements[4]->field="`product`.`quantity`";
        $elements[4]->sort="1";
        $elements[4]->header="quantity";
        $elements[4]->alias="quantity";

        $elements[5]=new stdClass();
        $elements[5]->field="`product`.`firstsaleprice`";
        $elements[5]->sort="1";
        $elements[5]->header="First Sale Price";
        $elements[5]->alias="firstsaleprice";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `product`","WHERE `product`.`status`=1");
        $this->load->view("json",$data);
    }

	function deleteallselectedproducts()
	{
		$access = array("1");
		$this->checkaccess($access);
        //print_r($this->input->post('ids'));
		$data['table']=$this->product_model->deleteallselectedproducts($this->input->get_post('ids'));
		$data['alertsuccess']="Selected Products Deleted Successfully";
		$data['page']='viewproduct';
		$data['title']='View Product';
		//$this->load->view('template',$data);
	}
	function editproduct()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->product_model->beforeeditproduct($this->input->get('id'));
		$data[ 'status' ] =$this->product_model->getstatusdropdown();
		$data['relatedproduct']=$this->product_model->getproductdropdown();
		$data['category']=$this->product_model->getcategorydropdown();
		$data['visibility']=$this->product_model->getvisibility();
        $data['brand']=$this->brand_model->getbranddropdown();
        $data['selectedbrand']=$this->brand_model->getbrandbyproduct($this->input->get_post('id'));
        $data['type']=$this->brand_model->gettypedropdown();
        $data['selectedtype']=$this->brand_model->gettypebyproduct($this->input->get_post('id'));

		$data['page']='editproduct';
		$data['page2']='block/productblock';
		$data['title']='Edit product';
		$this->load->view('template',$data);
	}
	function editproductsubmit()
	{
        $access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('sku','sku','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('description','description','trim|');
		$this->form_validation->set_rules('url','url','trim|');
		$this->form_validation->set_rules('visibility','visibility','trim|');
		$this->form_validation->set_rules('price','price','trim|');
		$this->form_validation->set_rules('wholesaleprice','wholesaleprice','trim|');
		$this->form_validation->set_rules('firstsaleprice','firstsaleprice','trim|');
		$this->form_validation->set_rules('secondsaleprice','secondsaleprice','trim|');
		$this->form_validation->set_rules('specialpricefrom','specialpricefrom','trim|');
		$this->form_validation->set_rules('specialpriceto','specialpriceto','trim|');
		$this->form_validation->set_rules('metatitle','metatitle','trim|');
		$this->form_validation->set_rules('metadesc','metadesc','trim|');
		$this->form_validation->set_rules('metakeyword','metakeyword','trim|');
		$this->form_validation->set_rules('quantity','quantity','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->product_model->getstatusdropdown();
			$data['relatedproduct']=$this->product_model->getproductdropdown();
			$data['category']=$this->product_model->getcategorydropdown();
			$data['visibility']=$this->product_model->getvisibility();
        $data['brand']=$this->brand_model->getbranddropdown();
        $data['selectedbrand']=$this->brand_model->getbrandbyproduct($this->input->get_post('id'));
			$data['before']=$this->product_model->beforeeditproduct($this->input->post('id'));
			$data['page']='editproduct';
			$data['page2']='block/productblock';
			$data['title']='Edit product';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$sku=$this->input->post('sku');
			$status=$this->input->post('status');
			$description=$this->input->post('description');
			$url=$this->input->post('url');
			$visibility=$this->input->post('visibility');
			$price=$this->input->post('price');
			$wholesaleprice=$this->input->post('wholesaleprice');
			$firstsaleprice=$this->input->post('firstsaleprice');
			$secondsaleprice=$this->input->post('secondsaleprice');
			$specialpricefrom=$this->input->post('specialpricefrom');
			$specialpriceto=$this->input->post('specialpriceto');
			if($specialpricefrom != "")
				$specialpricefrom = date("Y-m-d",strtotime($specialpricefrom));
			if($specialpriceto != "")
				$specialpriceto = date("Y-m-d",strtotime($specialpriceto));
			$specialpriceto=$this->input->post('specialpriceto');
			$metatitle=$this->input->post('metatitle');
			$metadesc=$this->input->post('metadesc');
			$metakeyword=$this->input->post('metakeyword');
			$quantity=$this->input->post('quantity');
			$category=$this->input->post('category');
			$relatedproduct=$this->input->post('relatedproduct');
			$brand=$this->input->post('brand');
			$type=$this->input->post('type');


			$modelnumber=$this->input->post('modelnumber');
			$brandcolor=$this->input->post('brandcolor');
			$eanorupc=$this->input->post('eanorupc');
			$eanorupcmeasuringunits=$this->input->post('eanorupcmeasuringunits');
			$compatibledevice=$this->input->post('compatibledevice');
			$compatiblewith=$this->input->post('compatiblewith');
			$material=$this->input->post('material');
			$color=$this->input->post('color');
			$width=$this->input->post('width');
			$height=$this->input->post('height');
			$depth=$this->input->post('depth');
			$salespackage=$this->input->post('salespackage');
			$keyfeatures=$this->input->post('keyfeatures');
			$videourl=$this->input->post('videourl');
			$modelname=$this->input->post('modelname');
			$finish=$this->input->post('finish');
			$weight=$this->input->post('weight');
			$domesticwarranty=$this->input->post('domesticwarranty');
			$warrantysummary=$this->input->post('warrantysummary');
			$size=$this->input->post('size');
            $typename=$this->input->post('typename');
            $dimension=$this->input->post('dimension');
			$colormatch=$this->input->post('colormatch');
            $microphone=$this->input->post('microphone');
			$length=$this->input->post('length');
			$capacity=$this->input->post('capacity');
			$voltage=$this->input->post('voltage');
			$tax=$this->input->post('tax');

			if($this->product_model->editproduct($id,$name,$sku,$description,$url,$visibility,$price,$wholesaleprice,$firstsaleprice,$secondsaleprice,$specialpricefrom,$specialpriceto,$metatitle,$metadesc,$metakeyword,$quantity,$status,$category,$relatedproduct,$brand,$type,$modelnumber,$brandcolor,$eanorupc,$eanorupcmeasuringunits,$compatibledevice,$compatiblewith,$material,$color,$width,$height,$depth,$salespackage,$keyfeatures,$videourl,$modelname,$finish,$weight,$domesticwarranty,$warrantysummary,$size,$typename,$dimension,$colormatch,$microphone,$length,$capacity,$voltage,$tax)==0)
			$data['alerterror']="product Editing was unsuccesful";
			else
			$data['alertsuccess']="product edited Successfully.";
			$data['table']=$this->product_model->viewproduct();

			$data['redirect']="site/viewproduct";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['page']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deleteproduct()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->product_model->deleteproduct($this->input->get('id'));
		$data['table']=$this->product_model->viewproduct();
		$data['alertsuccess']="product Deleted Successfully";
		$data['page']='viewproductnew';
		$data['title']='View product';
//		$this->load->view('template',$data);
        $data["redirect"]="site/viewproduct";
        $this->load->view("redirect",$data);
	}
	function uploadproductimage()
	{
		$access = array("1");
		$this->checkaccess($access);
		$id=$this->input->get('id');
		$data['table']=$this->product_model->viewallimages($id);
		$data['before']=$this->product_model->beforeeditproduct($id);
		$data['page']='uploadproductimage';
		$data['page2']='block/productblock';
		$data['title']='Upload Image';
		$this->load->view('template',$data);
	}
	function uploadproductimagesubmit()
	 {
		$access = array("1");
		$this->checkaccess($access);
		$config[ 'upload_path' ]   = './uploads/';
		$config[ 'allowed_types' ] = 'gif|jpg|png|jpeg';
		$config[ 'encrypt_name' ]  = TRUE;
		$this->load->library( 'upload', $config );
		if(!$this->upload->do_upload( 'image'))
		{
			$data['alerterror'] = "Image Uploaded Unsuccessfully.";
			$data['table']=$this->product_model->viewallimages($id);
			$data['before']=$this->product_model->beforeeditproduct($this->input->get('id'));
			$data['page']='uploadproductimage';
			$data['page2']='block/productblock';
			$data['title']='Image Upload';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->get('id');
			$uploaddata  = $this->upload->data();
			$this->product_model->addimage($id,$uploaddata);
			$data['alertsuccess']="Image Uploaded Successfully.";
			$data['before']=$this->product_model->beforeeditproduct($this->input->get('id'));
			$data['table']=$this->product_model->viewallimages($id);
			$data['page']='uploadproductimage';
			$data['title']='Image Upload';
			//$this->load->view('template',$data);
			$data['redirect']="site/uploadproductimage?id=$id";
			//$data['other']="template=$template";
			$this->load->view("redirect2",$data);
		}
	 }
	 function deleteimage()
	 {
		$access = array("1");
		$this->checkaccess($access);
		$id=$this->input->get('id');
		$imageid=$this->input->get('imageid');
		$this->product_model->deleteimage($imageid,$id);
		$data['alertsuccess']="Image Deleted Successfully.";
		$data['before']=$this->product_model->beforeeditproduct($this->input->get('id'));
		$data['table']=$this->product_model->viewallimages($id);
		$data['page']='uploadproductimage';
		$data['page2']='block/productblock';
		$data['title']='Image Upload';
		$this->load->view('template',$data);

	 }
	 function defaultimage()
	 {
		$access = array("1");
		$this->checkaccess($access);
		$id=$this->input->get('id');
		$imageid=$this->input->get('imageid');
		$this->product_model->defaultimage($imageid,$id);
		$data['alertsuccess']="Default Image is Selected Successfully.";
		$data['before']=$this->product_model->beforeeditproduct($this->input->get('id'));
		$data['table']=$this->product_model->viewallimages($id);
		$data['page']='uploadproductimage';
		$data['page2']='block/productblock';
		$data['title']='Image Upload';
		$this->load->view('template',$data);

	 }
	  function changeorder()
	 {
		$access = array("1");
		$this->checkaccess($access);
		$id=$this->input->get_post('id');
		$order=$this->input->get_post('order');
		$product=$this->input->get_post('product');
		$data['page2']='block/productblock';
		$this->product_model->changeorder($id,$order,$product);
	 }
	//Wishlist
	function wishlistsubmit()
	{
		$this->checkaccess($access);
		$user=$this->input->post('user');
		$product=$this->input->post('product');
		if($this->wishlist_model->wishlistsubmit($user,$product)==0)
		$data['message']="0";
		else
		$data['message']="1";

		$this->load->view('json',$data);
	}
	function viewwishlist()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->wishlist_model->viewwishlist();
		$data['page']='viewwishlist';
		$data['title']='View Wishlist';
		$this->load->view('template',$data);
	}
	function viewuserwishlist()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->wishlist_model->viewuserwishlist($this->input->get('id'));
		$data['before']=$this->user_model->beforeedit($this->input->get('id'));
		$data['page']='viewuserwishlist';
		$data['page2']='block/userblock';
		$data['title']='View Wishlist';
		$this->load->view('template',$data);
	}
	//cart
	function cartsubmit()
	{
		$this->checkaccess($access);
		$user=$this->input->post('user');
		$product=$this->input->post('product');
		$quantity=$this->input->post('quantity');
		if($this->cart_model->cartsubmit($user,$product,$quantity)==0)
		$data['message']="0";
		else
		$data['message']="1";

		$this->load->view('json',$data);
	}
	function viewcart()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->cart_model->viewcart();
		$data['page']='viewcart';
		$data['title']='View cart';
		$this->load->view('template',$data);
	}
	function viewusercart()
	{
		$access = array("1");
		$this->checkaccess($access);

		$data['table']=$this->cart_model->viewusercart($this->input->get('id'));
		$data['page']='viewusercart';
		$data['page2']='block/userblock';
		$data['before']=$this->user_model->beforeedit($this->input->get('id'));
		$data['title']='View cart';
		$this->load->view('template',$data);
	}
	//page
	public function createpage()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'page' ] = 'createpage';
		$data[ 'title' ] = 'Create page';
		$this->load->view( 'template', $data );
	}
	function createpagesubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('content','content','trim|');

		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'page' ] = 'createpage';
			$data[ 'title' ] = 'Create page';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$content=$this->input->post('content');
			if($this->page_model->createpage($name,$content)==0)
			$data['alerterror']="New page could not be created.";
			else
			$data['alertsuccess']="page  created Successfully.";
			$data['table']=$this->page_model->viewpage();
			$data['redirect']="site/viewpage";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewpage()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->page_model->viewpage();
		$data['page']='viewpage';
		$data['title']='View page';
		$this->load->view('template',$data);
	}
	function editpage()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->page_model->beforeeditpage($this->input->get('id'));
		$data['page']='editpage';
		$data['title']='Edit page';
		$this->load->view('template',$data);
	}
	function editpagesubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('content','content','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->page_model->beforeeditpage($this->input->post('id'));
			$data['page']='editpage';
			$data['title']='Edit page';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$content=$this->input->post('content');
			if($this->page_model->editpage($id,$name,$content)==0)
			$data['alerterror']="page Editing was unsuccesful";
			else
			$data['alertsuccess']="page edited Successfully.";
			$data['table']=$this->page_model->viewpage();
			$data['redirect']="site/viewpage";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['page']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deletepage()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->page_model->deletepage($this->input->get('id'));
		$data['table']=$this->page_model->viewpage();
		$data['alertsuccess']="page Deleted Successfully";
		$data['page']='viewpage';
		$data['title']='View page';
		$this->load->view('template',$data);
	}
	//slider
	public function createslider()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->slider_model->getstatusdropdown();
		$data['order']=$this->order_model->getorderdropdown();
		$data['product']=$this->product_model->getproductdropdown();
		$data[ 'page' ] = 'createslider';
		$data[ 'title' ] = 'Create slider';
		$this->load->view( 'template', $data );
	}
	function createslidersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
//		$this->form_validation->set_rules('link','link','trim|');
//		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('product','product','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->slider_model->getstatusdropdown();
            $data['order']=$this->order_model->getorderdropdown();
            $data['product']=$this->product_model->getproductdropdown();
			$data[ 'page' ] = 'createslider';
			$data[ 'title' ] = 'Create slider';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
//			$link=$this->input->post('link');
//			$target=$this->input->post('target');
//			$fromdate=$this->input->post('fromdate');
//			if($fromdate != "")
//				$fromdate = date("Y-m-d",strtotime($fromdate));
//			$todate=$this->input->post('todate');
//			if($todate != "")
//				$todate = date("Y-m-d",strtotime($todate));
			$status=$this->input->post('status');
			$order=$this->input->post('order');
			$product=$this->input->post('product');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->slider_model->createslider($name,$status,$order,$product,$image)==0)
			$data['alerterror']="New slider could not be created.";
			else
			$data['alertsuccess']="slider  created Successfully.";
			$data['table']=$this->slider_model->viewslider();
			$data['redirect']="site/viewslider";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewslider()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->slider_model->viewslider();
		$data['page']='viewslider';
		$data['title']='View slider';
		$this->load->view('template',$data);
	}
	function editslider()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->slider_model->beforeeditslider($this->input->get('id'));
		$data[ 'status' ] =$this->slider_model->getstatusdropdown();
		$data['product']=$this->product_model->getproductdropdown();
		$data['page']='editslider';
		$data['title']='Edit slider';
		$this->load->view('template',$data);
	}
	function editslidersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('product','product','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->slider_model->getstatusdropdown();
			$data['before']=$this->slider_model->beforeeditslider($this->input->post('id'));
			$data['page']='editslider';
			$data['title']='Edit slider';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$product=$this->input->post('product');
//			$target=$this->input->post('target');
//			$fromdate=$this->input->post('fromdate');
//			if($fromdate != "")
//				$fromdate = date("Y-m-d",strtotime($fromdate));
//			$todate=$this->input->post('todate');
//			if($todate != "")
//				$todate = date("Y-m-d",strtotime($todate));
			$status=$this->input->post('status');
			$order=$this->input->post('order');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}
			if($this->slider_model->editslider($id,$name,$status,$order,$product,$image)==0)
			$data['alerterror']="slider Editing was unsuccesful";
			else
			$data['alertsuccess']="slider edited Successfully.";
			$data['table']=$this->slider_model->viewslider();
			$data['redirect']="site/viewslider";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['page']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deleteslider()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->slider_model->deleteslider($this->input->get('id'));
		$data['table']=$this->slider_model->viewslider();
		$data['alertsuccess']="slider Deleted Successfully";
		$data['page']='viewslider';
		$data['title']='View slider';
		$this->load->view('template',$data);
	}
	//banner1
	public function createbanner1()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->banner_model->getstatusdropdown();
		$data[ 'page' ] = 'createbanner1';
		$data[ 'title' ] = 'Create banner1';
		$this->load->view( 'template', $data );
	}
	function createbannersubmit1()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->banner_model->getstatusdropdown();
			$data[ 'page' ] = 'createbanner1';
			$data[ 'title' ] = 'Create banner1';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$fromdate=$this->input->post('fromdate');
			if($fromdate != "")
				$fromdate = date("Y-m-d",strtotime($fromdate));
			$todate=$this->input->post('todate');
			if($todate != "")
				$todate = date("Y-m-d",strtotime($todate));
			$status=$this->input->post('status');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->banner_model->createbanner1($name,$link,$target,$status,$fromdate,$todate,$image)==0)
			$data['alerterror']="New banner1 could not be created.";
			else
			$data['alertsuccess']="banner1  created Successfully.";
			$data['table']=$this->banner_model->viewbanner1();
			$data['redirect']="site/viewbanner1";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewbanner1()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->banner_model->viewbanner1();
		$data['page']='viewbanner1';
		$data['title']='View banner1';
		$this->load->view('template',$data);
	}
	function editbanner1()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->banner_model->beforeeditbanner1($this->input->get('id'));
		$data[ 'status' ] =$this->banner_model->getstatusdropdown();
		$data['page']='editbanner1';
		$data['title']='Edit banner1';
		$this->load->view('template',$data);
	}
	function editbannersubmit1()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->banner_model->getstatusdropdown();
			$data['before']=$this->banner_model->beforeeditbanner1($this->input->post('id'));
			$data['page']='editbanner1';
			$data['title']='Edit banner1';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$fromdate=$this->input->post('fromdate');
			if($fromdate != "")
				$fromdate = date("Y-m-d",strtotime($fromdate));
			$todate=$this->input->post('todate');
			if($todate != "")
				$todate = date("Y-m-d",strtotime($todate));
			$status=$this->input->post('status');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}
			if($this->banner_model->editbanner1($id,$name,$link,$target,$status,$fromdate,$todate,$image)==0)
			$data['alerterror']="banner1 Editing was unsuccesful";
			else
			$data['alertsuccess']="banner1 edited Successfully.";
			$data['table']=$this->banner_model->viewbanner1();
			$data['redirect']="site/viewbanner1";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['page']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deletebanner1()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->banner_model->deletebanner1($this->input->get('id'));
		$data['table']=$this->banner_model->viewbanner1();
		$data['alertsuccess']="banner1 Deleted Successfully";
		$data['page']='viewbanner1';
		$data['title']='View banner1';
		$this->load->view('template',$data);
	}
	//banner2
	public function createbanner2()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->banner_model->getstatusdropdown();
		$data[ 'page' ] = 'createbanner2';
		$data[ 'title' ] = 'Create banner2';
		$this->load->view( 'template', $data );
	}
	function createbannersubmit2()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->banner_model->getstatusdropdown();
			$data[ 'page' ] = 'createbanner2';
			$data[ 'title' ] = 'Create banner2';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$fromdate=$this->input->post('fromdate');
			if($fromdate != "")
				$fromdate = date("Y-m-d",strtotime($fromdate));
			$todate=$this->input->post('todate');
			if($todate != "")
				$todate = date("Y-m-d",strtotime($todate));
			$status=$this->input->post('status');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->banner_model->createbanner2($name,$link,$target,$status,$fromdate,$todate,$image)==0)
			$data['alerterror']="New banner2 could not be created.";
			else
			$data['alertsuccess']="banner2  created Successfully.";
			$data['table']=$this->banner_model->viewbanner2();
			$data['redirect']="site/viewbanner2";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewbanner2()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->banner_model->viewbanner2();
		$data['page']='viewbanner2';
		$data['title']='View banner2';
		$this->load->view('template',$data);
	}
	function editbanner2()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->banner_model->beforeeditbanner2($this->input->get('id'));
		$data[ 'status' ] =$this->banner_model->getstatusdropdown();
		$data['page']='editbanner2';
		$data['title']='Edit banner2';
		$this->load->view('template',$data);
	}
	function editbannersubmit2()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->banner_model->getstatusdropdown();
			$data['before']=$this->banner_model->beforeeditbanner2($this->input->post('id'));
			$data['page']='editbanner2';
			$data['title']='Edit banner2';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$fromdate=$this->input->post('fromdate');
			if($fromdate != "")
				$fromdate = date("Y-m-d",strtotime($fromdate));
			$todate=$this->input->post('todate');
			if($todate != "")
				$todate = date("Y-m-d",strtotime($todate));
			$status=$this->input->post('status');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}
			if($this->banner_model->editbanner2($id,$name,$link,$target,$status,$fromdate,$todate,$image)==0)
			$data['alerterror']="banner2 Editing was unsuccesful";
			else
			$data['alertsuccess']="banner2 edited Successfully.";
			$data['table']=$this->banner_model->viewbanner2();
			$data['redirect']="site/viewbanner2";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['page']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deletebanner2()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->banner_model->deletebanner2($this->input->get('id'));
		$data['table']=$this->banner_model->viewbanner2();
		$data['alertsuccess']="banner2 Deleted Successfully";
		$data['page']='viewbanner2';
		$data['title']='View banner2';
		$this->load->view('template',$data);
	}
	//banner3
	public function createbanner3()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->banner_model->getstatusdropdown();
		$data[ 'page' ] = 'createbanner3';
		$data[ 'title' ] = 'Create banner3';
		$this->load->view( 'template', $data );
	}
	function createbannersubmit3()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->banner_model->getstatusdropdown();
			$data[ 'page' ] = 'createbanner3';
			$data[ 'title' ] = 'Create banner3';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$fromdate=$this->input->post('fromdate');
			if($fromdate != "")
				$fromdate = date("Y-m-d",strtotime($fromdate));
			$todate=$this->input->post('todate');
			if($todate != "")
				$todate = date("Y-m-d",strtotime($todate));
			$status=$this->input->post('status');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->banner_model->createbanner3($name,$link,$target,$status,$fromdate,$todate,$image)==0)
			$data['alerterror']="New banner3 could not be created.";
			else
			$data['alertsuccess']="banner3  created Successfully.";
			$data['table']=$this->banner_model->viewbanner3();
			$data['redirect']="site/viewbanner3";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewbanner3()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->banner_model->viewbanner3();
		$data['page']='viewbanner3';
		$data['title']='View banner3';
		$this->load->view('template',$data);
	}
	function editbanner3()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->banner_model->beforeeditbanner3($this->input->get('id'));
		$data[ 'status' ] =$this->banner_model->getstatusdropdown();
		$data['page']='editbanner3';
		$data['title']='Edit banner3';
		$this->load->view('template',$data);
	}
	function editbannersubmit3()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->banner_model->getstatusdropdown();
			$data['before']=$this->banner_model->beforeeditbanner3($this->input->post('id'));
			$data['page']='editbanner3';
			$data['title']='Edit banner3';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$fromdate=$this->input->post('fromdate');
			if($fromdate != "")
				$fromdate = date("Y-m-d",strtotime($fromdate));
			$todate=$this->input->post('todate');
			if($todate != "")
				$todate = date("Y-m-d",strtotime($todate));
			$status=$this->input->post('status');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}
			if($this->banner_model->editbanner3($id,$name,$link,$target,$status,$fromdate,$todate,$image)==0)
			$data['alerterror']="banner3 Editing was unsuccesful";
			else
			$data['alertsuccess']="banner3 edited Successfully.";
			$data['table']=$this->banner_model->viewbanner3();
			$data['redirect']="site/viewbanner3";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['page']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deletebanner3()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->banner_model->deletebanner3($this->input->get('id'));
		$data['table']=$this->banner_model->viewbanner3();
		$data['alertsuccess']="banner3 Deleted Successfully";
		$data['page']='viewbanner3';
		$data['title']='View banner3';
		$this->load->view('template',$data);
	}
	//celebcorner
	public function createcelebcorner()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->celebcorner_model->getstatusdropdown();
		$data[ 'page' ] = 'createcelebcorner';
		$data[ 'title' ] = 'Create celebcorner';
		$this->load->view( 'template', $data );
	}
	function createcelebcornersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->celebcorner_model->getstatusdropdown();
			$data[ 'page' ] = 'createcelebcorner';
			$data[ 'title' ] = 'Create celebcorner';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$status=$this->input->post('status');
			$order=$this->input->post('order');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->celebcorner_model->createcelebcorner($name,$link,$target,$status,$order,$image)==0)
			$data['alerterror']="New celebcorner could not be created.";
			else
			$data['alertsuccess']="celebcorner  created Successfully.";
			$data['table']=$this->celebcorner_model->viewcelebcorner();
			$data['redirect']="site/viewcelebcorner";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewcelebcorner()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->celebcorner_model->viewcelebcorner();
		$data['page']='viewcelebcorner';
		$data['title']='View celebcorner';
		$this->load->view('template',$data);
	}
	function editcelebcorner()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->celebcorner_model->beforeeditcelebcorner($this->input->get('id'));
		$data[ 'status' ] =$this->celebcorner_model->getstatusdropdown();
		$data['page']='editcelebcorner';
		$data['title']='Edit celebcorner';
		$this->load->view('template',$data);
	}
	function editcelebcornersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->celebcorner_model->getstatusdropdown();
			$data['before']=$this->celebcorner_model->beforeeditcelebcorner($this->input->post('id'));
			$data['page']='editcelebcorner';
			$data['title']='Edit celebcorner';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$status=$this->input->post('status');
			$order=$this->input->post('order');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}
			if($this->celebcorner_model->editcelebcorner($id,$name,$link,$target,$status,$order,$image)==0)
			$data['alerterror']="celebcorner Editing was unsuccesful";
			else
			$data['alertsuccess']="celebcorner edited Successfully.";
			$data['table']=$this->celebcorner_model->viewcelebcorner();
			$data['redirect']="site/viewcelebcorner";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['page']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deletecelebcorner()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->celebcorner_model->deletecelebcorner($this->input->get('id'));
		$data['table']=$this->celebcorner_model->viewcelebcorner();
		$data['alertsuccess']="celebcorner Deleted Successfully";
		$data['page']='viewcelebcorner';
		$data['title']='View celebcorner';
		$this->load->view('template',$data);
	}
	//bloggerscorner
	public function createbloggerscorner()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->bloggerscorner_model->getstatusdropdown();
		$data[ 'page' ] = 'createbloggerscorner';
		$data[ 'title' ] = 'Create bloggerscorner';
		$this->load->view( 'template', $data );
	}
	function createbloggerscornersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->bloggerscorner_model->getstatusdropdown();
			$data[ 'page' ] = 'createbloggerscorner';
			$data[ 'title' ] = 'Create bloggerscorner';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$status=$this->input->post('status');
			$order=$this->input->post('order');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->bloggerscorner_model->createbloggerscorner($name,$link,$target,$status,$order,$image)==0)
			$data['alerterror']="New bloggerscorner could not be created.";
			else
			$data['alertsuccess']="bloggerscorner  created Successfully.";
			$data['table']=$this->bloggerscorner_model->viewbloggerscorner();
			$data['redirect']="site/viewbloggerscorner";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewbloggerscorner()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->bloggerscorner_model->viewbloggerscorner();
		$data['page']='viewbloggerscorner';
		$data['title']='View bloggerscorner';
		$this->load->view('template',$data);
	}
	function editbloggerscorner()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->bloggerscorner_model->beforeeditbloggerscorner($this->input->get('id'));
		$data[ 'status' ] =$this->bloggerscorner_model->getstatusdropdown();
		$data['page']='editbloggerscorner';
		$data['title']='Edit bloggerscorner';
		$this->load->view('template',$data);
	}
	function editbloggerscornersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->bloggerscorner_model->getstatusdropdown();
			$data['before']=$this->bloggerscorner_model->beforeeditbloggerscorner($this->input->post('id'));
			$data['page']='editbloggerscorner';
			$data['title']='Edit bloggerscorner';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$status=$this->input->post('status');
			$order=$this->input->post('order');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}
			if($this->bloggerscorner_model->editbloggerscorner($id,$name,$link,$target,$status,$order,$image)==0)
			$data['alerterror']="bloggerscorner Editing was unsuccesful";
			else
			$data['alertsuccess']="bloggerscorner edited Successfully.";
			$data['table']=$this->bloggerscorner_model->viewbloggerscorner();
			$data['redirect']="site/viewbloggerscorner";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['page']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deletebloggerscorner()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->bloggerscorner_model->deletebloggerscorner($this->input->get('id'));
		$data['table']=$this->bloggerscorner_model->viewbloggerscorner();
		$data['alertsuccess']="bloggerscorner Deleted Successfully";
		$data['page']='viewbloggerscorner';
		$data['title']='View bloggerscorner';
		$this->load->view('template',$data);
	}
	//navigation
	public function createnavigation()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->navigation_model->getstatusdropdown();
		$data[ 'parent' ] =$this->navigation_model->getnavigationdropdown();
		$data[ 'page' ] = 'createnavigation';
		$data[ 'title' ] = 'Create navigation';
		$this->load->view( 'template', $data );
	}
	function createnavigationsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->navigation_model->getstatusdropdown();
			$data[ 'parent' ] =$this->navigation_model->getnavigationdropdown();
			$data[ 'page' ] = 'createnavigation';
			$data[ 'title' ] = 'Create navigation';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$status=$this->input->post('status');
			$order=$this->input->post('order');
			$parent=$this->input->post('parent');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->navigation_model->createnavigation($name,$link,$target,$status,$order,$image,$parent)==0)
			$data['alerterror']="New navigation could not be created.";
			else
			$data['alertsuccess']="navigation  created Successfully.";
			$data['table']=$this->navigation_model->viewnavigation();
			$data['redirect']="site/viewnavigation";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewnavigation()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->navigation_model->viewnavigation();
		$data['page']='viewnavigation';
		$data['title']='View navigation';
		$this->load->view('template',$data);
	}
	function editnavigation()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->navigation_model->beforeeditnavigation($this->input->get('id'));
		$data[ 'status' ] =$this->navigation_model->getstatusdropdown();
		$data[ 'parent' ] =$this->navigation_model->getnavigationdropdown();
		$data['page']='editnavigation';
		$data['title']='Edit navigation';
		$this->load->view('template',$data);
	}
	function editnavigationsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('link','link','trim|');
		$this->form_validation->set_rules('target','target','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->navigation_model->getstatusdropdown();
			$data[ 'parent' ] =$this->navigation_model->getnavigationdropdown();
			$data['before']=$this->navigation_model->beforeeditnavigation($this->input->post('id'));
			$data['page']='editnavigation';
			$data['title']='Edit navigation';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$link=$this->input->post('link');
			$target=$this->input->post('target');
			$status=$this->input->post('status');
			$order=$this->input->post('order');
			$parent=$this->input->post('parent');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}
			if($this->navigation_model->editnavigation($id,$name,$link,$target,$status,$order,$image,$parent)==0)
			$data['alerterror']="navigation Editing was unsuccesful";
			else
			$data['alertsuccess']="navigation edited Successfully.";
			$data['table']=$this->navigation_model->viewnavigation();
			$data['redirect']="site/viewnavigation";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['page']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deletenavigation()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->navigation_model->deletenavigation($this->input->get('id'));
		$data['table']=$this->navigation_model->viewnavigation();
		$data['alertsuccess']="navigation Deleted Successfully";
		$data['page']='viewnavigation';
		$data['title']='View navigation';
		$this->load->view('template',$data);
	}
	//currency
	public function createcurrency()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'isdefault' ] =$this->currency_model->getisdefault();
		$data[ 'country' ] =$this->currency_model->getcountry();
		$data[ 'page' ] = 'createcurrency';
		$data[ 'title' ] = 'Create currency';
		$this->load->view( 'template', $data );
	}
	function createcurrencysubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('conversionrate','conversionrate','trim|');
		$this->form_validation->set_rules('isdefault','isdefault','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'isdefault' ] =$this->currency_model->getisdefault();
			$data[ 'country' ] =$this->currency_model->getcountry();
			$data[ 'page' ] = 'createcurrency';
			$data[ 'title' ] = 'Create currency';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$isdefault=$this->input->post('isdefault');
			$conversionrate=$this->input->post('conversionrate');
			$country=$this->input->post('country');
			if($this->currency_model->createcurrency($name,$isdefault,$conversionrate,$country)==0)
			$data['alerterror']="New currency could not be created.";
			else
			$data['alertsuccess']="currency  created Successfully.";
			$data['table']=$this->currency_model->viewcurrency();
			$data['redirect']="site/viewcurrency";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewcurrency()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->currency_model->viewcurrency();
		$data['page']='viewcurrency';
		$data['title']='View currency';
		$this->load->view('template',$data);
	}
	function editcurrency()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->currency_model->beforeeditcurrency($this->input->get('id'));
		$data[ 'isdefault' ] =$this->currency_model->getisdefault();
			$data[ 'country' ] =$this->currency_model->getcountry();
		$data['page']='editcurrency';
		$data['title']='Edit currency';
		$this->load->view('template',$data);
	}
	function editcurrencysubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('conversionrate','conversionrate','trim|');
		$this->form_validation->set_rules('isdefault','isdefault','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->currency_model->beforeeditcurrency($this->input->post('id'));
			$data[ 'isdefault' ] =$this->currency_model->getisdefault();
			$data[ 'country' ] =$this->currency_model->getcountry();
			$data['page']='editcurrency';
			$data['title']='Edit currency';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$isdefault=$this->input->post('isdefault');
			$conversionrate=$this->input->post('conversionrate');
			$country=$this->input->post('country');
			if($this->currency_model->editcurrency($id,$name,$isdefault,$conversionrate,$country)==0)
			$data['alerterror']="currency Editing was unsuccesful";
			else
			$data['alertsuccess']="currency edited Successfully.";
			$data['table']=$this->currency_model->viewcurrency();
			$data['redirect']="site/viewcurrency";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['currency']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deletecurrency()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->currency_model->deletecurrency($this->input->get('id'));
		$data['table']=$this->currency_model->viewcurrency();
		$data['alertsuccess']="currency Deleted Successfully";
		$data['page']='viewcurrency';
		$data['title']='View currency';
		$this->load->view('template',$data);
	}
	//paymentgateway
	public function createpaymentgateway()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'isdefault' ] =$this->paymentgateway_model->getisdefault();
		$data[ 'status' ] =$this->paymentgateway_model->getstatusdropdown();
		$data[ 'page' ] = 'createpaymentgateway';
		$data[ 'title' ] = 'Create paymentgateway';
		$this->load->view( 'template', $data );
	}
	function createpaymentgatewaysubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('order','order','trim|');
		$this->form_validation->set_rules('isdefault','isdefault','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'isdefault' ] =$this->paymentgateway_model->getisdefault();
			$data[ 'status' ] =$this->paymentgateway_model->getstatusdropdown();
			$data[ 'page' ] = 'createpaymentgateway';
			$data[ 'title' ] = 'Create paymentgateway';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$isdefault=$this->input->post('isdefault');
			$order=$this->input->post('order');
			$status=$this->input->post('status');
			if($this->paymentgateway_model->createpaymentgateway($name,$isdefault,$order,$status)==0)
			$data['alerterror']="New paymentgateway could not be created.";
			else
			$data['alertsuccess']="paymentgateway  created Successfully.";
			$data['table']=$this->paymentgateway_model->viewpaymentgateway();
			$data['redirect']="site/viewpaymentgateway";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewpaymentgateway()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->paymentgateway_model->viewpaymentgateway();
		$data['page']='viewpaymentgateway';
		$data['title']='View paymentgateway';
		$this->load->view('template',$data);
	}
	function editpaymentgateway()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->paymentgateway_model->beforeeditpaymentgateway($this->input->get('id'));
		$data[ 'isdefault' ] =$this->paymentgateway_model->getisdefault();
		$data[ 'status' ] =$this->paymentgateway_model->getstatusdropdown();
		$data['page']='editpaymentgateway';
		$data['title']='Edit paymentgateway';
		$this->load->view('template',$data);
	}
	function editpaymentgatewaysubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		$this->form_validation->set_rules('order','order','trim|');
		$this->form_validation->set_rules('isdefault','isdefault','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->paymentgateway_model->beforeeditpaymentgateway($this->input->post('id'));
			$data[ 'isdefault' ] =$this->paymentgateway_model->getisdefault();
			$data[ 'status' ] =$this->paymentgateway_model->getstatusdropdown();
			$data['page']='editpaymentgateway';
			$data['title']='Edit paymentgateway';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			$isdefault=$this->input->post('isdefault');
			$order=$this->input->post('order');
			$status=$this->input->post('status');
			if($this->paymentgateway_model->editpaymentgateway($id,$name,$isdefault,$order,$status)==0)
			$data['alerterror']="paymentgateway Editing was unsuccesful";
			else
			$data['alertsuccess']="paymentgateway edited Successfully.";
			$data['table']=$this->paymentgateway_model->viewpaymentgateway();
			$data['redirect']="site/viewpaymentgateway";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['paymentgateway']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deletepaymentgateway()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->paymentgateway_model->deletepaymentgateway($this->input->get('id'));
		$data['table']=$this->paymentgateway_model->viewpaymentgateway();
		$data['alertsuccess']="paymentgateway Deleted Successfully";
		$data['page']='viewpaymentgateway';
		$data['title']='View paymentgateway';
		$this->load->view('template',$data);
	}
	//discountcoupon
	public function creatediscountcoupon()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'coupontype' ] =$this->discountcoupon_model->getcoupontype();
        $data[ 'status' ] =$this->user_model->getstatusdropdown();
		$data[ 'product' ] =$this->discountcoupon_model->getproducts();
		$data[ 'page' ] = 'creatediscountcoupon';
		$data[ 'title' ] = 'Create discountcoupon';
		$this->load->view( 'template', $data );
	}
	function creatediscountcouponsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('coupontype','coupontype','trim|');
		$this->form_validation->set_rules('discountpercent','discountpercent','trim|');
		$this->form_validation->set_rules('discountamount','discountamount','trim|');
		$this->form_validation->set_rules('minamount','minamount','trim|');
		$this->form_validation->set_rules('xproducts','xproducts','trim|');
		$this->form_validation->set_rules('yproducts','yproducts','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'coupontype' ] =$this->discountcoupon_model->getcoupontype();
            $data[ 'status' ] =$this->user_model->getstatusdropdown();
			$data[ 'product' ] =$this->discountcoupon_model->getproducts();
			$data[ 'page' ] = 'creatediscountcoupon';
			$data[ 'title' ] = 'Create discountcoupon';
			$this->load->view('template',$data);
		}
		else
		{
			$coupontype=$this->input->post('coupontype');
			$discountpercent=$this->input->post('discountpercent');
			$discountamount=$this->input->post('discountamount');
			$minamount=$this->input->post('minamount');
			$xproducts=$this->input->post('xproducts');
			$yproducts=$this->input->post('yproducts');
			$couponcode=$this->input->post('couponcode');
			$status=$this->input->post('status');
			$product=$this->input->post('product');
			if($this->discountcoupon_model->creatediscountcoupon($coupontype,$discountpercent,$discountamount,$minamount,$xproducts,$yproducts,$couponcode,$product,$status)==0)
			$data['alerterror']="New discountcoupon could not be created.";
			else
			$data['alertsuccess']="discountcoupon  created Successfully.";
			$data['table']=$this->discountcoupon_model->viewdiscountcoupon();
			$data['redirect']="site/viewdiscountcoupon";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function viewdiscountcoupon()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->discountcoupon_model->viewdiscountcoupon();
		$data['page']='viewdiscountcoupon';
		$data['title']='View discountcoupon';
		$this->load->view('template',$data);
	}
	function editdiscountcoupon()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->discountcoupon_model->beforeeditdiscountcoupon($this->input->get('id'));
		$data[ 'coupontype' ] =$this->discountcoupon_model->getcoupontype();
		$data[ 'product' ] =$this->discountcoupon_model->getproducts();
        $data[ 'status' ] =$this->user_model->getstatusdropdown();
		$data['page']='editdiscountcoupon';
		$data['title']='Edit discountcoupon';
		$this->load->view('template',$data);
	}
	function editdiscountcouponsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('coupontype','coupontype','trim|');
		$this->form_validation->set_rules('discountpercent','discountpercent','trim|');
		$this->form_validation->set_rules('discountamount','discountamount','trim|');
		$this->form_validation->set_rules('minamount','minamount','trim|');
		$this->form_validation->set_rules('xproducts','xproducts','trim|');
		$this->form_validation->set_rules('yproducts','yproducts','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->discountcoupon_model->beforeeditdiscountcoupon($this->input->post('id'));
			$data[ 'coupontype' ] =$this->discountcoupon_model->getcoupontype();
            $data[ 'status' ] =$this->user_model->getstatusdropdown();
			$data[ 'product' ] =$this->discountcoupon_model->getproducts();
			$data['page']='editdiscountcoupon';
			$data['title']='Edit discountcoupon';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$coupontype=$this->input->post('coupontype');
			$discountpercent=$this->input->post('discountpercent');
			$discountamount=$this->input->post('discountamount');
			$minamount=$this->input->post('minamount');
			$xproducts=$this->input->post('xproducts');
			$yproducts=$this->input->post('yproducts');
			$couponcode=$this->input->post('couponcode');
			$status=$this->input->post('status');
			$product=$this->input->post('product');
			if($this->discountcoupon_model->editdiscountcoupon($id,$coupontype,$discountpercent,$discountamount,$minamount,$xproducts,$yproducts,$couponcode,$product,$status)==0)
			$data['alerterror']="discountcoupon Editing was unsuccesful";
			else
			$data['alertsuccess']="discountcoupon edited Successfully.";
			$data['table']=$this->discountcoupon_model->viewdiscountcoupon();
			$data['redirect']="site/viewdiscountcoupon";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['discountcoupon']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}
	function deletediscountcoupon()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->discountcoupon_model->deletediscountcoupon($this->input->get('id'));
		$data['table']=$this->discountcoupon_model->viewdiscountcoupon();
		$data['alertsuccess']="discountcoupon Deleted Successfully";
		$data['page']='viewdiscountcoupon';
		$data['title']='View discountcoupon';
		$this->load->view('template',$data);
	}
	function editprice()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->product_model->beforeeditproduct($this->input->get('id'));
		$data['page']='editprice';
		$data['page2']='block/productblock';
		$data['title']='Edit price';
		$this->load->view('template',$data);
	}
	function editpricesubmit()
	{
		$this->form_validation->set_rules('price','price','trim|');
		$this->form_validation->set_rules('wholesaleprice','wholesaleprice','trim|');
		$this->form_validation->set_rules('firstsaleprice','firstsaleprice','trim|');
		$this->form_validation->set_rules('secondsaleprice','secondsaleprice','trim|');
		$this->form_validation->set_rules('specialpricefrom','specialpricefrom','trim|');
		$this->form_validation->set_rules('specialpriceto','specialpriceto','trim|');

		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->product_model->beforeeditproduct($this->input->post('id'));
			$data['page']='editprice';
			$data['page2']='block/productblock';
			$data['title']='Edit price';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');

			$price=$this->input->post('price');
			$wholesaleprice=$this->input->post('wholesaleprice');
			$firstsaleprice=$this->input->post('firstsaleprice');
			$secondsaleprice=$this->input->post('secondsaleprice');
			$specialpricefrom=$this->input->post('specialpricefrom');
			$specialpriceto=$this->input->post('specialpriceto');
			if($specialpricefrom != "")
				$specialpricefrom = date("Y-m-d",strtotime($specialpricefrom));
			if($specialpriceto != "")
				$specialpriceto = date("Y-m-d",strtotime($specialpriceto));
			$specialpriceto=$this->input->post('specialpriceto');

			if($this->product_model->editprice($id,$price,$wholesaleprice,$firstsaleprice,$secondsaleprice,$specialpricefrom,$specialpriceto)==0)
			$data['alerterror']="price Editing was unsuccesful";
			else
			$data['alertsuccess']="price edited Successfully.";
			$data['redirect']="site/editprice?id=".$id;
			//$data['other']="template=$template";
			$this->load->view("redirect2",$data);
		}
	}
	function editrelatedproducts()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->product_model->beforeeditproduct($this->input->get('id'));
		$data['product']=$this->product_model->getproducts($this->input->get('id'));
		$data['page']='relatedproducts';
		$data['page2']='block/productblock';
		$data['title']='Edit Related Products';
		$this->load->view('template',$data);
	}
	function editrelatedproductssubmit()
	{
		$this->form_validation->set_rules('price','price','trim|');
		$this->form_validation->set_rules('wholesaleprice','wholesaleprice','trim|');
		$this->form_validation->set_rules('firstsaleprice','firstsaleprice','trim|');
		$this->form_validation->set_rules('secondsaleprice','secondsaleprice','trim|');
		$this->form_validation->set_rules('specialpricefrom','specialpricefrom','trim|');
		$this->form_validation->set_rules('specialpriceto','specialpriceto','trim|');

		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->product_model->beforeeditproduct($this->input->post('id'));
			$data['product']=$this->product_model->getproducts($this->input->get('id'));
			$data['page']='relatedproducts';
			$data['page2']='block/productblock';
			$data['title']='Edit Related Products';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');

			$relatedproduct=$this->input->post('relatedproduct');

			if($this->product_model->editrelatedproduct($id,$relatedproduct)==0)
			$data['alerterror']="Related Product Editing was unsuccesful";
			else
			$data['alertsuccess']="Related Product edited Successfully.";

			$data['redirect']="site/editrelatedproducts?id=".$id;
			//$data['other']="template=$template";
			$this->load->view("redirect2",$data);
		}
	}
	function viewproductwaiting()
	{
		$access = array("1");
		$this->checkaccess($access);
//		$data['before']=$this->product_model->beforeeditproduct($this->input->get('id'));
		$data['table']=$this->product_model->viewproductwaiting();
		$data['page']='viewproductwaiting';
//		$data['page2']='block/productblock';
		$data['title']='Product waiting';
		$this->load->view('template',$data);
	}

	//Newsletter
	public function createnewsletteruser()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->newsletter_model->getstatusdropdown();
		$data[ 'user' ] =$this->newsletter_model->getuserdropdown();
		$data[ 'page' ] = 'createnewsletteruser';
		$data[ 'title' ] = 'Create newsletter';
		$this->load->view( 'template', $data );
	}
	public function createnewsletterusersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('status','status','trim|');

		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->newsletter_model->getstatusdropdown();
			$data[ 'user' ] =$this->newsletter_model->getuserdropdown();
			$data[ 'page' ] = 'createnewsletteruser';
			$data[ 'title' ] = 'Create newsletteruser';
			$this->load->view('template',$data);
		}
		else
		{
			$email=$this->input->post('email');
			$user=$this->input->post('user');
			$status=$this->input->post('status');
			if($this->newsletter_model->createnewsletteruser($email,$user,$status)==0)
			$data['alerterror']="New newsletteruser could not be created.";
			else
			$data['alertsuccess']="newsletteruser  created Successfully.";
			$data['redirect']="site/viewnewsletteruser";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	//Newsletter
	public function editnewsletteruser()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->celebcorner_model->beforeeditcelebcorner($this->input->get('id'));
		$data[ 'status' ] =$this->newsletter_model->getstatusdropdown();
		$data[ 'user' ] =$this->newsletter_model->getuserdropdown();
		$data[ 'page' ] = 'editnewsletteruser';
		$data[ 'title' ] = 'Edit newsletter';
		$this->load->view( 'template', $data );
	}
	//Order
    function createorder()
	{
		$access = array("1");
		$this->checkaccess($access);
		//$data[ 'category' ] =$this->order_model->getcategorydropdown();
		$data[ 'user' ] =$this->order_model->getuser();
		$data[ 'country' ] =$this->user_model->getcountry();
		$data[ 'orderstatus' ] =$this->order_model->getorderstatus();
		$data[ 'currency' ] =$this->currency_model->getcurrencydropdown();
		$data[ 'trackingcompany' ] =$this->user_model->gettrackingcompanydropdown();
		$data['before']=$this->order_model->beforeedit($this->input->get('id'));
		$data['page']='createorder';
		//$data['page2']='block/orderblock';
		$data['title']='Create order';
		$this->load->view('template',$data);
	}
	function createordersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('orderstatus','orderstatus','trim|');
		$this->form_validation->set_rules('firstname','Firstname','trim|required');
		$this->form_validation->set_rules('lastname','Lastname','trim|required');
		$this->form_validation->set_rules('email','Email','trim|required|valid_email|is_unique[user.email]');
		$this->form_validation->set_rules('billingaddress','billingaddress','trim');
		$this->form_validation->set_rules('billingcity','billingcity','trim');
		$this->form_validation->set_rules('billingstate','billingstate','trim');
		$this->form_validation->set_rules('billingcountry','billingcountry','trim');
		$this->form_validation->set_rules('shippingaddress','shippingaddress','trim');
		$this->form_validation->set_rules('shippingcity','shippingcity','trim');
		$this->form_validation->set_rules('shippingstate','shippingstate','trim');
		$this->form_validation->set_rules('shippingcountry','shippingcountry','trim');
		$this->form_validation->set_rules('shippingpincode','shippingpincode','trim');
		$this->form_validation->set_rules('currency','currency','trim');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'user' ] =$this->order_model->getuser();
			$data[ 'country' ] =$this->user_model->getcountry();
			$data[ 'orderstatus' ] =$this->order_model->getorderstatus();
			$data[ 'currency' ] =$this->currency_model->getcurrencydropdown();
            $data[ 'trackingcompany' ] =$this->user_model->gettrackingcompanydropdown();
			$data['before']=$this->order_model->beforeedit($this->input->get('id'));
			$data['page']='createorder';
			$data['page2']='block/orderblock';
			$data['title']='Edit order';
			$this->load->view('template',$data);
		}
		else
		{

			$user=$this->input->post('user');
			$firstname=$this->input->post('firstname');
			$lastname=$this->input->post('lastname');
			$email=$this->input->post('email');
			$billingaddress=$this->input->post('billingaddress');
			$billingcity=$this->input->post('billingcity');
			$billingstate=$this->input->post('billingstate');
			$billingcountry=$this->input->post('billingcountry');
			$shippingaddress=$this->input->post('shippingaddress');
			$shippingcity=$this->input->post('shippingcity');
			$shippingstate=$this->input->post('shippingstate');
			$shippingcountry=$this->input->post('shippingcountry');
			$shippingpincode=$this->input->post('shippingpincode');
			$currency=$this->input->post('currency');
			$orderstatus=$this->input->post('orderstatus');
			$trackingcode=$this->input->post('trackingcode');
			$billingcontact=$this->input->post('billingcontact');
			$shippingcontact=$this->input->post('shippingcontact');
			$trackingcompany=$this->input->post('trackingcompany');
			if(($this->order_model->createorder($user,$firstname,$lastname,$email,$billingaddress,$billingcity,$billingstate,$billingcountry,$shippingaddress,$shippingcity,$shippingstate,$shippingcountry,$shippingpincode,$currency,$orderstatus,$trackingcode,$billingcontact,$shippingcontact,$trackingcompany))==0)
				$data['alerterror']="Order could not be Created.";
			else
				$data['alertsuccess']="Order  edited Successfully.";
			$data['redirect']="site/vieworder";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}

	}


	function editorder()
	{
		$access = array("1");
		$this->checkaccess($access);
		//$data[ 'category' ] =$this->order_model->getcategorydropdown();
		$data[ 'user' ] =$this->order_model->getuser();
		$data[ 'country' ] =$this->user_model->getcountry();
		$data[ 'orderstatus' ] =$this->order_model->getorderstatus();
		$data[ 'currency' ] =$this->currency_model->getcurrencydropdown();
        $data[ 'trackingcompany' ] =$this->user_model->gettrackingcompanydropdown();
		$data['before']=$this->order_model->beforeedit($this->input->get('id'));
		$data['page']='editorder';
		$data['page2']='block/orderblock';
		$data['title']='Edit order';
		$this->load->view('template',$data);
	}
	function editordersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('orderstatus','orderstatus','trim|');
		$this->form_validation->set_rules('firstname','Firstname','trim|required');
		$this->form_validation->set_rules('lastname','Lastname','trim|required');
		$this->form_validation->set_rules('email','Email','trim|required|valid_email');
		$this->form_validation->set_rules('billingaddress','billingaddress','trim');
		$this->form_validation->set_rules('billingcity','billingcity','trim');
		$this->form_validation->set_rules('billingstate','billingstate','trim');
		$this->form_validation->set_rules('billingcountry','billingcountry','trim');
		$this->form_validation->set_rules('shippingaddress','shippingaddress','trim');
		$this->form_validation->set_rules('shippingcity','shippingcity','trim');
		$this->form_validation->set_rules('shippingstate','shippingstate','trim');
		$this->form_validation->set_rules('shippingcountry','shippingcountry','trim');
		$this->form_validation->set_rules('shippingpincode','shippingpincode','trim');
		$this->form_validation->set_rules('currency','currency','trim');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'user' ] =$this->order_model->getuser();
			$data[ 'country' ] =$this->user_model->getcountry();
			$data[ 'orderstatus' ] =$this->order_model->getorderstatus();
			$data[ 'currency' ] =$this->currency_model->getcurrencydropdown();
            $data[ 'trackingcompany' ] =$this->user_model->gettrackingcompanydropdown();
			$data['before']=$this->order_model->beforeedit($this->input->get('id'));
			$data['page']='editorder';
			$data['page2']='block/orderblock';
			$data['title']='Edit order';
			$this->load->view('template',$data);
		}
		else
		{

			$id=$this->input->post('id');
			$user=$this->input->post('user');
			$firstname=$this->input->post('firstname');
			$lastname=$this->input->post('lastname');
			$email=$this->input->post('email');
			$billingaddress=$this->input->post('billingaddress');
			$billingcity=$this->input->post('billingcity');
			$billingstate=$this->input->post('billingstate');
			$billingcountry=$this->input->post('billingcountry');
			$shippingaddress=$this->input->post('shippingaddress');
			$shippingcity=$this->input->post('shippingcity');
			$shippingstate=$this->input->post('shippingstate');
			$shippingcountry=$this->input->post('shippingcountry');
			$shippingpincode=$this->input->post('shippingpincode');
			$currency=$this->input->post('currency');
			$orderstatus=$this->input->post('orderstatus');
			$trackingcode=$this->input->post('trackingcode');
			$billingcontact=$this->input->post('billingcontact');
			$shippingcontact=$this->input->post('shippingcontact');
			$trackingcompany=$this->input->post('trackingcompany');
			$transactionid=$this->input->post('transactionid');
			if(($this->order_model->edit($id,$user,$firstname,$lastname,$email,$billingaddress,$billingcity,$billingstate,$billingcountry,$shippingaddress,$shippingcity,$shippingstate,$shippingcountry,$shippingpincode,$currency,$orderstatus,$trackingcode,$billingcontact,$shippingcontact,$trackingcompany,$transactionid))==0)
				$data['alerterror']="Order could not be edited.";
			else
            {
				$data['alertsuccess']="Order  edited Successfully.";
                $query1=$this->order_model->getorderstatus1($orderstatus);
                //echo $state=$query1;
                //$email=$this->input->get('email');
                $this->load->library('email');
                $email=$email;
                $this->email->from('magicmirror.in', 'MagicMirror');
                $this->email->to($email);
                $this->email->cc('another@another-example.com');
                $this->email->bcc('them@their-example.com');

                $this->email->subject('Welcome to Lyla');
                $this->email->message('<img src="http://zibacollection.co.uk/lylalovecouk/img/dispatchedbylyla.jpg" width="560px" height="398px"><br><b>YOUR ORDER IS '.$query1->name.'</b>');

                $this->email->send();

            }
			$data['redirect']="site/vieworder";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}

	}
    public function vieworder()
    {
        $access=array("1");
        $this->checkaccess($access);
		$data['page']='vieworder';
        $data["base_url"]=site_url("site/vieworderjson");
        $data["title"]="View order";
        $this->load->view("template",$data);
    }
    function vieworderjson()
    {
        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`order`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`order`.`firstname`";
        $elements[1]->sort="1";
        $elements[1]->header="firstname";
        $elements[1]->alias="firstname";

        $elements[2]=new stdClass();
        $elements[2]->field="`order`.`lastname`";
        $elements[2]->sort="1";
        $elements[2]->header="lastname";
        $elements[2]->alias="lastname";

        $elements[3]=new stdClass();
        $elements[3]->field="`order`.`finalamount`";
        $elements[3]->sort="1";
        $elements[3]->header="finalamount";
        $elements[3]->alias="finalamount";

        $elements[4]=new stdClass();
        $elements[4]->field="`order`.`finalamount`";
        $elements[4]->sort="1";
        $elements[4]->header="finalamount";
        $elements[4]->alias="finalamount";

        $elements[5]=new stdClass();
        $elements[5]->field="`orderstatus`.`name`";
        $elements[5]->sort="1";
        $elements[5]->header="orderstatus";
        $elements[5]->alias="orderstatus";

        $elements[6]=new stdClass();
        $elements[6]->field="`order`.`timestamp`";
        $elements[6]->sort="1";
        $elements[6]->header="timestamp";
        $elements[6]->alias="timestamp";
        $elements[7]=new stdClass();
        $elements[7]->field="`order`.`paymentmethod`";
        $elements[7]->sort="1";
        $elements[7]->header="paymentmethod";
        $elements[7]->alias="paymentmethod";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `order` LEFT OUTER JOIN `orderstatus` ON `orderstatus`.`id`=`order`.`orderstatus`","WHERE `order`.`orderstatus` NOT IN (1,5)");
        $this->load->view("json",$data);
    }

//	function viewpendingorder()
//	{
//		$access = array("1");
//		$this->checkaccess($access);
//		$data['table']=$this->order_model->viewpendingorder();
//		$data['page']='vieworder';
//		$data['title']='View Pending order';
//		$this->load->view('template',$data);
//	}

    public function viewpendingorder()
    {
        $access=array("1");
        $this->checkaccess($access);
		$data['page']='vieworder';
        $data["base_url"]=site_url("site/viewpendingorderjson");
        $data["title"]="View order";
        $this->load->view("template",$data);
    }
    function viewpendingorderjson()
    {
        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`order`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`order`.`firstname`";
        $elements[1]->sort="1";
        $elements[1]->header="firstname";
        $elements[1]->alias="firstname";

        $elements[2]=new stdClass();
        $elements[2]->field="`order`.`lastname`";
        $elements[2]->sort="1";
        $elements[2]->header="lastname";
        $elements[2]->alias="lastname";

        $elements[3]=new stdClass();
        $elements[3]->field="`order`.`finalamount`";
        $elements[3]->sort="1";
        $elements[3]->header="finalamount";
        $elements[3]->alias="finalamount";

        $elements[4]=new stdClass();
        $elements[4]->field="`order`.`finalamount`";
        $elements[4]->sort="1";
        $elements[4]->header="finalamount";
        $elements[4]->alias="finalamount";

        $elements[5]=new stdClass();
        $elements[5]->field="`orderstatus`.`name`";
        $elements[5]->sort="1";
        $elements[5]->header="orderstatus";
        $elements[5]->alias="orderstatus";

        $elements[6]=new stdClass();
        $elements[6]->field="`order`.`timestamp`";
        $elements[6]->sort="1";
        $elements[6]->header="timestamp";
        $elements[6]->alias="timestamp";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `order` LEFT OUTER JOIN `orderstatus` ON `orderstatus`.`id`=`order`.`orderstatus`","WHERE `order`.`orderstatus`=1");
        $this->load->view("json",$data);
    }

    function deleteorder()
    {
        $access = array("1");
        $this->checkaccess($access);
        $id=$this->input->get('id');
        $data['table']=$this->order_model->deleteorder($id);
        $data['redirect']="site/vieworder";
        //$data['other']="template=$template";
        $this->load->view("redirect",$data);
    }
	//Order

	function newsletter()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->newsletter_model->viewnewsletter();
		$data['page']='viewnewsletter';
		$data['title']='View newsletter';
		$this->load->view('template',$data);
	}
	//newsletter
	function limitedstock()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->newsletter_model->limitedstock();
		$data['page']='limitedstock';
		$data['title']='View Limited Stock Newsletter';
		$this->load->view('template',$data);
	}
	function viewcontact()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->newsletter_model->viewcontact();
		$data['page']='viewcontact';
		$data['title']='View Contact';
		$this->load->view('template',$data);
	}

    public function createorderitems()
	{
		$access = array("1");
		$this->checkaccess($access);
        $id=$this->input->get('id');
		$data['order']=$this->order_model->getorderitem($this->input->get('id'));
		$data['before']=$this->order_model->beforeedit($this->input->get('id'));
		$data[ 'product' ] =$this->product_model->getproductdropdown();
		$data[ 'category' ] =$this->category_model->getcategorydropdown();
		$data[ 'page' ] = 'createorderitem';
		$data['page2']='block/orderblock';
		$data[ 'title' ] = 'Create Orderitem';
		$this->load->view( 'template', $data );
	}
    function createorderitemsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('product','Product','trim|');
		$this->form_validation->set_rules('price','Price','trim|required');
		$this->form_validation->set_rules('quantity','Lastname','trim|required');
		$this->form_validation->set_rules('discount','Discount','trim|required');
		$this->form_validation->set_rules('finalprice','Finalprice','trim');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
        $id=$this->input->get('id');
		$data['order']=$this->order_model->getorderitem();
		$data['before']=$this->order_model->beforeedit($this->input->get('id'));
		$data[ 'product' ] =$this->product_model->getproductdropdown();
		$data[ 'category' ] =$this->category_model->getcategorydropdown();
			$data['page']='createorderitems';
			$data['page2']='block/orderblock';
			$data['title']='Create order';
			$this->load->view('template',$data);
		}
		else
		{

			$order=$this->input->get_post('id');
			$product=$this->input->post('product');
			$price=$this->input->post('price');
			$quantity=$this->input->post('quantity');
			$discount=$this->input->post('discount');
			$finalprice=$this->input->post('finalprice');

			if(($this->order_model->createorderitems($order,$product,$price,$quantity,$discount,$finalprice))==0)
				$data['alerterror']="Orderitem could not be Created.";
			else
				$data['alertsuccess']="Orderitem  edited Successfully.";
			$data['redirect']="site/editorderitems";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}

	}


	function printorderinvoice()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'category' ] =$this->category_model->getcategorydropdown();
		$data[ 'orderitem' ] =$this->order_model->getorderitem($this->input->get('id'));
//        print_r($data[ 'orderitem' ]);
		$data[ 'totallastamt' ] =$this->order_model->gettotallastamt($this->input->get('id'));
		$data[ 'totalqty' ] =$this->order_model->totalqty($this->input->get('id'));
		$data[ 'amtinwords' ] =$this->order_model->amtinwords($this->input->get('id'));
		$data['order']=$this->order_model->getorder($this->input->get('id'));
        $data['invoicedate'] = date( "d/m/Y", strtotime($data['order']->orderdate));
        $data['id']=$this->input->get('id');
		$this->load->view('templateinvoice1',$data);
	}

	function printorderlabel()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'category' ] =$this->category_model->getcategorydropdown();
		$data[ 'table' ] =$this->order_model->getorderitem($this->input->get('id'));
		$data['before']=$this->order_model->beforeedit($this->input->get('id'));
        $data['id']=$this->input->get('id');
		$data['page']='templatelabel';
		$data['title']='Edit order items';
		$this->load->view('templatelabel',$data);
	}

	function editorderitems()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'category' ] =$this->category_model->getcategorydropdown();
		$data[ 'table' ] =$this->order_model->getorderitem($this->input->get('id'));
		$data['before']=$this->order_model->beforeedit($this->input->get('id'));
        $data['id']=$this->input->get('id');
		$data['page']='editorderitems';
		$data['page2']='block/orderblock';
		$data['title']='Edit order items';
		$this->load->view('template',$data);
	}
	function editorderitem()
	{
		$access = array("1");
		$this->checkaccess($access);
        $id=$this->input->get('id');
		$data['order']=$this->order_model->getorderitem();
		$data['before']=$this->order_model->beforeedititem($this->input->get('id'));
		$data[ 'product' ] =$this->product_model->getproductdropdown();
		$data[ 'category' ] =$this->category_model->getcategorydropdown();
		$data[ 'table' ] =$this->order_model->getorderitem();
		$data['page']='editorderitem';
		$data['page2']='block/orderblock';
		$data['title']='Edit order item';
		$this->load->view('template',$data);
	}
    function editorderitemsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('product','Product','trim|');
		$this->form_validation->set_rules('price','Price','trim|required');
		$this->form_validation->set_rules('quantity','Lastname','trim|required');
		$this->form_validation->set_rules('discount','Discount','trim|required');
		$this->form_validation->set_rules('finalprice','Finalprice','trim');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
        $id=$this->input->get('id');
		$data['order']=$this->order_model->getorderitem();
		$data['before']=$this->order_model->beforeedititem($this->input->get('id'));
		$data[ 'product' ] =$this->product_model->getproductdropdown();
		$data[ 'category' ] =$this->category_model->getcategorydropdown();
		$data[ 'table' ] =$this->order_model->getorderitem();
		$data['page']='editorderitems';
		$data['page2']='block/orderblock';
		$data['title']='Edit order item';
		$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->get_post('id');
			//$order=$this->input->get_post('id');
			$product=$this->input->post('product');
			$order=$this->input->get_post('order');
			$price=$this->input->post('price');
			$quantity=$this->input->post('quantity');
			$discount=$this->input->post('discount');
			$finalprice=$this->input->post('finalprice');
            //echo $order;

			if(($this->order_model->updateorderitem($id,$order,$product,$price,$quantity,$discount,$finalprice))==0)
				$data['alerterror']="Orderitem could not be Updated.";
			else
				$data['alertsuccess']="Orderitem  edited Successfully.";
			$data['redirect']="site/editorderitems?id=".$order;
			$data['order']="id=$order";
			$this->load->view("redirect",$data);
		}

	}


	function getproductbycategory()
	{
		$category = $this->input->get_post('category');
		$data['message']=$this->order_model->getproductbycategory($category);
		$this->load->view('json',$data);
	}
	function getproductdetails()
	{
		$category = $this->input->get_post('category');
		$product = $this->input->get_post('product');
		$data['message']=$this->order_model->getproductdetails($category,$product);
		$this->load->view('json',$data);
	}
    function deleteorderitem()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->order_model->deleteorderitem($this->input->get('id'));
		$data[ 'table' ] =$this->order_model->getorderitem();
		$data['alertsuccess']="Orderitem Deleted Successfully";
		$data['page']='editorderitems';
		$data['page2']='block/orderblock';
		$data['title']='Edit orderitems';
		$this->load->view('template',$data);
	}

    //Pick Of Weak

	function viewpickofweak()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['table']=$this->pickofweak_model->viewpickofweak();
		$data['page']='viewpickofweak';
		$data['title']='View pickofweak';
		$this->load->view('template',$data);
	}

	public function createpickofweak()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['order']=$this->order_model->getorderdropdown();
		$data[ 'page' ] = 'createpickofweak';
		$data[ 'title' ] = 'Create pickofweak';
		$this->load->view( 'template', $data );
	}

	function createpickofweaksubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('order','Order','trim|required');

		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
            $data['order']=$this->order_model->getorderdropdown();
			$data[ 'page' ] = 'createpickofweak';
			$data[ 'title' ] = 'Create pickofweak';
			$this->load->view('template',$data);
		}
		else
		{
			$order=$this->input->post('order');

			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->pickofweak_model->createpickofweak($order,$image)==0)
			$data['alerterror']="New pickofweak could not be created.";
			else
			$data['alertsuccess']="pickofweak  created Successfully.";
			$data['table']=$this->pickofweak_model->viewpickofweak();
			$data['redirect']="site/viewpickofweak";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}


	function editpickofweak()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->pickofweak_model->beforeeditpickofweak($this->input->get('id'));
        $data['order']=$this->order_model->getorderdropdown();
		$data['page']='editpickofweak';
		$data['title']='Edit pickofweak';
		$this->load->view('template',$data);
	}
	function editpickofweaksubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('order','order','trim|required');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
            $data['before']=$this->pickofweak_model->beforeeditpickofweak($this->input->get('id'));
            $data['order']=$this->order_model->getorderdropdown();
			$data['page']='editpickofweak';
			$data['title']='Edit pickofweak';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$order=$this->input->post('order');
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->pickofweak_model->editpickofweak($id,$order,$image)==0)
			$data['alerterror']="pickofweak Editing was unsuccesful";
			else
			$data['alertsuccess']="pickofweak edited Successfully.";
			$data['table']=$this->pickofweak_model->viewpickofweak();
			$data['redirect']="site/viewpickofweak";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
			/*$data['page']='viewusers';
			$data['title']='View Users';
			$this->load->view('template',$data);*/
		}
	}

	function deletepickofweak()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->pickofweak_model->deletepickofweak($this->input->get('id'));
		$data['table']=$this->pickofweak_model->viewpickofweak();
		$data['alertsuccess']="pickofweak Deleted Successfully";
		$data['page']='viewpickofweak';
		$data['title']='View pickofweak';
		$this->load->view('template',$data);
	}

    function createproductwaiting()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['product']=$this->product_model->getproductdropdown();
		$data[ 'user' ] =$this->newsletter_model->getuserdropdownproductwaiting();
		$data['page']='createproductwaiting';
		$data['title']='create product Waiting';
		$this->load->view('template',$data);
	}

	function createproductwaitingsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('email','Email','trim|valid_email');
		$this->form_validation->set_rules('product','product','trim');
		$this->form_validation->set_rules('user','user','trim');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
            print_r($data['alerterror']);
			$data['before']=$this->product_model->beforecreateproductwaiting($this->input->get('id'));
            $data['product']=$this->product_model->getproductdropdown();
            $data[ 'user' ] =$this->newsletter_model->getuserdropdownproductwaiting();
            $data['page']='createproductwaiting';
            $data['title']='create product Waiting';
            $this->load->view('template',$data);
		}
		else
		{
			$email=$this->input->post('email');
			$product=$this->input->post('product');
			$user=$this->input->post('user');
			if($this->product_model->createproductwaiting($product,$user,$email)==0)
			$data['alerterror']="Home product created unsuccesfully";
			else
			$data['alertsuccess']="Home product created Succesfully.";
			$data['table']=$this->product_model->viewproductwaiting();
            $data['page']='viewproductwaiting';
    //		$data['page2']='block/productblock';
            $data['title']='Product waiting';
            $this->load->view('template',$data);
		}
	}
	function editproductwaiting()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->product_model->beforeeditproductwaiting($this->input->get('id'));
		$data['product']=$this->product_model->getproductdropdown();
		$data[ 'user' ] =$this->newsletter_model->getuserdropdownproductwaiting();
		$data['page']='editproductwaiting';
		$data['title']='Edit product Waiting';
		$this->load->view('template',$data);
	}

	function editproductwaitingsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('email','Email','trim|valid_email');
		$this->form_validation->set_rules('product','product','trim');
		$this->form_validation->set_rules('user','user','trim');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->product_model->beforeeditproductwaiting($this->input->get('id'));
            $data['product']=$this->product_model->getproductdropdown();
            $data[ 'user' ] =$this->newsletter_model->getuserdropdownproductwaiting();
            $data['page']='editproductwaiting';
            $data['title']='Edit product Waiting';
            $this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$email=$this->input->post('email');
			$product=$this->input->post('product');
			$user=$this->input->post('user');
//			print_r($_POST);
			if($this->product_model->editproductwaiting($id,$product,$user,$email)==0)
			$data['alerterror']="Home product created unsuccesfully";
			else
			$data['alertsuccess']="Home product created Succesfully.";
			$data['table']=$this->product_model->viewproductwaiting();
            $data['page']='viewproductwaiting';
    //		$data['page2']='block/productblock';
            $data['title']='Product waiting';
            $this->load->view('template',$data);
		}
	}

	function deleteproductwaiting()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->product_model->deleteproductwaiting($this->input->get('id'));
		$data['alertsuccess']="Product Waiting Deleted Successfully";
		$data['table']=$this->product_model->viewproductwaiting();
        $data['page']='viewproductwaiting';
//		$data['page2']='block/productblock';
        $data['title']='Product waiting';
        $this->load->view('template',$data);
	}
    //csv

    	public function exportusercsv()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->user_model->exportusercsv();

        $data['table']=$this->user_model->viewusers();
		$data['page']='viewusers';
		$data['title']='View Users';
		$this->load->view('template',$data);
	}
    	public function exportnewslettercsv()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->newsletter_model->exportnewslettercsv();

	}
    	public function exportordercsv()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->order_model->exportordercsv();

	}
    	public function exportorderitemcsv()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->order_model->exportorderitemcsv();

	}

    	public function exportproductcsv()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->product_model->exportproductcsv();
        $data['redirect']="site/viewproduct";
        $this->load->view("redirect",$data);
	}
    public function exportdateordercsv()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->order_model->exportdateordercsv();
        $data['redirect']="site/index";
        $this->load->view("redirect",$data);
	}

    function uploadproductcsv()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'page' ] = 'uploadproductcsv';
		$data[ 'title' ] = 'Upload product';
		$this->load->view( 'template', $data );
	}
    function uploadproductdescriptioncsv()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'page' ] = 'uploadproductdescriptioncsv';
		$data[ 'title' ] = 'Upload product';
		$this->load->view( 'template', $data );
	}
    function uploadproductcsvsubmit()
	{
        $access = array("1");
		$this->checkaccess($access);
        $config['upload_path'] = './uploads/';
        $config['allowed_types'] = '*';
        $config['max_size'] = '1000000';
        $this->load->library('upload', $config);
        $filename="file";
        $file="";
        if (  $this->upload->do_upload($filename))
        {
            $uploaddata = $this->upload->data();
            $file=$uploaddata['file_name'];
            $filepath=$uploaddata['file_path'];
        }
        else
        {
            $data['alerterror']=$this->upload->display_errors();

            $data['redirect']="site/viewproduct";
            $this->load->view("redirect",$data);
        }
        $fullfilepath=$filepath."".$file;
        $file = $this->csvreader->parse_file($fullfilepath);
        $id1=$this->product_model->createbycsv($file);

        if($id1==0)
        $data['alerterror']="New products could not be Uploaded.";
		else
		$data['alertsuccess']="products Uploaded Successfully.";
        $data['redirect']="site/viewproduct";
        $this->load->view("redirect",$data);
    }
    function uploadproductnewcsvsubmit()
	{
        $access = array("1");
				$this->checkaccess($access);
        $config['upload_path'] = './uploads/';
        $config['allowed_types'] = '*';
        $config['max_size'] = '1000000';
        $this->load->library('upload', $config);
        $filename="file";
        $file="";
        if (  $this->upload->do_upload($filename))
        {
            $uploaddata = $this->upload->data();
            $file=$uploaddata['file_name'];
            $filepath=$uploaddata['file_path'];
        }
        else
        {
            $data['alerterror']=$this->upload->display_errors();
            $data['redirect']="site/viewproduct";
            $this->load->view("redirect",$data);
        }
        $fullfilepath=$filepath."".$file;
        $file = $this->csvreader->parse_file($fullfilepath);
        $id1=$this->product_model->createbynewcsv($file);

        if($id1==0)
        $data['alerterror']="New products could not be Uploaded.";
		else
		$data['alertsuccess']="products Uploaded Successfully.";
        $data['redirect']="site/viewproduct";
        $this->load->view("redirect",$data);
    }


    //productimage

    function viewproductimage()
	{
		$access = array("1");
		$this->checkaccess($access);
        $productid=$this->input->get('id');
		$data['before']=$this->product_model->beforeeditproduct($productid);
		$data['table']=$this->productimage_model->viewproductimagebyproduct($productid);
		$data['page']='viewproductimage';
		$data['page2']='block/productblock';
        $data['title']='View product Image';
		$this->load->view('templatewith2',$data);
	}



    public function createproductimage()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'page' ] = 'createproductimage';
		$data[ 'title' ] = 'Create productimage';
		$data[ 'productid' ] = $this->input->get('id');
        $data['isdefault']=$this->productimage_model->getisdefaultdropdown();
		$this->load->view( 'template', $data );
	}
    function createproductimagesubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('product','product','trim|required');
		$this->form_validation->set_rules('order','order','trim');
		$this->form_validation->set_rules('isdefault','isdefault','trim');

		if($this->form_validation->run() == FALSE)
		{

			$data['alerterror'] = validation_errors();
			$data[ 'page' ] = 'createproductimage';
            $data[ 'title' ] = 'Create productimage';
            $data[ 'productid' ] = $this->input->get_post('id');
            $data['isdefault']=$this->productimage_model->getisdefaultdropdown();
//            $data['product']=$this->productimage_model->getproductdropdown();
            $this->load->view( 'template', $data );
		}
		else
		{
			$product=$this->input->post('product');
			$order=$this->input->post('order');
			$isdefault=$this->input->post('isdefault');

            $config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];

                $config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
                $config_r['maintain_ratio'] = TRUE;
                $config_t['create_thumb'] = FALSE;///add this
                $config_r['width']   = 800;
                $config_r['height'] = 800;
                $config_r['quality']    = 100;
                //end of configs

                $this->load->library('image_lib', $config_r);
                $this->image_lib->initialize($config_r);
                if(!$this->image_lib->resize())
                {
                    echo "Failed." . $this->image_lib->display_errors();
                }
                else
                {
                    $image=$this->image_lib->dest_image;
                }

			}


            if($this->productimage_model->create($product,$image,$order,$isdefault)==0)
               $data['alerterror']="New productimage could not be created.";
            else
               $data['alertsuccess']="productimage created Successfully.";

			$data['redirect']="site/viewproductimage?id=".$product;
			$this->load->view("redirect2",$data);
		}
	}

    function editproductimage()
	{
		$access = array("1");
		$this->checkaccess($access);
        $productid=$this->input->get('id');
        $data['productid']=$productid;
        $productimageid=$this->input->get('productimageid');
        $data['isdefault']=$this->productimage_model->getisdefaultdropdown();
		$data['before']=$this->productimage_model->beforeedit($this->input->get('productimageid'));
        $data['product']=$this->productimage_model->getproductdropdown();
		$data['page']='editproductimage';
		$data['title']='Edit productimage';
		$this->load->view('template',$data);
	}
	function editproductimagesubmit()
	{
		$access = array("1");
		$this->checkaccess($access);

		$this->form_validation->set_rules('product','product','trim|required');
		$this->form_validation->set_rules('order','order','trim');
		$this->form_validation->set_rules('isdefault','isdefault','trim');

		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
            $productid=$this->input->post('product');
            $productimageid=$this->input->post('productimageid');
            $data['productid']=$productid;
            $data['isdefault']=$this->productimage_model->getisdefaultdropdown();
			$data['before']=$this->productimage_model->beforeeditproduct($this->input->post('productimageid'));
            $data['isdefault']=$this->productimage_model->getisdefaultdropdown();
//			$data['page2']='block/eventblock';
			$data['page']='editproductimage';
			$data['title']='Edit productimage';
			$this->load->view('template',$data);
		}
		else
		{

			$id=$this->input->post('productimageid');
            $product=$this->input->post('product');
            $order=$this->input->post('order');
            $isdefault=$this->input->post('isdefault');

            $config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];

                $config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
                $config_r['maintain_ratio'] = TRUE;
                $config_t['create_thumb'] = FALSE;///add this
                $config_r['width']   = 800;
                $config_r['height'] = 800;
                $config_r['quality']    = 100;
                //end of configs

                $this->load->library('image_lib', $config_r);
                $this->image_lib->initialize($config_r);
                if(!$this->image_lib->resize())
                {
                    echo "Failed." . $this->image_lib->display_errors();
                }
                else
                {
                    $image=$this->image_lib->dest_image;
                }

			}
            if($image=="")
            {
                $image=$this->productimage_model->getproductimagebyid($id);
                $image=$image->image;
            }

			if($this->productimage_model->edit($id,$product,$image,$order,$isdefault)==0)
			$data['alerterror']="productimage Editing was unsuccesful";
			else
			$data['alertsuccess']="productimage edited Successfully.";

			$data['redirect']="site/viewproductimage?id=".$product;
			$this->load->view("redirect2",$data);

		}
	}

	function deleteproductimage()
	{
		$access = array("1");
		$this->checkaccess($access);
        $productid=$this->input->get('id');
        $productimageid=$this->input->get('productimageid');
		$this->productimage_model->deleteproductimage($this->input->get('productimageid'));
		$data['alertsuccess']="productimage Deleted Successfully";
		$data['redirect']="site/viewproductimage?id=".$productid;
		$this->load->view("redirect2",$data);
	}


    //avinash
    //offer
    public function viewoffer()
    {
        $access=array("1");
        $this->checkaccess($access);
        $data["page"]="viewoffer";
        $data["base_url"]=site_url("site/viewofferjson");
        $data["title"]="View Offer";
        $this->load->view("template",$data);
    }
    function viewofferjson()
    {
        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`offer`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`offer`.`title`";
        $elements[1]->sort="1";
        $elements[1]->header="title";
        $elements[1]->alias="title";

        $elements[2]=new stdClass();
        $elements[2]->field="`offer`.`price`";
        $elements[2]->sort="1";
        $elements[2]->header="price";
        $elements[2]->alias="price";

        $elements[3]=new stdClass();
        $elements[3]->field="`offer`.`description`";
        $elements[3]->sort="1";
        $elements[3]->header="description";
        $elements[3]->alias="description";

        $elements[4]=new stdClass();
        $elements[4]->field="`offer`.`startdate`";
        $elements[4]->sort="1";
        $elements[4]->header="startdate";
        $elements[4]->alias="startdate";

        $elements[5]=new stdClass();
        $elements[5]->field="`offer`.`enddate`";
        $elements[5]->sort="1";
        $elements[5]->header="enddate";
        $elements[5]->alias="enddate";

        $elements[6]=new stdClass();
        $elements[6]->field="`offer`.`status`";
        $elements[6]->sort="1";
        $elements[6]->header="status";
        $elements[6]->alias="status";

        $elements[7]=new stdClass();
        $elements[7]->field="`offer`.`timestamp`";
        $elements[7]->sort="1";
        $elements[7]->header="timestamp";
        $elements[7]->alias="timestamp";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `offer`");
        $this->load->view("json",$data);
    }

	public function createoffer()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->offer_model->getstatusdropdown();
		$data[ 'page' ] = 'createoffer';
		$data[ 'title' ] = 'Create offer';
		$this->load->view( 'template', $data );
	}
	function createoffersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('title','title','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('description','description','trim|');
		$this->form_validation->set_rules('price','price','trim|');
		$this->form_validation->set_rules('startdate','startdate','trim|');
		$this->form_validation->set_rules('enddate','enddate','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->offer_model->getstatusdropdown();
			$data[ 'page' ] = 'createoffer';
			$data[ 'title' ] = 'Create offer';
			$this->load->view('template',$data);
		}
		else
		{
			$title=$this->input->post('title');
			$description=$this->input->post('description');
			$price=$this->input->post('price');
			$startdate=$this->input->post('startdate');
			$enddate=$this->input->post('enddate');
			$status=$this->input->post('status');

			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->offer_model->createoffer($title,$description,$price,$startdate,$enddate,$status,$image)==0)
			$data['alerterror']="New offer could not be created.";
			else
			$data['alertsuccess']="offer  created Successfully.";
			$data['redirect']="site/viewoffer";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
//	function viewoffer()
//	{
//		$access = array("1");
//		$this->checkaccess($access);
//		$data['table']=$this->offer_model->viewoffer();
//		$data['page']='viewoffer';
//		$data['title']='View offer';
//		$this->load->view('template',$data);
//	}
	function editoffer()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->offer_model->beforeeditoffer($this->input->get('id'));
		$data[ 'status' ] =$this->offer_model->getstatusdropdown();
		$data['page2']='block/offerblock';
		$data['page']='editoffer';
		$data['title']='Edit offer';
		$this->load->view('templatewith2',$data);
	}
	function editoffersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('title','title','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('description','description','trim|');
		$this->form_validation->set_rules('price','price','trim|');
		$this->form_validation->set_rules('startdate','startdate','trim|');
		$this->form_validation->set_rules('enddate','enddate','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->offer_model->getstatusdropdown();
			$data['before']=$this->offer_model->beforeeditoffer($this->input->post('id'));
			$data['page']='editoffer';
			$data['title']='Edit offer';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');

			$title=$this->input->post('title');
			$description=$this->input->post('description');
			$price=$this->input->post('price');
			$startdate=$this->input->post('startdate');
			$enddate=$this->input->post('enddate');
			$status=$this->input->post('status');

			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

            if($image=="")
            {
            $image=$this->offer_model->getofferimagebyid($id);
               // print_r($image);
                $image=$image->image;
            }

			if($this->offer_model->editoffer($id,$title,$description,$price,$startdate,$enddate,$status,$image)==0)
			$data['alerterror']="offer Editing was unsuccesful";
			else
			$data['alertsuccess']="offer edited Successfully.";
			$data['redirect']="site/viewoffer";
			$this->load->view("redirect",$data);
		}
	}
	function deleteoffer()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->offer_model->deleteoffer($this->input->get('id'));
		$data['alertsuccess']="offer Deleted Successfully";
        $data['redirect']="site/viewoffer";
        $this->load->view("redirect",$data);
	}

        //offerproduct

    function viewofferproduct()
	{
		$access = array("1");
		$this->checkaccess($access);
        $offerid=$this->input->get('id');
        $data['offerid']=$offerid;
		$data['before']=$this->offer_model->beforeeditoffer($offerid);
		$data['product']=$this->product_model->getproductdropdown();
//		$data['table']=$this->offerproduct_model->viewofferproductbyorder($offerid);
        $data["base_url"]=site_url("site/viewofferproductjson?id=".$offerid);
		$data['page']='viewofferproduct';
		$data['page2']='block/offerblock';
        $data['title']='View offer Product';
		$this->load->view('templatewith2',$data);
	}
    function viewofferproductjson()
    {
        $offerid=$this->input->get('id');
        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`offerproduct`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`offerproduct`.`offer`";
        $elements[1]->sort="1";
        $elements[1]->header="offer";
        $elements[1]->alias="offer";

        $elements[2]=new stdClass();
        $elements[2]->field="`offerproduct`.`product`";
        $elements[2]->sort="1";
        $elements[2]->header="product";
        $elements[2]->alias="product";

        $elements[3]=new stdClass();
        $elements[3]->field="`offerproduct`.`quantity`";
        $elements[3]->sort="1";
        $elements[3]->header="quantity";
        $elements[3]->alias="quantity";

        $elements[4]=new stdClass();
        $elements[4]->field="`product`.`name`";
        $elements[4]->sort="1";
        $elements[4]->header="Product";
        $elements[4]->alias="productname";

        $elements[5]=new stdClass();
        $elements[5]->field="`product`.`sku`";
        $elements[5]->sort="1";
        $elements[5]->header="sku";
        $elements[5]->alias="sku";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `offerproduct` LEFT OUTER JOIN `product` ON `product`.`id`=`offerproduct`.`product`","WHERE `offerproduct`.`offer`='$offerid'");
        $this->load->view("json",$data);
    }



    public function createofferproduct()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'page' ] = 'createofferproduct';
		$data[ 'title' ] = 'Create offerproduct';
		$data['product']=$this->product_model->getproductdropdown();
		$data[ 'offerid' ] = $this->input->get('id');
		$this->load->view( 'template', $data );
	}
    function createofferproductsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('offer','offer','trim');
		$this->form_validation->set_rules('product','product','trim|required');
		$this->form_validation->set_rules('quantity','quantity','trim|');

		if($this->form_validation->run() == FALSE)
		{

			$data['alerterror'] = validation_errors();
			$data[ 'page' ] = 'createofferproduct';
            $data[ 'title' ] = 'Create offerproduct';
		    $data['product']=$this->product_model->getproductdropdown();
            $data[ 'offerid' ] = $this->input->get_post('offer');
            $this->load->view( 'template', $data );
		}
		else
		{
			$offer=$this->input->post('offer');
			$product=$this->input->post('product');
			$quantity=$this->input->post('quantity');


            if($this->offerproduct_model->create($offer,$product,$quantity)==0)
               $data['alerterror']="New offerproduct could not be created.";
            else
               $data['alertsuccess']="offerproduct created Successfully.";

			$data['redirect']="site/viewofferproduct?id=".$offer;
			$this->load->view("redirect2",$data);
		}
	}

    function editofferproduct()
	{
		$access = array("1");
		$this->checkaccess($access);
        $offerid=$this->input->get('id');
        $data['offerid']=$offerid;
		$data['product']=$this->product_model->getproductdropdown();
        $offerproductid=$this->input->get('offerproductid');
		$data['before']=$this->offerproduct_model->beforeedit($this->input->get('offerproductid'));
		$data['page']='editofferproduct';
		$data['title']='Edit offerproduct';
		$this->load->view('template',$data);
	}
	function editofferproductsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);

		$this->form_validation->set_rules('offer','offer','trim');
		$this->form_validation->set_rules('product','product','trim|required');
		$this->form_validation->set_rules('quantity','quantity','trim|');

		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
            $offerid=$this->input->post('offer');
            $offerproductid=$this->input->post('id');
            $data['offerid']=$offerid;
            $data['product']=$this->product_model->getproductdropdown();
			$data['before']=$this->offerproduct_model->beforeedit($this->input->post('id'));
//            $data['order']=$this->offerproduct_model->getorderdropdown();
			$data['page']='editofferproduct';
			$data['title']='Edit offerproduct';
			$this->load->view('template',$data);
		}
		else
		{

			$id=$this->input->post('id');
			$offer=$this->input->post('offer');
			$product=$this->input->post('product');
			$quantity=$this->input->post('quantity');

			if($this->offerproduct_model->edit($id,$offer,$product,$quantity)==0)
			$data['alerterror']="offerproduct Editing was unsuccesful";
			else
			$data['alertsuccess']="offerproduct edited Successfully.";

			$data['redirect']="site/viewofferproduct?id=".$order;
			$this->load->view("redirect2",$data);

		}
	}

	function deleteofferproduct()
	{
		$access = array("1");
		$this->checkaccess($access);
        $offerid=$this->input->get('id');
        $offerproductid=$this->input->get('offerproductid');
		$this->offerproduct_model->deleteofferproduct($this->input->get('offerproductid'));
		$data['alertsuccess']="offerproduct Deleted Successfully";
		$data['redirect']="site/viewofferproduct?id=".$offerid;
		$this->load->view("redirect2",$data);
	}


    //brand
    public function viewbrand()
    {
        $access=array("1");
        $this->checkaccess($access);
        $data["page"]="viewbrand";
        $data["base_url"]=site_url("site/viewbrandjson");
        $data["title"]="View brand";
        $this->load->view("template",$data);
    }
    function viewbrandjson()
    {
        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`brand`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`brand`.`name`";
        $elements[1]->sort="1";
        $elements[1]->header="name";
        $elements[1]->alias="name";

        $elements[2]=new stdClass();
        $elements[2]->field="`brand`.`order`";
        $elements[2]->sort="1";
        $elements[2]->header="order";
        $elements[2]->alias="order";

        $elements[3]=new stdClass();
        $elements[3]->field="`brand`.`logo`";
        $elements[3]->sort="1";
        $elements[3]->header="logo";
        $elements[3]->alias="logo";

        $elements[4]=new stdClass();
        $elements[4]->field="`brand`.`isdistributer`";
        $elements[4]->sort="1";
        $elements[4]->header="isdistributer";
        $elements[4]->alias="isdistributer";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `brand`");
        $this->load->view("json",$data);
    }

	public function createbrand()
	{
		$access = array("1");
		$this->checkaccess($access);
        $data['isdistributer']=$this->brand_model->getdistributerdropdown();
		$data[ 'page' ] = 'createbrand';
		$data[ 'title' ] = 'Create brand';
		$this->load->view( 'template', $data );
	}
	function createbrandsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','name','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'page' ] = 'createbrand';
			$data[ 'title' ] = 'Create brand';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$order=$this->input->post('order');
			$isdistributer=$this->input->post('isdistributer');

			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->brand_model->createbrand($name,$order,$image,$isdistributer)==0)
			$data['alerterror']="New brand could not be created.";
			else
			$data['alertsuccess']="brand  created Successfully.";
			$data['redirect']="site/viewbrand";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
//	function viewbrand()
//	{
//		$access = array("1");
//		$this->checkaccess($access);
//		$data['table']=$this->brand_model->viewbrand();
//		$data['page']='viewbrand';
//		$data['title']='View brand';
//		$this->load->view('template',$data);
//	}
	function editbrand()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->brand_model->beforeeditbrand($this->input->get('id'));
		$data['isdistributer']=$this->brand_model->getdistributerdropdown();
//		$data['page2']='block/brandblock';
		$data['page']='editbrand';
		$data['title']='Edit brand';
		$this->load->view('template',$data);
	}
	function editbrandsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','name','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->brand_model->beforeeditbrand($this->input->post('id'));
			$data['page']='editbrand';
			$data['title']='Edit brand';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');

			$name=$this->input->post('name');
			$order=$this->input->post('order');
            $isdistributer=$this->input->post('isdistributer');

			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

            if($image=="")
            {
            $image=$this->brand_model->getbrandlogobyid($id);
               // print_r($image);
                $image=$image->logo;
            }

			if($this->brand_model->editbrand($id,$name,$order,$image,$isdistributer)==0)
			$data['alerterror']="brand Editing was unsuccesful";
			else
			$data['alertsuccess']="brand edited Successfully.";
			$data['redirect']="site/viewbrand";
			$this->load->view("redirect",$data);
		}
	}
	function deletebrand()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->brand_model->deletebrand($this->input->get('id'));
		$data['alertsuccess']="brand Deleted Successfully";
        $data['redirect']="site/viewbrand";
        $this->load->view("redirect",$data);
	}

	function productimagereorder()
	{
		$access = array("1");
		$this->checkaccess($access);
//        $id=$this->input->get_post("id");
        $products=$this->product_model->getproductsforimageorderchange();
        foreach($products as $product)
        {
            $id=$product->id;
            $this->product_model->productimagereorderbyid($id);
        }
		$data['alertsuccess']="Product Images Reordered Successfully";
        $data['redirect']="site/index";
        $this->load->view("redirect",$data);
	}

    //type
	public function createtype()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'page' ] = 'createtype';
		$data[ 'title' ] = 'Create type';
		$this->load->view( 'template', $data );
	}
	function createtypesubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');

		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'page' ] = 'createtype';
			$data[ 'title' ] = 'Create type';
			$this->load->view('template',$data);
		}
		else
		{
			$name=$this->input->post('name');
			$content=$this->input->post('content');
			if($this->type_model->createtype($name)==0)
			$data['alerterror']="New type could not be created.";
			else
			$data['alertsuccess']="type  created Successfully.";
			$data['table']=$this->type_model->viewtype();
			$data['redirect']="site/viewtype";
			$this->load->view("redirect",$data);
		}
	}
    public function viewtype()
    {
        $access=array("1");
        $this->checkaccess($access);
		$data['page']='viewtype';
        $data["base_url"]=site_url("site/viewtypejson");
        $data["title"]="View type";
        $this->load->view("template",$data);
    }
    function viewtypejson()
    {
        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`type`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`type`.`name`";
        $elements[1]->sort="1";
        $elements[1]->header="name";
        $elements[1]->alias="name";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `type`");
        $this->load->view("json",$data);
    }

//	function viewtype()
//	{
//		$access = array("1");
//		$this->checkaccess($access);
//		$data['table']=$this->type_model->viewtype();
//		$data['page']='viewtype';
//		$data['title']='View type';
//		$this->load->view('template',$data);
//	}
	function edittype()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->type_model->beforeedittype($this->input->get('id'));
		$data['page']='edittype';
		$data['title']='Edit type';
		$this->load->view('template',$data);
	}
	function edittypesubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->type_model->beforeedittype($this->input->post('id'));
			$data['page']='edittype';
			$data['title']='Edit type';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$name=$this->input->post('name');
			if($this->type_model->edittype($id,$name)==0)
			$data['alerterror']="type Editing was unsuccesful";
			else
			$data['alertsuccess']="type edited Successfully.";
			$data['redirect']="site/viewtype";
			$this->load->view("redirect",$data);
		}
	}
	function deletetype()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->type_model->deletetype($this->input->get('id'));
		$data['alertsuccess']="type Deleted Successfully";
        $data['redirect']="site/viewtype";
        $this->load->view("redirect",$data);
	}

    // new arrivals

    public function createnewarrival()
	{
		$access = array("1");
		$this->checkaccess($access);
         $data['type']=$this->newarrival_model->gettypedropdown();
		$data['product']=$this->product_model->getproductdropdown();
		$data[ 'page' ] = 'createnewarrival';
		$data[ 'title' ] = 'Create New Arrival';
		$this->load->view( 'template', $data );
	}
	function createnewarrivalsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
			$product=$this->input->post('product');
			$order=$this->input->post('order');
			if($this->newarrival_model->create($product,$order)==0)
			$data['alerterror']="New newarrival could not be created.";
			else
			$data['alertsuccess']="newarrival created Successfully.";

			$data['table']=$this->newarrival_model->viewnewarrival();
			$data['redirect']="site/viewnewarrivals";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);

	}
    public function viewnewarrivals()
    {
        $access=array("1");
        $this->checkaccess($access);
        $data['table']=$this->newarrival_model->viewnewarrival();
		$data['page']='viewnewarrivals';
//        $data["base_url"]=site_url("site/viewuserjson");
        $data["title"]="View New Arrivals";
        $this->load->view("template",$data);
    }
    function viewnewarrivalsjson()
    {

        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`newarrival`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`product`.`name`";
        $elements[1]->sort="1";
        $elements[1]->header="product";
        $elements[1]->alias="product";

        $elements[2]=new stdClass();
        $elements[2]->field="`newarrival`.`order`";
        $elements[2]->sort="1";
        $elements[2]->header="order";
        $elements[2]->alias="order";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `newarrival` LEFT OUTER JOIN `product` ON `product`.`id`=`newarrival`.`product`");
        $this->load->view("json",$data);
    }

	function editnewarrival()
	{
		$access = array("1");
		$this->checkaccess($access);
         $data['type']=$this->newarrival_model->gettypedropdown();
		$data['product']=$this->product_model->getproductdropdown();
		$data['before']=$this->newarrival_model->beforeedit($this->input->get('id'));
		$data['page']='editnewarrival';
		$data['title']='Edit New Arrival';
		$this->load->view('template',$data);
	}
	function editnewarrivalsubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
            $id=$this->input->get_post('id');
            $product=$this->input->post('product');
			$order=$this->input->post('order');

			if($this->newarrival_model->edit($id,$product,$order)==0)
			$data['alerterror']="newarrival Editing was unsuccesful";
			else
			$data['alertsuccess']="newarrival edited Successfully.";

			$data['redirect']="site/viewnewarrivals";
			$this->load->view("redirect",$data);
	}

    function deletenewarrival()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->newarrival_model->deletenewarrival($this->input->get('id'));
		$data['table']=$this->newarrival_model->viewnewarrival();
		$data['alertsuccess']="newarrival Deleted Successfully";
		$data['page']='viewnewarrivals';
		$data['title']='View newarrivals';
		$this->load->view('template',$data);
	}



      public function viewsubscribe()
    {
        $access=array("1");
        $this->checkaccess($access);
        $data["page"]="viewsubscribe";
        $data["base_url"]=site_url("site/viewsubscribejson");
        $data["title"]="View subscribe";
        $this->load->view("template",$data);
    }
    function viewsubscribejson()
    {
        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`subscribe`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`subscribe`.`email`";
        $elements[1]->sort="1";
        $elements[1]->header="email";
        $elements[1]->alias="email";

        $elements[2]=new stdClass();
        $elements[2]->field="`subscribe`.`timestamp`";
        $elements[2]->sort="1";
        $elements[2]->header="timestamp";
        $elements[2]->alias="timestamp";
        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `subscribe`");
        $this->load->view("json",$data);
    }

	public function createsubscribe()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'page' ] = 'createsubscribe';
		$data[ 'title' ] = 'Create subscribe';
		$this->load->view( 'template', $data );
	}
	function createsubscribesubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
        $this->form_validation->set_rules('email','email','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'page' ] = 'createsubscribe';
			$data[ 'title' ] = 'Create subscribe';
			$this->load->view('template',$data);
		}
		else
		{
			$email=$this->input->post('email');
			if($this->subscribe_model->createsubscribe($email)==0)
			$data['alerterror']="New subscribe could not be created.";
			else
			$data['alertsuccess']="subscribe  created Successfully.";
			$data['redirect']="site/viewsubscribe";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
	function editsubscribe()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->subscribe_model->beforeeditsubscribe($this->input->get('id'));
//		$data['page2']='block/subscribeblock';
		$data['page']='editsubscribe';
		$data['title']='Edit subscribe';
		$this->load->view('template',$data);
	}
	function editsubscribesubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','name','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->subscribe_model->beforeeditsubscribe($this->input->post('id'));
			$data['page']='editsubscribe';
			$data['title']='Edit subscribe';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');

			$email=$this->input->post('email');
			$timestamp=$this->input->post('timestamp');

			if($this->subscribe_model->editsubscribe($id,$email,$timestamp)==0)
			$data['alerterror']="subscribe Editing was unsuccesful";
			else
			$data['alertsuccess']="subscribe edited Successfully.";
			$data['redirect']="site/viewsubscribe";
			$this->load->view("redirect",$data);
		}
	}
	function deletesubscribe()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->subscribe_model->deletesubscribe($this->input->get('id'));
		$data['alertsuccess']="subscribe Deleted Successfully";
        $data['redirect']="site/viewsubscribe";
        $this->load->view("redirect",$data);
	}


    // about us & clients

      public function viewaboutus()
    {
        $access=array("1");
        $this->checkaccess($access);
        $data["page"]="viewaboutus";
        $data["base_url"]=site_url("site/viewaboutusjson");
        $data["title"]="View aboutus";
        $this->load->view("template",$data);
    }
    function viewaboutusjson()
    {
        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`about`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`about`.`image`";
        $elements[1]->sort="1";
        $elements[1]->header="image";
        $elements[1]->alias="image";

        $elements[2]=new stdClass();
        $elements[2]->field="`about`.`order`";
        $elements[2]->sort="1";
        $elements[2]->header="order";
        $elements[2]->alias="order";

        $elements[3]=new stdClass();
        $elements[3]->field="`about`.`status`";
        $elements[3]->sort="1";
        $elements[3]->header="status";
        $elements[3]->alias="status";

        $elements[4]=new stdClass();
        $elements[4]->field="`about`.`title`";
        $elements[4]->sort="1";
        $elements[4]->header="title";
        $elements[4]->alias="title";

        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `about`");
        $this->load->view("json",$data);
    }

	public function createaboutus()
	{
		$access = array("1");
		$this->checkaccess($access);
        $data[ 'status' ] =$this->user_model->getstatusdropdown();
		$data[ 'page' ] = 'createaboutus';
		$data[ 'title' ] = 'Create aboutus';
		$this->load->view( 'template', $data );
	}
	function createaboutussubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('title','title','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'page' ] = 'createaboutus';
			$data[ 'title' ] = 'Create aboutus';
			$this->load->view('template',$data);
		}
		else
		{
			$title=$this->input->post('title');
			$order=$this->input->post('order');
			$status=$this->input->post('status');

			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->aboutus_model->createaboutus($order,$image,$status,$title)==0)
			$data['alerterror']="New aboutus could not be created.";
			else
			$data['alertsuccess']="aboutus  created Successfully.";
			$data['redirect']="site/viewaboutus";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}
//	function viewaboutus()
//	{
//		$access = array("1");
//		$this->checkaccess($access);
//		$data['table']=$this->aboutus_model->viewaboutus();
//		$data['page']='viewaboutus';
//		$data['title']='View aboutus';
//		$this->load->view('template',$data);
//	}
	function editaboutus()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->aboutus_model->beforeeditaboutus($this->input->get('id'));
		$data[ 'status' ] =$this->user_model->getstatusdropdown();
//		$data['page2']='block/aboutusblock';
		$data['page']='editaboutus';
		$data['title']='Edit aboutus';
		$this->load->view('template',$data);
	}
	function editaboutussubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','name','trim|');
		$this->form_validation->set_rules('order','order','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data['before']=$this->aboutus_model->beforeeditaboutus($this->input->post('id'));
			$data['page']='editaboutus';
			$data['title']='Edit aboutus';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');
			$title=$this->input->post('title');
			$order=$this->input->post('order');
			$status=$this->input->post('status');

			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

            if($image=="")
            {
            $image=$this->aboutus_model->getaboutuslogobyid($id);
               // print_r($image);
                $image=$image->image;
            }

			if($this->aboutus_model->editaboutus($id,$order,$image,$status,$title)==0)
			$data['alerterror']="aboutus Editing was unsuccesful";
			else
			$data['alertsuccess']="aboutus edited Successfully.";
			$data['redirect']="site/viewaboutus";
			$this->load->view("redirect",$data);
		}
	}
	function deleteaboutus()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->aboutus_model->deleteaboutus($this->input->get('id'));
		$data['alertsuccess']="aboutus Deleted Successfully";
        $data['redirect']="site/viewaboutus";
        $this->load->view("redirect",$data);
	}

    // home slider

     public function viewhomeslider()
    {
        $access=array("1");
        $this->checkaccess($access);
        $data["page"]="viewhomeslider";
        $data["base_url"]=site_url("site/viewhomesliderjson");
        $data["title"]="View homeslider";
        $this->load->view("template",$data);
    }
    function viewhomesliderjson()
    {
        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`homeslider`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";

        $elements[1]=new stdClass();
        $elements[1]->field="`homeslider`.`image`";
        $elements[1]->sort="1";
        $elements[1]->header="image";
        $elements[1]->alias="image";

        $elements[2]=new stdClass();
        $elements[2]->field="`homeslider`.`order`";
        $elements[2]->sort="1";
        $elements[2]->header="order";
        $elements[2]->alias="order";


        $search=$this->input->get_post("search");
        $pageno=$this->input->get_post("pageno");
        $orderby=$this->input->get_post("orderby");
        $orderorder=$this->input->get_post("orderorder");
        $maxrow=$this->input->get_post("maxrow");
        if($maxrow=="")
        {
            $maxrow=20;
        }
        if($orderby=="")
        {
            $orderby="id";
            $orderorder="ASC";
        }
        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `homeslider`");
        $this->load->view("json",$data);
    }

	public function createhomeslider()
	{
		$access = array("1");
		$this->checkaccess($access);
        $data['product']=$this->product_model->getproductdropdown();
		$data[ 'page' ] = 'createhomeslider';
		$data[ 'title' ] = 'Create homeslider';
		$this->load->view( 'template', $data );
	}
	function createhomeslidersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('title','title','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->homeslider_model->getstatusdropdown();
            $data['product']=$this->product_model->getproductdropdown();
			$data[ 'page' ] = 'createhomeslider';
			$data[ 'title' ] = 'Create homeslider';
			$this->load->view('template',$data);
		}
		else
		{
			$order=$this->input->post('order');
			$product=$this->input->post('product');

			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

			if($this->homeslider_model->createhomeslider($order,$image,$product)==0)
			$data['alerterror']="New homeslider could not be created.";
			else
			$data['alertsuccess']="homeslider  created Successfully.";
			$data['redirect']="site/viewhomeslider";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);
		}
	}

	function edithomeslider()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['before']=$this->homeslider_model->beforeedithomeslider($this->input->get('id'));
		$data[ 'status' ] =$this->homeslider_model->getstatusdropdown();
        $data['product']=$this->product_model->getproductdropdown();
//		$data['page2']='block/homesliderblock';
		$data['page']='edithomeslider';
		$data['title']='Edit homeslider';
		$this->load->view('template',$data);
	}
	function edithomeslidersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('title','title','trim|');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('description','description','trim|');
		$this->form_validation->set_rules('price','price','trim|');
		$this->form_validation->set_rules('startdate','startdate','trim|');
		$this->form_validation->set_rules('enddate','enddate','trim|');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->homeslider_model->getstatusdropdown();
            $data['product']=$this->product_model->getproductdropdown();
			$data['before']=$this->homeslider_model->beforeedithomeslider($this->input->post('id'));
			$data['page']='edithomeslider';
			$data['title']='Edit homeslider';
			$this->load->view('template',$data);
		}
		else
		{
			$id=$this->input->post('id');

			$order=$this->input->post('order');
			$product=$this->input->post('product');

			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];
			}

            if($image=="")
            {
            $image=$this->homeslider_model->gethomesliderimagebyid($id);
               // print_r($image);
                $image=$image->image;
            }

			if($this->homeslider_model->edithomeslider($id,$order,$image,$product)==0)
			$data['alerterror']="homeslider Editing was unsuccesful";
			else
			$data['alertsuccess']="homeslider edited Successfully.";
			$data['redirect']="site/viewhomeslider";
			$this->load->view("redirect",$data);
		}
	}
	function deletehomeslider()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->homeslider_model->deletehomeslider($this->input->get('id'));
		$data['alertsuccess']="homeslider Deleted Successfully";
        $data['redirect']="site/viewhomeslider";
        $this->load->view("redirect",$data);
	}
    function gettotallastamt()
	{
        $id=$this->input->get('id');
		$amt=$this->order_model->gettotallastamt($id);
          $data['message']=$amt;
        $this->load->view("json",$data);
	}



	    public function viewstore()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="viewstore";
	$data["base_url"]=site_url("site/viewstorejson");
	$data["title"]="View store";
	$this->load->view("template",$data);
	}
	function viewstorejson()
	{
	$elements=array();
	$elements[0]=new stdClass();
	$elements[0]->field="`dea_store`.`id`";
	$elements[0]->sort="1";
	$elements[0]->header="ID";
	$elements[0]->alias="id";
	$elements[1]=new stdClass();
	$elements[1]->field="`dea_store`.`storename`";
	$elements[1]->sort="1";
	$elements[1]->header="Store Name";
	$elements[1]->alias="storename";
	$elements[2]=new stdClass();
	$elements[2]->field="`dea_store`.`image`";
	$elements[2]->sort="1";
	$elements[2]->header="Logo";
	$elements[2]->alias="image";
	$elements[3]=new stdClass();
	$elements[3]->field="`dea_store`.`ownername`";
	$elements[3]->sort="1";
	$elements[3]->header="Owner Name";
	$elements[3]->alias="ownername";
	$elements[4]=new stdClass();
	$elements[4]->field="`dea_store`.`city`";
	$elements[4]->sort="1";
	$elements[4]->header="City";
	$elements[4]->alias="city";
	$elements[5]=new stdClass();
	$elements[5]->field="`dea_store`.`state`";
	$elements[5]->sort="1";
	$elements[5]->header="State";
	$elements[5]->alias="state";
	$elements[6]=new stdClass();
	$elements[6]->field="`dea_store`.`pincode`";
	$elements[6]->sort="1";
	$elements[6]->header="Pincode";
	$elements[6]->alias="pincode";
	$elements[7]=new stdClass();
	$elements[7]->field="`dea_store`.`phone`";
	$elements[7]->sort="1";
	$elements[7]->header="Phone";
	$elements[7]->alias="phone";
	$elements[8]=new stdClass();
	$elements[8]->field="`dea_store`.`email`";
	$elements[8]->sort="1";
	$elements[8]->header="Email";
	$elements[8]->alias="email";
	$elements[9]=new stdClass();
	$elements[9]->field="`dea_store`.`lat`";
	$elements[9]->sort="1";
	$elements[9]->header="Latitude";
	$elements[9]->alias="lat";
	$elements[10]=new stdClass();
	$elements[10]->field="`dea_store`.`creationdate`";
	$elements[10]->sort="1";
	$elements[10]->header="Creation Date";
	$elements[10]->alias="creationdate";
	$elements[11]=new stdClass();
	$elements[11]->field="`dea_store`.`modificationdate`";
	$elements[11]->sort="1";
	$elements[11]->header="Modification Date";
	$elements[11]->alias="modificationdate";
	$elements[12]=new stdClass();
	$elements[12]->field="`dea_store`.`address`";
	$elements[12]->sort="1";
	$elements[12]->header="Address";
	$elements[12]->alias="address";
	$elements[13]=new stdClass();
	$elements[13]->field="`dea_store`.`accesslevel`";
	$elements[13]->sort="1";
	$elements[13]->header="Accesslevel";
	$elements[13]->alias="accesslevel";
	$search=$this->input->get_post("search");
	$pageno=$this->input->get_post("pageno");
	$orderby=$this->input->get_post("orderby");
	$orderorder=$this->input->get_post("orderorder");
	$maxrow=$this->input->get_post("maxrow");
	if($maxrow=="")
	{
	$maxrow=20;
	}
	if($orderby=="")
	{
	$orderby="id";
	$orderorder="ASC";
	}
	$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `dea_store`");
	$this->load->view("json",$data);
	}

	public function createstore()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="createstore";
	$data["title"]="Create store";
	$data["accesslevel"]=$this->store_model->getaccesslevels();
	$this->load->view("template",$data);
	}
	public function createstoresubmit()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->form_validation->set_rules("storename","Store Name","trim");
	$this->form_validation->set_rules("ownername","Owner Name","trim");
	$this->form_validation->set_rules("city","City","trim");
	$this->form_validation->set_rules("state","State","trim");
	$this->form_validation->set_rules("pincode","Pincode","trim");
	$this->form_validation->set_rules("phone","Phone","trim");
	$this->form_validation->set_rules("email","Email","trim");
	$this->form_validation->set_rules("lat","Latitude","trim");
	$this->form_validation->set_rules("creationdate","Creation Date","trim");
	$this->form_validation->set_rules("modificationdate","Modification Date","trim");
	$this->form_validation->set_rules("address","Address","trim");
	if($this->form_validation->run()==FALSE)
	{
	$data["alerterror"]=validation_errors();
	$data["page"]="createstore";
	$data["title"]="Create store";
  	$data["accesslevel"]=$this->store_model->getaccesslevels();
	$this->load->view("template",$data);
	}
	else
	{
	$storename=$this->input->get_post("storename");
	$ownername=$this->input->get_post("ownername");
	$city=$this->input->get_post("city");
	$state=$this->input->get_post("state");
	$pincode=$this->input->get_post("pincode");
	$phone=$this->input->get_post("phone");
	$email=$this->input->get_post("email");
	$lat=$this->input->get_post("lat");
	$long=$this->input->get_post("long");
	$creationdate=$this->input->get_post("creationdate");
	$modificationdate=$this->input->get_post("modificationdate");
	$address=$this->input->get_post("address");
	$accesslevel=$this->input->get_post("accesslevel");
	$password=$this->input->post('password');
	$formofcompany=$this->input->post('formofcompany');
	$shippingaddress=$this->input->post('shippingaddress');
	$vat=$this->input->post('vat');
	$cst=$this->input->post('cst');
	$manager=$this->input->post('manager');
	$website=$this->input->post('website');
	$facebook=$this->input->post('facebook');
	$twitter=$this->input->post('twitter');
	$insta=$this->input->post('insta');
	$google=$this->input->post('google');
	$pan=$this->input->post('pan');
	$shoptime=$this->input->post('shoptime');
	$paymentcollectiontime=$this->input->post('paymentcollectiontime');
	$shopclosedon=$this->input->post('shopclosedon');
	$config['upload_path'] = './uploads/';
$config['allowed_types'] = 'gif|jpg|png|jpeg';
$this->load->library('upload', $config);
$filename="image";
$image="";
if (  $this->upload->do_upload($filename))
{
$uploaddata = $this->upload->data();
$image=$uploaddata['file_name'];

			$config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
			$config_r['maintain_ratio'] = TRUE;
			$config_t['create_thumb'] = FALSE;///add this
			$config_r['width']   = 800;
			$config_r['height'] = 800;
			$config_r['quality']    = 100;
			//end of configs

			$this->load->library('image_lib', $config_r);
			$this->image_lib->initialize($config_r);
			if(!$this->image_lib->resize())
			{
					echo "Failed." . $this->image_lib->display_errors();
					//return false;
			}
			else
			{
					//print_r($this->image_lib->dest_image);
					//dest_image
					$image=$this->image_lib->dest_image;
					//return false;
			}

}
	if($this->store_model->create($storename,$image,$ownername,$city,$state,$pincode,$phone,$email,$lat,$long,$creationdate,$modificationdate,$address,$accesslevel,$password,$formofcompany,$shippingaddress,$vat,$cst,$manager,$website,$facebook,$twitter,$insta,$google,$pan,$shoptime,$paymentcollectiontime,$shopclosedon)==0)
	$data["alerterror"]="New store could not be created.";
	else
	$data["alertsuccess"]="store created Successfully.";
	$data["redirect"]="site/viewstore";
	$this->load->view("redirect",$data);
	}
	}
	public function editstore()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="editstore";
	$data["page2"]="block/storeblock";
	$data["title"]="Edit store";
	$data["before1"]=$this->input->get('id');
	$data["before2"]=$this->input->get('id');
		$data["accesslevel"]=$this->store_model->getaccesslevels();
	$data["before"]=$this->store_model->beforeedit($this->input->get("id"));
	$this->load->view("template",$data);
	}
	public function editstoresubmit()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->form_validation->set_rules("id","ID","trim");
	$this->form_validation->set_rules("storename","Store Name","trim");
	$this->form_validation->set_rules("ownername","Owner Name","trim");
	$this->form_validation->set_rules("city","City","trim");
	$this->form_validation->set_rules("state","State","trim");
	$this->form_validation->set_rules("pincode","Pincode","trim");
	$this->form_validation->set_rules("phone","Phone","trim");
	$this->form_validation->set_rules("email","Email","trim");
	$this->form_validation->set_rules("lat","Latitude","trim");
	$this->form_validation->set_rules("creationdate","Creation Date","trim");
	$this->form_validation->set_rules("modificationdate","Modification Date","trim");
	$this->form_validation->set_rules("address","Address","trim");
	if($this->form_validation->run()==FALSE)
	{
	$data["alerterror"]=validation_errors();
	$data["page"]="editstore";
	$data["title"]="Edit store";
		$data["accesslevel"]=$this->store_model->getaccesslevels();
	$data["before"]=$this->store_model->beforeedit($this->input->get("id"));
	$this->load->view("template",$data);
	}
	else
	{
	$id=$this->input->get_post("id");
	$storename=$this->input->get_post("storename");
	$ownername=$this->input->get_post("ownername");
	$city=$this->input->get_post("city");
	$state=$this->input->get_post("state");
	$pincode=$this->input->get_post("pincode");
	$phone=$this->input->get_post("phone");
	$email=$this->input->get_post("email");
	$lat=$this->input->get_post("lat");
	$long=$this->input->get_post("long");
	$creationdate=$this->input->get_post("creationdate");
	$modificationdate=$this->input->get_post("modificationdate");
	$address=$this->input->get_post("address");
	$accesslevel=$this->input->get_post("accesslevel");
	$password=$this->input->get_post("password");
	$formofcompany=$this->input->post('formofcompany');
	$shippingaddress=$this->input->post('shippingaddress');
	$vat=$this->input->post('vat');
	$cst=$this->input->post('cst');
	$manager=$this->input->post('manager');
	$website=$this->input->post('website');
	$facebook=$this->input->post('facebook');
	$twitter=$this->input->post('twitter');
	$insta=$this->input->post('insta');
	$google=$this->input->post('google');
	$pan=$this->input->post('pan');
	$shoptime=$this->input->post('shoptime');
	$paymentcollectiontime=$this->input->post('paymentcollectiontime');
	$shopclosedon=$this->input->post('shopclosedon');
	$config['upload_path'] = './uploads/';
$config['allowed_types'] = 'gif|jpg|png|jpeg';
$this->load->library('upload', $config);
$filename="image";
$image="";
if (  $this->upload->do_upload($filename))
{
$uploaddata = $this->upload->data();
$image=$uploaddata['file_name'];

			$config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
			$config_r['maintain_ratio'] = TRUE;
			$config_t['create_thumb'] = FALSE;///add this
			$config_r['width']   = 800;
			$config_r['height'] = 800;
			$config_r['quality']    = 100;
			//end of configs

			$this->load->library('image_lib', $config_r);
			$this->image_lib->initialize($config_r);
			if(!$this->image_lib->resize())
			{
					echo "Failed." . $this->image_lib->display_errors();
					//return false;
			}
			else
			{
					//print_r($this->image_lib->dest_image);
					//dest_image
					$image=$this->image_lib->dest_image;
					//return false;
			}

}

	if($image=="")
	{
	$image=$this->store_model->getimagebyid($id);
		 // print_r($image);
			$image=$image->image;
	}
	if($this->store_model->edit($id,$storename,$image,$ownername,$city,$state,$pincode,$phone,$email,$lat,$long,$creationdate,$modificationdate,$address,$accesslevel,$password,$formofcompany,$shippingaddress,$vat,$cst,$manager,$website,$facebook,$twitter,$insta,$google,$pan,$shoptime,$paymentcollectiontime,$shopclosedon)==0)
	$data["alerterror"]="New store could not be Updated.";
	else
	$data["alertsuccess"]="store Updated Successfully.";
	$data["redirect"]="site/viewstore";
	$this->load->view("redirect",$data);
	}
	}
	public function deletestore()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->store_model->delete($this->input->get("id"));
	$data["redirect"]="site/viewstore";
	$this->load->view("redirect",$data);
	}
	public function viewstoreprice()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="viewstoreprice";
	$data["base_url"]=site_url("site/viewstorepricejson?id=").$this->input->get("id");
	$data["title"]="View storeprice";
	$this->load->view("template",$data);
	}
	function viewstorepricejson()
	{
		$id=$this->input->get("id");
	$elements=array();
	$elements[0]=new stdClass();
	$elements[0]->field="`dea_storeprice`.`id`";
	$elements[0]->sort="1";
	$elements[0]->header="ID";
	$elements[0]->alias="id";
	$elements[1]=new stdClass();
	$elements[1]->field="`dea_storeprice`.`storeid`";
	$elements[1]->sort="1";
	$elements[1]->header="Store Id";
	$elements[1]->alias="storeid";
	$elements[2]=new stdClass();
	$elements[2]->field="`product`.`name`";
	$elements[2]->sort="1";
	$elements[2]->header="Product Id";
	$elements[2]->alias="productid";
	$elements[3]=new stdClass();
	$elements[3]->field="`dea_storeprice`.`price`";
	$elements[3]->sort="1";
	$elements[3]->header="Price";
	$elements[3]->alias="price";
	$elements[4]=new stdClass();
	$elements[4]->field="`dea_storeprice`.`orderid`";
	$elements[4]->sort="1";
	$elements[4]->header="Order Id";
	$elements[4]->alias="orderid";
	$elements[5]=new stdClass();
	$elements[5]->field="`dea_storeprice`.`creationdate`";
	$elements[5]->sort="1";
	$elements[5]->header="Creation Date";
	$elements[5]->alias="creationdate";
	$elements[6]=new stdClass();
	$elements[6]->field="`dea_storeprice`.`modificationdate`";
	$elements[6]->sort="1";
	$elements[6]->header="Modification Date";
	$elements[6]->alias="modificationdate";
	$search=$this->input->get_post("search");
	$pageno=$this->input->get_post("pageno");
	$orderby=$this->input->get_post("orderby");
	$orderorder=$this->input->get_post("orderorder");
	$maxrow=$this->input->get_post("maxrow");
	if($maxrow=="")
	{
	$maxrow=20;
	}
	if($orderby=="")
	{
	$orderby="id";
	$orderorder="ASC";
	}
	$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `dea_storeprice` LEFT OUTER JOIN `product` ON `product`.`id`=`dea_storeprice`.`productid`","WHERE `dea_storeprice`.`storeid`='$id'");
	$this->load->view("json",$data);
	}

	public function createstoreprice()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="createstoreprice";
	$data['productid']=$this->product_model->getproductdropdown();
	$data["storeid"]=$this->deaorder_model->getstoredropdown();
	$data["title"]="Create storeprice";
	$this->load->view("template",$data);
	}
	public function createstorepricesubmit()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->form_validation->set_rules("storeid","Store Id","trim");
	$this->form_validation->set_rules("productid","Product Id","trim");
	$this->form_validation->set_rules("price","Price","trim");
	$this->form_validation->set_rules("orderid","Order Id","trim");
	$this->form_validation->set_rules("creationdate","Creation Date","trim");
	$this->form_validation->set_rules("modificationdate","Modification Date","trim");
	if($this->form_validation->run()==FALSE)
	{
	$data["alerterror"]=validation_errors();
	$data["page"]="createstoreprice";
	$data['productid']=$this->product_model->getproductdropdown();
	$data["storeid"]=$this->deaorder_model->getstoredropdown();
	$data["title"]="Create storeprice";
	$this->load->view("template",$data);
	}
	else
	{
	$storeid=$this->input->get_post("storeid");
	$productid=$this->input->get_post("productid");
	$price=$this->input->get_post("price");
	$orderid=$this->input->get_post("orderid");
	$creationdate=$this->input->get_post("creationdate");
	$modificationdate=$this->input->get_post("modificationdate");
	if($this->storeprice_model->create($storeid,$productid,$price,$orderid,$creationdate,$modificationdate)==0)
	$data["alerterror"]="New storeprice could not be created.";
	else
	$data["alertsuccess"]="storeprice created Successfully.";
	$data["redirect"]="site/viewstoreprice?id=".$storeid;
	$this->load->view("redirect2",$data);
	}
	}
	public function editstoreprice()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="editstoreprice";
	$data["title"]="Edit storeprice";
	$data['productid']=$this->product_model->getproductdropdown();
	$data["storeid"]=$this->deaorder_model->getstoredropdown();
	$data["before"]=$this->storeprice_model->beforeedit($this->input->get("id"));
	$this->load->view("template",$data);
	}
	public function editstorepricesubmit()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->form_validation->set_rules("id","ID","trim");
	$this->form_validation->set_rules("storeid","Store Id","trim");
	$this->form_validation->set_rules("productid","Product Id","trim");
	$this->form_validation->set_rules("price","Price","trim");
	$this->form_validation->set_rules("orderid","Order Id","trim");
	$this->form_validation->set_rules("creationdate","Creation Date","trim");
	$this->form_validation->set_rules("modificationdate","Modification Date","trim");
	if($this->form_validation->run()==FALSE)
	{
	$data["alerterror"]=validation_errors();
	$data["page"]="editstoreprice";
	$data["title"]="Edit storeprice";
	$data['productid']=$this->product_model->getproductdropdown();
	$data["storeid"]=$this->deaorder_model->getstoredropdown();
	$data["before"]=$this->storeprice_model->beforeedit($this->input->get("id"));
	$this->load->view("template",$data);
	}
	else
	{
	$id=$this->input->get_post("id");
	$storeid=$this->input->get_post("storeid");
	$productid=$this->input->get_post("productid");
	$price=$this->input->get_post("price");
	$orderid=$this->input->get_post("orderid");
	$creationdate=$this->input->get_post("creationdate");
	$modificationdate=$this->input->get_post("modificationdate");
	if($this->storeprice_model->edit($id,$storeid,$productid,$price,$orderid,$creationdate,$modificationdate)==0)
	$data["alerterror"]="New storeprice could not be Updated.";
	else
	$data["alertsuccess"]="storeprice Updated Successfully.";
	$data["redirect"]="site/viewstoreprice?id=".$storeid;
	$this->load->view("redirect2",$data);
	}
	}
	public function deletestoreprice()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->storeprice_model->delete($this->input->get("id"));
	$data["redirect"]="site/viewstoreprice?id=".$this->input->get("storeid");
	$this->load->view("redirect",$data);
	}
	public function viewdeaorder()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="viewdeaorder";
	$data["base_url"]=site_url("site/viewdeaorderjson");
	$data["title"]="View deaorder";
	$this->load->view("template",$data);
	}
	function viewdeaorderjson()
	{
	$elements=array();
	$elements[0]=new stdClass();
	$elements[0]->field="`dea_order`.`id`";
	$elements[0]->sort="1";
	$elements[0]->header="ID";
	$elements[0]->alias="id";
	$elements[1]=new stdClass();
	$elements[1]->field="`dea_store`.`storename`";
	$elements[1]->sort="1";
	$elements[1]->header="Store";
	$elements[1]->alias="store";
	$elements[2]=new stdClass();
	$elements[2]->field="`dea_order`.`paymentstatus`";
	$elements[2]->sort="1";
	$elements[2]->header="Payment Status";
	$elements[2]->alias="paymentstatus";
	$elements[3]=new stdClass();
	$elements[3]->field="`dea_sales`.`name`";
	$elements[3]->sort="1";
	$elements[3]->header="Sales";
	$elements[3]->alias="sales";
	$elements[4]=new stdClass();
	$elements[4]->field="`dea_order`.`firstname`";
	$elements[4]->sort="1";
	$elements[4]->header="First Name";
	$elements[4]->alias="firstname";
	$elements[5]=new stdClass();
	$elements[5]->field="`dea_order`.`lastname`";
	$elements[5]->sort="1";
	$elements[5]->header="Last Name";
	$elements[5]->alias="lastname";
	$elements[6]=new stdClass();
	$elements[6]->field="`dea_order`.`email`";
	$elements[6]->sort="1";
	$elements[6]->header="Email";
	$elements[6]->alias="email";
	$elements[7]=new stdClass();
	$elements[7]->field="`dea_order`.`billingcity`";
	$elements[7]->sort="1";
	$elements[7]->header="Billing City";
	$elements[7]->alias="billingcity";
	$elements[8]=new stdClass();
	$elements[8]->field="`dea_order`.`billingstate`";
	$elements[8]->sort="1";
	$elements[8]->header="Billing State";
	$elements[8]->alias="billingstate";
	$elements[9]=new stdClass();
	$elements[9]->field="`dea_order`.`billingcountry`";
	$elements[9]->sort="1";
	$elements[9]->header="Billing Country";
	$elements[9]->alias="billingcountry";
	$elements[10]=new stdClass();
	$elements[10]->field="`dea_order`.`billingcontact`";
	$elements[10]->sort="1";
	$elements[10]->header="Billing Contact";
	$elements[10]->alias="billingcontact";
	$elements[11]=new stdClass();
	$elements[11]->field="`dea_order`.`billingpincode`";
	$elements[11]->sort="1";
	$elements[11]->header="Billing Pincode";
	$elements[11]->alias="billingpincode";
	$elements[12]=new stdClass();
	$elements[12]->field="`dea_order`.`shippingcity`";
	$elements[12]->sort="1";
	$elements[12]->header="Shipping City";
	$elements[12]->alias="shippingcity";
	$elements[13]=new stdClass();
	$elements[13]->field="`dea_order`.`shippingstate`";
	$elements[13]->sort="1";
	$elements[13]->header="Shipping State";
	$elements[13]->alias="shippingstate";
	$elements[14]=new stdClass();
	$elements[14]->field="`dea_order`.`shippingcountry`";
	$elements[14]->sort="1";
	$elements[14]->header="Shipping Country";
	$elements[14]->alias="shippingcountry";
	$elements[15]=new stdClass();
	$elements[15]->field="`dea_order`.`shippingcontact`";
	$elements[15]->sort="1";
	$elements[15]->header="Shipping Contact";
	$elements[15]->alias="shippingcontact";
	$elements[16]=new stdClass();
	$elements[16]->field="`dea_order`.`shippingpincode`";
	$elements[16]->sort="1";
	$elements[16]->header="Shipping Pincode";
	$elements[16]->alias="shippingpincode";
	$elements[17]=new stdClass();
	$elements[17]->field="`dea_order`.`long`";
	$elements[17]->sort="1";
	$elements[17]->header="longitude";
	$elements[17]->alias="long";
	$elements[18]=new stdClass();
	$elements[18]->field="`dea_order`.`password`";
	$elements[18]->sort="1";
	$elements[18]->header="Password";
	$elements[18]->alias="password";
	$elements[19]=new stdClass();
	$elements[19]->field="`dea_order`.`creationdate`";
	$elements[19]->sort="1";
	$elements[19]->header="Creation Date";
	$elements[19]->alias="creationdate";
	$elements[20]=new stdClass();
	$elements[20]->field="`dea_order`.`modificationdate`";
	$elements[20]->sort="1";
	$elements[20]->header="Modification Date";
	$elements[20]->alias="modificationdate";
	$elements[21]=new stdClass();
	$elements[21]->field="`dea_order`.`billingaddress`";
	$elements[21]->sort="1";
	$elements[21]->header="Billing Address";
	$elements[21]->alias="billingaddress";
	$elements[22]=new stdClass();
	$elements[22]->field="`dea_order`.`sales`";
	$elements[22]->sort="1";
	$elements[22]->header="Sales";
	$elements[22]->alias="sales";
	$elements[23]=new stdClass();
	$elements[23]->field="`dea_store`.`ownername`";
	$elements[23]->sort="1";
	$elements[23]->header="Owner name";
	$elements[23]->alias="ownername";
	$elements[24]=new stdClass();
	$elements[24]->field="`dea_order`.`finalamount`";
	$elements[24]->sort="1";
	$elements[24]->header="Final Amount";
	$elements[24]->alias="finalamount";
	$elements[25]=new stdClass();
	$elements[25]->field="`dea_order`.`approve`";
	$elements[25]->sort="1";
	$elements[25]->header="Approval";
	$elements[25]->alias="approve";
	// $elements[25]=new stdClass();
	// $elements[25]->field="`dea_store`.`storename`";
	// $elements[25]->sort="1";
	// $elements[25]->header="Dealer Name";
	// $elements[25]->alias="saledealer";
	$search=$this->input->get_post("search");
	$pageno=$this->input->get_post("pageno");
	$orderby=$this->input->get_post("orderby");
	$orderorder=$this->input->get_post("orderorder");
	$maxrow=$this->input->get_post("maxrow");
	if($maxrow=="")
	{
	$maxrow=20;
	}
	if($orderby=="")
	{
	$orderby="id";
	$orderorder="ASC";
	}
	$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `dea_order` LEFT OUTER JOIN `dea_sales` ON `dea_sales`.`id`=`dea_order`.`sales` LEFT OUTER JOIN `dea_store` ON `dea_store`.`id`=`dea_order`.`store`");
	$this->load->view("json",$data);
	}

	public function createdeaorder()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="createdeaorder";
	$data["paymentstatus"]=$this->deaorder_model->getpaymentstatusdropdown();
	$data["store"]=$this->deaorder_model->getstoredropdown();
	$data["sales"]=$this->deaorder_model->getsalesdropdown();
		$data["salestype"]=$this->deaorder_model->getsalestypedropdown();
	$data["title"]="Create deaorder";
	$this->load->view("template",$data);
	}
	public function createdeaordersubmit()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->form_validation->set_rules("store","Store","trim");
	$this->form_validation->set_rules("paymentstatus","Payment Status","trim");
	$this->form_validation->set_rules("sales","Sales","trim");
	$this->form_validation->set_rules("firstname","First Name","trim");
	$this->form_validation->set_rules("lastname","Last Name","trim");
	$this->form_validation->set_rules("email","Email","trim");
	$this->form_validation->set_rules("billingcity","Billing City","trim");
	$this->form_validation->set_rules("billingstate","Billing State","trim");
	$this->form_validation->set_rules("billingcountry","Billing Country","trim");
	$this->form_validation->set_rules("billingcontact","Billing Contact","trim");
	$this->form_validation->set_rules("billingpincode","Billing Pincode","trim");
	$this->form_validation->set_rules("shippingcity","Shipping City","trim");
	$this->form_validation->set_rules("shippingstate","Shipping State","trim");
	$this->form_validation->set_rules("shippingcountry","Shipping Country","trim");
	$this->form_validation->set_rules("shippingcontact","Shipping Contact","trim");
	$this->form_validation->set_rules("shippingpincode","Shipping Pincode","trim");
	$this->form_validation->set_rules("long","longitude","trim");
	$this->form_validation->set_rules("password","Password","trim");
	$this->form_validation->set_rules("creationdate","Creation Date","trim");
	$this->form_validation->set_rules("modificationdate","Modification Date","trim");
	$this->form_validation->set_rules("billingaddress","Billing Address","trim");
	$this->form_validation->set_rules("shippingaddress","Shipping Address","trim");
	if($this->form_validation->run()==FALSE)
	{
	$data["alerterror"]=validation_errors();
	$data["paymentstatus"]=$this->deaorder_model->getpaymentstatusdropdown();
	$data["store"]=$this->deaorder_model->getstoredropdown();
	$data["sales"]=$this->deaorder_model->getsalesdropdown();
		$data["salestype"]=$this->deaorder_model->getsalestypedropdown();
	$data["page"]="createdeaorder";
	$data["title"]="Create deaorder";
	$this->load->view("template",$data);
	}
	else
	{
	$store=$this->input->get_post("store");
	$paymentstatus=$this->input->get_post("paymentstatus");
	$sales=$this->input->get_post("sales");
	$firstname=$this->input->get_post("firstname");
	$lastname=$this->input->get_post("lastname");
	$email=$this->input->get_post("email");
	$billingcity=$this->input->get_post("billingcity");
	$billingstate=$this->input->get_post("billingstate");
	$billingcountry=$this->input->get_post("billingcountry");
	$billingcontact=$this->input->get_post("billingcontact");
	$billingpincode=$this->input->get_post("billingpincode");
	$shippingcity=$this->input->get_post("shippingcity");
	$shippingstate=$this->input->get_post("shippingstate");
	$shippingcountry=$this->input->get_post("shippingcountry");
	$shippingcontact=$this->input->get_post("shippingcontact");
	$shippingpincode=$this->input->get_post("shippingpincode");
	$long=$this->input->get_post("long");
	$password=$this->input->get_post("password");
	$creationdate=$this->input->get_post("creationdate");
	$modificationdate=$this->input->get_post("modificationdate");
	$billingaddress=$this->input->get_post("billingaddress");
	$shippingaddress=$this->input->get_post("shippingaddress");
	$approve=$this->input->get_post("approve");
	$salestype=$this->input->get_post("salestype");
	$deliveredtime=$this->input->get_post("deliveredtime");
	$delivereddate=$this->input->get_post("delivereddate");
	$note=$this->input->get_post("note");
	if($this->deaorder_model->create($store,$paymentstatus,$sales,$firstname,$lastname,$email,$billingcity,$billingstate,$billingcountry,$billingcontact,$billingpincode,$shippingcity,$shippingstate,$shippingcountry,$shippingcontact,$shippingpincode,$long,$password,$creationdate,$modificationdate,$billingaddress,$shippingaddress,$approve,$salestype,$delivereddate,$deliveredtime,$note)==0)
	$data["alerterror"]="New order could not be created.";
	else
	$data["alertsuccess"]="order created Successfully.";
	$data["redirect"]="site/viewdeaorder";
	$this->load->view("redirect",$data);
	}
	}
	public function editdeaorder()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="editdeaorder";
	$data["page2"]="block/deaorder";
	$data["before1"]=$this->input->get('id');
	$data["before2"]=$this->input->get('id');
	$data["paymentstatus"]=$this->deaorder_model->getpaymentstatusdropdown();
	$data["store"]=$this->deaorder_model->getstoredropdown();
	$data["sales"]=$this->deaorder_model->getsalesdropdown();
		$data["saledealer"]=$this->deaorder_model->getsaledealerdropdown();
			$data["approve"]=$this->deaorder_model->getapprovedropdown();
				$data["salestype"]=$this->deaorder_model->getsalestypedropdown();
	$data["title"]="Edit deaorder";
	$data["before"]=$this->deaorder_model->beforeedit($this->input->get("id"));
	$this->load->view("template",$data);
	}
	public function editdeaordersubmit()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->form_validation->set_rules("id","ID","trim");
	$this->form_validation->set_rules("store","Store","trim");
	$this->form_validation->set_rules("paymentstatus","Payment Status","trim");
	$this->form_validation->set_rules("sales","Sales","trim");
	$this->form_validation->set_rules("firstname","First Name","trim");
	$this->form_validation->set_rules("lastname","Last Name","trim");
	$this->form_validation->set_rules("email","Email","trim");
	$this->form_validation->set_rules("billingcity","Billing City","trim");
	$this->form_validation->set_rules("billingstate","Billing State","trim");
	$this->form_validation->set_rules("billingcountry","Billing Country","trim");
	$this->form_validation->set_rules("billingcontact","Billing Contact","trim");
	$this->form_validation->set_rules("billingpincode","Billing Pincode","trim");
	$this->form_validation->set_rules("shippingcity","Shipping City","trim");
	$this->form_validation->set_rules("shippingstate","Shipping State","trim");
	$this->form_validation->set_rules("shippingcountry","Shipping Country","trim");
	$this->form_validation->set_rules("shippingcontact","Shipping Contact","trim");
	$this->form_validation->set_rules("shippingpincode","Shipping Pincode","trim");
	$this->form_validation->set_rules("long","longitude","trim");
	$this->form_validation->set_rules("password","Password","trim");
	$this->form_validation->set_rules("creationdate","Creation Date","trim");
	$this->form_validation->set_rules("modificationdate","Modification Date","trim");
	$this->form_validation->set_rules("billingaddress","Billing Address","trim");
	$this->form_validation->set_rules("shippingaddress","Shipping Address","trim");
	if($this->form_validation->run()==FALSE)
	{
	$data["alerterror"]=validation_errors();
	$data["page"]="editdeaorder";
	$data["title"]="Edit deaorder";
	$data["paymentstatus"]=$this->deaorder_model->getpaymentstatusdropdown();
	$data["store"]=$this->deaorder_model->getstoredropdown();
	$data["saledealer"]=$this->deaorder_model->getsaledealerdropdown();
	$data["approve"]=$this->deaorder_model->getapprovedropdown();
	$data["salestype"]=$this->deaorder_model->getsalestypedropdown();
	$data["sales"]=$this->deaorder_model->getsalesdropdown();
	$data["before"]=$this->deaorder_model->beforeedit($this->input->get("id"));
	$this->load->view("template",$data);
	}
	else
	{
	$id=$this->input->get_post("id");
	$store=$this->input->get_post("store");
	$paymentstatus=$this->input->get_post("paymentstatus");
	$sales=$this->input->get_post("sales");
	$firstname=$this->input->get_post("firstname");
	$lastname=$this->input->get_post("lastname");
	$email=$this->input->get_post("email");
	$billingcity=$this->input->get_post("billingcity");
	$billingstate=$this->input->get_post("billingstate");
	$billingcountry=$this->input->get_post("billingcountry");
	$billingcontact=$this->input->get_post("billingcontact");
	$billingpincode=$this->input->get_post("billingpincode");
	$shippingcity=$this->input->get_post("shippingcity");
	$shippingstate=$this->input->get_post("shippingstate");
	$shippingcountry=$this->input->get_post("shippingcountry");
	$shippingcontact=$this->input->get_post("shippingcontact");
	$shippingpincode=$this->input->get_post("shippingpincode");
	$long=$this->input->get_post("long");
	$password=$this->input->get_post("password");
	$creationdate=$this->input->get_post("creationdate");
	$modificationdate=$this->input->get_post("modificationdate");
	$billingaddress=$this->input->get_post("billingaddress");
	$shippingaddress=$this->input->get_post("shippingaddress");
	$saledealer=$this->input->get_post("saledealer");
	$approve=$this->input->get_post("approve");
	$salestype=$this->input->get_post("salestype");
	$deliverabletime=$this->input->get_post("deliverabletime");
	$deliverabledate=$this->input->get_post("deliverabledate");
	$note=$this->input->get_post("note");
	if($this->deaorder_model->edit($id,$store,$paymentstatus,$sales,$firstname,$lastname,$email,$billingcity,$billingstate,$billingcountry,$billingcontact,$billingpincode,$shippingcity,$shippingstate,$shippingcountry,$shippingcontact,$shippingpincode,$long,$password,$creationdate,$modificationdate,$billingaddress,$shippingaddress,$saledealer,$approve,$salestype,$deliverabledate,$deliverabletime,$note)==0)
	$data["alerterror"]="New deaorder could not be Updated.";
	else
	$data["alertsuccess"]="deaorder Updated Successfully.";
	$data["redirect"]="site/viewdeaorder";
	$this->load->view("redirect",$data);
	}
	}
	public function deletedeaorder()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->deaorder_model->delete($this->input->get("id"));
	$data["redirect"]="site/viewdeaorder";
	$this->load->view("redirect",$data);
	}
	public function vieworderproduct()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="vieworderproduct";
	$data["base_url"]=site_url("site/vieworderproductjson?id=").$this->input->get('id');
	$data["title"]="View orderproduct";
	$this->load->view("template",$data);
	}
	function vieworderproductjson()
	{
		$id=$this->input->get('id');
	$elements=array();
	$elements[0]=new stdClass();
	$elements[0]->field="`dea_orderproduct`.`id`";
	$elements[0]->sort="1";
	$elements[0]->header="ID";
	$elements[0]->alias="id";
	$elements[1]=new stdClass();
	$elements[1]->field="`product`.`name`";
	$elements[1]->sort="1";
	$elements[1]->header="Product";
	$elements[1]->alias="product";
	$elements[2]=new stdClass();
	$elements[2]->field="`dea_orderproduct`.`order`";
	$elements[2]->sort="1";
	$elements[2]->header="Order";
	$elements[2]->alias="order";
	$elements[3]=new stdClass();
	$elements[3]->field="`dea_orderproduct`.`quantity`";
	$elements[3]->sort="1";
	$elements[3]->header="Quantity";
	$elements[3]->alias="quantity";
	$elements[4]=new stdClass();
	$elements[4]->field="`dea_orderproduct`.`price`";
	$elements[4]->sort="1";
	$elements[4]->header="Price";
	$elements[4]->alias="price";
	$elements[5]=new stdClass();
	$elements[5]->field="`dea_orderproduct`.`approve`";
	$elements[5]->sort="1";
	$elements[5]->header="Approve";
	$elements[5]->alias="approve";

	$elements[6]=new stdClass();
 	$elements[6]->field="`productimage`.`image`";
 	$elements[6]->sort="1";
 	$elements[6]->header="Image";
 	$elements[6]->alias="image";

	$search=$this->input->get_post("search");
	$pageno=$this->input->get_post("pageno");
	$orderby=$this->input->get_post("orderby");
	$orderorder=$this->input->get_post("orderorder");
	$maxrow=$this->input->get_post("maxrow");
	if($maxrow=="")
	{
	$maxrow=20;
	}
	if($orderby=="")
	{
	$orderby="id";
	$orderorder="ASC";
	}
	$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `dea_orderproduct` LEFT OUTER JOIN `product` ON `product`.`id`=`dea_orderproduct`.`product` LEFT OUTER JOIN `productimage` ON `productimage`.`product`=`product`.`id`","WHERE `dea_orderproduct`.`order`='$id' GROUP BY `product`.`id`");
	$this->load->view("json",$data);
	}

	public function createorderproduct()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="createorderproduct";
			$data['product']=$this->product_model->getproductdropdown();
					$data['order']=$this->deaorder_model->getdeaorderdropdown();
	$data["title"]="Create orderproduct";
	$this->load->view("template",$data);
	}
	public function createorderproductsubmit()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->form_validation->set_rules("product","Product","trim");
	$this->form_validation->set_rules("order","Order","trim");
	$this->form_validation->set_rules("quantity","Quantity","trim");
	$this->form_validation->set_rules("price","Price","trim");
	if($this->form_validation->run()==FALSE)
	{
	$data["alerterror"]=validation_errors();
	$data["page"]="createorderproduct";
			$data['product']=$this->product_model->getproductdropdown();
				$data['order']=$this->deaorder_model->getdeaorderdropdown();
	$data["title"]="Create orderproduct";
	$this->load->view("template",$data);
	}
	else
	{
	$product=$this->input->get_post("product");
	$order=$this->input->get_post("order");
	$quantity=$this->input->get_post("quantity");
	$price=$this->input->get_post("price");
	if($this->orderproduct_model->create($product,$order,$quantity,$price)==0)
	$data["alerterror"]="New orderproduct could not be created.";
	else
	$data["alertsuccess"]="orderproduct created Successfully.";
	$data["redirect"]="site/vieworderproduct?id=".$order;
	$this->load->view("redirect2",$data);
	}
	}
	public function editorderproduct()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="editorderproduct";
	$data["title"]="Edit orderproduct";
			$data['product']=$this->product_model->getproductdropdown();
				$data['order']=$this->deaorder_model->getdeaorderdropdown();
	$data["before"]=$this->orderproduct_model->beforeedit($this->input->get("id"));
	$this->load->view("template",$data);
	}
	public function editorderproductsubmit()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->form_validation->set_rules("id","ID","trim");
	$this->form_validation->set_rules("product","Product","trim");
	$this->form_validation->set_rules("order","Order","trim");
	$this->form_validation->set_rules("quantity","Quantity","trim");
	$this->form_validation->set_rules("price","Price","trim");
	if($this->form_validation->run()==FALSE)
	{
	$data["alerterror"]=validation_errors();
	$data["page"]="editorderproduct";
	$data["title"]="Edit orderproduct";
			$data['product']=$this->product_model->getproductdropdown();
				$data['order']=$this->deaorder_model->getdeaorderdropdown();
	$data["before"]=$this->orderproduct_model->beforeedit($this->input->get("id"));
	$this->load->view("template",$data);
	}
	else
	{
	$id=$this->input->get_post("id");
	$product=$this->input->get_post("product");
	$order=$this->input->get_post("order");
	$quantity=$this->input->get_post("quantity");
	$price=$this->input->get_post("price");
	if($this->orderproduct_model->edit($id,$product,$order,$quantity,$price)==0)
	$data["alerterror"]="New orderproduct could not be Updated.";
	else
	$data["alertsuccess"]="orderproduct Updated Successfully.";
	$data["redirect"]="site/vieworderproduct?id=".$order;
	$this->load->view("redirect2",$data);
	}
	}
	public function deleteorderproduct()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->orderproduct_model->delete($this->input->get("id"));
	$data["redirect"]="site/vieworderproduct?id=".$this->input->get("deaorder");
	$this->load->view("redirect2",$data);
	}
	public function viewsales()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="viewsales";
	$data["base_url"]=site_url("site/viewsalesjson");
	$data["title"]="View sales";
	$this->load->view("template",$data);
	}
	function viewsalesjson()
	{
	$elements=array();
	$elements[0]=new stdClass();
	$elements[0]->field="`dea_sales`.`id`";
	$elements[0]->sort="1";
	$elements[0]->header="ID";
	$elements[0]->alias="id";
	$elements[1]=new stdClass();
	$elements[1]->field="`dea_sales`.`name`";
	$elements[1]->sort="1";
	$elements[1]->header="Name";
	$elements[1]->alias="name";
	$elements[2]=new stdClass();
	$elements[2]->field="`dea_sales`.`image`";
	$elements[2]->sort="1";
	$elements[2]->header="Image";
	$elements[2]->alias="image";
	$elements[3]=new stdClass();
	$elements[3]->field="`dea_sales`.`email`";
	$elements[3]->sort="1";
	$elements[3]->header="Email";
	$elements[3]->alias="email";
	$elements[4]=new stdClass();
	$elements[4]->field="`dea_sales`.`password`";
	$elements[4]->sort="1";
	$elements[4]->header="Password";
	$elements[4]->alias="password";
	$elements[5]=new stdClass();
	$elements[5]->field="`dea_sales`.`creationdate`";
	$elements[5]->sort="1";
	$elements[5]->header="Creation Date";
	$elements[5]->alias="creationdate";
	$elements[6]=new stdClass();
	$elements[6]->field="`dea_sales`.`modificationdate`";
	$elements[6]->sort="1";
	$elements[6]->header="Modification Date";
	$elements[6]->alias="modificationdate";
	$search=$this->input->get_post("search");
	$pageno=$this->input->get_post("pageno");
	$orderby=$this->input->get_post("orderby");
	$orderorder=$this->input->get_post("orderorder");
	$maxrow=$this->input->get_post("maxrow");
	if($maxrow=="")
	{
	$maxrow=20;
	}
	if($orderby=="")
	{
	$orderby="id";
	$orderorder="ASC";
	}
	$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `dea_sales`");
	$this->load->view("json",$data);
	}

	public function createsales()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="createsales";
	$data["title"]="Create sales";
	$this->load->view("template",$data);
	}
	public function createsalessubmit()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->form_validation->set_rules("name","Name","trim");
	$this->form_validation->set_rules("email","Email","trim");
	$this->form_validation->set_rules("password","Password","trim");
	$this->form_validation->set_rules("creationdate","Creation Date","trim");
	$this->form_validation->set_rules("modificationdate","Modification Date","trim");
	if($this->form_validation->run()==FALSE)
	{
	$data["alerterror"]=validation_errors();
	$data["page"]="createsales";
	$data["title"]="Create sales";
	$this->load->view("template",$data);
	}
	else
	{
	$name=$this->input->get_post("name");
	$email=$this->input->get_post("email");
	$password=$this->input->get_post("password");
	$creationdate=$this->input->get_post("creationdate");
	$modificationdate=$this->input->get_post("modificationdate");
	$config['upload_path'] = './uploads/';
$config['allowed_types'] = 'gif|jpg|png|jpeg';
$this->load->library('upload', $config);
$filename="image";
$image="";
if (  $this->upload->do_upload($filename))
{
$uploaddata = $this->upload->data();
$image=$uploaddata['file_name'];

			$config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
			$config_r['maintain_ratio'] = TRUE;
			$config_t['create_thumb'] = FALSE;///add this
			$config_r['width']   = 800;
			$config_r['height'] = 800;
			$config_r['quality']    = 100;
			//end of configs

			$this->load->library('image_lib', $config_r);
			$this->image_lib->initialize($config_r);
			if(!$this->image_lib->resize())
			{
					echo "Failed." . $this->image_lib->display_errors();
					//return false;
			}
			else
			{
					//print_r($this->image_lib->dest_image);
					//dest_image
					$image=$this->image_lib->dest_image;
					//return false;
			}

}
	if($this->sales_model->create($name,$image,$email,$password,$creationdate,$modificationdate)==0)
	$data["alerterror"]="New sales could not be created.";
	else
	$data["alertsuccess"]="sales created Successfully.";
	$data["redirect"]="site/viewsales";
	$this->load->view("redirect",$data);
	}
	}
	public function editsales()
	{
	$access=array("1");
	$this->checkaccess($access);
	$data["page"]="editsales";
	$data["title"]="Edit sales";
	$data["before"]=$this->sales_model->beforeedit($this->input->get("id"));
	$this->load->view("template",$data);
	}
	public function editsalessubmit()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->form_validation->set_rules("id","ID","trim");
	$this->form_validation->set_rules("name","Name","trim");
	$this->form_validation->set_rules("email","Email","trim");
	$this->form_validation->set_rules("password","Password","trim");
	$this->form_validation->set_rules("creationdate","Creation Date","trim");
	$this->form_validation->set_rules("modificationdate","Modification Date","trim");
	if($this->form_validation->run()==FALSE)
	{
	$data["alerterror"]=validation_errors();
	$data["page"]="editsales";
	$data["title"]="Edit sales";
	$data["before"]=$this->sales_model->beforeedit($this->input->get("id"));
	$this->load->view("template",$data);
	}
	else
	{
	$id=$this->input->get_post("id");
	$name=$this->input->get_post("name");
	$email=$this->input->get_post("email");
	$password=$this->input->get_post("password");
	$creationdate=$this->input->get_post("creationdate");
	$modificationdate=$this->input->get_post("modificationdate");
	$config['upload_path'] = './uploads/';
$config['allowed_types'] = 'gif|jpg|png|jpeg';
$this->load->library('upload', $config);
$filename="image";
$image="";
if (  $this->upload->do_upload($filename))
{
$uploaddata = $this->upload->data();
$image=$uploaddata['file_name'];

			$config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
			$config_r['maintain_ratio'] = TRUE;
			$config_t['create_thumb'] = FALSE;///add this
			$config_r['width']   = 800;
			$config_r['height'] = 800;
			$config_r['quality']    = 100;
			//end of configs

			$this->load->library('image_lib', $config_r);
			$this->image_lib->initialize($config_r);
			if(!$this->image_lib->resize())
			{
					echo "Failed." . $this->image_lib->display_errors();
					//return false;
			}
			else
			{
					//print_r($this->image_lib->dest_image);
					//dest_image
					$image=$this->image_lib->dest_image;
					//return false;
			}

}

	if($image=="")
	{
	$image=$this->sales_model->getimagebyid($id);
		 // print_r($image);
			$image=$image->image;
	}
	if($this->sales_model->edit($id,$name,$image,$email,$password,$creationdate,$modificationdate)==0)
	$data["alerterror"]="New sales could not be Updated.";
	else
	$data["alertsuccess"]="sales Updated Successfully.";
	$data["redirect"]="site/viewsales";
	$this->load->view("redirect",$data);
	}
	}
	public function deletesales()
	{
	$access=array("1");
	$this->checkaccess($access);
	$this->sales_model->delete($this->input->get("id"));
	$data["redirect"]="site/viewsales";
	$this->load->view("redirect",$data);
	}



}
?>
