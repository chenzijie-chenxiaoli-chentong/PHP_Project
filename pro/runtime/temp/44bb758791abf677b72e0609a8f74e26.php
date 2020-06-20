<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:75:"/www/wwwroot/47.56.99.14/public/../application/admin/view/payway/index.html";i:1563888420;s:62:"/www/wwwroot/47.56.99.14/application/admin/view/base/head.html";i:1558411548;s:60:"/www/wwwroot/47.56.99.14/application/admin/view/base/js.html";i:1558020051;}*/ ?>

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
                        <h5>通道列表</h5> &nbsp;&nbsp;&nbsp;
                        <button class="btn btn-xs btn-success" onclick="payway_create();"> <i class="fa fa-plus"></i> 新增通道帐户</button>
                        <a class="btn btn-xs btn-info" href="<?php echo url('payway/edits'); ?>"> <i class="fa fa-plus"></i> 批量修改</a>
                    </div>
                    <div class="ibox-content">
                        <form class="row">

                            <div class="col-sm-2">
                                <div class="input-group">
                                    <input type="text" name="name" placeholder="名称/ID" value="<?php echo input('name'); ?>" class="input-sm form-control"> 
                                </div>
                            </div>

                            <div class="col-sm-2">
                                    <select class="form-control" name="belong">
                                        
                                    <option value="">所有所属人</option>

                                    <?php foreach($payway_belong_list as $payway_belong): ?>

                                    <option value="<?php echo $payway_belong; ?>"><?php echo $payway_belong; ?></option>

                                    <?php endforeach; ?>

                                    </select>
                            </div>

                            <div class="col-sm-2">
                                <div class="input-group">
                                    <select name="payway" class="form-control">
                                        <?php if(input('payway')): ?>
                                        <option value="<?php echo input('payway'); ?>">
                                            
                                            <?php echo $payway_list[input('payway')]['name']; ?>

                                        </option>
                                        <?php endif; ?>
                                        <option value=""></option>
                                        <?php foreach($payway_list as $payway_code => $payway_content): ?>
                                        <option value="<?php echo $payway_code; ?>"><?php echo $payway_content['name']; ?></option>
                                        <?php endforeach; ?>

                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-2">
                                <div class="input-group">
                                    <select name="is_active" class="form-control">
                                        <?php if(input('is_active') === '0'): ?><option value="0">冻结</option><?php endif; if(input('is_active') === '1'): ?><option value="0">启用</option><?php endif; ?>
                                        <option value="">启用状态选择</option>
                                        <option value="1">启用</option>
                                        <option value="0">未启用</option>

                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="input-group">
                                    <select name="could_use" class="form-control">
                                        <?php if(input('could_use') === '0'): ?><option value="0">冻结</option><?php endif; if(input('could_use') === '1'): ?><option value="1">启用</option><?php endif; ?>
                                        <option value="">冻结状态选择</option>
                                        <option value="0">冻结</option>
                                        <option value="1">可用</option>

                                    </select>
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary" style="margin-bottom:0px;height:34px;"> 搜索</button> 
                                    </span>
                                </div>
                            </div>

  

                        </form>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>名称</th>
                                        <th>所属人-使用人</th>
                                        <th>类型</th>
                                        <th>启用状态</th>
                                        <th>微信-支付宝</th>
                                        <th>金额上限</th>
                                        <th>次数上限</th>
                                        <th>失败上限</th>
                                        <th>标识</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($list as $data): ?>
                                    <tr>

                                        <td><?php echo $data['id']; ?></td>
                                        <td><?php echo $data['name']; ?></td>
                                        <td><?php echo $data['belong']; ?>-<?php echo !empty($data['user'])?$data['user']: '全部商户'; ?></td>
                                        <td><?php echo $payway_list[$data['payway']]['name']; ?></td>
                                        <td onclick="let_could_use(<?php echo $data['id']; ?>,'<?php echo $data['name']; ?>');"><?php echo !empty($data['is_active'])?'启用' : '冻结'; ?>-<?php echo !empty($data['could_use'])?'可用' : '冻结'; ?></td>
                                        <td><?php echo !empty($data['is_wechat'])?'启用' : '未启用'; ?>-<?php echo !empty($data['is_ali'])?'启用' : '未启用'; ?></td>
                                        <td><?php echo $data['success_money']/100; ?> / <?php echo $data['success_max_money']/100; ?></td>
                                        <td><?php echo $data['success_times']; ?> / <?php echo $data['success_max_num']; ?></td>
                                        <td><?php echo $data['faild_times']; ?>/<?php echo $data['max_failed_times']; ?></td>
                                        <td><?php echo $data['identify_id']; ?></td>
                                        <td>
                                            
                                            <a class="btn btn-xs btn-warning" href="<?php echo url('payway/create',['id' => $data['id']]); ?>">编辑</a>
                                            <button class="btn btn-xs btn-danger" onclick="delet(<?php echo $data['id']; ?>,'<?php echo $data['name']; ?>');">删除</button>

                                        </td>

                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                            <?php echo $list->render(); ?>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div id="payway_create" style="padding:20px;display:none;">
        
        <form class="form-horizontal" method="get" action="<?php echo url('payway/create'); ?>">

            <div class="form-group">

                <div class="col-sm-12">
                    
                    <select class="form-control" name="payway">

                        <option value="">请选择通道类型</option>
                        
                        <?php foreach($payway_list as $payway_code => $payway): ?>

                        <option value="<?php echo $payway_code; ?>"><?php echo $payway['name']; ?></option>

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

/*
 * 创建
 */

function payway_create(){

    layer.open({

        type:1,
        content:$('#payway_create')

    })

}

/*
 * 删除
 */

function delet(id,name){

    layer.confirm('确认删除支付通道['+ name +']？',function(){

        location.href = "<?php echo url('payway/delete'); ?>?id=" + id + "&name=" + name;

    })

}

function let_could_use(id,name){

    layer.confirm('确认将通道【'+ name +'】连续失败次数清空并解除冻结？',function(){

        location.href = "<?php echo url('payway/let_could_use'); ?>?id=" + id;

    });

}

</script>

</body>

</html>
