<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:89:"/www/wwwroot/47.56.64.247/public/../application/admin/view/administrator/create_page.html";i:1562420345;s:63:"/www/wwwroot/47.56.64.247/application/admin/view/base/head.html";i:1558411548;s:61:"/www/wwwroot/47.56.64.247/application/admin/view/base/js.html";i:1558020051;}*/ ?>

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
                        <h5>账号编辑</h5> &nbsp;&nbsp;&nbsp;
                        <a class="btn btn-xs btn-success" href="<?php echo url('administrator/index'); ?>"> <i class="fa fa-plus"></i> 返回账号列表</a>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" method="post" action="<?php echo url('administrator/create'); ?>">

                            <input type="hidden" name="id" value="<?php echo $id; ?>">

                            <?php if(!$id): ?>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">帐号：</label>

                                <div class="col-sm-8">
                                    <input type="text" placeholder="帐号" class="form-control" name="username">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">密码：</label>

                                <div class="col-sm-8">
                                    <input type="password" placeholder="密码" class="form-control" name="password">
                                </div>
                            </div>

                            <?php endif; ?>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">支付宝原生费率：</label>

                                <div class="col-sm-8">
                                    <input type="text" placeholder="支付宝原生费率" class="form-control" name="fixed_money_ali_percent_fee" value="<?php echo !empty($id)?$info['fixed_money_ali_percent_fee'] : ''; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">微信原生费率：</label>

                                <div class="col-sm-8">
                                    <input type="text" placeholder="微信原生费率" class="form-control" name="fixed_money_wechat_percent_fee" value="<?php echo !empty($id)?$info['fixed_money_wechat_percent_fee'] : ''; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">支付宝固码费率：</label>

                                <div class="col-sm-8">
                                    <input type="text" placeholder="支付宝固码费率" class="form-control" name="unfixed_money_ali_percent_fee" value="<?php echo !empty($id)?$info['unfixed_money_ali_percent_fee'] : ''; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">微信固码费率：</label>

                                <div class="col-sm-8">
                                    <input type="text" placeholder="微信固码费率" class="form-control" name="unfixed_money_wechat_percent_fee" value="<?php echo !empty($id)?$info['unfixed_money_wechat_percent_fee'] : ''; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">身份：</label>

                                <div class="col-sm-8">
                                    <select name="pos" class="form-control">

                                        <?php if($id): ?><option value="<?php echo $info['pos']; ?>"><?php echo $administrator_pos[$info['pos']]['name']; ?></option><?php endif; ?>

                                        <option value="0"><?php echo $administrator_pos[0]['name']; ?></option>
                                        <option value="1"><?php echo $administrator_pos[1]['name']; ?></option>

                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">备注：</label>

                                <div class="col-sm-8">
                                    <input type="text" placeholder="备注" class="form-control" name="mark" value="<?php echo !empty($id)?$info['mark'] : ''; ?>">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">是否启用</label>
                                <div class="checkbox i-checks">
                                    <label><input type="radio" value="1" name="is_active" <?php if($id): if($info['is_active']): ?> checked <?php endif; endif; ?>> <i></i> 启用</label>
                                    <label><input type="radio" value="0" name="is_active" <?php if($id): if(!$info['is_active']): ?> checked <?php endif; endif; ?>> <i></i> 禁用</label>
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
