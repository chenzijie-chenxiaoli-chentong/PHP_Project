<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:69:"/www/wwwroot/pro/public/../application/admin/view/merchant/index.html";i:1563095858;s:54:"/www/wwwroot/pro/application/admin/view/base/head.html";i:1558411548;s:52:"/www/wwwroot/pro/application/admin/view/base/js.html";i:1558020052;}*/ ?>

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
                        <h5>商户列表</h5> &nbsp;&nbsp;&nbsp;
                        <button class="btn btn-xs btn-success" onclick="create();"> <i class="fa fa-plus"></i> 新增商户</button>
                    </div>
                    <div class="ibox-content">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>名称</th>
                                        <th>帐号</th>
                                        <th>所属代理</th>
                                        <th>备注</th>
                                        <th>费率(支原-微原-支固-微固)</th>
                                        <th>添加时间</th>
                                        <th>状态</th>
                                        <?php if(in_array(session('admin.pos'),[0,9])): ?>
                                        <th>余额</th>
                                        <th>操作</th>
                                        <?php endif; ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($list as $data): ?>
                                    <tr>

                                        <td><?php echo $data['id']; ?></td>
                                        <td><?php echo $data['name']; ?></td>
                                        <td><?php echo $data['username']; ?></td>
                                        <td><?php echo $data['creater_agent_code']; ?></td>
                                        <td><?php echo $data['mark']; ?></td>
                                        <td><?php echo $data['fixed_money_ali_percent_fee']; ?>%-<?php echo $data['fixed_money_wechat_percent_fee']; ?>%-<?php echo $data['unfixed_money_ali_percent_fee']; ?>%-<?php echo $data['unfixed_money_wechat_percent_fee']; ?>%</td>
                                        <td><?php echo $data['create_time']; ?></td>
                                        <td><?php echo $data['status']==1?'启用' : '禁用'; ?></td>
                                        <?php if(in_array(session('admin.pos'),[0,9])): ?>
                                        <td><?php echo $data['money']/100; ?></td>
                                        <td>
                                            <a class="btn btn-xs btn-warning" href="<?php echo url('merchant/edit',['id' => $data['id']]); ?>">编辑</a>
                                            <button class="btn btn-xs btn-warning" onclick="reset_pwd('<?php echo $data['username']; ?>','<?php echo $data['creater_agent_code']; ?>');">改密</button>
                                            <button class="btn btn-xs btn-danger" onclick="delet('<?php echo $data['username']; ?>','<?php echo $data['creater_agent_code']; ?>');">删除</button>

                                        </td>
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
        
        <form class="form-horizontal" id="merchant" method="post" action="<?php echo url('merchant/create'); ?>">

            <div class="form-group">
                <label class="col-sm-3 control-label">名称：</label>

                <div class="col-sm-8">
                    <input type="text" placeholder="名称" class="form-control" name="name">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">帐号：</label>

                <div class="col-sm-8">
                    <input type="text" placeholder="帐号" class="form-control" name="username">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">密码：</label>

                <div class="col-sm-8">
                    <input type="text" placeholder="密码" class="form-control" name="password">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">备注：</label>

                <div class="col-sm-8">
                    <input type="text" placeholder="备注" class="form-control" name="mark">
                </div>
            </div>

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
                <label class="col-sm-3 control-label">是否启用：</label>

                <div class="col-sm-6">
                   <div class="checkbox i-checks">
                        <label><input type="radio" value="1" name="status"> <i></i> 启用</label>
                        <label><input type="radio" value="-1" name="status"> <i></i> 不启用</label>
                    </div>
                </div>

            </div>

            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-8">
                    <button class="btn btn-sm btn-white" type="submit">创  建</button>
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
    
/*
 * 修改密码
 */

function reset_pwd(username,agent_code){

    layer.confirm('确认将【'+ username +'】的登录密码和提现密码都重置为【123456】？',function(){

        location.href = "<?php echo url('merchant/reset_pwd'); ?>?username=" + username + "&agent_code=" + agent_code;
        
    });

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

/*
 * 删除
 */

function delet(username,agent_code){

    layer.confirm('确认删除['+ username +']？',function(){

        location.href = "<?php echo url('merchant/delete'); ?>?username=" + username + "&agent_code=" + agent_code;

    })

}


    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });

</script>

</body>

</html>
