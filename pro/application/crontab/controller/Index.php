<?php
namespace app\crontab\controller;
class Index{

	function index(){

		$this->clear_expire_order();

		if( in_array(date('Hi'),['0000','0001']) ) $this->reset_payway_coulduse();

	}

	function reset_payway_coulduse(){

		model('Payway')->update([

			'could_use'		=>	1

		]);

	}

	function clear_expire_order(){

		$pay_order_model = model('PayOrder');

		$expire_orders = $pay_order_model->where(['status' => '-1','create_time' => ['lt', time()-300 ] ])->field('id')->select();

		foreach($expire_orders as $expire_order){

			$deal = $pay_order_model->where(['id' => $expire_order['id']])->update(['status' => '-2']);

		}

	}

}