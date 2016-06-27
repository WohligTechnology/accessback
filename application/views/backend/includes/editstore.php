<section class="panel">
<header class="panel-heading">
<h3 class="panel-title">Store & Sales Details </h3>
</header>
<div class="panel-body">
<form class='form-horizontal tasi-form' method='post' action='<?php echo site_url("site/editstoresubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Store Name</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="storename" value='<?php echo set_value('storename',$before->storename);?>'>
</div>
</div>
<div class=" form-group">
  <label class="col-sm-2 control-label" for="normal-field">Logo</label>
  <div class="col-sm-4">
  <input type="file" id="normal-field" class="form-control" name="image" value="<?php echo set_value('image',$before->image);?>">
  <?php if($before->image == "")
     { }
     else
     { ?>
      <img src="<?php echo base_url('uploads')."/".$before->image; ?>" width="140px" height="140px">
    <?php }
  ?>
  </div>
</div>
<div class="form-group">
  <label class="col-sm-2 control-label">Select Accesslevel</label>
  <div class="col-sm-4">
  <?php  	 echo form_dropdown('accesslevel',$accesslevel,set_value('accesslevel',$before->accesslevel),'class="chzn-select form-control" 	data-placeholder="Choose a Accesslevel..."');
  ?>
  </div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Owner Name</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="ownername" value='<?php echo set_value('ownername',$before->ownername);?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">City</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="city" value='<?php echo set_value('city',$before->city);?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">State</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="state" value='<?php echo set_value('state',$before->state);?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Pincode</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="pincode" value='<?php echo set_value('pincode',$before->pincode);?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Phone</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="phone" value='<?php echo set_value('phone',$before->phone);?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Email</label>
<div class="col-sm-4">
<input type="email" id="normal-field" class="form-control" name="email" value='<?php echo set_value('email',$before->email);?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Password</label>
<div class="col-sm-4">
<input type="password" id="normal-field" class="form-control" name="password" value='<?php echo set_value('password',$before->password);?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Latitude</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="lat" value='<?php echo set_value('lat',$before->lat);?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">longitude</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="long" value='<?php echo set_value('long',$before->long);?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Creation Date</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="creationdate" value='<?php echo set_value('creationdate',$before->creationdate);?>'>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Modification Date</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="modificationdate" value='<?php echo set_value('modificationdate',$before->modificationdate);?>'>
</div>
</div>
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Address</label>
<div class="col-sm-8">
<textarea name="address" id="" cols="20" rows="10" class="form-control"><?php echo set_value( 'address',$before->address);?></textarea>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">&nbsp;</label>
<div class="col-sm-4">
<button type="submit" class="btn btn-primary">Save</button>
<a href='<?php echo site_url("site/viewstore"); ?>' class='btn btn-secondary'>Cancel</a>
</div>
</div>
</form>
</div>
</section>
