<div class="col-lg-3 col-sm-3">
    <section class="panel">
        <div class="symbol terques">
            <i class="icon-user"></i>
        </div>
        <div class="value">
            <p>Total Users </p>
            <h1><?php echo $usercount; ?></h1>

        </div>

    </section>
</div>

<div class="col-lg-3 col-sm-3">
    <section class="panel">
        <div class="symbol terques">
            <i class="icon-user"></i>
        </div>
        <div class="value">
            <p>Monthly sales </p>
            <h1><?php echo $monthlysales; ?></h1>

        </div>

    </section>
</div>

<form method="post" action="<?php echo site_url('site/getDate');?>">
    <div class="row">
        <div class="form-group">
            <label class="col-sm-2 control-label" for="normal-field"><strong>Enter Date</strong></label>
            <div class="col-sm-4">
                <input type="date" id="normal-field" class="form-control" name="orderdate" value='<?php echo set_value(' orderdate ',$orderdate);?>'>
            </div>
        </div>
    </div>

    <button type="submit" class="btn btn-info" style="
    float: right;
    margin-top: -63px;">Submit</button>
</form>




<div class="showtable">
    <div class=" row" style="padding:1% 0;">
        <div class="col-md-10">
            <div class=" pull-right col-md-1 createbtn"><a class="btn btn-primary" href="<?php echo site_url('site/exportdateordercsv?date='.$orderdate); ?>" target="_blank"><i class="icon-plus"></i>Export to CSV </a></div>
        </div>

        <div class=" pull-right col-md-1 createbtn"><a class="btn btn-primary" href="<?php echo site_url('site/index'); ?>"><i class="icon-logn-arrow-left"></i>Back </a></div>
    </div>
    <div id="page-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel drawchintantable">
                    <?php $this->chintantable->createsearch("Ordered Product List");?>
                        <div class="fixed-table-container">
                            <div class="fixed-table-body">
                                <table class="table table-hover" id="" cellpadding="0" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th data-field="order">Order No</th>
                                            <th data-field="product">Product</th>
                                            <th data-field="image">Image</th>
                                            <th data-field="quantity">Quantity</th>
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
              var image="<a href='<?php echo base_url('uploads').'/'; ?>"+resultrow.image+"' target='_blank'><img src='<?php echo base_url('uploads').'/'; ?>"+resultrow.image+"' width='80px' height='80px'></a>";
                if(resultrow.image=="")
                {
                image="No Receipt Available";
                }
                return "<tr><td>" + resultrow.order + "</td><td><a href='http://accessworld.in/#/productdetail/" + resultrow.productid + "' target='_blank'>" + resultrow.product + "</a></td><td>" + image + "</td><td>" + resultrow.quantity + "</td></tr>";
                //            <a href='http://accessworld.in/#/productdetail/158'></a>
            }
            generatejquery("<?php echo $base_url;?>");
        </script>
    </div>
</div>