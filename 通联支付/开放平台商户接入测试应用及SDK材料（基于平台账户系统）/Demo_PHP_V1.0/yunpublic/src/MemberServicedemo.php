<?php

include_once './SDK/yunClient.php';
include_once './Log/Log.php';
include_once './Config/conf.php';

/**
运行前端页面时，把有关$demo的全部注释掉
 * 
 */
$demo = new Demo();
//$demo->createMember("testtlzf"); //{"userId":"f3183d66-bd16-4dba-90c9-7b43a6ce3ae0","bizUserId":"testtlzf"}
//$demo->sendVerificationCode("testtlzf","18734893146","9"); //{"phone":"18734893146","bizUserId":"lishulong"}
//$demo->bindPhone("testtlzf","18734893146","11111"); //测试环境手机验证码为11111
//$demo->signContract("testtlzf","https://www.baidu.com","https://www.zhihu.com","2");
//$demo->setRealName("testtlzf","李书龙","");
//$demo->getMemberInfo("testtlzf");
//$demo->getBankCardBin("6228491234567890123"); //测试环境下，只支持622848、622849开头的19位银行卡（后13位可以随便指定）
//$demo->applyBindBankCard("testtlzf","6227000267060250071","18734893146","李书龙",7,1,"");  //tranceNum '537419208761'
//$demo->bindBankCard("testtlzf","703547705753","18734893146","984376");
//$demo->queryBankCard("testtlzf");
//$demo->unbindBankCard("testtlzf","6227000267060250071");
//$demo->lockMember("testtlzf");
//$demo->unlockMember("testtlzf");
//$demo->setPayPwd("testtlzf","18734893146","1","","https://www.baidu.com","https://www.zhihu.com");
//$demo->updatePayPwd("testtlzf","李书龙","1","","https://www.baidu.com","https://www.zhihu.com");
//$demo->resetPayPwd("testtlzf","李书龙","18734893146","1","","https://www.baidu.com","https://www.zhihu.com");
//$demo->updatePhoneByPayPwd("testtlzf","李书龙","18734893146","1","","https://www.baidu.com","https://www.zhihu.com");
//$demo->applyBindAcct("testtlzf","set","weChatPublic","aaaaaaaaaaa");
//$demo->unbindPhone("testtlzf","18734893146","11111");
//$demo->testdecryptAES("1FAC0F1B4CA4717D2372193B3EAAC9176B50260D2CB93BBE803C14123B20CEA6");

class Demo
{
	private  $logIns;
	private  $config;
    public function __construct(){
        $this->logIns = Log::getInstance();
		$this->config = conf::getInstance();
		$this->config->loadConf('./Config/config.php');
	
    }
	/**
	 * [createMember 创建会员]
	 */
	public function createMember($bizUserId, $memberType = 3, $source = 2)
	{
		$param = array();
		$param["bizUserId"] = $bizUserId;
		$param["memberType"] = $memberType;
		$param["source"] = $source;
		$method = "allinpay.yunst.memberService.createMember";
		$yunClient = new yunClient();
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [sendVerificationCode 发送短信验证码]
	 */
	public function sendVerificationCode($bizUserId, $phone, $verificationCodeType)
	{
		$param = array();
		$param["bizUserId"] = $bizUserId;
		$param["phone"] = $phone;
		$param["verificationCodeType"] = $verificationCodeType;
		$method = "allinpay.yunst.memberService.sendVerificationCode";
		$yunClient = new yunClient();
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [bindPhone 绑定手机]
	 */
	public function bindPhone($bizUserId, $phone, $verificationCode)
	{
		$param = array();
		$param["bizUserId"] = $bizUserId;
		$param["phone"] = $phone;
		$param["verificationCode"] = $verificationCode;
		$method = "allinpay.yunst.memberService.bindPhone";
		$yunClient = new yunClient();
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [signContract 电子会员签约]
	 */
	public function signContract($bizUserId,$jumpUrl,$backUrl,$source)
	{
		$param = array();
		$param["bizUserId"] = $bizUserId;
		$param["jumpUrl"] = $jumpUrl;
		$param["backUrl"] = $backUrl;
		$param["source"] = $source;
		$method = "allinpay.yunst.memberService.signContract";
		$yunClient = new yunClient();
		$result = $yunClient->concatUrlParams($method,$param);
		$url = "http://test.allinpay.com/op/gateway?".$result;
		$this->logIns->logMessage("[电子会员签约URL]",Log::INFO,$url);
		header("Location:$url");
	}

	/**
	 * [setRealName 实名认证]
	 */
	public function setRealName($bizUserId,$name,$identityNo)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["name"] = $name;
		$param["identityType"] = "1";
		$param["identityNo"] = $yunClient->encryptAES($identityNo);
		$method = "allinpay.yunst.memberService.setRealName";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [getMemberInfo 获取会员信息]
	 * @param  [type] $bizUserId [description]
	 * @return [type]            [description]
	 */
	public function getMemberInfo($bizUserId)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = (string)$bizUserId;
		$method = "allinpay.yunst.memberService.getMemberInfo";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [getBankCardBin 查询卡bin]
	 */
	public function getBankCardBin($cardNo)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["cardNo"] = $yunClient->encryptAES($cardNo);
		$method = "allinpay.yunst.memberService.getBankCardBin";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [applyBindBankCard 申请绑卡]
	 */
	public function applyBindBankCard($bizUserId,$cardNo,$phone,$name,$cardCheck,$identityType,$identityNo,$validate=null,$cvv2=null)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["cardNo"] = $yunClient->encryptAES($cardNo);
		$param["phone"] = $phone;
		$param["name"] = $name;
		$param["cardCheck"] = $cardCheck;
		$param["identityType"] = $identityType;
		$param["identityNo"] = $yunClient->encryptAES($identityNo);
		$param["validate"] = $yunClient->encryptAES($validate);
		$param["cvv2"] = $yunClient->encryptAES($cvv2);
		$method = "allinpay.yunst.memberService.applyBindBankCard";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [applyBindBankCard 确认绑定银行卡]
	 */
	public function bindBankCard($bizUserId,$tranceNum,$phone,$verificationCode,$validate=null,$cvv2=null)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["tranceNum"] = $tranceNum;
		$param["phone"] = $phone;
		$param["verificationCode"] = $verificationCode;
		$param["validate"] = $yunClient->encryptAES($validate);
		$param["cvv2"] = $yunClient->encryptAES($cvv2);
		$method = "allinpay.yunst.memberService.bindBankCard";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [queryBankCard 查询绑定银行卡]
	 */
	public function queryBankCard($bizUserId)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$method = "allinpay.yunst.memberService.queryBankCard";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [unbindBankCard 解绑绑定银行卡]
	 */
	public function unbindBankCard($bizUserId,$cardNo)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["cardNo"] = $yunClient->encryptAES($cardNo);
		$method = "allinpay.yunst.memberService.unbindBankCard";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [lockMember 锁定会员]
	 */
	public function lockMember($bizUserId)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$method = "allinpay.yunst.memberService.lockMember";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [lockMember 解锁会员]
	 */
	public function unlockMember($bizUserId)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$method = "allinpay.yunst.memberService.unlockMember";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [setPayPwd 设置支付密码【密码验证版】]
	 */
	public function setPayPwd($bizUserId,$phone,$identityType,$identityNo,$jumpUrl,$backUrl)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["phone"] = $phone;
		$param["identityType"] = $identityType;
		$param["identityNo"] = $yunClient->encryptAES($identityNo);
		$param["jumpUrl"] = $jumpUrl;
		$param["backUrl"] = $backUrl;
		$method = "allinpay.yunst.memberService.setPayPwd";
		$result = $yunClient->concatUrlParams($method,$param);
		$url = "http://test.allinpay.com/op/gateway?".$result;
		$this->logIns->logMessage("[设置支付密码【密码验证版】]",Log::INFO,$url);
		header("Location:$url");
	}

	/**
	 * [updatePayPwd 修改支付密码【密码验证版】]
	 */
	public function updatePayPwd($bizUserId,$name,$identityType,$identityNo,$jumpUrl,$backUrl)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["name"] = $name;
		$param["identityType"] = $identityType;
		$param["identityNo"] = $yunClient->encryptAES($identityNo);
		$param["jumpUrl"] = $jumpUrl;
		$param["backUrl"] = $backUrl;
		$method = "allinpay.yunst.memberService.updatePayPwd";
		$result = $yunClient->concatUrlParams($method,$param);
		$url = "http://test.allinpay.com/op/gateway?".$result;
		$this->logIns->logMessage("[修改支付密码【密码验证版】]",Log::INFO,$url);
		header("Location:$url");
	}

	/**
	 * [resetPayPwd 重置支付密码【密码验证版】]
	 */
	public function resetPayPwd($bizUserId,$name,$phone,$identityType,$identityNo,$jumpUrl,$backUrl)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["name"] = $name;
		$param["phone"] = $phone;
		$param["identityType"] = $identityType;
		$param["identityNo"] = $yunClient->encryptAES($identityNo);
		$param["jumpUrl"] = $jumpUrl;
		$param["backUrl"] = $backUrl;
		$method = "allinpay.yunst.memberService.resetPayPwd";
		$result = $yunClient->concatUrlParams($method,$param);
		$url = "http://test.allinpay.com/op/gateway?".$result;
		$this->logIns->logMessage("[重置支付密码【密码验证版】]",Log::INFO,$url);
		header("Location:$url");
	}

	/**
	 * [updatePhoneByPayPwd 修改绑定手机【密码验证版】]
	 */
	public function updatePhoneByPayPwd($bizUserId,$name,$oldphone,$identityType,$identityNo,$jumpUrl,$backUrl)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["name"] = $name;
		$param["oldPhone"] = $oldPhone;
		$param["identityType"] = $identityType;
		$param["identityNo"] = $yunClient->encryptAES($identityNo);
		$param["jumpUrl"] = $jumpUrl;
		$param["backUrl"] = $backUrl;
		$method = "allinpay.yunst.memberService.updatePhoneByPayPwd";
		$result = $yunClient->concatUrlParams($method,$param);
		$url = "http://test.allinpay.com/op/gateway?".$result;
		$this->logIns->logMessage("[修改绑定手机【密码验证版】]",Log::INFO,$url);
		header("Location:$url");
	}

	/**
	 * [applyBindAcct 会员绑定支付账户用户标识]
	 */
	public function applyBindAcct($bizUserId,$operationType,$acctType,$acct)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["operationType"] = $operationType;
		$param["acctType"] = $acctType;
		$param["acct"] = $acct;
		$method = "allinpay.yunst.memberService.applyBindAcct";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [unbindPhone 解绑手机（验证原手机短信验证码）]
	 */
	public function unbindPhone($bizUserId,$phone,$verificationCode)
	{
		$param = array();
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["phone"] = $phone;
		$param["verificationCode"] = $verificationCode;
		$method = "allinpay.yunst.memberService.unbindPhone";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [testdecryptAES 测试AES解密]
	 */
	public function testdecryptAES($string)
	{
		$yunClient = new yunClient();
		$result = $yunClient->decryptAES($string);
		var_dump($result);
	}
}
