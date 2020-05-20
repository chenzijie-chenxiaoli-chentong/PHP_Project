<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:78:"/www/wwwroot/120.27.60.173/public/../application/admin/view/merchant/edit.html";i:1558332314;s:64:"/www/wwwroot/120.27.60.173/application/admin/view/base/head.html";i:1558411548;s:62:"/www/wwwroot/120.27.60.173/application/admin/view/base/js.html";i:1558020051;}*/ ?>
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
<div class="wrapper wrapper-content animated fadeInRight">

     &nbsp;&nbsp;&nbsp; <h1>修改【<?php echo $info['username']; ?>】</h1>

    <br>
    <br>
    <br>


    <div id="create">
        
        <form class="form-horizontal" id="merchant" method="post" action="<?php echo url('merchant/edit_deal'); ?>">

            <input type="hidden" name="id" value="<?php echo $info['id']; ?>">

            <div class="form-group">
                <label class="col-sm-3 control-label">名称：</label>

                <div class="col-sm-8">
                    <input type="text" placeholder="名称" class="form-control" name="name" value="<?php echo $info['name']; ?>">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">备注：</label>

                <div class="col-sm-8">
                    <input type="text" placeholder="备注" class="form-control" name="mark" value="<?php echo $info['mark']; ?>">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">微信费率：</label>

                <div class="col-sm-6">
                    <input type="text" placeholder="微信费率" class="form-control" name="wechat_percent_fee" value="<?php echo $info['wechat_percent_fee']; ?>">
                </div>
                <div class="col-sm-1">
                    %
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">支付宝费率：</label>

                <div class="col-sm-6">
                    <input type="text" placeholder="支付宝费率" class="form-control" name="ali_percent_fee" value="<?php echo $info['ali_percent_fee']; ?>">
                </div>
                <div class="col-sm-1">
                    %
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">是否启用：</label>

                <div class="col-sm-6">
                   <div class="checkbox i-checks">
                        <label><input type="radio" value="1" name="status" <?php if($info['status'] == 1): ?>checked<?php endif; ?>> <i></i> 启用</label>
                        <label><input type="radio" value="-1" name="status" <?php if($info['status'] == -1): ?>checked<?php endif; ?>> <i></i> 不启用</label>
                    </div>
                </div>

            </div>

            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-8">
                    <button class="btn btn-sm btn-white" type="submit">确  认</button>
                </div>
            </div>
        </form>

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

<script type="text/javascript">
    
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });

</script>