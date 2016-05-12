<div id="page-title">
<a class="btn btn-primary btn-labeled fa fa-plus margined pull-right" href="<?php echo site_url("site/createdeaorder"); ?>">Create</a>
<h1 class="page-header text-overflow">order Details </h1>
</div>
<div id="page-content">
<div class="row">
<div class="col-lg-12">
<div class="panel drawchintantable">
<?php $this->chintantable->createsearch("order List");?>
<div class="fixed-table-container">
<div class="fixed-table-body">
<table class="table table-hover" id="" cellpadding="0" cellspacing="0">
<thead>
<tr>
<th data-field="id">ID</th>
<th data-field="store">Store</th>
<th data-field="paymentstatus">Payment Status</th>
<th data-field="sales">Sales</th>
<th data-field="firstname">First Name</th>
<th data-field="lastname">Last Name</th>
<th data-field="email">Email</th>
<!-- <th data-field="billingcity">Billing City</th>
<th data-field="billingstate">Billing State</th>
<th data-field="billingcountry">Billing Country</th>
<th data-field="billingcontact">Billing Contact</th>
<th data-field="billingpincode">Billing Pincode</th>
<th data-field="shippingcity">Shipping City</th>
<th data-field="shippingstate">Shipping State</th>
<th data-field="shippingcountry">Shipping Country</th>
<th data-field="shippingcontact">Shipping Contact</th>
<th data-field="shippingpincode">Shipping Pincode</th>
<th data-field="long">longitude</th>
<th data-field="password">Password</th>
<th data-field="creationdate">Creation Date</th>
<th data-field="modificationdate">Modification Date</th>
<th data-field="billingaddress">Billing Address</th>
<th data-field="shippingaddress">Shipping Address</th> -->
</tr>
</thead>
<tbody>
</tbody>
</table>
</div>
<div class="fixed-table-pagination" style="display: block;">
<div class="pull-left pagination-detail">
<?php $this->chintantable->createpagination();?>
</div>
</div>
</div>
</div>
</div>
</div>
<script>
function drawtable(resultrow) {
return "<tr><td>" + resultrow.id + "</td><td>" + resultrow.store + "</td><td>" + resultrow.paymentstatus + "</td><td>" + resultrow.sales + "</td><td>" + resultrow.firstname + "</td><td>" + resultrow.lastname + "</td><td>" + resultrow.email + "</td><td><a class='btn btn-primary btn-xs' href='<?php echo site_url('site/editorder?id=');?>"+resultrow.id+"'><i class='icon-pencil'></i></a><a class='btn btn-danger btn-xs' onclick=return confirm(\"Are you sure you want to delete?\") href='<?php echo site_url('site/deleteorder?id='); ?>"+resultrow.id+"'><i class='icon-trash '></i></a></td></tr>";
}
generatejquery("<?php echo $base_url;?>");
</script>
</div>
</div>
