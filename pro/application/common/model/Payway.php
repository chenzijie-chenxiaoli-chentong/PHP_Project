<?php
namespace app\common\model;
class Payway extends \think\Model{

	protected $table = 'payway';

	/*
	 * 获取可用通道
	 */

	function get_payway($method,$fee){

		$where = [

			'is_active'			=>	1,
			'could_use'			=>	1,
			'next_use_time'		=>	['lt',time()],

		];

		if($method == 'wechat') $where['is_wechat'] = 1;
		if($method == 'ali') $where['is_ali'] = 1;

		$target = $this->where($where)->order('last_use_no asc')->field('id,payway,params,last_use_no')->find();

		if(!$target){

			return [

				'status'		=>	false,
				'res'			=>	'平台当日收款已达上限'

			];

		}

		switch ($target['payway']) {

			case 'shouqianba':

				return [

					'status'		=>	true,
					'data'			=>	$target

				];

				break;
			
			default:

				return [

					'status'		=>	false,
					'res'			=>	'错误的payway【id:'. $target['id'] .'】'

				];

				break;
		}

	}

	/*
	 *
	 */

	function set_inc_last_use_no($id){

		$where = [

			'is_active'			=>	1,
			'could_use'			=>	1,

		];

		$biggest_no = $this->where($where)->order('last_use_no desc')->value('last_use_no');

		return $this->where(['id' => $id])->update([

			'last_use_no'		=>	$biggest_no+1

		]);

	}

}