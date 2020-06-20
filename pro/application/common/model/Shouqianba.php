<?php
namespace app\common\model;
class Shouqianba extends \think\Model{

	/*
	 * 激活账户
	 */

	function active($data){

		$url =  config('payway.shouqianba')['domain'] . '/terminal/activate';
		
		$device_id = time() . rand(100000,999999);

		$params = [

			'app_id'			=>	$data['appid'],
			'code'				=>	$data['code'],
			'device_id'			=>	$device_id,

		];

		$json_params = json_encode($params);

		$sign = md5( $json_params . $data['vendor_key'] );
		#echo $sign;exit;
		$header = [

	        "Format:json",
	        "Content-Type: application/json",
	        "Authorization:" . $data['vendor_sn'] . ' ' . $sign

		];
		#print_r($header);exit;
		$result = $this->post($url,$json_params,$header);
		#print_r($url);exit;
		#print_r($result);exit;
		if($result['result_code'] != '200') return [

			'status'		=>	false,
			'res'			=>	'激活失败',
			'msg'			=>	$result['error_message'],
			#'msg'			=>	json_encode($result),

		];

		$res_data = array_merge($data,$result['biz_response'],['device_id' => $device_id]);

		return [

			'status'		=>	true,
			'data'			=>	$res_data

		];

	}

	/*
	 * 请求支付
	 */

	function prepay($data,$order_id,$fee,$method,$title,$description,$notify_url){

		if($method == 'wechat') $payway = '3';
		if($method == 'ali') $payway = '1';

		$url =  config('payway.shouqianba')['domain'] . '/upay/v2/precreate';

		$params = [

			'terminal_sn'					=>	$data['terminal_sn'],
			'client_sn'						=>	$order_id,
			'total_amount'					=>	strval($fee),
			'payway'						=>	$payway,
			'subject'						=>	$title,
			'description'					=>	$description,
			'operator'						=>	'user',
			'notify_url'					=>	$notify_url,

		];

		$json_params = json_encode($params);

		$sign = md5( $json_params . $data['terminal_key'] );

		$header = [

	        "Format:json",
	        "Content-Type: application/json",
	        "Authorization: " . $data['terminal_sn'] . ' ' . $sign

		];

		$result = $this->post($url,$json_params,$header);

		return $result;

	}

	/*
	 * h5支付
	 */

	function h5pay($data,$order_id,$fee,$title,$description,$notify_url,$return_url){

		$params = [

			'client_sn'						=>	$order_id,
			'description'					=>	$description,
			'notify_url'					=>	$notify_url,
			'operator'						=>	'user',
			'return_url'					=>	$return_url,
			'subject'						=>	$title,
			'terminal_sn'					=>	$data['terminal_sn'],
			'total_amount'					=>	strval($fee),

		];

		ksort($params);

		$params = http_build_query($params);

		$url = config('payway.shouqianba')['h5_domain'] . '?' . $params . "&sign=" . strtoupper(md5(urldecode($params).'&key=' . $data['terminal_key'] ));

		return $url;

	}

	function query($order_id,$payway_params){

		$url =  config('payway.shouqianba')['domain'] . '/upay/v2/query';

		$payway_params = json_decode($payway_params,true);
		
		$params = [

			'terminal_sn'			=>	$payway_params['terminal_sn'],
			'client_sn'				=>	$order_id

		];

		$json_params = json_encode($params);

		$sign = md5( $json_params . $payway_params['terminal_key'] );

		$header = [

	        "Format:json",
	        "Content-Type: application/json",
	        "Authorization: " . $payway_params['terminal_sn'] . ' ' . $sign

		];

		$result = $this->post($url,$json_params,$header);

		return $result;

	}

	function post($url,$json_params,$header){

	    $ch = curl_init();

	    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查
	    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);  // 从证书中检查SSL加密算法是否存在

	    curl_setopt($ch, CURLOPT_URL, $url);
	    curl_setopt($ch, CURLOPT_HEADER, 0);
	    curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	    curl_setopt($ch, CURLOPT_POST, 1);
	    curl_setopt($ch, CURLOPT_POSTFIELDS, $json_params);
	    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 0);

	    $response = curl_exec($ch);

	    curl_close($ch);

	    return json_decode($response,true);

	}

}