<?php
namespace app\admin\controller;
class Moneyaccount extends Base{

	function index(){

		$where = [];

		if( session('admin.pos') == 1 ){

			$where['user_type'] = 'agent';
			$where['username'] = session('admin.username');

		}

		if( !session('admin') ){

			$where['user_type'] = 'merchant';
			$where['username'] = session('merchant.username');

		}

		$list = model('MoneyAccount')->where($where)->paginate();

		$return_data = [

			'list'					=>	$list,
			'moneyaccount_conf'		=>	config('moneyaccount'),
			'pos_conf'				=>	config('administrator.pos'),

		];

		$this->assign($return_data);

		return view();

	}

	function create(){

		$account_type 	= input('account_type');
		$id 			= input('id');

		if( !array_key_exists($account_type, config('moneyaccount') ) ) $this->error('错误的帐户类型');

		$account_info = [];

		if($id){

			$account_info = model('MoneyAccount')->where(['id' => $id])->find();

			switch ($account_info['user_type']) {

				case 'agent':

					if( !in_array(session('admin.pos'),[0,9]) and session('admin.username') != $account_info['username'] ) $this->error('权限不足');

					break;

				case 'merchant':

					if( !in_array(session('admin.pos'),[0,9]) ) $this->error('权限不足');

					break;
				
				default:

					$this->error('程序错误，错误代码10003');

					break;
			}

			$account_info['account_info'] = json_decode($account_info['account_info'],true);

		}

		$return_data = [

			'account_type'			=>	$account_type,
			'account_info'			=>	$account_info,
			'moneyaccount_conf'		=>	config('moneyaccount.' . $account_type ),

		];

		$this->assign($return_data);

		return view();

	}

	function create_deal(){

		if( session('admin.pos') != 1 and !session('merchant') ) $this->error('只有代理人和商户可以添加');

		$id 					= input('id');
		$name 					= input('name');
		$account_type 			= input('account_type');
		$mark 					= input('mark');

		if( !array_key_exists($account_type, config('moneyaccount') ) ) $this->error('错误的帐户类型');

		if(!$name) $this->error('名称不能为空');

		$moneyaccount_conf		=	config('moneyaccount.' . $account_type );

		$account_params = [];

		foreach( $moneyaccount_conf['fields'] as $key => $val ){

			$account_params[$key] = input($key);

		}

		if($id){

			$account_info = model('MoneyAccount')->where(['id' => $id])->find();

			switch ($account_info['user_type']) {

				case 'agent':

					if( !in_array(session('admin.pos'),[0,9]) and session('admin.username') != $account_info['username'] ) $this->error('权限不足');

					break;

				case 'merchant':

					if( !in_array(session('admin.pos'),[0,9]) ) $this->error('权限不足');

					break;
				
				default:

					$this->error('程序错误，错误代码10003');

					break;
			}

			$deal = model('MoneyAccount')->where(['id' => $id])->update([

				'name'			=>	$name,
				'mark'			=>	$mark,
				'account_info'	=>	json_encode($account_params),

			]);

		}else{

			$user_type = 'merchant';
			$username = session('merchant.username');

			if( session('admin') ){

				$user_type = 'agent';
				$username = session('admin.username');

			}

			$deal = model('MoneyAccount')->insert([

				'name'			=>	$name,
				'account_type'	=>	$account_type,
				'mark'			=>	$mark,
				'user_type'		=>	$user_type,
				'username'		=>	$username,
				'account_info'	=>	json_encode($account_params),

			]);

		}



		$this->success('处理成功');

	}

	function delete(){

		$id = input('id');

		$account_info = model('MoneyAccount')->where(['id' => $id])->find();

		switch ($account_info['user_type']) {

			case 'agent':

				if( !in_array(session('admin.pos'),[0,9]) and session('admin.username') != $account_info['username'] ) $this->error('权限不足');

				break;

			case 'merchant':

				if( !in_array(session('admin.pos'),[0,9]) ) $this->error('权限不足');

				break;
			
			default:

				$this->error('程序错误，错误代码10003');

				break;
		}

		$deal = model('MoneyAccount')->where(['id' => $id])->delete();

		$this->success('处理成功');

	}

}