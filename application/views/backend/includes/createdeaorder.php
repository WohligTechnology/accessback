<div id="page-title">
<a href="<?php echo site_url("site/vieworder"); ?>" class="btn btn-primary btn-labeled fa fa-arrow-left margined pull-right">Back</a>
<h1 class="page-header text-overflow">order Details </h1>
</div>
<div id="page-content">
<div class="row">
<div class="col-lg-12">
<section class="panel">
<div class="panel-heading">
<h3 class="panel-title">
Create order </h3>
</div>
<div class="panel-body">
<form class='form-horizontal tasi-form' method='post' action='<?php echo site_url("site/createordersubmit");?>' enctype= 'multipart/form-data'>
<div class="panel-body">
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Store</label>
<div class="col-sm-4">
<?php echo form_dropdown("store",$store,set_value('store'),"class='chzn-select form-control'");?>
</div>
</div>
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Payment Status</label>
<div class="col-sm-4">
<?php echo form_dropdown("paymentstatus",$paymentstatus,set_value('paymentstatus'),"class='chzn-select form-control'");?>
</div>
</div>
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Sales</label>
<div class="col-sm-4">
<?php echo form_dropdown("sales",$sales,set_value('sales'),"class='chzn-select form-control'");?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">First Name</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="firstname" value='<?php echo set_value('firstname');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Last Name</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="lastname" value='<?php echo set_value('lastname');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Email</label>
<div class="col-sm-4">
<input type="email" id="normal-field" class="form-control" name="email" value='<?php echo set_value('email');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Billing City</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="billingcity" value='<?php echo set_value('billingcity');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Billing State</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="billingstate" value='<?php echo set_value('billingstate');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Billing Country</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="billingcountry" value='<?php echo set_value('billingcountry');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Billing Contact</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="billingcontact" value='<?php echo set_value('billingcontact');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Billing Pincode</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="billingpincode" value='<?php echo set_value('billingpincode');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Shipping City</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shippingcity" value='<?php echo set_value('shippingcity');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Shipping State</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shippingstate" value='<?php echo set_value('shippingstate');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Shipping Country</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shippingcountry" value='<?php echo set_value('shippingcountry');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Shipping Contact</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shippingcontact" value='<?php echo set_value('shippingcontact');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Shipping Pincode</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shippingpincode" value='<?php echo set_value('shippingpincode');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">longitude</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="long" value='<?php echo set_value('long');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Password</label>
<div class="col-sm-4">
<input type="password" id="normal-field" class="form-control" name="password" value='<?php echo set_value('password');?>'>
</div>
</div>
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Billing Address</label>
<div class="col-sm-8">
<textarea name="billingaddress" id="" cols="20" rows="10" class="form-control"><?php echo set_value( 'billingaddress');?></textarea>
</div>
</div>
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Shipping Address</label>
<div class="col-sm-8">
<textarea name="shippingaddress" id="" cols="20" rows="10" class="form-control"><?php echo set_value( 'shippingaddress');?></textarea>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">&nbsp;</label>
<div class="col-sm-4">
<button type="submit" class="btn btn-primary">Save</button>
<a href="<?php echo site_url("site/vieworder"); ?>" class="btn btn-secondary">Cancel</a>
</div>
</div>
</form>
</div>
</section>
</div>
</div>
</div>
