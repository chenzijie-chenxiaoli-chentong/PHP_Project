<?php
namespace app\common\model;
class Log extends \think\Model{

	protected $table = 'log';

	/*
	 * 记录日志
	 */

	function log($type,$username,$content){

		return $this->insert([

			'type'				=>	$type,
			'username'			=>	$username,
			'create_time'		=>	time(),
			'content'			=>	$content

		]);

	}

}