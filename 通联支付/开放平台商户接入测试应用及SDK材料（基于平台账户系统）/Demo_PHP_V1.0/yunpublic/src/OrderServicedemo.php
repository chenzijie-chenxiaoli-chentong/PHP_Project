<?php
include_once './SDK/yunClient.php';
include_once './Log/Log.php';
include_once './Config/conf.php';

$demo = new OrderDemo();
//$demo->depositApply("testtlzf","400193",1,0,0,"https://www.baidu.com","https://www.zhihu.com","1010","保险代理",2);
//$demo->payByBackSMS("testtlzf","TL20200413042730",'{"sign":"","tphtrxcrtime":"","tphtrxid":0,"trxflag":"trx","trxsn":""}',"941927","10.168.1.70");
//$demo->payBySMS("testtlzf","TL20200413015559","10.168.1.70");
//$demo->consumeApply("testtlzf","#yunBizUserId_B2C#",2,0,0,"https://www.baidu.com","1010","保险代理",2);//消费申请,加分账
//$demo->agentCollectApply("testtlzf","3001",1,0,"https://www.baidu.com",0,"1910","其他",2);//托管代收申请说
//$demo->signalAgentPay("testtlzf01","TL20200413042730","4001",1,0,"https://www.baidu.com");//单笔托管代付
//$demo->freezeMoney("testtlzf",1);//冻结金额
//$demo->unfreezeMoney("testtlzf","TL20200413044214",1);//解冻金额
//$demo->refund("TL20200413042730","testtlzf","D0",1,"https://www.baidu.com");//退款申请
//$demo->applicationTransfer("testtlzf",1);//平台转账申请
//$demo->queryBalance("testtlzf","400193");//查询余额 
//$demo->getOrderDetail("TL20200413042730");//查询订单状态 
//$demo->queryInExpDetail("2020-4-12","2020-4-13","testtlzf","400193",1,2);//查询账户收支明细 
//$demo->getCheckAccountFile("2020-4-13",1);//平台集合对账下载
//$demo->queryMerchantBalance();//平台账户集余额查询
class OrderDemo
{
	private  $logIns;
	private  $config;
    public function __construct(){
        $this->logIns = Log::getInstance();
        $this->config = conf::getInstance();
		$this->config->loadConf('./Config/config.php');
    }

    /**
     * [depositApply 充值申请]
     */
	public function depositApply($bizUserId,$accountSetNo,$amount,$fee,$validateType,$frontUrl,$backUrl,$industryCode,$industryName,$source)
	{

		$yunClient = new yunClient();
		$param["bizOrderNo"] = "TL".date("Ymdhis");
		$param["bizUserId"] = $bizUserId;
		$param["accountSetNo"] = $accountSetNo;
		$param["amount"] = $amount;
		$param["fee"] =$fee;
		$param["validateType"] = $validateType;
		$param["frontUrl"] = $frontUrl;
		$param["backUrl"] = $backUrl;
		//快捷支付
		// $payParam["amount"] = 1;
		// $payParam["bankCardNo"] = $yunClient->encryptAES("6227000267060250071");
		// $payMethod["QUICKPAY_VSP"] = $payParam;
		//收银宝网关
		// $payParam["amount"] = 1;
		// $payParam["paytype"] = "B2B";
		// $payMethod["GATEWAY_VSP"] = $payParam;
		//微信小程序
		// $payParam["amount"] = 1;
		// $payParam["limitPay"] = "no_credit";
		// $payParam["acct"] = "oUU99wefa2BWRDmoIqUjMTFrxMGY";
		// $payMethod["WECHATPAY_MINIPROGRAM"] = $payParam;

		$param["payMethod"] = $payMethod;
		$param["industryCode"] = $industryCode;
		$param["industryName"] = $industryName;
		$param["source"] = $source;
		$method = "allinpay.yunst.orderService.depositApply";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [payByBackSMS 确认支付（后台+短信验证码确认）]
	 */
	public function payByBackSMS($bizUserId,$bizOrderNo,$tradeNo,$verificationCode,$consumerIp)
	{
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["bizOrderNo"] = $bizOrderNo;
		$param["tradeNo"] = $tradeNo;
		$param["verificationCode"] = $verificationCode;
		$param["consumerIp"] = $consumerIp;
		$method = "allinpay.yunst.orderService.payByBackSMS";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [payBySMS 确认支付（前台+短信验证码确认）]
	 */
	public function payBySMS($bizUserId,$bizOrderNo,$consumerIp,$verificationCode=null)
	{
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["bizOrderNo"] = $bizOrderNo;
		$param["verificationCode"] = $verificationCode;
		$param["consumerIp"] = $consumerIp;
		$method = "allinpay.yunst.orderService.payBySMS";
		$result = $yunClient->concatUrlParams($method,$param);
		$url = "http://test.allinpay.com/op/gateway?".$result;
		$this->logIns->logMessage("[前台+短信验证码确认URL]",Log::INFO,$url);
		header("Location:$url");
	}

	/**
	 * [withdrawApply 提现申请]
	 */
	public function withdrawApply($bizUserId,$accountSetNo,$amount,$fee,$validateType,$backUrl,$bankCardNo,$industryCode,$industryName,$source)
	{
		$yunClient = new yunClient();
		$param["bizOrderNo"] = "TL".date("Ymdhis");
		$param["bizUserId"] = $bizUserId;
		$param["accountSetNo"] = $accountSetNo;
		$param["amount"] = $amount;
		$param["fee"] = $fee;
		$param["validateType"] = $validateType;
		$param["backUrl"] = $backUrl;
		$param["bankCardNo"] = $yunClient->encryptAES($bankCardNo);
		$param["industryCode"] = $industryCode;
		$param["industryName"] = $industryName;
		$param["source"] = $source;
		$method = "allinpay.yunst.orderService.withdrawApply";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}


	/**
	 * [consumeApply 消费申请]
	 */
	public function consumeApply($payerId,$recieverId,$amount,$fee,$validateType,$backUrl,$industryCode,$industryName,$source)
	{
		$yunClient = new yunClient();
		$param["payerId"] = $payerId;
		$param["recieverId"] = $recieverId;
		$param["amount"] = $amount;
		$param["fee"] = $fee;
		$param["bizOrderNo"] = "TL".date("Ymdhis");
		$param["validateType"] = $validateType;
		$param["backUrl"] = $backUrl;

		//余额支付 JSONArray
		// $payParam[0]["accountSetNo"]="400193";
		// $payParam[0]["amount"]=$amount;
		// $payMethod["BALANCE"] = $payParam;
		//快捷支付
		$payParam["amount"] = $amount;
		$payParam["bankCardNo"] = $yunClient->encryptAES("6227000267060250071");
		$payMethod["QUICKPAY_VSP"] = $payParam;
		//收银宝网关
		// $payParam["amount"] = 1;
		// $payParam["paytype"] = "B2B";
		// $payMethod["GATEWAY_VSP"] = $payParam;
		//微信小程序
		// $payParam["amount"] = 1;
		// $payParam["limitPay"] = "no_credit";
		// $payParam["acct"] = "oUU99wefa2BWRDmoIqUjMTFrxMGY";
		// $payMethod["WECHATPAY_MINIPROGRAM"] = $payParam;
		
		// 二级分账
		$splitRuleList[0]["bizUserId"]="testtlzf02";
		$splitRuleList[0]["accountSetNo"]="400193";
		$splitRuleList[0]["amount"]=1;
		$splitRuleList[0]["fee"]=0;
		$splitRuleList[0]["remark"]="消费二级分账";

		//一级分账
		$splitParam[0]["bizUserId"]="testtlzf01";
		$splitParam[0]["accountSetNo"]="400193";
		$splitParam[0]["amount"]=1;
		$splitParam[0]["fee"]=0;
		$splitParam[0]["remark"]="消费一级分账";
		$splitParam[0]["splitRuleList"]=$splitRuleList;
		$param["splitRule"] = $splitParam;
		$param["payMethod"] = $payMethod;
		$param["industryCode"] = $industryCode;
		$param["industryName"] = $industryName;
		$param["source"] = $source;
		$method = "allinpay.yunst.orderService.consumeApply";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [agentCollectApply 托管代收]
	 */
	public function agentCollectApply($payerId,$tradeCode,$amount,$fee,$backUrl,$validateType,$industryCode,$industryName,$source)
	{
		$yunClient = new yunClient();
		$param["bizOrderNo"] = "TL".date("Ymdhis");
		$param["payerId"] = $payerId;
		//收款列表 JSONArray
		$recievParam[0]["bizUserId"]="testtlzf01";
		$recievParam[0]["amount"]="1";
		$param["recieverList"] = $recievParam;
		$param["tradeCode"] = $tradeCode;
		$param["amount"] = $amount;
		$param["fee"] = $fee;
		$param["backUrl"] = $backUrl;
		$param["validateType"] = $validateType;
		//余额支付 JSONArray
		// $payParam[0]["accountSetNo"]="400193";
		// $payParam[0]["amount"]=$amount;
		// $payMethod["BALANCE"] = $payParam;
		//快捷支付
		$payParam["amount"] = $amount;
		$payParam["bankCardNo"] = $yunClient->encryptAES("6227000267060250071");
		$payMethod["QUICKPAY_VSP"] = $payParam;
		//收银宝网关
		// $payParam["amount"] = 1;
		// $payParam["paytype"] = "B2B";
		// $payMethod["GATEWAY_VSP"] = $payParam;
		//微信小程序
		// $payParam["amount"] = 1;
		// $payParam["limitPay"] = "no_credit";
		// $payParam["acct"] = "oUU99wefa2BWRDmoIqUjMTFrxMGY";
		// $payMethod["WECHATPAY_MINIPROGRAM"] = $payParam;
		$param["payMethod"] = $payMethod;
		$param["industryCode"] = $industryCode;
		$param["industryName"] = $industryName;
		$param["source"] = $source;
		$method = "allinpay.yunst.orderService.agentCollectApply";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [signalAgentPay 单笔托管代付]
	 */
	public function signalAgentPay($bizUserId,$bizOrderNo,$tradeCode,$amount,$fee,$backUrl)
	{
		$yunClient = new yunClient();
		$param["bizOrderNo"] = "TL".date("Ymdhis");
		//托管代收中的付款人列表
		$collectPayList[0]["bizOrderNo"] = $bizOrderNo;
		$collectPayList[0]["amount"] = $amount;
		$param["collectPayList"] = $collectPayList;
		//收款账户bizUserId
		$param["bizUserId"] = $bizUserId;
		$param["accountSetNo"] = "400193";
		$param["tradeCode"] = $tradeCode;
		$param["amount"] = $amount;
		$param["fee"] = $fee;
		$param["backUrl"] = $backUrl;
		$method = "allinpay.yunst.orderService.signalAgentPay";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [freezeMoney 冻结金额]
	 */
	public function freezeMoney($bizUserId,$amount)
	{
		$yunClient = new yunClient();
		$param["bizFreezenNo"] = "TL".date("Ymdhis");
		$param["bizUserId"] = $bizUserId;
		$param["accountSetNo"] = "400193";
		$param["amount"] = $amount;
		$method = "allinpay.yunst.orderService.freezeMoney";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [unfreezeMoney 解冻金额]
	 */
	public function unfreezeMoney($bizUserId,$bizFreezenNo,$amount)
	{
		$yunClient = new yunClient();
		$param["bizFreezenNo"] = $bizFreezenNo;
		$param["bizUserId"] = $bizUserId;
		$param["accountSetNo"] = "400193";
		$param["amount"] = $amount;
		$method = "allinpay.yunst.orderService.unfreezeMoney";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [refund 退款申请]
	 */
	public function refund($oriBizOrderNo,$bizUserId,$refundType,$amount,$backUrl)
	{
		$yunClient = new yunClient();
		$param["bizOrderNo"] = "TL".date("Ymdhis");
		$param["oriBizOrderNo"] = $oriBizOrderNo;
		$param["bizUserId"] = $bizUserId;
		$param["refundType"] = $refundType;
		$param["amount"] = $amount;
		$param["backUrl"] = $backUrl;
		$method = "allinpay.yunst.orderService.refund";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [applicationTransfer 平台转账]
	 */
	public function applicationTransfer($targetBizUserId,$amount)
	{
		$yunClient = new yunClient();
		$param["bizTransferNo"] = "TL".date("Ymdhis");
		$param["sourceAccountSetNo"] = "100001";
		$param["targetBizUserId"] = $targetBizUserId;
		$param["targetAccountSetNo"] = "400193";
		$param["amount"] = $amount;
		$param["backUrl"] = "https://www.baidu.com";
		$method = "allinpay.yunst.orderService.applicationTransfer";
		$result = $yunClient->request($method,$param);
		var_dump($result);

	}

	/**
	 * [queryBalance 查询余额]
	 */
	public function queryBalance($bizUserId,$accountSetNo)
	{
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["accountSetNo"] = $accountSetNo;
		$method = "allinpay.yunst.orderService.queryBalance";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [getOrderDetail 查询订单状态]
	 */
	public function getOrderDetail($bizOrderNo)
	{
		$yunClient = new yunClient();
		$param["bizOrderNo"] = $bizOrderNo;
		$method = "allinpay.yunst.orderService.getOrderDetail";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [queryInExpDetail 查询账户收支明细]
	 */
	public function queryInExpDetail($timestart,$timeend,$bizUserId,$accountSetNo,$startPosition,$queryNum)
	{
		$yunClient = new yunClient();
		$param["bizUserId"] = $bizUserId;
		$param["accountSetNo"] = $accountSetNo;
		$param["dateStart"] = date("Y-m-d",strtotime($timestart));
		$param["dateEnd"] = date("Y-m-d",strtotime($timeend));
		$param["startPosition"] = $startPosition;
		$param["queryNum"] = $queryNum;
		$method = "allinpay.yunst.orderService.queryInExpDetail";
		$result = $yunClient->request($method,$param);
		var_dump($result);
	}

	/**
	 * [getCheckAccountFile 平台集合对账下载]
	 */
	public function getCheckAccountFile($timestart,$fileType)
	{
		$yunClient = new yunClient();
		$param["date"] = date("Ymd",strtotime($timestart));
		$param["fileType"] = $fileType;
		$method = "allinpay.yunst.orderService.getCheckAccountFile";
		$result = $yunClient->request($method,$param);
		set_time_limit(0); 
		$file = file_get_contents($url);
		file_put_contents("./DownFile/$data.txt", $file);
	}

}
