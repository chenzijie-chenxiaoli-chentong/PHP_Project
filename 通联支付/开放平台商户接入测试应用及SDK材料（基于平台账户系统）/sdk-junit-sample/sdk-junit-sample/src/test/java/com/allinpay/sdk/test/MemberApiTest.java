/**
 * create this file at 下午4:35:35 by renhd.
 */
package com.allinpay.sdk.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.allinpay.sdk.bean.BizParameter;
import com.allinpay.sdk.bean.OpenResponse;

/**
 * 通联开放平台行业分账产品 会员类接口测试demo 详细参考通商云开放平台接口规范
 *
 * @author 任海东 2020年1月10日
 *
 */
public class MemberApiTest extends JuintTest {

	/**
	 * 创建会员
	 */
//	@Test
//	public void createMember() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "lyz004");
//		param.put("memberType", 3L);
//		param.put("source", 1L);
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.createMember", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}

//	/**
////	 * 账户余额协议签约
////	 */
//	@Test
//	public void signBalanceProtocol() {
//		final BizParameter param = new BizParameter();
//		param.put("protocolReqSn", "20200424001");
//		param.put("payerId", "lyz003");
//		param.put("receiverId", "lyz001");
//		param.put("protocolName", "通联通商云委托扣款授权书");
//		param.put("jumpUrl", "http://www.baidu.com");
//		param.put("jumpUrl", "http://www.baidu.com");
//		param.put("noSignPcoUrl", "http://www.baidu.com");
//		try {
//			final String url = client.concatUrlParams("allinpay.yunst.memberService.signBalanceProtocol", param);
//			System.out.println("cccc="+url);
//			browser(url);// 打开浏览器
//			
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//	/**
//	 * 账户余额协议解约
//	 */
//	@Test
//	public void releaseProtocol() {
//		final BizParameter param = new BizParameter();
//		param.put("protocolReqSn", "20200424001");
//		param.put("payerId", "lyz003");
//		param.put("protocolNo", "1253256267871326208");
////	    param.put("source", 1);
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.releaseProtocol", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
	/**
//	 * 账户余额协议查询
//	 */
//	@Test
//	public void getProtocolDetail() {
//		final BizParameter param = new BizParameter();
//
//		param.put("payerId", "lyz003");
//		param.put("protocolNo", "1253256267871326208");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.getProtocolDetail", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}

//	
//
////	/**
////	 * 发送短信验证码
////	 */
//	@Test
//	public void sendVerificationCode() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "lyz003");
//		param.put("phone", "18616358370");
//		param.put("verificationCodeType", 9L);
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.sendVerificationCode", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//////
//	/**
//	 * 绑定手机
//	 */
//	@Test
//	public void bindPhone() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "lyz003");
//		param.put("phone", "13127977056");
//		param.put("verificationCode", "11111");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.bindPhone", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
/////**
//* 无验证绑定手机
//*/
//@Test
//public void bindPhoneWithoutConfirm() {
//	final BizParameter param = new BizParameter();
//	param.put("bizUserId", "lyz004");
//	param.put("phone", "13127977056");
//	try {
//		final OpenResponse response = client.execute("allinpay.yunst.memberService.bindPhoneWithoutConfirm", param);
//		if ("OK".equals(response.getSubCode())) {
//			System.out.println(response.getData());
//		}
//	} catch (final Exception e) {
//		e.printStackTrace();
//	}
//}

//	/**
//	 * 修改绑定手机（短信验证码确认）
//	 */
//	@Test
//	public void changeBindPhone() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "lyz003");
//		param.put("oldphone", "13127977056");
//		param.put("newphone", "18616358370");
//		param.put("newverificationCode", "11111");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.changeBindPhone", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}	
////	/**
////	 * 个人会员实名认证
////	 */
//	@Test
//	public void setRealName() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "lyz003");
//		param.put("isAuth", "true");
//		param.put("name", "李玉贞");
//		param.put("identityType", "1");
//		param.put("identityNo", client.encrypt("410328198803269667"));// 敏感数据加密
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.setRealName", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 电子会员签约
////	 */
//	@Test
//	public void signContract() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("jumpUrl", "http://ceshi.allinpay.com");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		param.put("source", 2L);
//		try {
//			final String url = client.concatUrlParams("allinpay.yunst.memberService.signContract", param);
//			System.out.println(url);
//			browser(url);// 打开浏览器
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 查询(个人、企业)会员信息
////	 */
//	@Test
//	public void getMemberInfo() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "enterprise0002");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.getMemberInfo", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//				final JSONObject data = JSON.parseObject(response.getData());
//				System.out.println(client.decrypt(data.getJSONObject("memberInfo").getString("accountNo")));// test
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 设置企业信息
////	 */
//	@Test
//	public void setCompanyInfo() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "lyz001");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		param.put("isAuth", false);
//		final Map<String, Object> companyBasicInfo = new LinkedHashMap<>();
//		companyBasicInfo.put("companyName", "测试小b商户2");
//		companyBasicInfo.put("companyAddress", "上海浦东新区金沪路");
//		companyBasicInfo.put("authType", 1L);
//		companyBasicInfo.put("uniCredit", "111111");
//		companyBasicInfo.put("businessLicense", "222222");
//		companyBasicInfo.put("organizationCode", "333333");
//		companyBasicInfo.put("taxRegister", "444444");
//		companyBasicInfo.put("expLicense", "2099-1-1");
//		companyBasicInfo.put("telephone", "555555");
//		companyBasicInfo.put("legalName", "张三");
//		companyBasicInfo.put("identityType", 1L);
//		companyBasicInfo.put("legalIds", client.encrypt("666666"));
//		companyBasicInfo.put("legalPhone", "777777");
//		companyBasicInfo.put("accountNo", client.encrypt("6228480402637874215"));
//		companyBasicInfo.put("parentBankName", "农业银行");
//		companyBasicInfo.put("bankCityNo", "777777");
//		companyBasicInfo.put("bankName", "农业银行");
//		companyBasicInfo.put("unionBank", "103611001012");
//		companyBasicInfo.put("bankCityNo", "");
//		companyBasicInfo.put("province", "");
//		companyBasicInfo.put("city", "");
//
//		param.put("companyBasicInfo", companyBasicInfo);
//
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.setCompanyInfo", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 查询卡bin
////	 */
//	@Test
//	public void getBankCardBin() {
//		final BizParameter param = new BizParameter();
//		param.put("cardNo", client.encrypt("6228480402637874214"));
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.getBankCardBin", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 请求实名绑定银行卡
////	 */
	/*
	 */
//	@Test
//	public void applyBindBankCardAndRealName() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "lyz004");
//		param.put("phone", "13127977056");
//		param.put("cardCheck", 7);
//		param.put("cardNo", client.encrypt("4392268332962753"));
//		param.put("name", "李玉贞");
//		param.put("identityNo", client.encrypt("410328198803269667"));
//		param.put("identityType", 1L);
//    	param.put("validate", client.encrypt("0321"));
//    	param.put("cvv2", client.encrypt("950"));
//     	param.put("isSafeCard", false);
////    	param.put("unionBank", "");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.applyBindBankCardAndRealName", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//}
	
	///**
	//* 确认实名绑定银行卡
	//*/
//	@Test
//	public void bindBankCardAndRealName() {
//		final BizParameter param = new BizParameter();
//		final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//		param.put("bizUserId", "lyz004");
//		param.put("tranceNum", "265742152995");// 申请绑卡时返回的tranceNum
//		param.put("transDate", sdf.format(new Date()));
//		param.put("phone", "13127977056");
//		param.put("validate", "0321");
//		param.put("cvv2", client.encrypt("950"));
//		param.put("verificationCode", "043802");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.bindBankCardAndRealName", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//	}

/////**
/* 请求绑定银行卡
*/
/*
*/
@Test
public void applyBindBankCard() {
	final BizParameter param = new BizParameter();
	param.put("bizUserId", "lyz004");
	param.put("phone", "13127977056");
	param.put("cardCheck", 9);
	param.put("cardNo", client.encrypt("4392268332962753"));
	param.put("name", "李玉贞");
	param.put("identityNo", client.encrypt("410328198803269667"));
	param.put("identityType", 1L);
	param.put("validate", client.encrypt("0321"));
	param.put("cvv2", client.encrypt("950"));
	param.put("isSafeCard", false);
//	param.put("unionBank", "");
	try {
		final OpenResponse response = client.execute("allinpay.yunst.memberService.applyBindBankCard", param);
		if ("OK".equals(response.getSubCode())) {
			System.out.println(response.getData());
		}
	} catch (final Exception e) {
		e.printStackTrace();
	}
}
}

////	/**
////	 * 确认绑卡
////	 */
//	@Test
//	public void bindBankCard() {
//		final BizParameter param = new BizParameter();
//		final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//		param.put("bizUserId", "test0002");
//		param.put("tranceNum", "SMFBK1215543341848993792");// 申请绑卡时返回的tranceNum
//		param.put("transDate", sdf.format(new Date()));
//		param.put("phone", "13616515002");
//		param.put("verificationCode", "111111");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.bindBankCard", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
	


////
////	/**
////	 * 查询绑定银行卡
////	 */
//	@Test
//	public void queryBankCard() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("cardNo", client.encrypt("6228480402637874321"));
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.queryBankCard", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 解绑银行卡
////	 */
//	@Test
//	public void unbindBankCard() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("cardNo", client.encrypt("6228480402637874321"));
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.unbindBankCard", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 锁定会员
////	 */
//	@Test
//	public void lockMember() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.lockMember", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 解锁会员
////	 */
//	@Test
//	public void unlockMember() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.unlockMember", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 设置支付密码
////	 */
//	@Test
//	public void setPayPwd() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("phone", "18812345678");
//		param.put("name", "测试会员2");
//		param.put("identityType", "1");
//		param.put("identityNo", client.encrypt("110101200808087633"));
//		param.put("jumpUrl", "http://ceshi.allinpay.com");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		try {
//			final String url = client.concatUrlParams("allinpay.yunst.memberService.setPayPwd", param);
//			System.out.println(url);
//			browser(url);// 打开浏览器
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 修改支付密码
////	 */
//	@Test
//	public void updatePayPwd() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("name", "测试会员2");
//		param.put("identityType", "1");
//		param.put("identityNo", client.encrypt("110101200808087633"));
//		param.put("jumpUrl", "http://ceshi.allinpay.com");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		try {
//			final String url = client.concatUrlParams("allinpay.yunst.memberService.updatePayPwd", param);
//			System.out.println(url);
//			browser(url);// 打开浏览器
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 重置支付密码
////	 */
//	@Test
//	public void resetPayPwd() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("name", "测试会员2");
//		param.put("phone", "18812345678");
//		param.put("identityType", "1");
//		param.put("identityNo", client.encrypt("110101200808087633"));
//		param.put("jumpUrl", "http://ceshi.allinpay.com");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		try {
//			final String url = client.concatUrlParams("allinpay.yunst.memberService.resetPayPwd", param);
//			System.out.println(url);
//			browser(url);// 打开浏览器
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 修改绑定手机
////	 */
//	@Test
//	public void updatePhoneByPayPwd() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("name", "测试会员2");
//		param.put("identityType", "1");
//		param.put("identityNo", client.encrypt("110101200808087633"));
//		param.put("oldPhone", "18812345678");
//		param.put("jumpUrl", "http://ceshi.allinpay.com");
//		param.put("backUrl", "http://ceshi.allinpay.com");
//		try {
//			final String url = client.concatUrlParams("allinpay.yunst.memberService.updatePhoneByPayPwd", param);
//			System.out.println(url);
//			browser(url);// 打开浏览器
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 解绑手机
////	 */
////	@Test
//	public void unbindPhone() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("phone", "18843218765");
//		param.put("verificationCode", "11111");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.unbindPhone", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 会员绑定支付账户用户标识
////	 */
//	@Test
//	public void applyBindAcct() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("operationType", "set");
//		param.put("acctType", "weChatPublic");
//		param.put("acct", "oUpF8uMuAJO_M2pxb1Q9zNjWeS6o");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.applyBindAcct", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
////
////	/**
////	 * 会员收银宝渠道商户信息及终端信息绑定
////	 */
//	@Test
//	public void vspTermidService() {
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "test0002");
//		param.put("operationType", "set");
//		param.put("vspCusid", "8215840481600WD");
//		param.put("appid", "00013940");
//		param.put("vspTermid", "10267344");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.vspTermidService", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
/////**
//* 支付宝个人代扣协议页面签约
//*/
//@Test
//public void alipayUserAgreementPageSign() {
//	final HashMap<String, Object> accessParams = new HashMap<>();
//	accessParams.put("channel", "ALIPAYAPP");
//	final BizParameter param = new BizParameter();
//	param.put("bizUserId", "lyz003");
////	param.put("signValidityPeriod", "set");
//	param.put("personalProductCode", "GENERAL_WITHHOLDING_P");
//	param.put("signScene", "INDUSTRY|PARKING");
//	param.put("externalAgreementNo", "I20200427lyz3");
//	param.put("accessParams", JSONObject.toJSON(accessParams));
//	param.put("backUrl", "http://www.baidu.com");
//	try {
//		final OpenResponse response = client.execute("allinpay.yunst.memberService.alipayUserAgreementPageSign", param);
//		if ("OK".equals(response.getSubCode())) {
//			System.out.println(response.getData());
//		}
//	} catch (final Exception e) {
//		e.printStackTrace();
//	}
//}
//}
	
	/**
	//* 支付宝个人代扣协议解约
	//*/
//	@Test
//	public void alipayUserAgreementUnsign() {
//		final HashMap<String, Object> accessParams = new HashMap<>();
//		accessParams.put("channel", "ALIPAYAPP");
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "lyz003");
////	param.put("alipayUserid", "20201877777677");
//		param.put("agreementNo", "20205227633928344996");
////		param.put("alipayLogonId", "INDUSTRY|PARKING");
////		param.put("externalAgreementNo", "I20200427lyz");
////		param.put("extendParams", "");
//		param.put("backUrl", "http://www.baidu.com");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.alipayUserAgreementUnsign", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//}
	/**
	//* 支付宝个人代扣协议查询
	//*/
//	@Test
//	public void alipayUserAgreementQuery() {
//		final HashMap<String, Object> accessParams = new HashMap<>();
//		accessParams.put("channel", "ALIPAYAPP");
//		final BizParameter param = new BizParameter();
//		param.put("bizUserId", "lyz003");
////	param.put("alipayUserid", "20201877777677");
////		param.put("agreementNo", "20205227633928344996");
//		param.put("personalProductcode", "GENERAL_WITHHOLDING_P");
//		param.put("signScene", "INDUSTRY|PARKING");
//		param.put("externalAgreementNo", "20200309123412");
////		param.put("extendParams", "");
//		try {
//			final OpenResponse response = client.execute("allinpay.yunst.memberService.alipayUserAgreementQuery", param);
//			if ("OK".equals(response.getSubCode())) {
//				System.out.println(response.getData());
//			}
//		} catch (final Exception e) {
//			e.printStackTrace();
//		}
//	}
//}
/**
//* 支付宝个人代扣协议初始化
//*/
//@Test
//public void alipayAgreementInitial() {
//	final JSONArray agreementList = new JSONArray();
//	final HashMap<String, Object> agreementList1 = new HashMap<>();
//	agreementList1.put("bizUserId", "lyz003");
//	agreementList1.put("personalProductCode", "GENERAL_WITHHOLDING_P");
//	agreementList1.put("signScene", "INDUSTRY|PARKING");
//	agreementList1.put("alipayUserid", "INDUSTRY|PARKING");
//	agreementList1.put("agreementNo", "2019876655554");
//	agreementList1.put("signTime", "2019-03-26 12:34:50");
//	agreementList1.put("externalAgreementNo", "20200309123412");
//	agreementList1.put("status", "NORMAL");
//	agreementList1.put("validTime", "2019-03-26 12:34:50");
//	agreementList1.put("invalidTime", "2030-03-26 12:34:50");
//	agreementList.add(agreementList1);
//	final BizParameter param = new BizParameter();
//    param.put("agreementList", agreementList);
//	param.put("reqId", "20205227633928344996");
//	param.put("backUrl", "http://www.baidu.com");
//
//
//	try {
//		final OpenResponse response = client.execute("allinpay.yunst.memberService.alipayAgreementInitial", param);
//		if ("OK".equals(response.getSubCode())) {
//			System.out.println(response.getData());
//		}
//	} catch (final Exception e) {
//		e.printStackTrace();
//	}
//}
//}