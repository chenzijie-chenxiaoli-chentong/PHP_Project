<?php
namespace app\admin\controller;
class Log extends Base{

	function index(){

		model('AdminUser')->auth('log');

		$list = model('Log')->order('id desc')->paginate();

		$return_data = [

			'list'					=>	$list

		];

		$this->assign($return_data);

		return view();

	}

}