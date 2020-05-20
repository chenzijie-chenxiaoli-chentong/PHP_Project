<?php
namespace app\admin\controller;
class Money extends Base{

	function index(){

		$where = [];

		$my_pos = session('admin.pos');

		if( $my_pos == 1 ){

			$where['user_type'] = 'agent';
			$where['username'] = session('admin.username');

		}else{

			if( input('username') ) $where['username'] = input('username');
			if( input('order_id') ) $where['order_id'] = input('order_id');
			if( input('starttime') ){

				if( strtotime( input('starttime') ) > strtotime( input('endtime') ) ) $this->error('开始时间不能大于结束时间');

				$where['time'] = ['between',[input('starttime') , input('endtime') ]];

			}

		}

		#return json($where);

		$list = model('MoneyLog')->where($where)->order('time desc')->paginate(15,false,['query' => input()]);

		$sum_money = model('MoneyLog')->where( array_merge($where,['money' => ['gt',0] ]) )->sum('money');

		$return_data = [

			'list'					=>	$list,
			'sum_money'				=>	$sum_money

		];

		$this->assign($return_data);

		return view();


	}

}