<?php

function setting($key){
	
	$setting = cache('setting');

	$val = isset($setting[$key]) ? $setting[$key] : '';

	if(!$val){

		$val = model('Setting')->where(['key' => $key])->value('val');

		$setting_cache = cache('setting') ?: [];

		$setting_cache[$key] = $val;

		cache('setting',$setting_cache);

	}

	if( is_array( json_decode( $val,true ) ) ) return json_decode( $val,true );

	return $val;

}

/*
 * 是否是手机浏览器
 */

function is_mobile(){

	if(strstr(request()->instance()->header()['user-agent'],'Android')) return true;

	if(strstr(request()->instance()->header()['user-agent'],'iPhone')) return true;

}

/*
 * 是否是微信浏览器
 */

function is_weixin() { 

  	if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false) return true; 

	return false; 

}