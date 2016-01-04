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

    <div class="row">
        <div class="form-group">
            <label class="col-sm-2 control-label" for="normal-field"><strong>Select Month</strong></label>
            <div class="col-sm-4">
                <select id='gMonth2' name="month">
                    <option value=''>--Select Month--</option>
                    <option selected value='1'>Janaury</option>
                    <option value='2'>February</option>
                    <option value='3'>March</option>
                    <option value='4'>April</option>
                    <option value='5'>May</option>
                    <option value='6'>June</option>
                    <option value='7'>July</option>
                    <option value='8'>August</option>
                    <option value='9'>September</option>
                    <option value='10'>October</option>
                    <option value='11'>November</option>
                    <option value='12'>December</option>
                </select>
            </div>
        </div>



        <div class="form-group">
            <label class="col-sm-2 control-label" for="normal-field"><strong>Select Year</strong></label>
            <div class="col-sm-4">
                <!--                <input type="date" id="normal-field" class="form-control" name="orderdate" value='<?php echo set_value(' orderdate ',$orderdate);?>'>-->
                <select id="birthyear" name="year">
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028">2028</option>
                    <option value="2029">2029</option>
                    <option value="2030">2030</option>
                    <option value="2031">2031</option>
                    <option value="2032">2032</option>
                    <option value="2033">2033</option>
                    <option value="2034">2034</option>
                    <option value="2035">2035</option>
                    <option value="2036">2036</option>
                    <option value="2037">2037</option>
                    <option value="2038">2038</option>
                    <option value="2039">2039</option>
                    <option value="2040">2040</option>
                </select>
            </div>
        </div>
    </div>
    <button type="submit" class="btn btn-info">Submit</button>
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
                var image = "<a class='img-center' href='<?php echo base_url('uploads').'/'; ?>" + resultrow.image + "' ><img src='<?php echo base_url('uploads').'/'; ?>" + resultrow.image + "'></a>";
                if (resultrow.image == "") {
                    image = "No Receipt Available";
                }
                return "<tr><td>" + resultrow.order + "</td><td><a href='http://accessworld.in/#/productdetail/" + resultrow.productid + "' target='_blank'>" + resultrow.product + "</a></td><td>" + image + "</td><td>" + resultrow.productid + "</td></tr>";
                //            <a href='http://accessworld.in/#/productdetail/158'></a>
            }
            generatejquery("<?php echo $base_url;?>");
        </script>
    </div>
</div>