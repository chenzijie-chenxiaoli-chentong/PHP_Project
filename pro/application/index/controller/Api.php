<?php
namespace app\index\controller;

//use app\SaeQRcode;
use Endroid\QrCode\QrCode;

use think\Cache;

class Api extends \think\Controller{
	
	private $key = 'sdl2fL3KH3J3G92327Kh';//密钥
	
/*	public function genUrl(){
		
	//这是一个测试方法  无用
		$order_id = date('YmdHis').rand(10000,99999);
		
		echo $order_id.PHP_EOL;
		echo '加密串:',md5($this->key.$order_id.'0.01'.'http://pay.bafangrenpin.com/index/ordernotify/returl'.'ali');
	}*/
	
	
	
	/*  通联支付二维码接口
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
			
			$payway_list = Cache::get('payway_list');
			if( $payway_list == false){
				$payway_list = model('Payway')->column('id,payway,name,params','id');
				if(empty($payway_list)) { echo json_encode(['flag'=>'10063','msg'=>'请添加商家二维码信息','info'=>'']);die; }
				Cache::set('payway_list',$payway_list);
			}
		
			$first = array_shift($payway_list);  //所有商家的支付二维码 按顺序展示  payway表中
			Cache::set('payway_list',$payway_list);
			
			// print_r($first);die;
			
			
			//$payway_id = 1;//收银宝  todo 固定展示二维码用
			
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
				'payway_id'=> $first['id'] , 
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
		
		
		if($first['payway'] == 'shouyinbao'){  //收银宝
			
			$arr = json_decode($first['params'] , true);
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
			echo '<img src="'.$qr_img.'">';
			header('Content-Type: '.$qrCode->getContentType());
			echo $qrCode->writeString();die;
			
			$rData = ['qr_img'=>$qr_img,'expire'=>200];
			
			echo json_encode(['flag'=>'10000','msg'=>'成功','info'=>$rData]);die;
		}
			
		}else{
			echo json_encode(['flag'=>'10009','msg'=>'参数验证失败','info'=>'']);die;
		}
		//echo 'hahhahah';die;
	}//end function
    */
	public function getQRcode(){

		$order_id = input('order_id');//订单号
		$money = 0.01; //支付金额
		$returl = ''; //商家回调URL
		$method = '';//支付方法： wechat / ali
		$md5str = input('md5str'); //加密后的md5字符串 md5(key , 订单号)

        // 判断订单号是否符合长度
        if(strlen($order_id)>64){
            echo json_encode(['flag'=>'10013','msg'=>'订单号长度大于64位','info'=>'']);die;
        }

        // 判断md5参数是否正确
		if( $md5str && (md5($this->key.$order_id) === $md5str)){

            // 查询订单号是否重复
			$exist = model('PayOrder')->where(['order_id'=>$order_id])->column('id');
			if($exist) { echo json_encode(['flag'=>'10005','msg'=>'订单号重复','info'=>'']);die; }

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

			$count = 1;
			while (true) {
			    // 循环十次找不到银行卡号就返回失败
                if ($count >10){
                    echo json_encode(['flag'=>'10002','msg'=>'没有可用通道','info'=>'']);die;
                }

                // 有缓存随机展示
                $first = array_shift($payway_list);  //所有商家的支付二维码 按顺序展示  payway表中
                Cache::set('payway_list', $payway_list);


                //$payway_id = 1;//收银宝  todo 固定展示二维码用
                // 判断是否是银行卡通道
                if ($first['payway'] == 'bankcard') {  //银行卡

                    $arr = json_decode($first['params'], true); //读取params字段

                    $rData = ['result' => $arr, 'expire' => 200]; //构造返回json

                    // 写入订单
                    model('PayOrder')->insert([
                        'username' => 'abc',
                        'order_id' => $order_id,
                        'fee' => floatval($money) * 100,
                        'method' => $method ?: 'wechat',
                        'create_time' => time(),
                        'pay_time' => date('Y-m-d H:i:s'),
                        'qr_code' => '',
                        'qr_code_image_url' => '',
                        'notify_url' => '',
                        'payway_id' => $first['id'],
                        'agent_code' => '',
                        'agent_type' => 'mobile',
                        'payway_order_id' => $order_id,
                        'transaction_id' => $order_id,
                        'expire_time' => time() + 2000000, //订单过期时间
                        'payway' => 'bankcard',
                        'act_fee' => floatval($money) * 100,
                        'return_url' => $returl,
                    ]);

                    echo json_encode(['flag' => '10000', 'msg' => '成功', 'info' => $rData]);
                    die; //返回结果
                    }
                else{
                    $count ++;
                }
                }
            }

		//md5效验失败
		else{
		        echo json_encode(['flag'=>'10009','msg'=>'参数验证失败','info'=>'']);die;
            }
		//echo 'hahhahah';die;
	}//end function
}//end class