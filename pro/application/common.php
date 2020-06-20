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








/**
 * [curl_request php curl请求函数]
 * @param  {[type]} $url          [访问的URL]
 * @param  {String} $post         [post数据(不填则为GET)]
 * @param  {String} $cookie       [提交的$cookies]
 * @param  {Number} $returnCookie [是否返回$cookies]
 * @return {[type]}               [返回的请求数据]
 */
function curl_request($url,$post='',$cookie='', $returnCookie=0){
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)');
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($curl, CURLOPT_AUTOREFERER, 1);
    curl_setopt($curl, CURLOPT_REFERER, "https://jy.xzsec.com");
    if($post) {
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($post));
    }
    if($cookie) {
        curl_setopt($curl, CURLOPT_COOKIE, $cookie);
    }
    curl_setopt($curl, CURLOPT_HEADER, $returnCookie);
    curl_setopt($curl, CURLOPT_TIMEOUT, 10);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $data = curl_exec($curl);
    if (curl_errno($curl)) {
        return curl_error($curl);
    }
//    if($returnCookie){ //  测试用
//        curl_setopt($curl, CURLINFO_HEADER_OUT, true);
//        $big = curl_getinfo($curl );
//        print_r($big);
//    }
    curl_close($curl);
    if($returnCookie){
        list($header, $body) = explode("\r\n\r\n", $data, 2);
        preg_match_all("/Set\-Cookie:([^;]*);/", $header, $matches);
        $info['cookie']  = implode( "; " , $matches[1] );
        $info['content'] = $body;
        return $info;
    }else{
        return $data;
    }
}







