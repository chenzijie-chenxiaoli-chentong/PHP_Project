<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:66:"/www/wwwroot/pro/public/../application/index/view/test/newpay.html";i:1589537695;s:54:"/www/wwwroot/pro/application/admin/view/base/head.html";i:1558411548;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <title>支付二维码</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title><?php echo config('site.name'); ?></title>
    <meta name="keywords" content="<?php echo config('site.keywords'); ?>">
    <meta name="description" content="<?php echo config('site.description'); ?>">
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="/static/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/static/hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/static/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/static/hplus/css/animate.css" rel="stylesheet">
    <link href="/static/hplus/css/style.css?v=4.1.0" rel="stylesheet">
    <style type="text/css">
        
        table th,td{

            text-align: center;

        }

    </style>
</head>


</head>
<body  style="background:#f0f0f0">

   
        <div  id="qrcode" style="height:260px;width:260px;margin:50px auto;"></div>
		
		<h3 id="pay_status" style="height:50px;width:200px;margin:0 auto;color:red;">订单过期倒计时：<label id="expire_seconds"></label>秒</h4>
           
</body>
<!--<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>-->
<script type='text/javascript' src='http://cdn.staticfile.org/jquery/2.1.4/jquery.min.js'></script>
<script src='/static/qrcode/jquery.qrcode.min.js'>
	
</script>
<script type="text/javascript">
	var payurl = "<?php echo $payurl; ?>";
    $('#qrcode').qrcode(payurl); //任意字符串
    
    // $('#qrcode').qrcode({
    //     render: "table",                  //table方式
    //     width: 220,                       //宽度
    //     height:220,                       //高度
    //     background: "#ffffff",            //背景颜色
    //     foreground: "black",                //前景颜色
    //     text: payurl        //任意内容
    // });
    
</script>

<script type="text/javascript">
    
    expire_seconds = 200;
	$('#expire_seconds').text(expire_seconds);
	
    Timer = setInterval(function(){

        if(expire_seconds == 0){
            
            $.get("<?php echo url('test/update_status'); ?>",{order_id:'<?php echo $order_id; ?>'},function(res){
            
	        });
            
            
            
            $('#pay_status').html('<p style="color:red;margin:0 auto;">该订单已过期</p>');
            $('#qrcode').html('');
            clearInterval(Timer);
            alert('该订单已过期');
            window.history.go(-1);

        }

        $.get("<?php echo url('test/check_success'); ?>",{order_id:'<?php echo $order_id; ?>'},function(res){
            
            if( res.status == 1 ){  
                
	            $('#qrcode').html('');
	            clearInterval(Timer);
	            alert('支付成功！');
	            window.history.go(-1);
            }
            
        });

        $('#expire_seconds').text( --expire_seconds );

    },1000);

</script>






</html>