<?php
namespace app\admin\controller;
class Payway extends Base{

	function index(){

		model('AdminUser')->auth('payway_list');

		$field = implode([

			'payway.id as id',
			'payway.name as name',
			'payway.next_use_time as next_use_time',
			'payway.payway as payway',
			'payway.is_active as is_active',
			'payway.user as user',
			'payway.could_use as could_use',
			'payway.is_wechat as is_wechat',
			'payway.is_ali as is_ali',
			'payway.identify_id as identify_id',
			'payway.belong as belong',
			'payway.max_failed_times as max_failed_times',
			'payway.success_max_money as success_max_money',
			'payway.success_max_num as success_max_num',
			'payway_date_log.success_money as success_money',
			'payway_date_log.success_times as success_times',
			'payway_date_log.faild_times as faild_times',

		],',');

		$where = [];

		if(input('name')) $where['name|payway.id'] = input('name');
		if(input('payway')) $where['payway'] = input('payway');
		if(input('is_active') === '0') $where['is_active'] = 0;
		if(input('is_active') === '1') $where['is_active'] = 1;
		if(input('could_use') === '0') $where['could_use'] = 0;
		if(input('could_use') === '1') $where['could_use'] = 1;
		if(input('belong')) $where['belong'] = input('belong');

		$list = model('Payway')

				->alias('payway')

				->join('payway_date_log','payway_date_log.payway_id = payway.id and payway_date_log.date = "' . date('Y-m-d') . '"','left' )

				->field($field)

				->where($where)

				->order('payway asc')

				->paginate(50);

		$payway_belong_list = model('Payway')->group('belong')->column('belong');

		$return_data = [

			'list'							=>	$list,
			'payway_list'					=>	config('payway'),
			'payway_belong_list'			=>	$payway_belong_list,

		];

		$this->assign($return_data);

		return view();

	}

	/*
	 * 新增修改通道帐户
	 */

	function create(){

		model('AdminUser')->auth('payway_create');

		$id = input('id');

		$payway = input('payway');

		$payway_info = [];

		$payway_info_params = [];

		if($id){

			$payway_info = model('Payway')->where(['id' => $id])->find();

			if(!$payway_info) $this->error('该通道不存在');

			$payway = $payway_info['payway'];

			$payway_info_params = json_decode($payway_info['params'],true);

		}

		$payway_conf = config('payway');

		if( !array_key_exists($payway,$payway_conf) ) $this->error('错误的通道类型');

		$merchant_list = model('Merchant')->field('username')->select();

		$return_data = [

			'payway' 				=> $payway_conf[$payway],
			'payway_info'			=> $payway_info,
			'payway_info_params'	=> $payway_info_params,
			'merchant_list'			=> $merchant_list,

		];

		$this->assign($return_data);

		return view();

	}

	/*
	 * 创建处理
	 */

	function create_deal(){

		#model('AdminUser')->auth('payway_list');

		model('AdminUser')->auth('payway_create');

		$id 				= input('id');
		$payway 			= input('payway');
		$name 				= input('name');
		$user 				= input('user');
		$is_active 			= input('active');
		$success_max_num 	= intval(input('success_max_num'));
		$success_max_money 	= intval(input('success_max_money')*100);
		$recive_way			= input('recive_way/a');
		$mark 				= input('mark');
		$belong 			= input('belong');
		$frequence 			= input('frequence');
		$max_failed_times 	= input('max_failed_times');
		$identify_id 		= input('identify_id');

		$payway_conf = config('payway');
		

		if( !array_key_exists($payway,$payway_conf) ) $this->error('错误的通道类型');

		if(!$name) $this->error('通道名称不能为空');

		$pay_params = [];

		foreach( $payway_conf[$payway]['fields'] as $key => $val ){

			$pay_params[$key] = input($key);

		}

		if($user){

			$merchant_ex = model('Merchant')->where(['username' => $user])->count();

			if(!$merchant_ex) $this->error('错误的使用人');

		}

		if($id){

			$before_name = model('Payway')->where(['id' => $id])->value('name');

			$update = [

				'payway'				=>	$payway,
				'name'					=>	$name,
				'user'					=>	$user,
				'create_time'			=>	time(),
				'is_active'				=>	$is_active,
				'success_max_num'		=>	$success_max_num,
				'success_max_money'		=>	$success_max_money,
				'mark'					=>	$mark,
				'belong'				=>	$belong,
				'frequence'				=>	$frequence,
				'max_failed_times'		=>	$max_failed_times,
				'identify_id'			=>	$identify_id,
				'is_wechat'				=>	in_array('wechat', $recive_way),
				'is_ali'				=>	in_array('ali', $recive_way),

			];

			if( $payway != 'shouqianba' ) $update['params'] = json_encode($pay_params);

			$deal = model('Payway')->where(['id' => $id])->update($update);

			$log = model('Log')->log('admin', session('admin.username'), '修改了支付通道【'. $name .'】的信息' );

		}else{

			if( $payway == 'shouqianba' ){

				$shouqianba_active = model('Shouqianba')->active($pay_params);

				if(!$shouqianba_active['status']) $this->error('收钱吧商户激活失败，' . $shouqianba_active['msg']);

				$pay_params = $shouqianba_active['data'];

			}

			$deal = model('Payway')->insert([

				'payway'				=>	$payway,
				'name'					=>	$name,
				'user'					=>	$user,
				'create_time'			=>	time(),
				'is_active'				=>	$is_active,
				'success_max_num'		=>	$success_max_num,
				'success_max_money'		=>	$success_max_money,
				'mark'					=>	$mark,
				'belong'				=>	$belong,
				'frequence'				=>	$frequence,
				'max_failed_times'		=>	$max_failed_times,
				'identify_id'			=>	$identify_id,
				'is_wechat'				=>	in_array('wechat', $recive_way),
				'is_ali'				=>	in_array('ali', $recive_way),
				'params'				=>	json_encode($pay_params),
				'is_fixed_money'		=>	$payway_conf[$payway]['is_fixed_money'],

			]);

			$log = model('Log')->log('admin', session('admin.username'), '新增了支付通道，名称为【'. $name .'】' );

		}

		$this->success('处理成功','payway/index');

	}

	/*
	 * 删除
	 */

	function delete(){

		model('AdminUser')->auth('payway_list');

		model('AdminUser')->auth('payway_delete');

		$id 			= input('id');
		$name 			= input('name');

		$deal = model('Payway')->where(['id' => $id])->delete();

		$log_deal = model('Log')->log('admin',session('admin.username'),'删除了支付通道【'. $name .'】');

		$this->success('处理成功');

	}

	function edits(){

		model('AdminUser')->auth('payway_list');

		$payway_list = config('payway');

		$payway_belong_list = model('Payway')->group('belong')->column('belong');

		$return_data = [

			'payway_list'				=>	$payway_list,
			'payway_belong_list'		=>	$payway_belong_list,

		];

		$this->assign($return_data);

		return view();

	}

	function edits_deal(){

		model('AdminUser')->auth('payway_list');

		$payway 				= input('payway');
		$success_max_money 		= input('success_max_money') * 100;
		$success_max_num 		= input('success_max_num');
		$frequence 				= input('frequence');
		$max_failed_times 		= input('max_failed_times');
		$belong 				= input('belong');
		$active 				= input('active');

		$where = [

			'payway'		=>	$payway

		];

		if($belong) $where['belong'] = $belong;

		$deal = model('Payway')->where($where)->update([

			'success_max_money'			=>	$success_max_money,
			'success_max_num'			=>	$success_max_num,
			'frequence'					=>	$frequence,
			'max_failed_times'			=>	$max_failed_times,
			'is_active'					=>	$active,

		]);

		$this->success('批量处理成功');

	}

	function let_could_use(){

		model('AdminUser')->auth('payway_list');

		$id = input('id');

		$date = date('Y-m-d');

		$deal = [

			'1'	=>	model('Payway')->where(['id' => $id])->update(['could_use' => 1]),
			'2'	=>	model('PaywayDateLog')->where(['payway_id' => $id,'date' => $date ])->update(['faild_times' => 0]),

		];

		$this->success('处理成功');

	}

}