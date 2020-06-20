<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:75:"/www/wwwroot/120.27.60.173/public/../application/index/view/test/index.html";i:1558450578;s:64:"/www/wwwroot/120.27.60.173/application/admin/view/base/head.html";i:1558411548;}*/ ?>
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

<div style="text-align: center;font-size: 24px;">
<br/>
<br/>
<br/>
<br/>
<br/>
		<form action="test/pay">
			<p>请选择支付方式</p>
			<input type="radio" name="method" value="wechat">微信
			<input type="radio" name="method" value="ali">支付宝<br/><br/><br/>
			<p>请输入支付金额</p>
			<input type="text" name="money">
			<br/><br/><br/>
			<button class="btn btn-info">确认支付</button>
		</form>

</div>