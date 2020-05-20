<?php
namespace app\admin\controller;
class Merchant extends Base{

	function index(){

		$where = [];

		if( session('admin.agent_code') != 'offical' ) $where['creater_agent_code'] = session('admin.agent_code');

		$list = model('Merchant')->where($where)->paginate();

		$return_data = [

			'list'					=>	$list

		];

		$this->assign($return_data);

		return view();

	}

	function create(){

		$username							=	input('username');
		$password							=	input('password');
		$name								=	input('name');
		$mark								=	input('mark');
		$status								=	input('status');
		$fixed_money_ali_percent_fee		=	floatval(input('fixed_money_ali_percent_fee'));
		$fixed_money_wechat_percent_fee		=	floatval(input('fixed_money_wechat_percent_fee'));
		$unfixed_money_ali_percent_fee		=	floatval(input('unfixed_money_ali_percent_fee'));
		$unfixed_money_wechat_percent_fee	=	floatval(input('unfixed_money_wechat_percent_fee'));

		$username_strlen = strlen($username);
		$password_strlen = strlen($password);

		if( $username_strlen < 6 or $username_strlen > 16 ) $this->error('帐号长度错误（6-16位）');
		if( $password_strlen < 6 or $password_strlen > 16 ) $this->error('密码长度错误（6-16位）');

		$admin_session = session('admin');

		if($fixed_money_ali_percent_fee < $admin_session['fixed_money_ali_percent_fee'] ) $this->error('费率必须大于【'. $admin_session['fixed_money_ali_percent_fee'] .'%】');
		if($fixed_money_wechat_percent_fee < $admin_session['fixed_money_wechat_percent_fee'] ) $this->error('费率必须大于【'. $admin_session['fixed_money_wechat_percent_fee'] .'%】');
		if($unfixed_money_ali_percent_fee < $admin_session['unfixed_money_ali_percent_fee'] ) $this->error('费率必须大于【'. $admin_session['unfixed_money_ali_percent_fee'] .'%】');
		if($unfixed_money_wechat_percent_fee < $admin_session['unfixed_money_wechat_percent_fee'] ) $this->error('费率必须大于【'. $admin_session['unfixed_money_wechat_percent_fee'] .'%】');

		$user_ex = model('Merchant')->where(['username' => $username])->count();

		if($user_ex) $this->error('账号已存在');

		$deal = model('Merchant')->insert([

			'username'							=>	$username,
			'password'							=>	md5($password),
			'create_time'						=>	time(),
			'creater_agent_code'				=>	$admin_session['agent_code'],
			'fixed_money_ali_percent_fee'		=>	$fixed_money_ali_percent_fee,
			'fixed_money_wechat_percent_fee'	=>	$fixed_money_wechat_percent_fee,
			'unfixed_money_ali_percent_fee'		=>	$unfixed_money_ali_percent_fee,
			'unfixed_money_wechat_percent_fee'	=>	$unfixed_money_wechat_percent_fee,
			'name'								=>	$name,
			'mark'								=>	$mark,
			'status'							=>	$status,

		]);

		$log_deal = model('Log')->log('admin', session('admin.username'),'创建了商户【'. $username .'】' );

		$this->success('处理成功');

	}

	function edit(){

		$id = input('id');

		$info = model('Merchant')->where(['id' => $id])->find();

		if( session('admin.pos') == 1 and $info['creater_agent_code'] != session('admin.agent_code') ) $this->error('权限不足');

		$return_data = [

			'info'			=>	$info,
			'id'			=>	$id,

		];

		$this->assign($return_data);

		return view();

	}

	function edit_deal(){

		$id									=	input('id');
		$name								=	input('name');
		$mark								=	input('mark');
		$status								=	input('status');
		$fixed_money_ali_percent_fee		=	floatval(input('fixed_money_ali_percent_fee'));
		$fixed_money_wechat_percent_fee		=	floatval(input('fixed_money_wechat_percent_fee'));
		$unfixed_money_ali_percent_fee		=	floatval(input('unfixed_money_ali_percent_fee'));
		$unfixed_money_wechat_percent_fee	=	floatval(input('unfixed_money_wechat_percent_fee'));
		$ali_percent_fee					=	floatval(input('ali_percent_fee'));

		$info = model('Merchant')->where(['id' => $id])->find();

		if( session('admin.pos') == 1 and $info['creater_agent_code'] != session('admin.agent_code') ) $this->error('权限不足');

		$admin_session = session('admin');

		if($fixed_money_ali_percent_fee < $admin_session['fixed_money_ali_percent_fee'] ) $this->error('费率必须大于【'. $admin_session['fixed_money_ali_percent_fee'] .'%】');
		if($fixed_money_wechat_percent_fee < $admin_session['fixed_money_wechat_percent_fee'] ) $this->error('费率必须大于【'. $admin_session['fixed_money_wechat_percent_fee'] .'%】');
		if($unfixed_money_ali_percent_fee < $admin_session['unfixed_money_ali_percent_fee'] ) $this->error('费率必须大于【'. $admin_session['unfixed_money_ali_percent_fee'] .'%】');
		if($unfixed_money_wechat_percent_fee < $admin_session['unfixed_money_wechat_percent_fee'] ) $this->error('费率必须大于【'. $admin_session['unfixed_money_wechat_percent_fee'] .'%】');

		$deal = model('Merchant')->where(['id' => $id])->update([

			'fixed_money_ali_percent_fee'		=>	$fixed_money_ali_percent_fee,
			'fixed_money_wechat_percent_fee'	=>	$fixed_money_wechat_percent_fee,
			'unfixed_money_ali_percent_fee'		=>	$unfixed_money_ali_percent_fee,
			'unfixed_money_wechat_percent_fee'	=>	$unfixed_money_wechat_percent_fee,
			'name'								=>	$name,
			'mark'								=>	$mark,
			'status'							=>	$status,

		]);

		$log_deal = model('Log')->log('admin', session('admin.username'),'修改了商户【'. $info['username'] .'】' );

		$this->success('处理成功');

	}

	/*
	 * 修改密码
	 */

	function reset_pwd(){

		$username 		=	input('username');
		$agent_code 	=	input('agent_code');

		$user_info = model('Merchant')->where(['username' => $username])->find();

		if( !in_array(session('admin.agent_code'),[0,9]) and $user_info['creater_agent_code'] != session('admin.agent_code') ) $this->error('权限不足');

		$deal = model('Merchant')->where(['username' => $username])->update([

			'password'			=>	md5('123456'),
			'cash_password'		=>	md5('123456'),

		]);

		$log_deal = model('Log')->log('admin',session('admin.username'),'重置了商户['. $username .']的登陆密码');

		$this->success('处理成功');

	}

	/*
	 * 删除
	 */

	function delete(){

		$username 		=	input('username');
		$agent_code 	=	input('agent_code');

		if( !in_array(session('admin.agent_code'),[0,9]) ) $this->error('权限不足');

		$deal = model('Merchant')->where(['username' => $username])->delete();

		$log = model('Log')->log('admin', session('admin.username') , '删除了商户['. $username .']' );

		$this->success('处理成功');

	}

}