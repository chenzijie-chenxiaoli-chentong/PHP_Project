<?php
namespace app\admin\controller;
class Payorder extends Base{

	function index(){


		$where = [];

		$my_pos = session('admin.pos');

		if( $my_pos == 1 ) $where['agent_code'] = session('admin.agent_code');

		if(! session('admin') and session('merchant') ) $where['username'] = session('merchant.username');

		if( input('order_id') ) $where['order_id|payway_order_id|transaction_id'] = input('order_id');
		if( input('username') ) $where['username'] = input('username');
		if( input('payway_id') ) $where['payway_id'] = input('payway_id');

		if( input('starttime') ){

			if( strtotime( input('starttime') ) > strtotime( input('endtime') ) ) $this->error('开始时间不能大于结束时间');

			$where['create_time'] = ['between',[strtotime( input('starttime') ),strtotime( input('endtime') )]];

		}

		if( input('belong') ){

			$payways = model('Payway')->where(['belong' => input('belong')])->column('id');

			$where['payway_id'] = ['in',$payways];

		}

		if( input('order_status') ) $where['status'] = input('order_status');

		$list = model('PayOrder')->where($where)->order('create_time desc')->paginate(15,false,['query' => input()]);

		$sum_fee = model('PayOrder')->where($where)->sum('fee');

		$payway_belong_list = model('Payway')->group('belong')->column('belong');
// var_export( config('order_status') );die;
		$return_data = [

			'list'					=>	$list,
			'order_status'			=>	config('order_status'),
			'sum_fee'				=>	$sum_fee,
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


	//更改订单状态
	function update_order_status(){

		$status = input('status');
		$order_id = input('orderid');
		if( ($status!='-2') && ($status!='1') ) die('status error');

		$res = model('PayOrder')->where(['order_id' => $order_id])->update(['status'=>$status]);
		if($res){
			echo json_encode(['flag'=>'1000','msg'=>'订单状态更改成功','data'=>'']);die;
		}else{
			echo json_encode(['flag'=>'9999','msg'=>'订单状态更改失败','data'=>'']);die;
		}




	}//end function

}