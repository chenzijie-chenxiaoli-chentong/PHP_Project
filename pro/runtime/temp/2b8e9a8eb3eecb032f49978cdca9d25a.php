<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:65:"/www/wwwroot/pro/public/../application/admin/view/cash/index.html";i:1559288064;s:54:"/www/wwwroot/pro/application/admin/view/base/head.html";i:1558411548;s:52:"/www/wwwroot/pro/application/admin/view/base/js.html";i:1558020052;}*/ ?>

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
                        <h5>提现列表</h5> &nbsp;&nbsp;&nbsp;
                        <?php if(session('admin.pos') == 1 or session('merchant')): ?>
                        <button class="btn btn-xs btn-success" onclick="create();"> <i class="fa fa-plus"></i> 申请提现</button>
                        <?php endif; ?>
                    </div>
                    <div class="ibox-content">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>申请账号</th>
                                        <th>金额</th>
                                        <th>结算账户</th>
                                        <th>申请时间</th>
                                        <th>处理时间</th>
                                        <th>备注</th>
                                        <?php if(session('admin') and in_array(session('admin.pos'),[0,9])): ?>
                                        <th>操作</th>
                                        <?php else: ?>
                                        <th>状态</th>
                                        <?php endif; ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($list as $data): ?>
                                    <tr>

                                        <td><?php echo $data['id']; ?></td>
                                        <td><?php echo $data['username']; ?>(<?php echo $data['user_type']; ?>)</td>
                                        <td><?php echo $data['money']/100; ?></td>
                                        <td><button class="btn btn-xs btn-info" onclick="read_cash_account_info(<?php echo $data['money_account_id']; ?>);">点击查看</button></td>
                                        <td><?php echo $data['create_time']; ?></td>
                                        <td><?php echo date('Y-m-d H:i:s',$data['deal_time']); ?></td>
                                        <td><?php echo $data['mark']; ?></td>
                                        <?php if(session('admin') and in_array(session('admin.pos'),[0,9])): ?>
                                        <td>
                                            <?php if($data['status'] == 0): ?>
                                            <button class="btn btn-xs btn-success" onclick="cash_deal(<?php echo $data['id']; ?>,1);">成功</button>
                                            <button class="btn btn-xs btn-danger" onclick="cash_deal(<?php echo $data['id']; ?>,2);">失败</button>
                                            <?php else: ?>

                                            <?php echo $cash_status[$data['status']]['name']; endif; ?>
                                        </td>
                                        <?php else: ?>

                                        <td><?php echo $cash_status[$data['status']]['name']; ?></td>
                                        <?php endif; ?>

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

    <div id="create" style="padding:20px;display:none;">
        
        <form class="form-horizontal" method="post" action="<?php echo url('cash/create'); ?>">

            <div class="form-group">
                <label class="col-sm-3 control-label">提现金额</label>

                <div class="col-sm-8">
                    <input type="text" placeholder="提现金额" class="form-control" name="money">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">收款账户：</label>

                <div class="col-sm-8">
                    <select class="form-control" name="money_account">

                        <option value="">请选择收款账户</option>
                        
                        <?php foreach($money_account_list as $money_account): ?>

                        <option value="<?php echo $money_account['id']; ?>"><?php echo $money_account['name']; ?>(<?php echo $money_account['mark']; ?>)</option>

                        <?php endforeach; ?>

                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">提现密码</label>

                <div class="col-sm-8">
                    <input type="passowrd" placeholder="提现密码" class="form-control" name="cash_password">
                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-8">
                    <button class="btn btn-sm btn-white" type="submit">确  认</button>
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
    
function cash_deal(id,status){

    if(status == 1){

        layer.prompt({title:'请填写提现成功凭证',formType:2},function(value){

            location.href = "<?php echo url('cash/deal'); ?>?id="+id+"&status=1&mark=" + value;

        });

    }

    if(status == 2){

        layer.prompt({title:'请输入失败原因',formType:2},function(value){

            location.href = "<?php echo url('cash/deal'); ?>?status=2&id="+id+"&mark=" + value;

        });

    }

}

/*
 * 创建管理员
 */

function create(){

    layer.open({

        type:1,
        content:$('#create'),
        area:['40%','auto']

    })

}

function read_cash_account_info(id){

    $.get("<?php echo url('cash/read_cash_account_info'); ?>",{id:id},function(data){

        console.log(data);

        if(!data.code){

            layer.alert('该资金账户已不存在');

            return false;

        }

        str = '';

        if(data.data.account_type == 'bank'){
            str += '类型：银行<br/>';
            str += '开户地：'+ data.data.account_info.province + data.data.account_info.city +'<br/>';
            str += '银行名称：'+ data.data.account_info.name +'<br/>';
            str += '分行名称：'+ data.data.account_info.province +'<br/>';
            str += '卡号：'+ data.data.account_info.account +'<br/>';
            str += '备注：'+ data.data.mark +'<br/>';

        }else{

            str += '类型：支付宝<br/>';
            str += '账号：'+ data.data.account_info.account +'<br/>';

        }

        layer.alert(str);

    });

}



</script>

</body>

</html>
