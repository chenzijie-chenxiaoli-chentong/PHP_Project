<?php
namespace app\index\controller;
/*
	use app\admin\controller\Base;
	class Test extends Base{
*/
use think\Cache;
class Test extends \think\Controller{


	function index(){

		return view();

	}
	//银行卡测试通道 2020-08-02
     function newpay(){
        if($_SERVER['REQUEST_METHOD'] == 'GET') die;

        $order_id = date('YmdHis').rand(10000,99999);
        //查询数据
        //$payway_list = model('Payway')->column('id,payway,name,params', 'id');

        // 判断是否有缓存数据
        // 获取缓存 如果payway_list不存在结果返回false，如果结果为false 就把payway_list写入缓存
        $payway_list = Cache::get('payway_list');
        if( $payway_list == false){
            // 查询数据库中所有支付通道
            $payway_list = model('Payway')->column('id,payway,name,params','id');
            if(empty($payway_list)) { echo json_encode(['flag'=>'10063','msg'=>'请添加商家二维码信息','info'=>'']);die; }
            // 写入缓存 把所有支付通道写入缓存
            Cache::set('payway_list',$payway_list);
        }
        while (true) {
            // $first = array_shift($payway_list);  //所有商家的支付二维码 按顺序展示  payway表中
            // 有缓存随机展示
            $first = array_shift($payway_list);  //所有商家的支付二维码 按顺序展示  payway表中
            Cache::set('payway_list', $payway_list);
            $payway_id = $first['id'];
            if ($first['payway'] == 'bankcard') {  //银行卡
                $arr = json_decode($first['params'], true);
                //echo var_dump($arr);  //查看数据类型
                $ar = '银行卡号：'.$arr['bankcard_num']. '账户名：'.$arr['username']. '开户行：'.$arr['accountbank'];
                }
            else{
                continue;
                }
            // 写入订单
            model('PayOrder')->insert([
                'username' => 'abc',
                'order_id' => $order_id,
                'fee' => floatval(0.01) * 100,
                'method' => '' ?: 'wechat',
                'create_time' => time(),
                'pay_time' => date('Y-m-d H:i:s'),
                'qr_code' => '',
                'qr_code_image_url' => '',
                'notify_url' => '',
                'payway_id' => $payway_id,
                'agent_code' => '',
                'agent_type' => 'mobile',
                'payway_order_id' => $order_id,
                'transaction_id' => $order_id,
                'expire_time' => time() + 2000000, //订单过期时间
                'payway' => 'bankcard',
                'act_fee' => floatval(0.01) * 100,
                'return_url' => '',
            ]);
            // 向页面传递数据
            $this->assign(['payurl'=>$ar,'order_id'=>$order_id]);
            return view();

        }

    }//end function

	
	//新版测试通道支付方法 2020-05-14
//	function newpay(){
//
//		if($_SERVER['REQUEST_METHOD'] == 'GET') die;
//
//		$order_id = date('YmdHis').rand(10000,99999);
//		$amt = floatval(input('money'))*100;
//		$payway_id = setting('text_use_payway');
//
//		$payway_list = model('Payway')->column('id,payway,name,params','id');
//		//echo '<pre>';print_r($payway_list);die;
//		if(!$payway_id){
//			$payway_id = array_rand($payway_list);
//		}
//
//		//echo $payway_id;die;
//
//		//写入订单表
//		model('PayOrder')->insert([
//			'username'=>'abc',
//			'order_id'=>$order_id,
//			'fee'=>$amt,
//			'method'=>input('method'),
//			'create_time'=>time(),
//			'pay_time'=>date('Y-m-d H:i:s'),
//			'qr_code'=>'',
//			'qr_code_image_url'=>'',
//			'notify_url'=>'',
//			'payway_id'=>$payway_id,
//			'agent_code'=>'',
//			'agent_type'=>'mobile',
//			'payway_order_id'=>$order_id,
//			'transaction_id'=>$order_id,
//			'expire_time'=>'',
//			'payway'=>$payway_list[$payway_id]['payway'],
//			'act_fee'=>$amt,
//			'return_url'=>'',
//		]);
//
//		$payUrl = [
//			'shouyinbao'=>'https://syb.allinpay.com/sappweb/usertrans/cuspay',//收银宝
//			'shouqianba'=>'',
//			'lakala'=>'',
//		];
//
//
//		if($payway_list[$payway_id]['payway'] == 'shouyinbao'){  //收银宝
//
//			$arr = json_decode($payway_list[$payway_id]['params'] , true);
//			// print_r($arr);die;
//			$appid =  $arr['appid'];  //收银宝appid
//			$md5Key = $arr['md5key'];//收银宝设置的md5密钥
//			$qrcodeStr = substr( $arr['qr_code'] , strrpos( $arr['qr_code']  , '=')+1 ); //通联分配的二维码编号
//			if( strlen($qrcodeStr)!=8 ) { echo '通道二维码信息有误';die; }
//
//
//			$signSrc = 'amt='.$amt.'&appid='.$appid.'&c='.$qrcodeStr.'&key='.$md5Key.'&oid='.$order_id.'&trxreserve=05';
//			$sign = md5($signSrc);
//			$url = $payUrl['shouyinbao'].'?amt='.$amt.'&appid='.$appid.'&c='.$qrcodeStr.'&oid='.$order_id.'&sign='.$sign.'&trxreserve=05';
//			//echo $url;die;
//			$this->assign(['payurl'=>$url,'order_id'=>$order_id]);
//			return view();
//		}
//
//
//	}//end function
	
	
	
	
	

	function pay(){

		$money = intval( (input('money') ?: 0) * 100);
		$method = input('method');

		$is_fixed_money = input('is_fixed_money');

		if(!$money) $this->error('金额错误。例：（0.1）');

		$order_id = date('YmdHis').rand(1000000000,9999999999);

		$agent_type = '';
		$return_url = 'http://baidu.com';

		if( is_mobile() ){

			$agent_type = 'mobile';
			$return_url = request()->domain() . url('index/test/return_url');

		}

		$account_info = [

			'account'			=>	'dont_delete',
			'password_md5'		=>	md5('123123'),

		];

/*		$account_info = [

			'account'			=>	'just639',
			'password_md5'		=>	'34f9664450a6e5c2ad95510164a57a6f',

		];*/

		$params = [

			'username'				=>	$account_info['account'],
			'order_id'				=>	$order_id,
			'fee'					=>	$money,
			'method'				=>	$method,
			'title'					=>	'测试支付test',
			'sign'					=>	md5( $order_id . $account_info['password_md5'] ),
			'agent_type'			=>	$agent_type,
			'return_url'			=>	$return_url,
			'is_fixed_money'		=>	$is_fixed_money

		];

		//echo config('api_domain') . url('api/merchant/create') . '?' . http_build_query($params);exit;

		$res = json_decode( file_get_contents( config('api_domain') . url('api/merchant/create') . '?' . http_build_query($params) ) ,true);

		if($res['code'] == 0) $this->error('通道繁忙，请稍后重试');

		#print_r($res['data']['qr_code_image_url']);exit;

		$img_name = 'wechat.png';

		if($method == 'ali') $img_name = 'ali.jpg';

		if( is_mobile() ){

			$tit_msg = '使用微信扫一扫功能';

			if($method == 'ali') $tit_msg = '使用支付宝扫一扫功能';

			if( is_weixin() ){

				header('Location:' . $res['data']['qr_code'] );

				exit;

			}

		}else{

			$tit_msg = '请打开微信扫一扫进行支付';

			if($method == 'ali') $tit_msg = '请打开支付宝扫一扫进行支付';

		}

		$return_data = [

			'qr_code_url'			=>	$res['data']['qr_code_image_url'],
			'order_id'				=>	$order_id,
			'expire_seconds'		=>	300,
			'tit_msg'				=>	$tit_msg,
			'img_name'				=>	$img_name,
			'money'					=>	($money/100),
			'is_fixed_money'		=>	$is_fixed_money,

		];

		$this->assign($return_data);

		return view();

	}

	function order_pay(){

		$order_id = input('order_id');

		$order_info = model('PayOrder')->where(['order_id' => $order_id])->find();

		$qr_code_url = $order_info['qr_code_image_url'];

		$expire_seconds  = strtotime($order_info['create_time']) + 300 - time();

		if($expire_seconds < 0) $this->error('该订单已过期。');

		$return_data = [

			'qr_code_url'			=>	$qr_code_url,
			'order_id'				=>	$order_id,
			'expire_seconds'		=>	$expire_seconds

		];

		$this->assign($return_data);

		return view('pay');

	}

	function check_success(){

		$order_id = input('order_id');
		$status = model('PayOrder')->where(['order_id' => $order_id])->column('status')[0];
		return json(['status' => $status] );

	}
	
	
	//更改订单状态
	function update_status(){

		//$status = input('status');
		$order_id = input('order_id');
		

		model('PayOrder')->where(['order_id' => $order_id])->update(['status'=>-2]);
		

	}//end function
	
	
	

	function return_url(){

		echo '<script>alert("支付成功");</script>';

	}

}