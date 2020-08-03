<?php
return [

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

    'bankcard'				=>	[

        'name'				=>	'银行卡',

        'fields'			=>	[

            'bankcard_num'  =>	'银行卡号',
            'username'		=>	'账户名',
            'accountbank'	=>	'开户行'

        ],

        'domain'					=>	'',

        'is_fixed_money'			=>	0,

        'h5_domain'					=>	'https://m.wosai.cn/qr/gateway',

        'order_expire_time'			=>	'300',

    ],


];