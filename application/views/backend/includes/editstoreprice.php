<section class="panel">
<header class="panel-heading">
<h3 class="panel-title">storeprice Details </h3>
</header>
<div class="panel-body">
<form class='form-horizontal tasi-form' method='post' action='<?php echo site_url("site/editstorepricesubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Store Id</label>
<div class="col-sm-4">
<?php echo form_dropdown("storeid",$storeid,set_value('storeid',$before->storeid),"class='chzn-select form-control'");?>
</div>
</div>
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Product Id</label>
<div class="col-sm-4">
<?php echo form_dropdown("productid",$productid,set_value('productid',$before->productid),"class='chzn-select form-control'");?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">Price</label>
<div class="col-sm-4">
<input type="text" id="normal-field" class="form-control" name="price" value='<?php echo set_value('price',$before->price);?>'>
</div>
</div>
<div class=" form-group">
<label class="col-sm-2 control-label" for="normal-field">Order Id</label>
<div class="col-sm-4">
<?php echo form_dropdown("orderid",$orderid,set_value('orderid',$before->orderid),"class='chzn-select form-control'");?>
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
<div class="form-group">
<label class="col-sm-2 control-label" for="normal-field">&nbsp;</label>
<div class="col-sm-4">
<button type="submit" class="btn btn-primary">Save</button>
<a href='<?php echo site_url("site/viewstoreprice"); ?>' class='btn btn-secondary'>Cancel</a>
</div>
</div>
</form>
</div>
</section>
