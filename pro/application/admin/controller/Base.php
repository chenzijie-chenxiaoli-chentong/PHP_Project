<?php
namespace app\admin\controller;
class Base extends \think\Controller{

	/*
	 * 身份验证
	 */

	function _initialize(){

		if( !session('admin') and !session('merchant') ) exit( '<script>top.location.href="'. url('index/index') .'";</script>' );

	}

	/*
	 * 首页
	 */

	function index(){

		if( session('admin.pos') == 1 ){

			$username = session('admin.username');
			$user_type = 'agent';

			#余额
			$my_info = model('AdminUser')->where(['username' => $username ])->field('money,fixed_money_ali_percent_fee,fixed_money_wechat_percent_fee,unfixed_money_ali_percent_fee,unfixed_money_wechat_percent_fee')->find();

			#今日商户请求订单
			$merchant_today_request = model('PayOrder')->where([

				'agent_code' 		=> session('admin.agent_code'),
				'create_time'		=> ['gt',strtotime('today') ],

			])->field('sum(fee) as money,count(*) as num')->find();

			#今日商户成功订单
			$merchant_today_success = model('PayOrder')->where([

				'agent_code' 		=> session('admin.agent_code'),
				'create_time'		=> ['gt',strtotime('today')],
				'status'			=> '1'

			])->field('sum(fee) as money,count(*) as num')->find();

			#当月商户成功订单

			$merchant_month_success = model('PayOrder')->where([

				'agent_code' 		=> session('admin.agent_code'),
				'create_time'		=> ['gt', strtotime( date('Y-m').'-01 00:00:00' ) ],
				'status'			=> '1'

			])->field('sum(fee) as money,count(*) as num')->find();

			$merchant_count = model('Merchant')->where(['creater_agent_code' => session('admin.agent_code') ])->count();

			$order_group_count = model('PayOrder')->where([

				'agent_code' 		=> session('admin.agent_code'),
				'create_time'		=> ['gt', strtotime( date('Y-m').'-01 00:00:00' ) ],
				'status'			=> '1'

			])->field('left(pay_time,10) as date,count(*) as num,sum(fee) as money')->group('left(pay_time,10)')->select();

			#总收入
			$count_in = model('MoneyLog')->where([

				'user_type' 		=> $user_type,
				'username' 			=> $username,
				'money'				=> ['gt',0]

			])->sum('money');

			#总提现
			$count_out = model('MoneyLog')->where([

				'user_type' 		=> $user_type,
				'username' 			=> $username,
				'money'				=> ['lt',0]

			])->sum('money');

		}elseif( session('merchant') ){

			$username = session('merchant.username');
			$user_type = 'merchant';

			#余额
			$my_info = model('Merchant')->where(['username' => $username ])->field('money,fixed_money_ali_percent_fee,fixed_money_wechat_percent_fee,unfixed_money_ali_percent_fee,unfixed_money_wechat_percent_fee')->find();

			#今日商户请求订单
			$merchant_today_request = model('PayOrder')->where([

				'username' 			=> $username,
				'create_time'		=> ['gt',strtotime('today') ],

			])->field('sum(fee) as money,count(*) as num')->find();

			#今日商户成功订单
			$merchant_today_success = model('PayOrder')->where([

				'username' 			=> $username,
				'create_time'		=> ['gt',strtotime('today')],
				'status'			=> '1'

			])->field('sum(fee) as money,count(*) as num')->find();

			#当月商户成功订单

			$merchant_month_success = model('PayOrder')->where([

				'username'	 		=> $username,
				'create_time'		=> ['gt', strtotime( date('Y-m').'-01 00:00:00' ) ],
				'status'			=> '1'

			])->field('sum(fee) as money,count(*) as num')->find();

			$merchant_count = 0;

			$order_group_count = model('PayOrder')->where([

				'username' 			=> $username,
				'create_time'		=> ['gt', strtotime( date('Y-m').'-01 00:00:00' ) ],
				'status'			=> '1'

			])->field('left(pay_time,10) as date,count(*) as num,sum(fee) as money')->group('left(pay_time,10)')->select();

			#总收入
			$count_in = model('MoneyLog')->where([

				'user_type' 		=> $user_type,
				'username' 			=> $username,
				'money'				=> ['gt',0]

			])->sum('money');

			#总提现
			$count_out = model('MoneyLog')->where([

				'user_type' 		=> $user_type,
				'username' 			=> $username,
				'money'				=> ['lt',0]

			])->sum('money');

			#echo model('MoneyLog')->GetLastSql();exit;

		}else{

			$user_type = 'agent';
			$username = session('admin.username');

			#余额
			$my_info = model('AdminUser')->where(['username' => $username ])->find();

			#今日商户请求订单
			$merchant_today_request = model('PayOrder')->where([

				'create_time'		=> ['gt',strtotime('today') ],

			])->field('sum(fee) as money,count(*) as num')->find();

			#今日商户成功订单
			$merchant_today_success = model('PayOrder')->where([

				'create_time'		=> ['gt',strtotime('today')],
				'status'			=> '1'

			])->field('sum(fee) as money,count(*) as num')->find();

			#当月商户成功订单

			$merchant_month_success = model('PayOrder')->where([

				'create_time'		=> ['gt', strtotime( date('Y-m').'-01 00:00:00' ) ],
				'status'			=> '1'

			])->field('sum(fee) as money,count(*) as num')->find();

			$order_group_count = model('PayOrder')->where([

				'create_time'		=> ['gt', strtotime( date('Y-m').'-01 00:00:00' ) ],
				'status'			=> '1'

			])->field('left(pay_time,10) as date,count(*) as num,sum(fee) as money')->group('left(pay_time,10)')->select();

			$merchant_count = model('Merchant')->count();

			#总收入
			$count_in = model('MoneyLog')->where([

				'money'				=> ['gt',0],
				'user_type'			=> 'platform',

			])->sum('money');

				#总提现
			$count_out = model('MoneyLog')->where([

				'money'				=> ['lt',0]

			])->sum('money');

		}

		$return_data = [

			'count_in'					=>	$count_in,
			'count_out'					=>	$count_out,
			'my_info'					=>	$my_info,
			'merchant_today_request'	=>	$merchant_today_request,
			'merchant_today_success'	=>	$merchant_today_success,
			'merchant_month_success'	=>	$merchant_month_success,
			'merchant_count'			=>	$merchant_count,
			'order_group_count'			=>	$order_group_count,

		];

		$this->assign($return_data);

		return view($user_type);

	}

	/*
	 * 退出登录
	 */

	function logout(){

		if( session('admin') ){

			session('admin',null);

			$this->success('退出成功','admin/index/index');
			
		}else{

			session('merchant',null);

			$this->success('退出成功','index/index/index');

		}

	}

	function change_my_pwd(){

		$pwd = input('pwd');

		if( strlen($pwd) < 6 ) $this->error('密码不能小于6位');

		if( session('admin') ){

			$deal = model('AdminUser')->where(['username' => session('admin.username') ])->update([

				'password'			=>	md5($pwd)

			]);

		}else{

			$deal = model('Merchant')->where(['username' => session('merchant.username') ])->update([

				'password'			=>	md5($pwd)

			]);

		}

		$this->success('修改成功');

	}

	function change_cash_pwd(){

		$pwd 			= input('pwd');
		$pwd_old 		= input('pwd_old');

		if( session('admin') ){

			$pwd_old_right = model('AdminUser')->where(['username' => session('admin.username')])->value('cash_password');

			if( md5($pwd_old) != $pwd_old_right ) $this->error('原密码错误');

			if(!$pwd) $this->error('密码不能为空');

			$deal = model('AdminUser')->where(['username' => session('admin.username')])->update([

				'cash_password'		=>	md5($pwd)

			]);

		}else{

			$pwd_old_right = model('Merchant')->where(['username' => session('merchant.username')])->value('cash_password');

			if( md5($pwd_old) != $pwd_old_right ) $this->error('原密码错误');

			if(!$pwd) $this->error('密码不能为空');

			$deal = model('Merchant')->where(['username' => session('merchant.username')])->update([

				'cash_password'		=>	md5($pwd)

			]);

		}

		$this->success('修改成功');

	}

}