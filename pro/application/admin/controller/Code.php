<?php
namespace app\admin\controller;
use think\Exception;

class Code extends Base{

    function index(){
        $where = [];

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
        $list = model('Code')->where($where)->order('id desc')->paginate(15,false,['query' => input()]);
        //查询手机号
        $phone = model('Code')->where($where)->sum('phone');

        $return_data = [

            'list'					=>	$list,  // 验证码列表
            'sum_fee'				=>	$phone, // 金额

        ];

        $this->assign($return_data);

        return view();

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