<?php
return [

	'shouqianba'					=>	[

		'name'				=>	'收钱吧',
		
		'fields'			=>	[

			'vendor_sn'		=>	'vendor_sn',
			'vendor_key'	=>	'vendor_key',
			'appid'			=>	'appid',
			'code'			=>	'code',

		],

		'domain'					=>	'https://api.shouqianba.com',

		'is_fixed_money'			=>	1,

		'h5_domain'					=>	'https://m.wosai.cn/qr/gateway',

		'order_expire_time'			=>	'300',

	],

	'shouyinbao'					=>	[

		'name'				=>	'收银宝',
		
		'fields'			=>	[

			'qr_code'		=>	'二维码信息',
			'appid'		=>	'APPID',
			'md5key'		=>	'MD5密钥'

		],

		'domain'					=>	'',

		'is_fixed_money'			=>	0,

		'h5_domain'					=>	'https://m.wosai.cn/qr/gateway',

		'order_expire_time'			=>	'300',

	],

	'lakala'					=>	[

		'name'				=>	'拉卡拉',
		
		'fields'			=>	[

			'qr_code'		=>	'二维码信息',
			'account'		=>	'账号',
			'password'		=>	'密码'

		],

		'domain'					=>	'',

		'is_fixed_money'			=>	0,

		'h5_domain'					=>	'https://m.wosai.cn/qr/gateway',

		'order_expire_time'			=>	'300',

	],


];