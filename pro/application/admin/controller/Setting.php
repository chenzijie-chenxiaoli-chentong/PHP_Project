<?php
namespace app\admin\controller;
class Setting extends Base{

	static $setting_type_a = [

		'min_cash',
		'text_use_payway'

	];

	static $setting_type_b = [

		'wechat_msg_reciver',

	];

	function index(){

		$payway_list = model('Payway')->column('id,payway,name,params','id');

		$return_data = [

			'payway_list'				=>	$payway_list,

		];
		
		//print_r($return_data);die;
		//var_dump(setting('min_cash'));die;
		

		$this->assign($return_data);

		return view();

	}

	function set(){

		$key = input('key');

		if( in_array( $key , self::$setting_type_a ) ){

			$val = input('val');

			$deal = model('Setting')->setting($key,$val);

		}

		if( in_array( $key , self::$setting_type_b ) ){

			$val = input('val/a') ?: [];

			$res = [];
			if( setting('wechat_msg_reciver') ){
				foreach( setting('wechat_msg_reciver') as $mark => $switch ){
	
					$res[$mark] = 0;
	
					if( in_array($mark,$val) ) $res[$mark] = 1;
	
				}
			}

			$deal = model('Setting')->setting($key,$res);

		}

		$this->success('处理成功');

	}

}