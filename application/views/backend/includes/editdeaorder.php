<section class="panel">
<header class="panel-heading">
<h3 class="panel-title">Store Order Details </h3>
</header>
<div class="panel-body">
<form class='form-horizontal tasi-form' method='post' action='<?php echo site_url("site/editdeaordersubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Store</label>
<div class="col-sm-4">
<?php echo form_dropdown("store",$store,set_value('store',$before->store),"class='chzn-select form-control'");?>
</div>
</div>
<div class=" form-group" >
<label class="col-sm-2 control-label" for="normal-field">Payment Status</label>
<div class="col-sm-4">
<?php echo form_dropdown("paymentstatus",$paymentstatus,set_value('paymentstatus',$before->paymentstatus),"class='chzn-select form-control'");?>
</div>
</div>
<div class=" form-group" >
<label class="col-sm-2 control-label" for="normal-field">Approve Order</label>
<div class="col-sm-4">
<?php echo form_dropdown("approve",$approve,set_value('approve',$before->approve),"class='chzn-select form-control'");?>
</div>
</div>
<div class=" form-group" >
<label class="col-sm-2 control-label" for="normal-field">Dealer Name</label>
<div class="col-sm-4">
<?php echo form_dropdown("saledealer",$saledealer,set_value('saledealer',$before->saledealer),"class='chzn-select form-control'");?>
</div>
</div>
<div class=" form-group" >
<label class="col-sm-2 control-label" for="normal-field">Final Amount</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" readonly="true" name="finalamount" value='<?php echo set_value('finalamount',$before->finalamount);?>'>
</div>
</div>
<div class=" form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Sales</label>
<div class="col-sm-4">
<?php echo form_dropdown("sales",$sales,set_value('sales',$before->sales),"class='chzn-select form-control'");?>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">First Name</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="firstname" value='<?php echo set_value('firstname',$before->firstname);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Last Name</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="lastname" value='<?php echo set_value('lastname',$before->lastname);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Email</label>
<div class="col-sm-4">
<input type="email" id="normal-field" class="form-control" name="email" value='<?php echo set_value('email',$before->email);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Billing City</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="billingcity" value='<?php echo set_value('billingcity',$before->billingcity);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Billing State</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="billingstate" value='<?php echo set_value('billingstate',$before->billingstate);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Billing Country</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="billingcountry" value='<?php echo set_value('billingcountry',$before->billingcountry);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Billing Contact</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="billingcontact" value='<?php echo set_value('billingcontact',$before->billingcontact);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Billing Pincode</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="billingpincode" value='<?php echo set_value('billingpincode',$before->billingpincode);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Shipping City</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shippingcity" value='<?php echo set_value('shippingcity',$before->shippingcity);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Shipping State</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shippingstate" value='<?php echo set_value('shippingstate',$before->shippingstate);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Shipping Country</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shippingcountry" value='<?php echo set_value('shippingcountry',$before->shippingcountry);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Shipping Contact</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shippingcontact" value='<?php echo set_value('shippingcontact',$before->shippingcontact);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Shipping Pincode</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="shippingpincode" value='<?php echo set_value('shippingpincode',$before->shippingpincode);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">longitude</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="long" value='<?php echo set_value('long',$before->long);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Password</label>
<div class="col-sm-4">
<input type="password" id="normal-field" class="form-control" name="password" value='<?php echo set_value('password',$before->password);?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Creation Date</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="creationdate" value='<?php echo set_value('creationdate',$before->creationdate);?>'>
</div>
</div>
<div class="form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Modification Date</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="modificationdate" value='<?php echo set_value('modificationdate',$before->modificationdate);?>'>
</div>
</div>
<div class=" form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Billing Address</label>
<div class="col-sm-8">
<textarea name="billingaddress" id="" cols="20" rows="10" class="form-control "><?php echo set_value( 'billingaddress',$before->billingaddress);?></textarea>
</div>
</div>
<div class=" form-group" style="display:none">
<label class="col-sm-2 control-label" for="normal-field">Shipping Address</label>
<div class="col-sm-8">
<textarea name="shippingaddress" id="" cols="20" rows="10" class="form-control "><?php echo set_value( 'shippingaddress',$before->shippingaddress);?></textarea>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">&nbsp;</label>
<div class="col-sm-4">
<button type="submit" class="btn btn-primary">Save</button>
<a href='<?php echo site_url("site/viewdeaorder"); ?>' class='btn btn-secondary'>Cancel</a>
</div>
</div>
</form>
</div>
</section>
