/**
 * create this file at 下午4:35:35 by renhd.
 */
package com.allinpay.sdk.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.allinpay.sdk.bean.BizParameter;
import com.allinpay.sdk.bean.OpenResponse;

/**
 * 通联开放平台行业分账产品 订单类接口测试demo 详细参考通商云开放平台接口规范
 *
 * @author 任海东 2020年1月10日
 *
 */
public class OrderApiTest extends JuintTest {

	/**
	 * 充值申请
	 */
//	@Test
//	public void depositApply() {
//		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		final Calendar calendar = Calendar.getInstance();
//		calendar.add(Calendar.HOUR, 15);
//		final Date date = calendar.getTime();
//		final String orderExpireDatetime = sdf.format(date);
//
//		final BizParameter param = new BizParameter();
		// 实名付（单笔）
//		final HashMap<String, Object> realnamePay = new HashMap<>();
//		realnamePay.put("bankCardNo", client.encrypt("6228480402637874321"));
//		realnamePay.put("amount", 100); // 分

		// 收银宝网关
//		final Map<String, Object> gatewayVsp = new HashMap<>();
//		gatewayVsp.put("amount", 100L);
//		gatewayVsp.put("paytype", "B2C");
//		// 通联通虚拟入金
//				final Map<String, Object> virtualIn = new HashMap<>();
//				virtualIn.put("amount", 10000L);
//				virtualIn.put("extChannelNo", "");
//				virtualIn.put("extAccount", "");
//				virtualIn.put("paysummary", "");
//		// 组装支付方式
//		final HashMap<String, Object> payMethod = new HashMap<>();
////		payMethod.put("REALNAMEPAY", realnamePay);
////		payMethod.put("GATEWAY_VSP", gatewayVsp);
//		payMethod.put("VIRTUAL_IN", virtualIn);
//
//		param.put("bizUserId", "lyz003");
//		param.put("bizOrderNo", System.currentTimeMillis() + "lyz");
//		param.put("accountSetNo", "400221");
//		param.put("amount", 10000L);
//		param.put("fee", 0L);
//		param.put("validateType", 0L);
//		param.put("frontUrl", "http://ceshi.allinpay.com");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		param.put("orderExpireDatetime", orderExpireDatetime);
//  	param.put("payMethod", JSONObject.toJSON(payMethod));
//		param.put("goodsName", "computer");
//		param.put("industryCode", "1010");
//		param.put("industryName", "保险代理");
//		param.put("source", 2L);
//		param.put("summary", "deposit");
//		param.put("extendInfo", "this is extendInfo");
//
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.depositApply", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}

	/**
	 * 消费申请
	 */
//	@Test
//	public void consumeApply() {
//		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		final Calendar calendar = Calendar.getInstance();
//		calendar.add(Calendar.HOUR, 15);
//		final Date date = calendar.getTime();
//		final String orderExpireDatetime = sdf.format(date);
//		final BizParameter param = new BizParameter();
//		// 支付方式
//		// 实名付（单笔）
//		final Map<String, Object> realnamePay = new HashMap<>();
//		realnamePay.put("bankCardNo", client.encrypt("6228480402637874321"));
//		realnamePay.put("amount", 200L);
//
//		// 组装支付方式
//		final HashMap<String, Object> payMethod = new HashMap<>();
//		payMethod.put("REALNAMEPAY", realnamePay);
//
//		param.put("payerId", "test0002");
//		param.put("recieverId", "enterprise0001");
//		param.put("bizOrderNo", System.currentTimeMillis() + "xf");
//		param.put("amount", 200L);
//		param.put("fee", 0L);
//		param.put("validateType", 1L);
//
//		// *** split rule
//		final JSONArray splitRule = new JSONArray();
//
//		final HashMap<String, Object> splitRule1 = new HashMap<>();
//		splitRule1.put("bizUserId", "test0001");
//		splitRule1.put("accountSetNo", "200001");
//		splitRule1.put("amount", 50L);
//		splitRule1.put("fee", 0L);
//		splitRule1.put("remark", " 消费一级分账");
//
//		final JSONArray splitRule2List1 = new JSONArray();
//		final HashMap<String, Object> splitRule2List = new HashMap<>();
//		splitRule2List.put("bizUserId", "renhd001");
//		splitRule2List.put("accountSetNo", "200001");
//		splitRule2List.put("amount", 20L);
//		splitRule2List.put("fee", 0L);
//		splitRule2List.put("remark", "消费二级分账");
//
//		splitRule2List1.add(new JSONObject(splitRule2List));
//
//		splitRule1.put("splitRuleList", splitRule2List1);
//		splitRule.add(new JSONObject(splitRule1));
//
////		param.put("splitRule", splitRule);
//
//		param.put("frontUrl", "http://ceshi.allinpay.com");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		param.put("orderExpireDatetime", orderExpireDatetime);
//		param.put("payMethod", payMethod);
//		param.put("goodsName", "computer");
//		param.put("goodsDesc", "computer made in china");
//		param.put("industryCode", "1010");
//		param.put("industryName", "保险代理");
//		param.put("source", 2L);
//		param.put("summary", "consume");
//		param.put("extendInfo", "商户上送扩展信息");
//
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.consumeApply", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	/**
	 * 余额协议消费申请
	 */
//	@Test
//	public void consumeProtocolApply() {
//		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		final Calendar calendar = Calendar.getInstance();
//		calendar.add(Calendar.HOUR, 15);
//		final Date date = calendar.getTime();
//		final String orderExpireDatetime = sdf.format(date);
//		final BizParameter param = new BizParameter();
//		// 支付方式
//		// 实名付（单笔）
//		final Map<String, Object> realnamePay = new HashMap<>();
//		realnamePay.put("bankCardNo", client.encrypt("6228480402637874321"));
//		realnamePay.put("amount", 200L);
//		// 余额支付
//			final JSONArray balance = new JSONArray();
//	final HashMap<String, Object> balancePay = new HashMap<>();
//	balancePay.put("accountSetNo", "400221");
//	balancePay.put("amount", 30L);
//	balance.add(balancePay);
//
//		// 组装支付方式
//		final HashMap<String, Object> payMethod = new HashMap<>();
//		//payMethod.put("REALNAMEPAY", realnamePay);
//		payMethod.put("BALANCE", balance);
//
//		param.put("payerId", "lyz003");
//		param.put("receiverId", "lyz001");
//		param.put("protocolNo", "1253256267871326208");
//		param.put("bizOrderNo", System.currentTimeMillis() + "lyz");
//		param.put("amount", 30L);
//		param.put("fee", 0L);
////		param.put("validateType", 0L);
//
//		// *** split rule
//		final JSONArray splitRule = new JSONArray();
//
//		final HashMap<String, Object> splitRule1 = new HashMap<>();
//		splitRule1.put("bizUserId", "test0001");
//		splitRule1.put("accountSetNo", "200001");
//		splitRule1.put("amount", 50L);
//		splitRule1.put("fee", 0L);
//		splitRule1.put("remark", " 消费一级分账");
//
//		final JSONArray splitRule2List1 = new JSONArray();
//		final HashMap<String, Object> splitRule2List = new HashMap<>();
//		splitRule2List.put("bizUserId", "renhd001");
//		splitRule2List.put("accountSetNo", "200001");
//		splitRule2List.put("amount", 20L);
//		splitRule2List.put("fee", 0L);
//		splitRule2List.put("remark", "消费二级分账");
//
//		splitRule2List1.add(new JSONObject(splitRule2List));
//
//		splitRule1.put("splitRuleList", splitRule2List1);
//		splitRule.add(new JSONObject(splitRule1));

//		request.put("splitRule", splitRule);

//		param.put("frontUrl", "http://ceshi.allinpay.com");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		param.put("orderExpireDatetime", orderExpireDatetime);
//		param.put("payMethod", payMethod);
//		param.put("goodsName", "computer");
//		param.put("goodsDesc", "computer made in china");
//		param.put("industryCode", "1010");
//		param.put("industryName", "保险代理");
//		param.put("source", 2L);
//		param.put("summary", "consume");
//		param.put("extendInfo", "商户上送扩展信息");
//
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.consumeProtocolApply", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//}
	/**
	 * 虚拟出入金确认支付
	 */
//	@Test
//	public void payVirtual() {
//		final BizParameter param = new BizParameter();
//
//		param.put("bizUserId", "lyz003");
//		param.put("bizOrderNo", "1587707816739lyz");
//		param.put("flag", "confirm");
//		param.put("extPayMethod", "VIRTUAL_IN");
//    	param.put("extTradeNo", System.currentTimeMillis() + "lyz");
//		param.put("consumerIp", "192.168.11.11");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.payVirtual", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}

//	/**
//	 * 托管代收申请（标准版）
//	 */
//	@Test
//	public void agentCollectApply() {
//		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		final Calendar calendar = Calendar.getInstance();
//		calendar.add(Calendar.HOUR, 15);
//		final Date date = calendar.getTime();
//		final String orderExpireDatetime = sdf.format(date);
//		final BizParameter param = new BizParameter();
//		// 支付方式
//		// 实名付（单笔）
//		final Map<String, Object> realnamePay = new HashMap<>();
//		realnamePay.put("bankCardNo", client.encrypt("6228480402637874321"));
//		realnamePay.put("amount", 30L);
//
//		// 组装支付方式
//		final HashMap<String, Object> payMethod = new HashMap<>();
//		payMethod.put("REALNAMEPAY", realnamePay);
//
//		// 收款列表
//		final JSONArray receiverList = new JSONArray();
//		final HashMap<String, Object> receiver1 = new HashMap<>();
//		receiver1.put("bizUserId", "test0001");
//		receiver1.put("amount", 30L);
//		receiverList.add(new JSONObject(receiver1));
//
//		param.put("payerId", "test0002");
//		param.put("bizOrderNo", System.currentTimeMillis() + "ds");
//		param.put("recieverList", receiverList);
//		param.put("tradeCode", "1003");
//		param.put("amount", 30L);
//		param.put("fee", 0L);
//		param.put("validateType", 1L); // 1 短信验证
//		param.put("frontUrl", "http://ceshi.allinpay.com");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		param.put("orderExpireDatetime", orderExpireDatetime);
//		param.put("payMethod", payMethod);
//		param.put("goodsName", "computer");
//		param.put("goodsDesc", "computer made in china");
//		param.put("industryCode", "1010");
//		param.put("industryName", "保险代理");
//		param.put("source", 2L);
//		param.put("summary", "consume");
//		param.put("extendInfo", "this is extendInfo");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.agentCollectApply", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
	
//	 * 托管代收申请（简化校验版）
////	 */
//	@Test
//	public void agentCollectApplySimplifyCheck() {
//		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		final Calendar calendar = Calendar.getInstance();
//		calendar.add(Calendar.HOUR, 15);
//		final Date date = calendar.getTime();
//		final String orderExpireDatetime = sdf.format(date);
//		final BizParameter param = new BizParameter();
//		// 支付方式
//		// 实名付（单笔）
//		final Map<String, Object> realnamePay = new HashMap<>();
//		realnamePay.put("bankCardNo", client.encrypt("6228480402637874321"));
//		realnamePay.put("amount", 30L);
//		// 余额支付
//		final JSONArray balance = new JSONArray();
//		final HashMap<String, Object> balancePay = new HashMap<>();
//		balancePay.put("accountSetNo", "400221");
//		balancePay.put("amount", 30L);
//		balance.add(balancePay);
//	
//	
//		// 组装支付方式
//		final HashMap<String, Object> payMethod = new HashMap<>();
//	  //payMethod.put("REALNAMEPAY", realnamePay);
//		payMethod.put("BALANCE", balance);
//
//
//		param.put("payerId", "lyz003");
//		param.put("bizOrderNo", System.currentTimeMillis() + "ds");
//		param.put("tradeCode", "1003");
//		param.put("amount", 30L);
//		param.put("fee", 0L);
//		param.put("validateType", 0L); // 1 短信验证
//		param.put("frontUrl", "http://ceshi.allinpay.com");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		param.put("orderExpireDatetime", orderExpireDatetime);
//		param.put("payMethod", payMethod);
//		param.put("goodsName", "computer");
//		param.put("goodsDesc", "computer made in china");
//		param.put("industryCode", "1010");
//		param.put("industryName", "保险代理");
//		param.put("source", 2L);
//		param.put("summary", "consume");
//		param.put("extendInfo", "this is extendInfo");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.agentCollectApplySimplifyCheck", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//	/	 * 余额托管代收申请
//	 */
//	@Test
//	public void agentCollectApply() {
//		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		final Calendar calendar = Calendar.getInstance();
//		calendar.add(Calendar.HOUR, 15);
//		final Date date = calendar.getTime();
//		final String orderExpireDatetime = sdf.format(date);
//		final BizParameter param = new BizParameter();
//		// 支付方式
//		// 实名付（单笔）
//		final Map<String, Object> realnamePay = new HashMap<>();
//		realnamePay.put("bankCardNo", client.encrypt("6228480402637874321"));
//		realnamePay.put("amount", 30L);
//		// 余额支付
//		final JSONArray balance = new JSONArray();
//		final HashMap<String, Object> balancePay = new HashMap<>();
//		balancePay.put("accountSetNo", "400221");
//		balancePay.put("amount", 30L);
//		balance.add(balancePay);
//
//		// 组装支付方式
//		final HashMap<String, Object> payMethod = new HashMap<>();
////		payMethod.put("REALNAMEPAY", realnamePay);
//		payMethod.put("BALANCE", balance);
//		// 收款列表
//		final JSONArray recieverList = new JSONArray();
//		final HashMap<String, Object> receiver1 = new HashMap<>();
//		receiver1.put("bizUserId", "lyz001");
//		receiver1.put("amount", 30L);
//		recieverList.add(new JSONObject(receiver1));
//
//		param.put("payerId", "lyz003");
//		param.put("bizOrderNo", System.currentTimeMillis() + "lyz");	
//		param.put("recieverList", recieverList);
//		param.put("protocolNo", "1253256267871326208");
//		param.put("payMethod", payMethod);
//		param.put("tradeCode", "1003");
//		param.put("amount", 30L);
//		param.put("fee", 0L);
//		 // 1 短信验证
//		param.put("frontUrl", "http://ceshi.allinpay.com");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		param.put("orderExpireDatetime", orderExpireDatetime);
//		
//		param.put("goodsName", "computer");
//		param.put("goodsDesc", "computer made in china");
//		param.put("industryCode", "1010");
//		param.put("industryName", "保险代理");
//		param.put("source", 2L);
//		param.put("summary", "consume");
//		param.put("extendInfo", "this is extendInfo");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.agentCollectApply", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//}


//	/**
//	 * 单笔托管代付（标准版）
//	 */
//	@Test
//	public void signalAgentPay() {
//		final BizParameter param = new BizParameter();
//		// 源托管代收订单付款信息
//		final JSONArray collectPayList = new JSONArray();
//		final HashMap<String, Object> collect1 = new HashMap<>();
//		collect1.put("bizOrderNo", "1578901808944ds");
//		collect1.put("amount", 30L);
//		collectPayList.add(new JSONObject(collect1));
//
//		param.put("bizUserId", "test0001");
//		param.put("accountSetNo", "200001");
//		param.put("bizOrderNo", System.currentTimeMillis() + "df");
//		param.put("collectPayList", collectPayList);
//		param.put("tradeCode", "2003");
//		param.put("amount", 30L);
//		param.put("fee", 0L);
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		param.put("summary", "consume");
//		param.put("extendInfo", "this is extendInfo");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.signalAgentPay", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//	/**
//	 * 单笔托管代付（标准版）
////	 */
//	@Test
//	public void signalAgentPay() {
//		final BizParameter param = new BizParameter();
//		// 源托管代收订单付款信息
//		final JSONArray collectPayList = new JSONArray();
//		final HashMap<String, Object> collect1 = new HashMap<>();
//		collect1.put("bizOrderNo", "1587714782316ds");
//		collect1.put("amount", 3L);
//		collectPayList.add(new JSONObject(collect1));
//
//		param.put("bizUserId", "lyz001");
//		param.put("accountSetNo", "400221");
//		param.put("bizOrderNo", System.currentTimeMillis() + "df");
//		param.put("collectbizOrderNo", "1587714782316ds");
////		param.put("collectPayList", collectPayList);
//		param.put("tradeCode", "2003");
//		param.put("amount", 3L);
//		param.put("fee", 0L);
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		param.put("summary", "consume");
//		param.put("extendInfo", "this is extendInfo");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.signalAgentPaySimplifyCheck", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 批量托管代付（简化校验版）
//	 */
//	@Test
//	public void batchAgentPaySimplifyCheck() {
//		final BizParameter param = new BizParameter();
//		// 源托管代收订单付款信息
////		final JSONArray collectPayList = new JSONArray();
////		final HashMap<String, Object> collect1 = new HashMap<>();
////		collect1.put("bizOrderNo", "1578901712750ds");
////		collect1.put("amount", 30L);
////		collectPayList.add(new JSONObject(collect1));
//
//		final HashMap<String, Object> pay1 = new HashMap<>();
//		pay1.put("bizOrderNo", System.currentTimeMillis() + "df");
//		pay1.put("collectbizOrderNo","1587714782316ds");
//		pay1.put("bizUserId", "lyz001");
//		pay1.put("accountSetNo", "400221");
//		pay1.put("backUrl", "http://ceshi.allinpay.com");
//		pay1.put("amount", 3L);
//		pay1.put("fee", 0L);
//
//		final JSONArray batchPayList = new JSONArray();
//		batchPayList.add(pay1);
//		
//		final HashMap<String, Object> pay2 = new HashMap<>();
//		pay2.put("bizOrderNo", System.currentTimeMillis() + "df");
//		pay2.put("collectbizOrderNo","1587714877800ds");
//		pay2.put("bizUserId", "lyz001");
//		pay2.put("accountSetNo", "400221");
//		pay2.put("backUrl", "http://ceshi.allinpay.com");
//		pay2.put("amount", 3L);
//		pay2.put("fee", 0L);
//		batchPayList.add(pay2);
//
//		param.put("bizBatchNo", System.currentTimeMillis() + "ba");
//		param.put("batchPayList", batchPayList);
//		param.put("tradeCode", "2003");
//
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.batchAgentPaySimplifyCheck", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//}
//	/**

//
//	/**
//	 * 提现申请
//	 */
//	@Test
//	public void withdrawApply() {
//		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		final Calendar calendar = Calendar.getInstance();
//		calendar.add(Calendar.HOUR, 15);
//		final Date date = calendar.getTime();
//		final String orderExpireDatetime = sdf.format(date);
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("bizOrderNo", System.currentTimeMillis() + "tx");
//		param.put("accountSetNo", "200001");
//		param.put("amount", 1L);
//		param.put("fee", 0L);
//		param.put("validateType", 1L);
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		param.put("orderExpireDatetime", orderExpireDatetime);
//		param.put("bankCardNo", client.encrypt("6228480402637874321"));
//		param.put("bankCardPro", 0L);
//		param.put("withdrawType", "D0");
//		param.put("industryCode", "1010");
//		param.put("industryName", "保险代理");
//		param.put("source", 2L);
//		param.put("summary", "withdraw");
//		param.put("extendInfo", "this is extendInfo");
//
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.withdrawApply", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 确认支付（后台+短信验证码）
//	 */
//	@Test
//	public void payByBackSMS() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("bizOrderNo", "1578901712750ds");
//		param.put("tradeNo", "");
//		param.put("verificationCode", "11111"); // 测试环境 验证码 11111
//		param.put("consumerIp", "192.168.11.11");
//
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.payByBackSMS", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 确认支付（前台+短信验证码）
//	 */
//	@Test
//	public void payBySMS() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("bizOrderNo", "1578897792888cz");
//		param.put("tradeNo", "");
//		param.put("verificationCode", "11111"); // 测试环境 验证码 11111
//		param.put("consumerIp", "192.168.11.11");
//		try {
//			final String url = client.concatUrlParams("allinpay.yunst.orderService.payBySMS", param);
//			System.out.println(url);
//			browser(url);// 打开浏览器
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 确认支付（前台+短支付密码）
//	 */
//	@Test
//	public void payByPwd() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("bizOrderNo", "15788977912321cz");
//		param.put("tradeNo", "");
//		param.put("jumpUrl", "http://ceshi.allinpay.com");
//		param.put("consumerIp", "192.168.11.11");
//		try {
//			final String url = client.concatUrlParams("allinpay.yunst.orderService.payByPwd", param);
//			System.out.println(url);
//			browser(url);// 打开浏览器
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 冻结金额
//	 */
//	@Test
//	public void freezeMoney() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("bizFreezenNo", System.currentTimeMillis() + "dj");
//		param.put("accountSetNo", "200001");
//		param.put("amount", 1);
//
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.freezeMoney", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 解冻金额
//	 */
//	@Test
//	public void unfreezeMoney() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("bizFreezenNo", "1578900930033dj");
//		param.put("accountSetNo", "200001");
//		param.put("amount", 1);
//
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.unfreezeMoney", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 退款
//	 */
//	@Test
//	public void refund() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("bizOrderNo", System.currentTimeMillis() + "tk");
//		param.put("oriBizOrderNo", "1578884948956cz");
//		param.put("amount", 1);
//		param.put("refundType", "D0");
//
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.refund", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 查询余额
//	 */
//	@Test
//	public void queryBalance() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("accountSetNo", "200001");
//
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.queryBalance", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 查询订单状态
//	 */
//	@Test
//	public void getOrderDetail() {
//		final BizParameter param = new BizParameter();
//		param.put("bizOrderNo", "1578884948956cz");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.getOrderDetail", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 查询账户收支明细
//	 */
//	@Test
//	public void queryInExpDetail() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("accountSetNo", "200001");
//		param.put("dateStart", "2020-01-10");
//		param.put("dateEnd", "2020-01-17");
//		param.put("startPosition", 1L);
//		param.put("queryNum", 10L);
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.queryInExpDetail", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 重发支付短信验证码
//	 */
//	@Test
//	public void resendPaySMS() {
//		final BizParameter param = new BizParameter();
//		param.put("bizOrderNo", "1578883586614xf");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.resendPaySMS", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//	 * 文件下载-非标
//	 */
//	@Test
//	public void getDetailFile() {
//		final BizParameter param = new BizParameter();
//		param.put("date", "20200424");
//		param.put("fileType", 3);
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.merchantService.getDetailFile", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//	/**
//	 * 平台账户间转账
//	 */
//	@Test
//	public void applicationTransferForOrgAcct() {
//		final BizParameter param = new BizParameter();
//		param.put("bizTransferNo",  System.currentTimeMillis() + "tk");
//		param.put("sourceAccountSetNo", "100001");
//		param.put("targetAccountSetNo", "2000000");
//		param.put("amount", 1);
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.orderService.applicationTransferForOrgAcct", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
	
//}
///**
//* 收银宝退款资金调拨
//*/
//@Test
//public void transferVSPRefundFund() {
//	final Map<String, Object> REFUND_TRANSFER_VSP = new HashMap<>();
//	REFUND_TRANSFER_VSP.put("payerCusid", client.encrypt("55058404816VQLX"));
//	REFUND_TRANSFER_VSP.put("payeeCusid", client.encrypt("55058404816VQL6"));
//	REFUND_TRANSFER_VSP.put("amount", 1L);
//	final HashMap<String, Object> payMethod = new HashMap<>();
//     payMethod.put("REFUND_TRANSFER_VSP", REFUND_TRANSFER_VSP);
//	final BizParameter param = new BizParameter();
//	param.put("bizOrderNo",  System.currentTimeMillis() + "tk");
//	param.put("backUrl", "http://test.allinpay.com/yst-notify/zfb/yibu");
//	param.put("source", 1);
//	param.put("payMethod", payMethod);
//	param.put("transferAmount", 1);
//	try {
//		final OpenResponse response = client.execute("allinpay.yunst.orderService.transferVSPRefundFund", param);
//		if ("OK".equals(response.getSubCode())) {
//			System.out.println(response.getData());
//		}
//	} catch (final Exception e) {
//		e.printStackTrace();
//	}
//}
//}
	///**
	//* 收银宝商户资金查询
	//*/
	@Test
	public void queryVSPFund() {

		final BizParameter param = new BizParameter();
		param.put("cusid", "55058404816VQLX");
		param.put("appid", "00182106");
		param.put("key", "123456");
		try {
			final OpenResponse response = client.execute("allinpay.yunst.merchantService.queryVSPFund", param);
			if ("OK".equals(response.getSubCode())) {
				System.out.println(response.getData());
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}
	}
