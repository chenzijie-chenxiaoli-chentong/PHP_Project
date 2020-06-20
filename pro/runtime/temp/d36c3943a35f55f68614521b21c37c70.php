<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:78:"/www/wwwroot/120.27.60.173/public/../application/admin/view/payway/create.html";i:1559695570;s:64:"/www/wwwroot/120.27.60.173/application/admin/view/base/head.html";i:1558411548;s:62:"/www/wwwroot/120.27.60.173/application/admin/view/base/js.html";i:1558020051;}*/ ?>

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
                        <h5> <?php echo input('id') ? '修改' : '新增'; ?> [<?php echo $payway['name']; ?>]通道</h5> &nbsp;&nbsp;&nbsp;
                        <a class="btn btn-xs btn-success" href="<?php echo url('payway/index'); ?>"> <i class="fa fa-plus"></i> 返回通道列表</a>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" method="post" action="<?php echo url('payway/create_deal'); ?>">

                            <input type="hidden" name="id" value="<?php echo input('id'); ?>">
                            <input type="hidden" name="payway" value="<?php echo input('payway') ?: $payway_info['payway']; ?>">

                            <div class="form-group">
                                <label class="col-sm-3 control-label">通道名称</label>

                                <div class="col-sm-8">
                                    <input type="text" name="name" placeholder="通道名称" class="form-control" value="<?php echo input('id') ? $payway_info['name'] : ''; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">使用商户</label>

                                <div class="col-sm-8">
                                    <select name="user" class="form-control">
                                    <?php if(input('id')): ?>
                                    <option value="<?php echo $payway_info['user']; ?>"><?php echo !empty($payway_info['user'])?$payway_info['user']: '全部商户'; ?></option>
                                    <?php endif; ?>
                                    <option value="">全部商户</option>
                                    
                                    <?php foreach($merchant_list as $merchant): ?>
                                    <option value="<?php echo $merchant['username']; ?>"><?php echo $merchant['username']; ?></option>
                                    <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>

                            <?php foreach($payway['fields'] as $field => $name): ?>

                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo $name; ?></label>

                                <div class="col-sm-8">
                                    <input type="text" name="<?php echo $field; ?>" placeholder="<?php echo $name; ?>" class="form-control" value="<?php echo input('id') ? $payway_info_params[$field] : ''; ?>" >
                                </div>
                            </div>

                            <?php endforeach; ?>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">开启的支付方式</label>
                                <div class="checkbox i-checks">
                                    <label><input type="checkbox" value="wechat" <?php echo !empty($payway_info['is_wechat'])?'checked' : ''; ?> name="recive_way[]"> <i></i> 微信</label>
                                    <label><input type="checkbox" value="ali" <?php echo !empty($payway_info['is_ali'])?'checked' : ''; ?> name="recive_way[]"> <i></i> 支付宝</label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">是否启用</label>
                                <div class="checkbox i-checks">
                                    <label><input type="radio" value="1" name="active" <?php echo !empty($payway_info['is_active'])?'checked' : ''; ?>> <i></i> 启用</label>
                                    <label><input type="radio" value="0" name="active" <?php echo !empty($payway_info['is_active'])?'' : 'checked'; ?>> <i></i> 不启用</label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">单日金额上限</label>

                                <div class="col-sm-8">
                                    <input type="text" name="success_max_money" placeholder="单日金额上限" class="form-control" value="<?php echo input('id') ? $payway_info['success_max_money']/100 : ''; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">单日次数上限</label>

                                <div class="col-sm-8">
                                    <input type="text" name="success_max_num" placeholder="单日次数上限" class="form-control" value="<?php echo input('id') ? $payway_info['success_max_num'] : ''; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">最小使用间隔</label>

                                <div class="col-sm-8">
                                    <input type="text" name="frequence" placeholder="最小使用间隔" class="form-control" value="<?php echo input('id') ? $payway_info['frequence'] : ''; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">最大失败上限</label>

                                <div class="col-sm-8">
                                    <input type="text" name="max_failed_times" placeholder="最大失败上限" class="form-control" value="<?php echo input('id') ? $payway_info['max_failed_times'] : ''; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">备注</label>

                                <div class="col-sm-8">
                                    <input type="text" name="mark" placeholder="备注" class="form-control" value="<?php echo input('id') ? $payway_info['mark'] : ''; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">所属人</label>

                                <div class="col-sm-8">
                                    <input type="text" name="belong" placeholder="所属人" class="form-control" value="<?php echo input('id') ? $payway_info['belong'] : ''; ?>">
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
