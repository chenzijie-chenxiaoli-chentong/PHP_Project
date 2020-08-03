<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:65:"/www/wwwroot/pr/public/../application/admin/view/money/index.html";i:1596394087;s:53:"/www/wwwroot/pr/application/admin/view/base/head.html";i:1596394088;s:51:"/www/wwwroot/pr/application/admin/view/base/js.html";i:1596394089;}*/ ?>

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
                        <h5>资金日志</h5> &nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="ibox-content">
                        <form class="row">

                            <div class="col-sm-1">
                                <div class="input-group">
                                    <input type="text" name="username" placeholder="用户名" value="<?php echo input('username'); ?>" class="input-sm form-control"> 
                                </div>
                            </div>

                            <div class="col-sm-2">
                                <div class="input-group">
                                    <input type="text" name="starttime" placeholder="开始时间" value="<?php echo input('starttime'); ?>" class="input-sm form-control"> 
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="input-group">
                                    <input type="text" name="endtime" placeholder="结束时间" value="<?php echo input('endtime'); ?>" class="input-sm form-control"> 
                                </div>
                            </div>


                            <div class="col-sm-2">
                                <div class="input-group">
                                    <input type="text" name="order_id" placeholder="订单号" value="<?php echo input('order_id'); ?>" class="input-sm form-control"> 
                                </div>
                            </div>

                            <div class="col-sm-1">

                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"> 搜索</button> 
                                    </span>
                            </div>

                        </form>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>用户身份</th>
                                        <th>用户名</th>
                                        <th>时间</th>
                                        <th>金额</th>
                                        <th>原因</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($list as $data): ?>
                                    <tr>

                                        <td><?php echo $data['user_type']; ?></td>
                                        <td><?php echo $data['username']; ?></td>
                                        <td><?php echo $data['time']; ?></td>
                                        <td><?php echo $data['money']/100; ?></td>
                                        <td><?php echo $data['mark']; ?></td>

                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php echo $list->render(); ?>
                    </div>
                    总收入【<?php echo $sum_money/100; ?>】元
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

<script type="text/javascript" src="/static/laydate/laydate.js"></script>

<script type="text/javascript">

    laydate.render({
      elem: '[name=starttime]', //指定元素
      type:'datetime'
    });    laydate.render({
      elem: '[name=endtime]', //指定元素
      type:'datetime'
    });

</script>

</body>

</html>
