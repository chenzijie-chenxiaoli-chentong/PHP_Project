<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:75:"D:\WWW\wwwroot\pro\public/../application/admin\view\moneyaccount\index.html";i:1558330249;s:56:"D:\WWW\wwwroot\pro\application\admin\view\base\head.html";i:1558411548;s:54:"D:\WWW\wwwroot\pro\application\admin\view\base\js.html";i:1558020051;}*/ ?>

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
                        <h5>帐户列表</h5> &nbsp;&nbsp;&nbsp;
                        <button class="btn btn-xs btn-success" onclick="create();"> <i class="fa fa-plus"></i> 新增帐户</button>
                    </div>
                    <div class="ibox-content">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>账户类型</th>
                                        <th>账户名称</th>
                                        <th>备注</th>
                                        <th>所属用户</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($list as $data): ?>
                                    <tr>

                                        <td><?php echo $data['id']; ?></td>
                                        <td><?php echo $moneyaccount_conf[$data['account_type']]['name']; ?></td>
                                        <td><?php echo $data['name']; ?></td>
                                        <td><?php echo $data['mark']; ?></td>
                                        <td><?php echo $data['username']; ?>(<?php echo $data['user_type']; ?>)</td>
                                        <td>
                                            
                                            <a class="btn btn-xs btn-warning" href="<?php echo url('moneyaccount/create',['id' => $data['id'],'account_type' => $data['account_type']]); ?>">编辑</a>
                                            <button class="btn btn-xs btn-danger" onclick="delet(<?php echo $data['id']; ?>,'<?php echo $data['name']; ?>');">删除</button>

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

    <div id="create_type_select" style="padding:20px;display:none;">
        
        <form class="form-horizontal" method="get" action="<?php echo url('moneyaccount/create'); ?>">

            <div class="form-group">

                <div class="col-sm-12">
                    
                    <select class="form-control" name="account_type">

                        <option value="">请选择帐户类型</option>

                        <?php foreach($moneyaccount_conf as $type_code => $type_content): ?>

                        <option value="<?php echo $type_code; ?>"><?php echo $type_content['name']; ?></option>

                        <?php endforeach; ?>
                        
                    </select>

                </div>

                <br/>
                <br/>

                <div class="col-sm-12">

                    <button class="btn btn-block btn-info" type="submit">确认添加</button>

                </div>

            </div>

        </form>

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
    
function create(){

    layer.open({

        type:1,
        content:$('#create_type_select')

    })

}

function delet(id,name){

    layer.confirm('确认删除账户【'+ name +'】？',function(){

        location.href = "<?php echo url('moneyaccount/delete'); ?>?id=" + id;

    });

}

</script>

</body>

</html>
