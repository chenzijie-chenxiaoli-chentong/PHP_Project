<?php

namespace app\crontab\controller;

use think\console\Command;
use think\console\Input;
use think\console\Output;

use \think\Db;

//use app\common\model\PayOrder;


class CheckOrder extends Command{
	
	
	protected function configure()
    {
        $this->setName('checkorder')->setDescription('定时清理过期订单');
    }
    
    
    //定时查看订单是否支付成功
    protected function execute(Input $input, Output $output)
    {
        //$output->writeln("TestCommand:");
        //$list = model('PayOrder')->where([ 'status' => 'null' ])->column();
        $list = Db::table('pay_order')->where('status',null)->column('*');
        if(empty($list)) exit();
        foreach($list as $v){
        	if( !$v['expire_time'] || ($v['expire_time'] <= time()) ){  //订单过期了
        		Db::table('pay_order')->where('id',$v['id'])->update(['status'=>-2]);
        	}else{
        		
        	}
        }
        //$output->writeln(print_r($list,true));
        
        
    }
	
	
	
	
	
}//end class