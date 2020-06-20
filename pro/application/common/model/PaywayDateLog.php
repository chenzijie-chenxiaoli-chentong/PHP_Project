<?php
namespace app\common\model;
class PaywayDateLog extends \think\Model{

	protected $table = 'payway_date_log';

	function log($id,$type,$money){

		$date = date('Y-m-d');

		$pay_way_date_ex = $this->where(['payway_id' => $id,'date' => $date])->find();

		if(!$pay_way_date_ex){

			return $this->insert([

				'payway_id'				=>	$id,
				'date'					=>	$date,
				$type.'_money'			=>	$money,
				$type.'_times'			=>	1,

			]);

		}

		$this->startTrans();

		$money_deal = $this->where(['payway_id' => $id,'date' => $date])->setInc($type.'_money',$money);

		$times_deal = $this->where(['payway_id' => $id,'date' => $date])->setInc($type.'_times',1);

		if($type == 'success') $this->where(['payway_id' => $id,'date' => $date])->update(['faild_times' => 0]);

		$payway_info = model('Payway')->where(['id' => $id])->field('success_max_money,success_max_num,frequence')->find();

		$payway_update = [

			'next_use_time' => time() + $payway_info['frequence']

		];

		if($payway_info['success_max_money'] <= $pay_way_date_ex['success_money']){

			$payway_update['could_use'] = 0;

			model('Wechat')->msg('通道ID【'. $id .'】停用，收款金额达到上限');

		}

		if($payway_info['success_max_num'] <= $pay_way_date_ex['success_times']){

			$payway_update['could_use'] = 0;

			model('Wechat')->msg('通道ID【'. $id .'】停用，收款次数达到上限');

		}

		model('Payway')->where(['id' => $id])->update($payway_update);

		$this->commit();

		return true;

	}

}