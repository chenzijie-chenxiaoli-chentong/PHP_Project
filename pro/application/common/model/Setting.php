<?php
namespace app\common\model;
class Setting extends \think\Model{

	protected $table = 'setting';

	function setting($key,$val){

		if( is_array($val) ) $val = json_encode($val);

		$deal = $this->where(['key' => $key])->update(['val' => $val]);

		$setting_cache = cache('setting') ?: [];

		$setting_cache[$key] = $val;

		cache('setting',$setting_cache);

		return true;

	}

}