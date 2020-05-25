<?php
namespace app\index\controller;

//use app\SaeQRcode;
use Endroid\QrCode\QrCode;

class Api extends \think\Controller{
	
	private $key = 'sdl2fL3KH3J3G92327Kh';//密钥
	
	/*public function genUrl(){
	//这是一个测试方法  无用
		$order_id = date('YmdHis').rand(10000,99999);
		
		echo $order_id.PHP_EOL;
		echo '加密串:',md5($this->key.$order_id.'0.01'.'http://pay.bafangrenpin.com/index/ordernotify/returl'.'ali');
	}*/
	
	
	
	
	//对外接口 ，商家来请求支付二维码图片接口
	public function getQRcode(){
	
		
		$order_id = input('order_id');//订单号
		$money = input('money'); //支付金额
		$returl = input('return_url'); //商家回调URL
		$method = input('method');//支付方法： wechat / ali
		$md5str = input('md5str'); //加密后的md5字符串 md5(key , 订单号，支付金额，回调url, 支付方法)
		
		
		$preg1 = "/^http(s)?:\\/\\/.+/";
		if(!preg_match($preg1,$returl)) {
			echo json_encode(['flag'=>'10012','msg'=>'回调url格式不正确','info'=>'']);die;
		}
		if(strlen($order_id)>64){
			echo json_encode(['flag'=>'10013','msg'=>'订单号长度大于64位','info'=>'']);die;
		}
		if(strlen($method)>32){
			echo json_encode(['flag'=>'10013','msg'=>'支付方法长度大于32位','info'=>'']);die;
		}
		
		
		if( $md5str && (md5($this->key.$order_id.$money.$returl.$method) === $md5str)){
			//echo '11oooo111';die;
			
			$exist = model('PayOrder')->where(['order_id'=>$order_id])->column('id');
			if($exist) { echo json_encode(['flag'=>'10005','msg'=>'订单号重复','info'=>'']);die; }
			
			
			$payway_list = model('Payway')->column('id,payway,name,params','id');
			$payway_id = 1;//收银宝
			
			model('PayOrder')->insert([
				'username'=>'abc', 
				'order_id'=>$order_id, 
				'fee'=>floatval($money)*100, 
				'method'=>$method ? : 'wechat', 
				'create_time'=>time(), 
				'pay_time'=>date('Y-m-d H:i:s'), 
				'qr_code'=>'', 
				'qr_code_image_url'=>'', 
				'notify_url'=>'', 
				'payway_id'=> $payway_id , 
				'agent_code'=>'', 
				'agent_type'=>'mobile', 
				'payway_order_id'=>$order_id, 
				'transaction_id'=>$order_id, 
				'expire_time'=>time()+200, //订单过期时间
				'payway'=>'shouyinbao', 
				'act_fee'=>floatval($money)*100, 
				'return_url'=>$returl,
			]);
			
			
			$payUrl = [
				'shouyinbao'=>'https://syb.allinpay.com/sappweb/usertrans/cuspay',//收银宝
				'shouqianba'=>'',
				'lakala'=>'',
			];
		
		
		if($payway_list[$payway_id]['payway'] == 'shouyinbao'){  //收银宝
			
			$arr = json_decode($payway_list[$payway_id]['params'] , true);
			// print_r($arr);die;
			$appid =  $arr['appid'];  //收银宝appid
			$md5Key = $arr['md5key'];//收银宝设置的md5密钥
			$qrcodeStr = substr( $arr['qr_code'] , strrpos( $arr['qr_code']  , '=')+1 ); //通联分配的二维码编号
			if( strlen($qrcodeStr)!=8 ) { echo json_encode(['flag'=>'10008','msg'=>'获取支付二维码失败','info'=>'']);die; }
			
			
			$signSrc = 'amt='.(floatval($money)*100).'&appid='.$appid.'&c='.$qrcodeStr.'&key='.$md5Key.'&oid='.$order_id.'&trxreserve=05';
			$sign = md5($signSrc);
			$url = $payUrl['shouyinbao'].'?amt='.(floatval($money)*100).'&appid='.$appid.'&c='.$qrcodeStr.'&oid='.$order_id.'&sign='.$sign.'&trxreserve=05';
			//echo $url;die;
			
			$qrCode = new QrCode($url);//生成支付二维码
			$qr_img = 'data:'.$qrCode->getContentType().';base64,'.base64_encode($qrCode->writeString());
			//echo '<img src="'.$qr_img.'">';
			//header('Content-Type: '.$qrCode->getContentType());
			//echo $qrCode->writeString();
			
			$rData = ['qr_img'=>$qr_img,'expire'=>200];
			
			echo json_encode(['flag'=>'10000','msg'=>'成功','info'=>$rData]);die;
			
			
			
			
			
		}
			
			
			
			
			
		}else{
			echo json_encode(['flag'=>'10009','msg'=>'参数验证失败','info'=>'']);die;
		}
		
		
		
		
		
		
		//echo 'hahhahah';die;
	}//end function
	
	
	
	
	
	
	
	
	
	
	
	
}//end class