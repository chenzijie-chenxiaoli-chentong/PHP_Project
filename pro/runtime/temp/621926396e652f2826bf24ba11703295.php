<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:68:"/www/wwwroot/pr/public/../application/admin/view/payorder/index.html";i:1596394087;s:53:"/www/wwwroot/pr/application/admin/view/base/head.html";i:1596394088;s:51:"/www/wwwroot/pr/application/admin/view/base/js.html";i:1596394089;}*/ ?>
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
<link href="/static/hplus/css/plugins/switchery/switchery.css" rel="stylesheet">
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">

                        <div class="row">
                            
                            <h5 class="col-md-1" style="margin-left: 20px;">订单列表</h5>

                            <div class="col-md-1"><b>自动刷新间隔</b></div>
                            <div class="col-md-1"><input class="form-control" value="<?php if(input('autorefresh')): ?><?php echo input('autorefresh'); endif; ?>" placeholder="单位：秒" type="text" id="refresh_interval"></div>
                            <div class="col-md-1"><b>是否自动刷新</b></div>
                            <div class="col-md-1"><input type="checkbox" class="js-switch" <?php if(input('autorefresh')): ?>checked<?php endif; ?> /></div>

                            
                        </div>

                    </div>
                    <div class="ibox-content">
                        <form class="row">
                            <?php if(session('admin')): ?>
                            <div class="col-sm-1">
                                <div class="input-group">
                                    <input type="text" name="username" placeholder="创建商户" value="<?php echo input('username'); ?>" class="input-sm form-control"> 
                                </div>
                            </div>
                            <?php endif; ?>

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

                            <div class="col-sm-1">
                                <div class="input-group">
                                    <select name="order_status" class="form-control">
                                        <?php if(input('order_status')): ?>
                                        <option value="<?php echo input('order_status'); ?>">
                                            
                                            <?php echo $order_status[input('order_status')]['name']; ?>

                                        </option>
                                        <?php endif; ?>
                                        <option value="">全部状态</option>
                                        <?php foreach($order_status as $code => $content): ?>

                                        <option value="<?php echo $code; ?>"><?php echo $content['name']; ?></option>

                                        <?php endforeach; ?>

                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-2">
                                <div class="input-group">
                                    <input type="text" name="order_id" placeholder="订单号" value="<?php echo input('order_id'); ?>" class="input-sm form-control"> 
                                </div>
                            </div>

                            <div class="col-sm-1">
                                <div class="input-group">
                                    <input type="text" name="payway_id" placeholder="通道ID" value="<?php echo input('payway_id'); ?>" class="input-sm form-control"> 
                                </div>
                            </div>

                            <div class="col-sm-1">
                                <select class="form-control" name="belong">
                                    
                                <option value="">所有所属人</option>

                                <?php foreach($payway_belong_list as $payway_belong): ?>

                                <option value="<?php echo $payway_belong; ?>"><?php echo $payway_belong; ?></option>

                                <?php endforeach; ?>

                                </select>
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
                                        <th>ID</th>
                                        <th>创建商户</th>
                                        <th>订单号</th>
                                        <?php if(in_array(session('admin.pos'),[0,9])): ?><th>通道ID</th><?php endif; ?>
                                        <th>支付费用-实际到账</th>
                                        <th>支付方式</th>
                                        <th>创建时间</th>
                                        <th>支付时间</th>
                                        <th>状态</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($list as $data): ?>
                                    <tr>

                                        <td><?php echo $data['id']; ?></td>
                                        <td><?php echo $data['username']; ?></td>
                                        <td onclick="order_id_detials('<?php echo $data['order_id']; ?>','<?php echo $data['payway_order_id']; ?>','<?php echo $data['transaction_id']; ?>');"><?php echo $data['order_id']; ?></td>
                                        <?php if(in_array(session('admin.pos'),[0,9])): ?><td><?php echo $data['payway_id']; ?></td><?php endif; ?>
                                        <td><?php echo $data['fee']/100; ?> - <label <?php if($data['status'] == 1 and $data['fee'] != $data['act_fee']): ?>style="color:red;"<?php endif; ?>><?php echo $data['act_fee']/100; ?></label></td>
                                        <td><?php echo $data['method']; ?>(<?php echo $data['agent_type']=='mobile'?'手机' : '电脑'; ?>)</td>
                                        <td><?php echo $data['create_time']; ?></td>
                                        <td><?php if(strtotime($data['pay_time']) > 0): ?> <?php echo $data['pay_time']; endif; ?></td>
                                        <td class="orderStatus">
                                        
                                            <!---->

                                            <!--    <button class="btn btn-danger btn-xs" onclick="confirm_order('');"></button>-->

                                            <!---->

	                                                <?php if($data['status']==''): ?>
	                                                    <button class="btn btn-success btn-xs"
	                                                    onclick="confirm_status(this , '<?php echo $data['order_id']; ?>','1');"> <?php echo $order_status[1]['name']; ?>
	                                                    </button>
	                                                    <button class="btn btn-danger btn-xs"
	                                                    onclick="confirm_status(this , '<?php echo $data['order_id']; ?>','-2');"> <?php echo $order_status[-2]['name']; ?>
	                                                    </button>
	                                                <?php else: ?>
	                                                    <font color='<?php echo $data['status']=='1'?'green':'red'; ?>'><?php echo $order_status[$data['status']]['name']; ?></font>
	                                                <?php endif; ?>

                                            <!---->

                                        </td>

                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php echo $list->render(); ?>
                    </div>
                    共计【<?php echo $sum_fee/100; ?>】元
                </div>
            </div>

        </div>
    </div>

    <div id="success_order_div" style="display: none;padding: 10px;">
        <form action="<?php echo url('payorder/success_deal'); ?>">
            <input type="text" class="form-control" name="order_id" id="success_order_id" style="margin:10px 0;">
            <input type="text" class="form-control" name="sn" placeholder="商户单号" style="margin:10px 0;">
            <input type="text" class="form-control" name="trade_no" placeholder="交易单号" style="margin:10px 0;">
            <input type="text" class="form-control" name="total_amount" placeholder="实际到账金额" style="margin:10px 0;">
            <button  style="margin:10px 0;" class="btn btn-info btn-block">确认</button>
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
<script type="text/javascript" src="/static/laydate/laydate.js"></script>

<script src="/static/hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>

<script src="/static/hplus/js/plugins/switchery/switchery.js"></script>

<script src="/static/hplus/js/plugins/cropper/cropper.min.js"></script>

<script src="/static/hplus/js/demo/form-advanced-demo.js"></script>



<script type="text/javascript">

    laydate.render({
      elem: '[name=starttime]', //指定元素
      type:'datetime'
    });    laydate.render({
      elem: '[name=endtime]', //指定元素
      type:'datetime'
    });

    var refresh_interval;

    if( $('.js-switch').is(':checked') ) autorefresh( <?php echo input('autorefresh'); ?> );

    $('.js-switch').change(function(){

        if( $(this).is(':checked') ){

            refresh_interval_sec = $('#refresh_interval').val();

            if(refresh_interval_sec < 3){

                layer.alert('刷新间隔最小为3秒');

                $(this).removeAttr('checked');



                return false;

            }else{

                autorefresh(refresh_interval_sec);
                
            }

        }else{

            clearTimeout(refresh_interval);
            
        }

    })

    function autorefresh(refresh_interval_sec){

        refresh_interval = setTimeout(function(){
            href = '?autorefresh=' + refresh_interval_sec;
			console.log(href);
            location.href = href;

        },refresh_interval_sec*1000 );

    }

    function order_id_detials(order_id,payway_order_id,transaction_id){

        var str = '平台订单号：' + order_id + '<br/>';

            str += '商户单号：' + payway_order_id + '<br/>';

            str += '交易单号：' + transaction_id + '<br/>';

        layer.alert(str);

    }

    function confirm_order(order_id){

        $('#success_order_id').val(order_id);

        layer.open({

            type:1,
            content:$('#success_order_div'),
            area:["<?php if(is_mobile()): ?>75%<?php else: ?>25%<?php endif; ?>",'40%'],
            title:'将该订单处理为成功'

        })

    }


    //确定更改订单状态
    function confirm_status(obj , orderid , status){
        ///console.log(orderid , status);
		if( confirm('确定更改订单状态吗?') === false ) { return false; }
        $.ajax({
            url:'/admin/payorder/update_order_status',
            type:'post',
            data:{orderid:orderid,status:status},
            dataType:'json',
            success:function(res){
                // console.log(res);
                //alert(res.msg);
                if(res.flag=='1000'){
                    var text = (status=='1') ? "<font color='green'><?php echo $order_status[1]['name']; ?></font>" : "<font color='red'><?php echo $order_status[-2]['name']; ?></font>";
                    $(obj).parent('td').html(text);
                }else{

                }
            },
            error:function(){

            }
        });
    }



</script>

</body>

</html>
