<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:77:"/www/wwwroot/120.27.60.173/public/../application/admin/view/payway/edits.html";i:1559458446;s:64:"/www/wwwroot/120.27.60.173/application/admin/view/base/head.html";i:1558411548;s:62:"/www/wwwroot/120.27.60.173/application/admin/view/base/js.html";i:1558020051;}*/ ?>

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
                        <h5> 批量修改</h5> &nbsp;&nbsp;&nbsp;
                        <a class="btn btn-xs btn-success" href="<?php echo url('payway/index'); ?>"> <i class="fa fa-plus"></i> 返回通道列表</a>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" method="post" action="<?php echo url('payway/edits_deal'); ?>">

                            <div class="form-group">
                                <label class="col-sm-3 control-label">请选择通道类型</label>

                                <div class="col-sm-8">
                                    <select class="form-control" name="payway">
                                        
                                        <?php foreach($payway_list as $payway_code => $payway_content): ?>

                                        <option value="<?php echo $payway_code; ?>"><?php echo $payway_content['name']; ?></option>

                                        <?php endforeach; ?>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">所属人</label>

                                <div class="col-sm-8">

                                    <select class="form-control" name="belong">
                                        
                                    <option value="">所有所属人</option>

                                    <?php foreach($payway_belong_list as $payway_belong): ?>

                                    <option value="<?php echo $payway_belong; ?>"><?php echo $payway_belong; ?></option>

                                    <?php endforeach; ?>

                                    </select>

                                </div>
                            </div>

                            <hr>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">单日收款金额上限</label>

                                <div class="col-sm-8">
                                    <input type="text" name="success_max_money" placeholder="单日收款金额上限" class="form-control" value="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">单日收款次数上限</label>

                                <div class="col-sm-8">
                                    <input type="text" name="success_max_num" placeholder="单日收款次数上限" class="form-control" value="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">最小使用间隔（秒）</label>

                                <div class="col-sm-8">
                                    <input type="text" name="frequence" placeholder="最小使用间隔" class="form-control" value="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">最大连续失败次数</label>

                                <div class="col-sm-8">
                                    <input type="text" name="max_failed_times" placeholder="最大连续失败次数" class="form-control" value="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">是否启用</label>
                                <div class="checkbox i-checks">
                                    <label><input type="radio" value="1" name="active"> <i></i> 启用</label>
                                    <label><input type="radio" value="0" name="active"> <i></i> 不启用</label>
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
