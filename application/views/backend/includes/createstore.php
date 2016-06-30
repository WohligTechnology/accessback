<div id="page-title">
<a href="<?php echo site_url("site/viewstore"); ?>" class="btn btn-primary btn-labeled fa fa-arrow-left margined pull-right">Back</a>
<h1 class="page-header text-overflow">Store & Sales Details  </h1>
</div>
<div id="page-content">
<div class="row">
<div class="col-lg-12">
<section class="panel">
<div class="panel-heading">
<h3 class="panel-title">
Create store </h3>
</div>
<div class="panel-body">
<form class='form-horizontal tasi-form' method='post' action='<?php echo site_url("site/createstoresubmit");?>' enctype= 'multipart/form-data'>
<div class="panel-body">
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Store Name</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="storename" value='<?php echo set_value('storename');?>'>
</div>
</div>
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Logo</label>
<div class="col-sm-4">
<input type="file" id="normal-field" class="form-control" name="image" value='<?php echo set_value('image');?>'>
</div>
</div>
<div class=" form-group">
  <label class="col-sm-2 control-label">Select Accesslevel</label>
  <div class="col-sm-4">
  <?php 	 echo form_dropdown('accesslevel',$accesslevel,set_value('accesslevel'),'class="chzn-select form-control" 	data-placeholder="Choose a Accesslevel..."');
  ?>
  </div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Owner Name</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="ownername" value='<?php echo set_value('ownername');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">City</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="city" value='<?php echo set_value('city');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">State</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="state" value='<?php echo set_value('state');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Pincode</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="pincode" value='<?php echo set_value('pincode');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Phone</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="phone" value='<?php echo set_value('phone');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Email</label>
<div class="col-sm-4">
<input type="email" id="normal-field" class="form-control" name="email" value='<?php echo set_value('email');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Password</label>
<div class="col-sm-4">
<input type="password" id="normal-field" class="form-control" name="password" value='<?php echo set_value('password');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Latitude</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="lat" value='<?php echo set_value('lat');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">longitude</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="long" value='<?php echo set_value('long');?>'>
</div>
</div>
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Address</label>
<div class="col-sm-8">
<textarea name="address" id="" cols="20" rows="10" class="form-control "><?php echo set_value( 'address');?></textarea>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Form of company</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="formofcompany" value='<?php echo set_value('formofcompany');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Shipping Address</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shippingaddress" value='<?php echo set_value('shippingaddress');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Vat</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="vat" value='<?php echo set_value('vat');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Cst</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="cst" value='<?php echo set_value('cst');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Purchase Manager</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="manager" value='<?php echo set_value('manager');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Website</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="website" value='<?php echo set_value('website');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Facebook</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="facebook" value='<?php echo set_value('facebook');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Twitter</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="twitter" value='<?php echo set_value('twitter');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Instagram</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="insta" value='<?php echo set_value('insta');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Google</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="google" value='<?php echo set_value('google');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Pan no.</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="pan" value='<?php echo set_value('pan');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Shop Time</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shoptime" value='<?php echo set_value('shoptime');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Payment Collection Time</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="paymentcollectiontime" value='<?php echo set_value('paymentcollectiontime');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Shop Closed On</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shopclosedon" value='<?php echo set_value('shopclosedon');?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">&nbsp;</label>
<div class="col-sm-4">
<button type="submit" class="btn btn-primary">Save</button>
<a href="<?php echo site_url("site/viewstore"); ?>" class="btn btn-secondary">Cancel</a>
</div>
</div>
</form>
</div>
</section>
</div>
</div>
</div>
