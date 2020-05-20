<?php
namespace app\common\model;
class AdminUser extends \think\Model{

	protected $table = 'admin_user';

	/*
	 * 权限检查
	 */

	function auth($auth){

		$pos = session('admin.pos');

		if($pos != 9){

			if( !in_array($auth, config('auth.' . $pos) ) ){

				$Controller = new \think\Controller;

				$Controller->error('没有权限');

			}
			
		}

	}

}