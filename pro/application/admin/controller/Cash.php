<?php
namespace app\admin\controller;
class Cash extends Base{

	function index(){

		$where = [];

		if( session('admin.pos') == 1 ){

			$where['username'] = session('admin.username');
			$where['user_type'] = 'agent';

		}

		if( !session('admin') ){

			$where['user_type'] = 'merchant';
			$where['username'] = session('merchant.username');

		}

		$money_account_list = [];

		if( session('admin.pos') == 1 ){

			$money_account_list = model('MoneyAccount')->where(['user_type' => 'agent','username' => session('admin.username')])->field('id,name,account_type,mark')->select();

			if(!$money_account_list) $this->error('您还没有添加资金账户，请前往添加资金账户','moneyaccount/index');

		}

		if( session('merchant') ){

			$money_account_list = model('MoneyAccount')->where(['user_type' => 'merchant','username' => session('merchant.username')])->field('id,name,account_type,mark')->select();

			if(!$money_account_list) $this->error('您还没有添加资金账户，请前往添加资金账户','moneyaccount/index');

		}

		$list = model('Cash')->where($where)->order('id desc')->paginate();

		$return_data = [

			'list'						=>	$list,
			'money_account_list'		=>	$money_account_list,
			'cash_status'				=>	config('cash_status'),

		];

		$this->assign($return_data);

		return view();

	}

	function create(){

		$money 					=	floatval(input('money'));
		$money_account 			=	input('money_account');
		$cash_password 			=	input('cash_password');

		$min_cash = cache('setting')['min_cash'];

		if($money < $min_cash) $this->error('提现金额必须大于【'. $min_cash .'】元');

		if( session('admin.pos') == 1 ){

			$username = session('admin.username');

			$user_type = 'agent';

			$my_info = model('AdminUser')->where(['username' => $username])->find();

		}elseif( session('merchant') ){

			$username = session('merchant.username');

			$user_type = 'merchant';

			$my_info = model('Merchant')->where(['username' => $username])->find();

		}else{

			$this->error('此操作由代理人或商户操作');

		}

		$my_money = $my_info['money'];

		if($my_info['cash_password'] != md5($cash_password) ) $this->error('提现密码错误');

		$money = $money * 100;

		if($money > $my_money ) $this->error('提现金额必须小于您的余额【'. $my_money/100 .'】元');

		$money_account_ex = model('MoneyAccount')->where(['id' => $money_account,'user_type' => $user_type])->find();

		if(!$money_account_ex) $this->error('错误的收款账户');

		if($money_account_ex['username'] != $username ) $this->error('错误的收款账户');

		$is_cashing = model('Cash')->where(['user_type' => $user_type,'username' => $username,'status' => 0])->find();

		if($is_cashing) $this->error('您有提现申请正在处理，请等待处理完成后再次进行提现');

		model('Wechat')->msg('申请提现【'. $money/100 .'】元，请后台处理');

		$deal = model('Cash')->insert([

			'user_type'					=>	$user_type,
			'username'					=>	$username,
			'create_time'				=>	time(),
			'deal_time'					=>	0,
			'status'					=>	0,
			'money_account_id'			=>	$money_account,
			'mark'						=>	'',
			'money'						=>	$money

		]);

		$this->success('处理成功');

	}

	function deal(){

		if( !in_array(session('admin.pos'),[0,9]) ) $this->error('权限不足');

		$id 				=	input('id');
		$status 			=	input('status');
		$mark 				=	input('mark');

		$cash_info = model('Cash')->where(['id' => $id])->find();

		if($cash_info['status'] != 0) $this->error('状态错误');

		if($status == 1){

			model('Cash')->startTrans();

			$deal1 = model('Cash')->where(['id' => $id])->update([

				'status' 		=> 	1,
				'deal_time'		=>	time(),
				'mark'			=>	$mark

			]);

			if($cash_info['user_type'] == 'agent') $deal2 = model('AdminUser')->where(['username' => $cash_info['username']])->setDec('money',$cash_info['money']);

			if($cash_info['user_type'] == 'merchant') $deal2 = model('Merchant')->where(['username' => $cash_info['username']])->setDec('money',$cash_info['money']);

			$deal3 = model('MoneyLog')->log($cash_info['user_type'],$cash_info['username'],-$cash_info['money'],'申请提现成功');
			
			if(!$deal1 or !$deal2 or !$deal3) $this->error('程序错误，请重试');

			model('Cash')->commit();

		}

		if($status == 2){

			if(!$mark) $this->error('请填写失败原因');

			$deal = model('Cash')->where(['id' => $id])->update([

				'status' 		=> 2,
				'mark'			=>	$mark,
				'deal_time'		=>	time(),

			]);

		}

		$this->success('处理成功');

	}

	function read_cash_account_info(){

		$id = input('id');

		$info = model('MoneyAccount')->where(['id' => $id])->find();

		if(!$info) return json(['code' => 0]);

		$info['account_info'] = json_decode($info['account_info'],true);

		return json([

			'code'			=>	1,
			'data'			=>	$info

		]);

	}

}