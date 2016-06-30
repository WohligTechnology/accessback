<div id="page-title">
<!-- <a class="btn btn-primary btn-labeled fa fa-plus margined pull-right" href="<?php echo site_url("site/createdeaorder"); ?>">Create</a> -->
<h1 class="page-header text-overflow">Store Order Details </h1>
</div>
<div id="page-content">
<div class="row">
<div class="col-lg-12">
<div class="panel drawchintantable">
<?php $this->chintantable->createsearch("Store Order List");?>
<div class="fixed-table-container">
<div class="fixed-table-body">
<table class="table table-hover" id="" cellpadding="0" cellspacing="0">
<thead>
<tr>
<th data-field="id">ID</th>
<th data-field="store">Store</th>
<th data-field="paymentstatus">Payment Status</th>
<th data-field="sales">Sales</th>
<th data-field="finalamount">Final Amount</th>
<th data-field="approve">Approval</th>
<!-- <th data-field="saledealer">Dealer name</th> -->
<!-- <th data-field="firstname">First Name</th>
<th data-field="lastname">Last Name</th>
<th data-field="email">Email</th> -->
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
  if(resultrow.paymentstatus==1){
resultrow.paymentstatus="CDC";
  }
  else if(resultrow.paymentstatus==2){
    resultrow.paymentstatus="7 days";
  }
  else if(resultrow.paymentstatus==3){
    resultrow.paymentstatus="15 days";
  }
  else if(resultrow.paymentstatus==4){
    resultrow.paymentstatus="21 days";
  }
  else if(resultrow.paymentstatus==5){
    resultrow.paymentstatus="30 days";
  }

  if(resultrow.approve==1){
resultrow.approve="Approved";
  }
  else if(resultrow.approve==2){
    resultrow.approve="Not Approved";
  }

  if(resultrow.sales!=0){
resultrow.sales="By sales Person";
// resultrow.store=resultrow.storename;
  }
  else {
    resultrow.sales="By Dealer himself";
    // resultrow.store=resultrow.store;
    resultrow.saledealer='';
  }


  if(resultrow.store==""){

  }
  else {
    resultrow.store=resultrow.store;
  }
return "<tr><td>" + resultrow.id + "</td><td>" + resultrow.store + "</td><td>" + resultrow.paymentstatus + "</td><td>" + resultrow.sales + "</td><td>" + resultrow.finalamount + "</td><td>" + resultrow.approve + "</td><td><a class='btn btn-primary btn-xs' href='<?php echo site_url('site/editdeaorder?id=');?>"+resultrow.id+"'><i class='icon-pencil'></i></a><a class='btn btn-danger btn-xs' onclick=return confirm(\"Are you sure you want to delete?\") href='<?php echo site_url('site/deletedeaorder?id='); ?>"+resultrow.id+"'><i class='icon-trash '></i></a></td></tr>";
}
generatejquery("<?php echo $base_url;?>");
</script>
</div>
</div>
