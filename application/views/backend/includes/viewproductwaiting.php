<div class="col-md-12">
    <h4>Maximum 4 Products Only</h4>
	<div class=" pull-right col-md-1 createbtn" ><a class="btn btn-primary" href="<?php echo site_url('site/createproductwaiting'); ?>"><i class="icon-plus"></i>Create </a></div>
	</div>
		<section class="panel">
			<header class="panel-heading">
                Product Waiting 
            </header>
			
			<table class="table table-striped table-hover border-top " id="sample_1" cellpadding="0" cellspacing="0" >
			<thead>
				<tr>
					<th>Product</th>
					<th>Action</th>
					
				</tr>
			</thead>
			<tbody>
			   <?php foreach($table as $row) { ?>
					<tr>
						<!--<td><?php echo $row->id; ?></td>-->
						<td><?php echo $row->name; ?></td>
						<td> 
                           <a class="btn btn-primary btn-xs" href="<?php echo site_url('site/editproductwaiting?id=').$row->id;?>"><i class="icon-pencil"></i></a>
                            <a class="btn btn-danger btn-xs" href="<?php echo site_url('site/deleteproductwaiting?id=').$row->id; ?>" onclick="return confirm('Are you sure?')"><i class="icon-trash "></i></a>
									 
					   </td>
					</tr>
					<?php } ?>
			</tbody>
			</table>
		</section>
	