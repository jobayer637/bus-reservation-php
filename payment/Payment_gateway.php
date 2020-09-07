
<!DOCTYPE html>
<html>
<head>
<title>Payment Gateway</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Payment Form Widget" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Fugaz+One' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Alegreya+Sans:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>


<!-- sending confirm email to the user-->


<?php 
if(isset($_POST['ordersubmitcodunreg'])||isset($_POST['ordersubmitcod'])||isset($_POST['ordersubmitDBBLunreg'])||isset($_POST['ordersubmitdbbl'])||isset($_POST['ordersubmitBKASHunreg'])||isset($_POST['ordersubmitbkash'])||isset($_POST['ordersubmitCARDunreg'])||isset($_POST['ordersubmitcard'])){
	
    $to = "teamerrors3@gmail.com"; // this is admin Email address
	
    $customermail = $_POST['umail']; // this is the sender's Email address
    $customername = $_POST['uname'];
    $customerphone= $_POST['ucell'];
	
    $subject = "Customer Order";
    $subject2 = "Product Order Submit";
	
    $message = " Customer Name:  ".$customername . "\n\n Customer  Phone:  " . $customerphone. "\n\n A order is waiting to deliver,please check your admin panel to confirm the order.";
    $message2 = "Thank you " . $customername . " for your order in our store.\n\n  We will inform you soon about your order.";

    $headers = "From:" . $customermail;
    $headers2 = "From:" . $to;
	
    mail($to,$subject,$message,$headers);// it will goto admin
	
    mail($customermail,$subject2,$message2,$headers2); // sends a copy of the message to the sender
	
    //echo "Mail Sent. Thank you " . $customername . ", we will contact you shortly.";
    // You can also use header('Location: thank_you.php'); to redirect to another page.
    }
?>




<!--registered user order insert star-->
<?php
if($_SERVER['REQUEST_METHOD']== 'POST' && isset($_POST['ordersubmitcod'])){
$cmrId =Session::get("cmrId");
$typ="CASH  ON DELIVERY";
$insertOrder = $ct->orderProduct($cmrId,$typ);
$delData=$ct->delCustomerCart();
}
?>
<?php
if($_SERVER['REQUEST_METHOD']== 'POST' && isset($_POST['ordersubmitdbbl'])){
$cmrId =Session::get("cmrId");
$typ="PAID BY DBBL MOBILE BANKING ";
$insertOrder = $ct->orderProduct($cmrId,$typ);
$delData=$ct->delCustomerCart();
}
?>
<?php
if($_SERVER['REQUEST_METHOD']== 'POST' && isset($_POST['ordersubmitbkash'])){
$cmrId =Session::get("cmrId");
$typ="PAID BY BKASH";
$insertOrder = $ct->orderProduct($cmrId,$typ);
$delData=$ct->delCustomerCart();
}
?>
<?php
if($_SERVER['REQUEST_METHOD']== 'POST' && isset($_POST['ordersubmitcard'])){
$cmrId =Session::get("cmrId");
$typ="PAID BY CARD.";
$insertOrder = $ct->orderProduct($cmrId,$typ);
$delData=$ct->delCustomerCart();
}
?>
<!--registered user order insert end-->
<!--unregistered user order insert start-->
<?php
if($_SERVER['REQUEST_METHOD']== 'POST' && isset($_POST['ordersubmitcodunreg'])){
$sess = session_id();
$typ="CASH  ON DELIVERY";
$insertOrderunreg = $ct->orderProducttemp($sess,$_POST,$_FILES,$typ);
$delData=$ct->delCustomerCart();
}
?>

<?php
if($_SERVER['REQUEST_METHOD']== 'POST' && isset($_POST['ordersubmitBKASHunreg'])){
$sess = session_id();
$typ="PAID BY BKASH";
$insertOrderunreg = $ct->orderProducttemp($sess,$_POST,$_FILES,$typ);
$delData=$ct->delCustomerCart();
}
?>

<?php
if($_SERVER['REQUEST_METHOD']== 'POST' && isset($_POST['ordersubmitDBBLunreg'])){
$sess = session_id();
$typ="PAID BY DBBL MOBILE BANKING";
$insertOrderunreg = $ct->orderProducttemp($sess,$_POST,$_FILES,$typ);
$delData=$ct->delCustomerCart();
}
?>
<?php
if($_SERVER['REQUEST_METHOD']== 'POST' && isset($_POST['ordersubmitCARDunreg'])){
$sess = session_id();
$typ="PAID BY CARD";
$insertOrderunreg = $ct->orderProducttemp($sess,$_POST,$_FILES,$typ);
$delData=$ct->delCustomerCart();
}
?>
<!--unregistered user order insert end-->
<?php 

 ?>
	<div class="main">
		<h1>Payment </h1>
		<?php if (isset($insertOrder)){
					echo $insertOrder;}?>
					<?php if (isset($insertOrderunreg)){
					echo $insertOrderunreg;}?>
		<div class="content">
				<h1><a href="../index.php"></a></h1>
			
			<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
					<script type="text/javascript">
						$(document).ready(function () {
							$('#horizontalTab').easyResponsiveTabs({
								type: 'default', //Types: default, vertical, accordion           
								width: 'auto', //auto or any width like 600px
								fit: true   // 100% fit in a container
							});
						});
						
					</script>
						<div class="sap_tabs">
							<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
								<div class="pay-tabs">
									<h2>Select Payment Method</h2>
									<h3 style="color:red;">N.B:it's a demo payment gateway.Here will goes the payment gateway's API</h3>
									<!--basket price start-->
			
					
		
									  <ul class="resp-tabs-list">
									  <li class="resp-tab-item" aria-controls="tab_item-4" role="tab"><span><label class="pic1"><img src="images/cod.png"/></label>Cash on Delivery</span></li>
									  <li class="resp-tab-item" aria-controls="tab_item-5" role="tab"><span><label class="pic1"><img src="images/rocket.png"/></label>DBBL Rocket</span></li>
									  <li class="resp-tab-item" aria-controls="tab_item-6" role="tab"><span><label class="pic1"><img src="images/bkash.png"/></label>bKash</span></li>
										<!--  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span><label class="pic3"></label>Net Banking</span></li>-->
										  <!--<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span><label class="pic4"></label>PayPal</span></li> -->
										  <li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><span><label class="pic2"></label>Credit/Debit Card</span></li>
									<!--<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span><label class="pic3"></label>Net Banking</span></li>  -->
										  <div class="clear"></div>
									  </ul>	
								</div>
								<div class="resp-tabs-container">
								
						
								 Developed by <a href="" target="_blank"> BUBT Team</a></p>
	</div>
</body>
</html>