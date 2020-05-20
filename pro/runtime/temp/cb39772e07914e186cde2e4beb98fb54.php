<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:77:"/www/wwwroot/47.56.64.247/public/../application/admin/view/setting/index.html";i:1568723067;s:63:"/www/wwwroot/47.56.64.247/application/admin/view/base/head.html";i:1558411548;s:61:"/www/wwwroot/47.56.64.247/application/admin/view/base/js.html";i:1558020051;}*/ ?>

 <!DOCTYPE html>
<html>

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

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">

            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>最小提现金额</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" method="post" action="<?php echo url('setting/set'); ?>">
                            <input type="hidden" name="key" value="min_cash">
                            <div class="form-group">
                                <div class="col-sm-8">
                                    <input type="text" placeholder="金额" class="form-control" value="<?php echo setting('min_cash'); ?>" name="val">
                                </div>
                                <div class="col-sm-4">
                                    <button class="btn btn-sm btn-white" type="submit">确  认</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>微信消息开关</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" method="post" action="<?php echo url('setting/set'); ?>">
                            <input type="hidden" name="key" value="wechat_msg_reciver">
                            <div class="form-group">
                                <?php foreach(setting('wechat_msg_reciver') as $wechat_mark => $switch): ?>
                                <div class="col-sm-3">
                                    <div class="checkbox i-checks">
                                        <input type="checkbox" value="<?php echo $wechat_mark; ?>" <?php if($switch): ?>checked<?php endif; ?> name="val[]"><?php echo $wechat_mark; ?>
                                    </div>
                                </div>
                                <?php endforeach; ?>
                                <div class="col-sm-3">
                                    <button class="btn btn-sm btn-white" type="submit">确  认</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>测试支付使用的通道</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" method="post" action="<?php echo url('setting/set'); ?>">
                            <input type="hidden" name="key" value="text_use_payway">
                            <div class="form-group">
                                <div class="col-sm-8">
                                    <select name="val" class="form-control">
                                    <option value="<?php echo setting('text_use_payway'); ?>"><?php if(isset($payway_list[setting('text_use_payway')])): ?> <?php echo setting('text_use_payway'); ?>-<?php echo $payway_list[setting('text_use_payway')]['name']; else: ?> 所有通道 <?php endif; ?></option>
                                    <option value="0">所有通道</option>
                                    <?php foreach($payway_list as $payway_info): ?>
                                    <option value="<?php echo $payway_info['id']; ?>"><?php echo $payway_info['id']; ?>-<?php echo $payway_info['name']; ?></option>
                                    <?php endforeach; ?>

                                    </select>
                                </div>
                                <div class="col-sm-4">
                                    <button class="btn btn-sm btn-white" type="submit">确  认</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>



    <!-- 全局js -->
    <script src="/static/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="/static/hplus/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="/static/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/static/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>

    <!-- 自定义js -->
    <script src="/static/hplus/js/hplus.js?v=4.1.0"></script>
    <script type="text/javascript" src="/static/hplus/js/contabs.js"></script>

    <!-- 第三方插件 -->
    <script src="/static/hplus/js/plugins/pace/pace.min.js"></script>
    
    <script src="/static/hplus/js/plugins/iCheck/icheck.min.js"></script>

    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</body>

</html>
