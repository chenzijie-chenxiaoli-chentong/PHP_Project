<?php
namespace app\admin\controller;
use think\Exception;

class Sms extends Base{

    function index(){
        $where = [];

        $my_pos = session('admin.pos');

//        if( $my_pos == 1 ) $where['agent_code'] = session('admin.agent_code');

//        if(! session('admin') and session('merchant') ) $where['username'] = session('merchant.username');
//
//        if( input('order_id') ) $where['order_id|payway_order_id|transaction_id'] = input('order_id');
//        if( input('username') ) $where['username'] = input('username');
//        if( input('payway_id') ) $where['payway_id'] = input('payway_id');

        if( input('starttime') ){

            if( strtotime( input('starttime') ) > strtotime( input('endtime') ) ) $this->error('开始时间不能大于结束时间');

            $where['create_time'] = ['between',[strtotime( input('starttime') ),strtotime( input('endtime') )]];

        }

        if( input('belong') ){

            $payways = model('Payway')->where(['belong' => input('belong')])->column('id');

            $where['payway_id'] = ['in',$payways];

        }

        if( input('order_status') ) $where['status'] = input('order_status');

        //分页查询 一页15条数据
        $list = model('Sms')->where($where)->order('create_time desc')->paginate(15,false,['query' => input()]);
        //查询金额
        $sum_fee = model('Sms')->where($where)->sum('fee');

        $payway_belong_list = model('Payway')->group('belong')->column('belong');

        $return_data = [

            'list'					=>	$list,  //账单列表
            'order_status'			=>	config('order_status'), //订单状态
            'sum_fee'				=>	$sum_fee, //金额
            'payway_belong_list'	=>	$payway_belong_list,

        ];

        $this->assign($return_data);

        return view();

    }

    function success_deal(){

        if( session('admin.pos') != 9 ) $this->error('权限不足');

        $order_id = input('order_id');

        $params = [

            'sn'				=>	input('sn'),
            'order_id'			=>	$order_id,
            'trade_no'			=>	input('trade_no'),
            'total_amount'		=>	( floatval(input('total_amount')) * 100 ),

        ];

        $url = config('api_domain') . '/api/base/admin_success_order?' . http_build_query($params);

        $result = file_get_contents( $url );

        if($result != '1') $this->error('程序错误，请联系管理员');

        $log_deal = model('Log')->insert([

            'type'			=>	'admin',
            'username'		=>	session('admin.username'),
            'create_time'	=>	time(),
            'content'		=>	'手动将订单【'. $order_id .'】成功'

        ]);

        $this->success('处理成功');

    }


    //补单录入
    function sms_insert(){
        //接收ajax传输过来的参数
        $bankcard_num = input('bankcard_num');
        $sms_content = input('sms_content');
        $fee = input('fee');
        $pay_time = input('pay_time');

        try{
            //写入数据
            model('Sms')->insert([
                'bankcard_num' => $bankcard_num,  //卡号
                'sms_content' => $sms_content,  //短信内容
                'fee' => floatval($fee) * 100,  //金额
                'create_time' => time(),  //当前时间
                'pay_time' => $pay_time,  //时间
            ]);
            //返回结果 ajax可接收判断执行状态
            return json_encode(['flag' => '10000', 'msg' => '成功']);
        }catch (Exception $e) {
            return json_encode(['flag' => '10001', 'msg' => '失败']);
        }

    }//end function

}