/**
 * create this file at 下午4:35:35 by renhd.
 */
package com.allinpay.sdk.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.allinpay.sdk.bean.BizParameter;
import com.allinpay.sdk.bean.OpenResponse;

/**
 * 通联开放平台行业分账产品 特权类接口测试demo 详细参考通商云开放平台接口规范
 *
 * @author 任海东 2020年1月10日
 *
 */
public class VipApiTest extends JuintTest {

	/**
	 * 特权会员订单查询
	 */
	@Test
	public void vipGetOrderPaymentDetail() {
		final BizParameter param = new BizParameter();
		param.put("privBizUserId", "818330b1-0545-44d7-8361-751e4bed0220");
		param.put("sysid", "1902271423530473681");//特权会员可查询的应用
		param.put("bizOrderNo", "CZ202004271353430823DO9GNLPZ");//商户订单号
		try {
			final OpenResponse response = client.execute("allinpay.yunst.orderService.vipGetOrderPaymentDetail", param);
			if ("OK".equals(response.getSubCode())) {
				System.out.println(response.getData());
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 * 特权会员账户收支明细查询
	 * 
	 */
	@Test
	public void vipGetUserExpDetail() {
		final BizParameter param = new BizParameter();
		param.put("privBizUserId", "818330b1-0545-44d7-8361-751e4bed0220");
		param.put("sysid", "1902271423530473681");//特权会员可查询的应用
		param.put("bizUserId", "zhaoweiwei");//商户会员编号
		param.put("accountSetNo", "");//账户集编号
		param.put("dateStart", "2020-04-20");//起始时间
		param.put("dateEnd", "2020-04-27");//结束时间
		param.put("startPosition", "1");//起始位置
		param.put("queryNum", "10");//查询条数
		try {
			final OpenResponse response = client.execute("allinpay.yunst.orderService.vipGetUserExpDetail", param);
			if ("OK".equals(response.getSubCode())) {
				System.out.println(response.getData());
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 * 分公司拓展应用信息查询
	 * 
	 */
	@Test
	public void vipGetAccessApplication() {
		final BizParameter param = new BizParameter();
		param.put("privBizUserId", "818330b1-0545-44d7-8361-751e4bed0220");
		param.put("sysid", "1902271423530473681");//特权会员可查询的应用
		param.put("orgCode", "9999450000");//分公司编码
//		param.put("dateStart", "2020-04-20");//起始时间
//		param.put("dateEnd", "");//结束时间
		param.put("startPosition", "1");//起始位置
		param.put("queryNum", "10");//查询条数
		try {
			final OpenResponse response = client.execute("allinpay.yunst.merchantService.vipGetAccessApplication", param);
			if ("OK".equals(response.getSubCode())) {
				System.out.println(response.getData());
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 * 应用状态及功能配置查询
	 * 
	 */
	@Test
	public void vipApplicationStatusConfigQuery() {
		final BizParameter param = new BizParameter();
		param.put("privBizUserId", "818330b1-0545-44d7-8361-751e4bed0220");
		param.put("sysid", "1902271423530473681");//特权会员可查询的应用
		param.put("functionType", 1L);//功能配置类型
		try {
			final OpenResponse response = client.execute("allinpay.yunst.merchantService.vipApplicationStatusConfigQuery", param);
			if ("OK".equals(response.getSubCode())) {
				System.out.println(response.getData());
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 平台商户信息查询
	 */
	@Test
	public void vipMerchantInfoQuery() {
		final BizParameter param = new BizParameter();
		param.put("privBizUserId", "818330b1-0545-44d7-8361-751e4bed0220");//测试特权会员818330b1-0545-44d7-8361-751e4bed0220 生产特权会员39295d56-3c20-4771-b8b3-110f36dc2e8c
		param.put("sysid", "1902271423530473681");//特权会员可查询的应用  测试环境1902271423530473681  生产环境1902141108045931770
		try {
			final OpenResponse response = client.execute("allinpay.yunst.merchantService.vipMerchantInfoQuery", param);
			if ("OK".equals(response.getSubCode())) {
				System.out.println(response.getData());
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 应用分账和手续费比例配置查询
	 */
	@Test
	public void vipApplicationSplitFeeConfigQuery() {
		final BizParameter param = new BizParameter();
		param.put("privBizUserId", "818330b1-0545-44d7-8361-751e4bed0220");//测试特权会员818330b1-0545-44d7-8361-751e4bed0220 生产特权会员39295d56-3c20-4771-b8b3-110f36dc2e8c
		param.put("sysid", "1902271423530473681");//特权会员可查询的应用  测试环境1902271423530473681  生产环境1902141108045931770
		try {
			final OpenResponse response = client.execute("allinpay.yunst.merchantService.vipApplicationSplitFeeConfigQuery", param);
			if ("OK".equals(response.getSubCode())) {
				System.out.println(response.getData());
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 银行前置特殊信息文件下载
	 */
	@Test
	public void vipGetSpecialDetailFileForBank() {
		final BizParameter param = new BizParameter();
		param.put("privBizUserId", "818330b1-0545-44d7-8361-751e4bed0220");//测试特权会员818330b1-0545-44d7-8361-751e4bed0220 生产特权会员39295d56-3c20-4771-b8b3-110f36dc2e8c
		param.put("sysid", "1902271423530473681");//特权会员可查询的应用  测试环境1902271423530473681  生产环境1902141108045931770
		param.put("date", "20200426");
		param.put("acctOrgType", 1L);
		param.put("fileType", 5L);
		
		try {
			final OpenResponse response = client.execute("allinpay.yunst.merchantService.vipGetSpecialDetailFileForBank", param);
			if ("OK".equals(response.getSubCode())) {
				System.out.println(response.getData());
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 平台会员及订单明细文件下载
	 */
	@Test
	public void vipGetDetailFile() {
		final BizParameter param = new BizParameter();
		param.put("privBizUserId", "818330b1-0545-44d7-8361-751e4bed0220");//测试特权会员818330b1-0545-44d7-8361-751e4bed0220 生产特权会员39295d56-3c20-4771-b8b3-110f36dc2e8c
		param.put("sysid", "1902271423530473681");//特权会员可查询的应用  测试环境1902271423530473681  生产环境1902141108045931770
		param.put("date", "20200426");
		param.put("fileType", 4L);
		
		try {
			final OpenResponse response = client.execute("allinpay.yunst.merchantService.vipGetDetailFile", param);
			if ("OK".equals(response.getSubCode())) {
				System.out.println(response.getData());
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}
	
}
