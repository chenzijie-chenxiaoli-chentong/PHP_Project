<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:77:"/www/wwwroot/47.56.64.247/public/../application/admin/view/base/merchant.html";i:1563192915;s:63:"/www/wwwroot/47.56.64.247/application/admin/view/base/head.html";i:1558411548;s:61:"/www/wwwroot/47.56.64.247/application/admin/view/base/js.html";i:1558020051;}*/ ?>
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
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>收入</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><?php echo $count_in/100; ?></h1>
                        <div class="stat-percent font-bold text-success"><i class="fa fa-rmb"></i></div>
                        <small>总收入</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>提现</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><?php echo abs($count_out/100); ?></h1>
                        <div class="stat-percent font-bold text-info"><i class="fa fa-money"></i>
                        </div>
                        <small>总提现金额</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>余额</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><?php echo $my_info['money']/100; ?></h1>
                        <div class="stat-percent font-bold text-navy"><i class="fa fa-building"></i>
                        </div>
                        <small>当前余额</small>
                    </div>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>费率(支原-微原-支固-微固)</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><?php echo $my_info['fixed_money_ali_percent_fee']; ?>%-<?php echo $my_info['fixed_money_wechat_percent_fee']; ?>%-<?php echo $my_info['unfixed_money_ali_percent_fee']; ?>%-<?php echo $my_info['unfixed_money_wechat_percent_fee']; ?>%</h1>
                        <div class="stat-percent font-bold text-danger"><i class="fa fa-calculator"></i>
                        </div>
                        <small>订单收入费率</small>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">

            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>今日请求订单</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><?php echo !empty($merchant_today_request['money']/100)?$merchant_today_request['money']/100: 0; ?></h1>
                        <div class="stat-percent font-bold text-danger"> <i class="fa fa-flash"></i>
                        </div>
                        <small>订单数量：<?php echo $merchant_today_request['num']; ?></small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>今日成功订单</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><?php echo !empty($merchant_today_success['money']/100)?$merchant_today_success['money']/100: 0; ?></h1>
                        <div class="stat-percent font-bold text-danger"><i class="fa fa-fire"></i>
                        </div>
                        <small>订单数量：<?php echo $merchant_today_success['num']; ?></small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>当月成功订单</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><?php echo !empty($merchant_month_success['money']/100)?$merchant_month_success['money']/100: 0; ?></h1>
                        <div class="stat-percent font-bold text-danger"><i class="fa fa-history"></i>
                        </div>
                        <small>订单数量：<?php echo $merchant_month_success['num']; ?></small>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>订单统计</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="flot-chart" style="min-height: 300px;">
                                    <div class="flot-chart-content" id="flot-dashboard-chart"></div>
                                </div>
                            </div>
                        </div>
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
<script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>
<script type="text/javascript">

    var myChart = echarts.init(document.getElementById('flot-dashboard-chart'));

    var dates = new Array;
    var moneys = new Array;
    var nums = new Array;
    i = 0;
    $.each( eval('(' + '<?php echo json_encode($order_group_count); ?>' + ')' ),function(k,v){

        dates[i] = v.date;
        moneys[i] = v.money/100;
        nums[i] = v.num;

        i++;

    } );

    console.log(dates);
    
    myChart.setOption({
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            crossStyle: {
                color: '#999'
            }
        }
    },
    toolbox: {
        feature: {
            dataView: {show: true, readOnly: false},
            magicType: {show: true, type: ['line', 'bar']},
            restore: {show: true},
            saveAsImage: {show: true}
        }
    },
    legend: {
        data:['成功金额','成功订单量']
    },
    xAxis: [
        {
            type: 'category',
            data: dates,
            axisPointer: {
                type: 'shadow'
            }
        }
    ],
    yAxis: [
        {
        },
        {
        }
    ],
    series: [
        {
            name:'成功金额',
            type:'bar',
            barWidth:10,
            data:moneys
        },
        {
            name:'成功订单量',
            type:'line',
            yAxisIndex: 1,
            data:nums
        }
    ]
});



</script>