<?php
namespace app\common\model;
class PayOrder extends \think\Model{

	protected $table = 'pay_order';

	function success_deal($order_id,$pay_time){
		
		$order_info = $this->where(['order_id' => $order_id])->find();

		cache('order_'. $order_id .'_success',$order_info);

		if($order_info['status'] != '-1') return true;

		$deal_arr = [];

		$this->startTrans();

		$deal_arr['step1_order_deal'] = $this->where(['order_id' => $order_id])->update([

			'status'				=>	1,
			'pay_time'				=>	date('Y-m-d H:i:s',$pay_time)

		]);

		$merchant_info = model('Merchant')->where(['username' => $order_info['username'] ])->find();

		$agent_info = model('AdminUser')->where(['agent_code' => $merchant_info['creater_agent_code'] ])->find();

		$merchant_should_get_money = floor($order_info['fee'] * (100 - $merchant_info[ $order_info['method'] . '_percent_fee'])/100 );

		$agent_should_get_money = floor( ( $merchant_info[ $order_info['method'] . '_percent_fee'] - $agent_info['percent_fee'] )/100 * $order_info['fee'] );

		$platform_should_get_money = $order_info['fee'] - $merchant_should_get_money - $agent_should_get_money;

		$deal_arr['step2_merchant_money_deal'] = model('Merchant')->where(['username' => $order_info['username'] ])->setInc('money',$merchant_should_get_money);

		if(!$merchant_should_get_money) $deal_arr['step2_merchant_money_deal'] = true;

		$deal_arr['step3_merchant_money_log'] = model('MoneyLog')->log('merchant',$merchant_info['username'],$merchant_should_get_money,'订单['. $order_id .']的收入');

		$deal_arr['step4_agent_money_deal'] = model('AdminUser')->where(['username' => $agent_info['username'] ])->setInc('money',$agent_should_get_money);

		if(!$agent_should_get_money) $deal_arr['step4_agent_money_deal'] = true;

		$deal_arr['step5_agent_money_log'] = model('MoneyLog')->log('agent',$agent_info['username'],$agent_should_get_money,'商户['. $order_info['username'] .']---订单['. $order_id .']的利润');

		$deal_arr['step6_platform_money_deal'] = model('AdminUser')->where(['username' => 'admin'])->setInc('money',$platform_should_get_money);

		if(!$platform_should_get_money) $deal_arr['step6_platform_money_deal'] = true;

		$deal_arr['step7_platform_money_log'] = model('MoneyLog')->log('platform','admin',$platform_should_get_money,'代理人['. $agent_info['username'] .']---商户['. $order_info['username'] .']---订单['. $order_id .']的利润');

		$deal_arr['step8_pay_way_log_deal'] = model('PaywayDateLog')->log($order_info['payway_id'],'success',$order_info['fee']);

		foreach($deal_arr as $key => $val){

			if(!$val){
				
				return false;

			}

		}

		$this->commit();

		return true;

	}

	function failed_deal($order_id){

		$this->where(['order_id' => $order_id])->update(['status'	=>	'-2']);

		$order_info = $this->where(['order_id' => $order_id])->find();

		$failed_times_deal = model('PaywayDateLog')->where(['payway_id' => $order_info['payway_id'],'date' => date('Y-m-d') ])->setInc('faild_times',1);

		$payway_faild_times = model('PaywayDateLog')->where(['payway_id' => $order_info['payway_id'],'date' => date('Y-m-d') ])->value('faild_times');

		$payway_max_failed_times = model('Payway')->where(['id' => $order_info['payway_id'] ])->value('max_failed_times');

		if($payway_faild_times >= $payway_max_failed_times){

			model('Payway')->where(['id' => $order_info['payway_id'] ])->update([

				'could_use'			=>	0

			]);

			model('Wechat')->msg('通道ID【'. $order_info['payway_id'] .'】停用，连续失败次数达到上限');

		}

		return true;

	}

}