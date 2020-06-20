<?php
namespace app\common\model;
class Wechat extends \think\Model{

	function msg($content){

		$url = 'http://api3.2cccc.cc/apiv3/wechat_msg';

		$wechats = [

			[

				'params'	=>	[

					'center_id'		=>	'9429',
					'client_type'	=>	'center',
					'msg'			=>	$content

				],
				'mark'		=>	'Flue',

			],

			[

				'params'	=>	[

					'center_id'		=>	'9429',
					'client_type'	=>	'card',
					'msg'			=>	$content,
					'client_content'=>	'ZSHUP42N',

				],
				'mark'		=>	'fefe',

			],

			[

				'params'	=>	[

					'center_id'		=>	'9429',
					'client_type'	=>	'card',
					'msg'			=>	$content,
					'client_content'=>	'5X5KWDMAMQV6922HR78BYGQJ73WB6T57A5RED2LZ',

				],
				'mark'		=>	'weizhi',

			],

		];

		$wechat_msg_reciver = setting('wechat_msg_reciver');
      
      	$res = false;

		foreach($wechats as $wechat){

			if( $wechat_msg_reciver[ $wechat['mark'] ] ){

				@$res = file_get_contents($url . '?' . http_build_query($wechat['params']));

				$res = json_decode($res,true);
				
			}

		}

		return $res;

	}

}