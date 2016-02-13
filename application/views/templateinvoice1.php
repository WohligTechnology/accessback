
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <title>Bill</title>
  <style>
    body {
      font-size: 12px;
    }

    .size {
      font-size: 10px;
    }

    .size1 {
      font-size: 9px;
    }

    .bor {
      border: 1px solid #000;
    }

    .bor1 {
      border: 1px solid #000;
      height: 45px;
    }

    .bor2 {
      border: 1px solid #000;
      height: 90px;
    }

    .padd {
      padding: 0px;
    }

    .padd1 {
      padding: 5px;
    }

    .mar {
      margin: 0px;
    }

    .arr p {
      margin: 0;
    }

    .arr1 p {
      margin: 0;
      font-size: 11px;
    }

    th {
      border: 1px solid #000;
      text-align: center;
      font-weight: normal;
      vertical-align: top;
    }

    tfoot {
      border: 1px solid #000;
      border-bottom: none;
    }

    tfoot td {
      padding: 5px;
    }

    .arr1 {
      display: inline-block;
    }

    .arr {
      display: inline-block;
    }

    tbody tr td {
      padding: 0 5px 0 5px;
    }
  </style>
</head>

<body>
  <div class="container">
    <div>
      <h4 class="text-center" style="margin:0px"><b>INVOICE FOR ACCESS</b></h4>
    </div>
    <div class="row">
      <div class="col-xs-6">
        <div>
          <div class="row bor">
            <div class="col-xs-4" style="padding-right:0px;padding-left:3px;padding-top:2px">
              <img src="<?php echo base_url('uploads/logoaccess.png'); ?>" alt="logo" width="98.5" height="30">
            </div>
            <div class="col-xs-8" style="padding:0px 10px 0px 10px;">
              <div class="arr1">
                <p style="font-size:16"><b>Access</b></p>
                <p>19/20,Ganga Building,1st Floor</p>
                <p>Old Topiwala Lane,</p>
                <p>Off.Lamington Road</p>
                <p>Grant Road(E),Mumbai-400007.</p>
                <p>Tel.No.-022-23840789/ 809/ 810</p>
                <p>E-Mail: accessinfoworld@vsnl.com</p>
              </div>
            </div>
             <div class="bor">


            </div> 
          </div>
        </div>
        <div class="row">
          <div class="bor" style="border-top:none;padding-top:3px;">
            <div class="arr" style="padding-left:5px">
              <p><?php echo $order->firstname; ?> <?php echo $order->lastname; ?></p>
<!--              <p style="font-size:16"><b>ACCESS - MKC</b></p>-->
              <p><?php echo $order->billingaddress; ?></p>
              <p><?php echo $order->billingcity;?></p> - <p> <?php echo $order->billingpincode;?></p>
               <p><?php echo $order->billingcountry;?></p>
              <p><?php echo $order->billingcontact;?></p>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xs-6 mar">
        <div class="row">
          <div class="col-xs-6 padd">
            <div class="bor1" style="border-left:none;border-right:none">
              <div class="arr" style="padding-left:5px">
                <p>Order ID.</p>
                <p style="margin-top:5px"><b> <?php echo $order->id;?></b></p>
              </div>
            </div>
          </div>
          <div class="col-xs-6 padd">
            <div class="bor1">
              <div class="arr" style="padding-left:5px">
                <p>Dated</p>
                <p style="margin-top:5px"><b> <?php echo $invoicedate;?></b></p>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6 padd">
            <div style="height: 45px"></div>
          </div>
          <div class="col-xs-6 padd">
            <div style="height: 45px;border-left: 1px solid #000;border-right: 1px solid #000;">
              <div class="arr" style="padding-left:5px">
                <p>Mode/Terms of payment</p>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6 padd">
            <div class="bor1" style="border-left: none;border-right: none">
              <div class="arr" style="padding-left:5px">
                <p>Supplier's Ref.</p>
              </div>
            </div>
          </div>
          <div class="col-xs-6 padd">
            <div class="bor1">
              <div class="arr" style="padding-left:5px">
                <p>Other Reference(s)</p>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div>
            <div class="bor2" style="border-top:none;border-left:none;">
              <div class="arr" style="padding-left:5px">
                <p>Terms of Delivery</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <table style="border-collapse: collapse;width : 100%;font-size:12">
        <col span="7" style="border: 1px solid #000;border-bottom: none">
          <tr>
            <th width="20">SI No.
            </th>
            <th>Description of Goods</th>
            <th>Quantity</th>
            <th>Rate</th>
            <th>Per</th>
            <th>Disc%</th>
            <th>Amount</th>
          </tr>
          <tfoot>
            <tr>
              <td></td>
              <td align="right">Total</td>
              <td align="right"><b><?php echo $totalqty;?> Pcs.</b></td>
              <td></td>
              <td></td>
              <td></td>
              <td align="right"><b>&#8377;<?php echo $totallastamt;?></b></td>
            </tr>
          </tfoot>
           <?php $i=1 ?>
         <?php  foreach($orderitem as $orderitems){ ?>
          <tr>
            <td align="center"><?php  echo $i;?></td>
            <td align="left"><b><?php  echo $orderitems->name;?></b></td>
            <td align="right"><b><?php  echo $orderitems->quantity;?> Pcs.</b></td>
            <td align="right"><?php  echo $orderitems->price;?></td>
            <td align="center">Pcs.</td>
            <td></td>
            <td align="right"><?php  echo $orderitems->finalprice;?></td>
          
          </tr>
            <?php }?>
          <tr>
            <td align="center"></td>
            <td></td>
            <td></td>
            <td></td>
            <td align="center"></td>
            <td></td>
            <td align="right" style="border-top: 1px solid #000"><?php echo $totallastamt;?></td>
          </tr>
          <tr>
            <td align="center"></td>
            <td style="text-align:right; text-align: top;"><b><i>ACCESS BRANCH TRANSFER</i></b></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
      </table>
    </div>
    <div class="row">
      <div class="row bor" style="border-bottom:none;margin:0px">
        <div class="col-xs-8 size" style="padding:0px 0px 0px 5px">Amount Chargeable (in words)
          <br>
          <b>Indian Rupees <?php echo $amtinwords; ?></b></div>
        <div class="col-xs-4">
          <p class="text-right"><i>E. & O.E</i></p>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="bor size1 padd1" style="border-bottom:none;border-top:none">
        <div class="arr" style="margin-top:30px">
          <p>Company's VAT TIN</p>
          <p>Buyer's VAT TIN</p>
          <p>Company's PAN</p>
        </div>
        <div class="arr">
          <p>
            : <b>27900022830V w.e.f. 1-4-2006</b>
          </p>
          <p>
            : <b>27900022830v</b>
          </p>
          <p>
            : <b>AAGFA1707Q</b>
          </p>
        </div>
      </div>
    </div>
    <div class="row bor padd" style="border-top:none;">
      <div class="col-xs-6 size1 padd1">
        <div>
          <u>Declaration</u>
          <br> TERMS & CONDITIONS:
          <p>
            <br>1.Please bring Invoice Copy for warranty/replacement Purpose/D. O.A Replacement Validity 72 hrs only/No.Warranty on Burn /Damage Pieces. 2.Material Delivered with MRP Labels on all Products Mention on this Invoice.3.Warranty on all products
            is carry-in-warranty from the respective Mfr./Dist.As per there warranty terms.4.If Cheque is dishonoured Rs.250/- Per cheque will be charged.5.Replacement timings:2.00PM to 5.00 PM( Monday to Friday) STRICTY.</p>
          <p style="margin-bottom:0px">I/We Hereby Certify that my/our registration certificate under the maharashtra Value Added Tax Act,2002 is in force on the date on whice the sale of the goods sepecifield in this tax invoice is made by me/us and that the transaction of sale
            covered by this tax invoice has been effected by me/us & it shal be accounted for in the turnover of sales while filling of return & the due tax, if any, payable on the sale has been paid os shall be paid.</p>
        </div>
      </div>
      <div class="col-xs-6 padd" style="font-size:12">
        <div style="margin-top:52px">
          <div class="arr">
            <p>Date & Time</p>
            <p>Company's Bank Details</p>
            <p>Bank Name </p>
            <p> A/c No. </p>
            <p>Branch & IFS Code</p>
          </div>
          <div class="arr">
            <p>
              : <b>4-Jan-2016 at 18:50</b>
            </p>
            <p>.</p>
            <p>
              : <b>Union Bank Of India</b>
            </p>
            <p>
              : <b>318804040036296</b>
            </p>
            <p>
              :
            </p>
          </div>
          <div class=" text-right">
            <div class="bor" style="height:87px;border-bottom:none;border-right:none">
              <p><b>For Access</b></p>
              <p style="margin:51px 0px 0px 0px">Authorised Signatory</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div>
      <p class="text-center" style="margin-bottom:0px">SUBJECT TO MUMBAI JURISDICTION</p>
      <p class="text-center">This is a Computer Generated Invoice</p>
    </div>
  </div>
</body>

</html>
