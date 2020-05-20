<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:72:"/www/wwwroot/47.56.64.247/public/../application/index/view/test/pay.html";i:1564156069;s:63:"/www/wwwroot/47.56.64.247/application/admin/view/base/head.html";i:1558411548;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <title>支付</title>
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
<body>

    <div>
        <br>
        <br>
        <br>
        <div class="row">
            
            <div class="col-sm-4"></div>
            <div class="col-sm-4 row" style="text-align:center;">
                
                <div class="col-md-12">
                    <img src="/static/img/<?php echo $img_name; ?>">
                </div>

                <div class="col-md-12">
                    <img src="<?php echo $qr_code_url; ?>" style="width:70%;">
                </div>

                <div class="col-md-12">
                    <?php if(is_mobile()): ?>
                    <h3 style="color:red;">请支付￥<?php echo $money; ?>元，否则支付无效</h3>
                    <?php else: ?>
                    <h1 style="color:red;">请支付￥<?php echo $money; ?>元，否则支付无效</h1>
                    <?php endif; ?>
                </div>

                <?php if(is_mobile()): ?>

                <div class="col-md-12"><p style="float: left;margin-left: 15%;">①截图或保存图片到手机</p></div>
                <div class="col-md-12"><p style="float: left;margin-left: 15%;">②<?php echo $tit_msg; ?></p></div>
                <div class="col-md-12"><p style="float: left;margin-left: 15%;">③点击右上角，从相册选取刚才的截图进行支付</p></div>

                <?php else: ?>

                <div class="col-md-12"><p style=""><?php echo $tit_msg; ?></p></div>

                <?php endif; ?>

                <div class="col-md-12"> 
                    <h5>订单号：<?php echo $order_id; ?></h5>
                    <br/>
                    <h4 id="pay_status">订单过期倒计时：<label id="expire_seconds"></label>秒</h4>
                </div>

            </div>
            <div class="col-sm-4"></div>

        </div>

    </div>

</body>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    
    expire_seconds = <?php echo $expire_seconds; ?>;

    expire_seconds_interval = setInterval(function(){

        if(expire_seconds == 0){

            alert('该订单已过期');

            $('#pay_status').html('<p style="color:red;">该订单已过期</p>');

            clearInterval(expire_seconds_interval);

        }

        $.get("<?php echo url('test/check_success'); ?>",{order_id:'<?php echo $order_id; ?>'},function(data){

            if( data.code ){

                alert('支付成功！');

                $('#pay_status').html('<p style="color:red;">该订单已过期</p>');

                clearInterval(expire_seconds_interval);
                
            }

        });

        $('#expire_seconds').text( --expire_seconds );

    },1000);

</script>
</html>