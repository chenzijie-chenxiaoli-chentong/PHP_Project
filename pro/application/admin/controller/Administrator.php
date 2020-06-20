<?php
namespace app\admin\controller;
class Administrator	extends Base{

	/*
	 * 首页
	 */

	function index(){

		$list = model('AdminUser')->paginate();

		$return_data = [

			'list'					=>	$list,
			'administrator_pos'		=>	config('administrator.pos')

		];

		$this->assign($return_data);

		return view();

	}

	/*
	 * 修改密码
	 */

	function change_pwd(){

		$username 		=	input('username');
		$pwd 			=	input('pwd');

		if( session('admin.pos') != 9 ){

			if( session('admin.username') != $username ) $this->error('此权限为超级管理员拥有');

		}

		$deal = model('AdminUser')->where(['username' => $username])->update([

			'password'		=>	md5($pwd)

		]);

		$log_deal = model('Log')->log('admin',session('admin.username'),'修改了管理员['. $username .']的登陆密码');

		$this->success('处理成功');

	}

	function create_page(){

		$id = input('id');

		$info = [];

		if($id) $info = model('AdminUser')->where(['id' => $id])->find();

		$return_data = [

			'administrator_pos'		=>	config('administrator.pos'),
			'info'					=>	$info,
			'id'					=>	$id,

		];

		$this->assign($return_data);

		return view();

	}

	/*
	 * 创建
	 */

	function create(){

		if( session('admin.pos') != 9 ) $this->error('权限不足');

		$id 								=	input('id');
		$username 							=	input('username');
		$password 							=	input('password');
		$pos 								=	input('pos');
		$fixed_money_ali_percent_fee 		=	input('fixed_money_ali_percent_fee');
		$fixed_money_wechat_percent_fee 	=	input('fixed_money_wechat_percent_fee');
		$unfixed_money_ali_percent_fee 		=	input('unfixed_money_ali_percent_fee');
		$unfixed_money_wechat_percent_fee 	=	input('unfixed_money_wechat_percent_fee');
		$mark 								=	input('mark');
		$is_active 							=	input('is_active');

		if($username == 'offical') $this->error('该账户已存在');

		$agent_code 		=	$username;

		if($pos == 0){

			if( !in_array(session('admin.pos'),[9]) ) $this->error('管理员只能由超级管理员创建');

			$agent_code = 'offical';
			
		}

		if($id){

			$deal = model('AdminUser')->where(['id' => $id])->update([

				'pos'								=>	$pos,
				'fixed_money_ali_percent_fee'		=>	$fixed_money_ali_percent_fee,
				'fixed_money_wechat_percent_fee'	=>	$fixed_money_wechat_percent_fee,
				'unfixed_money_ali_percent_fee'		=>	$unfixed_money_ali_percent_fee,
				'unfixed_money_wechat_percent_fee'	=>	$unfixed_money_wechat_percent_fee,
				'is_active'							=>	$is_active,
				'mark'								=>	$mark,

			]);

			$log = model('Log')->log('admin', session('admin.username') , '修改了帐号['. $username .']' );

		}else{

			$username_strlen = strlen($username);
			$password_strlen = strlen($password);

			if( $username_strlen < 6 or $username_strlen > 16 ) $this->error('帐号长度错误（6-16位）');
			if( $password_strlen < 6 or $password_strlen > 16 ) $this->error('密码长度错误（6-16位）');

			$user_ex = model('AdminUser')->where(['username' => $username])->count();

			if($user_ex) $this->error('帐号已存在');

			$deal = model('AdminUser')->create([

				'username'							=>	$username,
				'password'							=>	md5($password),
				'create_time'						=>	time(),
				'pos'								=>	$pos,
				'agent_code'						=>	$agent_code,
				'fixed_money_ali_percent_fee'		=>	$fixed_money_ali_percent_fee,
				'fixed_money_wechat_percent_fee'	=>	$fixed_money_wechat_percent_fee,
				'unfixed_money_ali_percent_fee'		=>	$unfixed_money_ali_percent_fee,
				'unfixed_money_wechat_percent_fee'	=>	$unfixed_money_wechat_percent_fee,
				'is_active'							=>	$is_active,
				'mark'								=>	$mark,

			]);

			$log = model('Log')->log('admin', session('admin.username') , '添加了帐号['. $username .']' );

		}

		$this->success('处理成功');

	}

	/*
	 * 删除
	 */

	function delete(){

		$username 		=	input('username');

		if( session('admin.pos') != 9 ) $this->error('权限不足');

		$user_pos = model('AdminUser')->where(['username' => $username])->value('pos');

		if($user_pos == 9) $this->error('超级管理员帐号不能删除');

		$deal = model('AdminUser')->where(['username' => $username])->delete();

		$log = model('Log')->log('admin', session('admin.username') , '删除了帐号['. $username .']' );

		$this->success('处理成功');

	}

}