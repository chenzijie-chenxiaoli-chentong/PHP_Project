<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:74:"/www/wwwroot/pro/public/../application/admin/view/administrator/index.html";i:1596394089;s:54:"/www/wwwroot/pro/application/admin/view/base/head.html";i:1596394088;s:52:"/www/wwwroot/pro/application/admin/view/base/js.html";i:1596394089;}*/ ?>

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
                        <h5>账号列表</h5> &nbsp;&nbsp;&nbsp;
                        <a class="btn btn-xs btn-success" href="<?php echo url('administrator/create_page'); ?>"> <i class="fa fa-plus"></i> 新增账号</a>
                    </div>
                    <div class="ibox-content">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>帐号</th>
                                        <th>添加时间</th>
                                        <th>身份类型</th>
                                        <th>余额</th>
                                        <th>费率(支原-微原-支固-微固)</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($list as $data): ?>
                                    <tr>

                                        <td><?php echo $data['username']; ?></td>
                                        <td><?php echo $data['create_time']; ?></td>
                                        <td><?php echo $administrator_pos[$data['pos']]['name']; ?></td>
                                        <td><?php echo $data['money']/100; ?></td>
                                        <td><?php echo $data['fixed_money_ali_percent_fee']; ?>%-<?php echo $data['fixed_money_wechat_percent_fee']; ?>%-<?php echo $data['unfixed_money_ali_percent_fee']; ?>%-<?php echo $data['unfixed_money_wechat_percent_fee']; ?>%</td>
                                        <td>
                                            
                                            <button class="btn btn-xs btn-warning" onclick="change_pwd('<?php echo $data['username']; ?>');">改密</button>
                                            <a class="btn btn-xs btn-warning" href="<?php echo url('administrator/create_page',['id' => $data['id']]); ?>">编辑</a>
                                            <button class="btn btn-xs btn-danger" onclick="delet('<?php echo $data['username']; ?>');">删除</button>

                                        </td>

                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php echo $list->render(); ?>
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

<script type="text/javascript">
    
/*
 * 修改密码
 */

function change_pwd(username){

    layer.prompt({title: '['+ username +']的新密码', formType: 1}, function(text){
        
        location.href = "<?php echo url('administrator/change_pwd'); ?>?username=" + username + "&pwd=" + text;

    });

}


/*
 * 删除
 */

function delet(username){

    layer.confirm('确认删除['+ username +']？',function(){

        location.href = "<?php echo url('administrator/delete'); ?>?username=" + username;

    })

}


</script>

</body>

</html>
