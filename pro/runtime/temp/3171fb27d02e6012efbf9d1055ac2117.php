<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:84:"/www/wwwroot/120.27.60.173/public/../application/admin/view/moneyaccount/create.html";i:1558252165;s:64:"/www/wwwroot/120.27.60.173/application/admin/view/base/head.html";i:1558411548;s:62:"/www/wwwroot/120.27.60.173/application/admin/view/base/js.html";i:1558020051;}*/ ?>

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
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5> <?php echo input('id') ? '修改' : '新增'; ?> [<?php echo $moneyaccount_conf['name']; ?>]</h5> &nbsp;&nbsp;&nbsp;
                        <a class="btn btn-xs btn-success" href="<?php echo url('moneyaccount/index'); ?>"> <i class="fa fa-plus"></i> 返回帐户列表</a>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" method="post" action="<?php echo url('moneyaccount/create_deal'); ?>">

                            <input type="hidden" name="id" value="<?php echo input('id'); ?>">
                            <input type="hidden" name="account_type" value="<?php echo $account_type; ?>">

                            <div class="form-group">
                                <label class="col-sm-3 control-label">帐户名称</label>

                                <div class="col-sm-8">
                                    <input type="text" name="name" placeholder="帐户名称" class="form-control" value="<?php echo !empty($account_info)?$account_info['name'] :''; ?>">
                                </div>
                            </div>

                            <?php foreach($moneyaccount_conf['fields'] as $field => $name): ?>

                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo $name; ?></label>

                                <div class="col-sm-8">
                                    <input type="text" name="<?php echo $field; ?>" placeholder="<?php echo $name; ?>" class="form-control" value="<?php echo !empty($account_info)?$account_info['account_info'][$field] :''; ?>" >
                                </div>
                            </div>

                            <?php endforeach; ?>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">备注信息</label>

                                <div class="col-sm-8">
                                    <input type="text" name="mark" placeholder="备注信息" class="form-control" value="<?php echo !empty($account_info)?$account_info['mark'] :''; ?>">
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


</body>

    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>

</html>
