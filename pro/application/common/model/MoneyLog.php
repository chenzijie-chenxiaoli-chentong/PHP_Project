<?php
namespace app\common\model;
class MoneyLog extends \think\Model{

	protected $table = 'money_log';

	function log($user_type,$username,$money,$mark){

		return $this->insert([

			'user_type'					=>	$user_type,
			'username'					=>	$username,
			'time'						=>	date('Y-m-d H:i:s'),
			'date'						=>	date('Y-m-d'),
			'money'						=>	$money,
			'mark'						=>	$mark,

		]);

	}

}