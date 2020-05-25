/**
 * create this file at 下午2:12:44 by renhd.
 */
package com.allinpay.sdk.test;

import java.lang.reflect.Method;

import org.junit.Before;

import com.allinpay.sdk.OpenClient;
import com.allinpay.sdk.bean.OpenConfig;

/**
 * junit 测试demo示例
 *
 * @author 任海东 2020年1月10日
 *
 */
public class JuintTest {

	protected OpenClient client;

	@Before
	public void configClient() {
//		测试参数
		final String url = "http://test.allinpay.com/op/gateway";
		final String appId = "1250978269474349057";
		final String secretKey = "4Ue2o3YxIHfUZSgHMVR2FNpx76dR2g1F";
		final String privateKeyPath = "F:\\yun\\sdk-junit-sample\\1250978269474349057.pfx";
		final String pwd = "123456";
		final String tlPublicKey = "F:\\yun\\sdk-junit-sample\\TLCertcs.cer";
//		生产参数
//		final String url = "https://cloud.allinpay.com/gateway";
//		final String appId = "1252162491785977857";
//		final String secretKey = "8L0MJSfssqU12f5zIHCcGNYxJlexYsyF";
//		final String privateKeyPath = "F:\\yun\\sdk-junit-sample\\1252162491785977857.pfx";
//		final String pwd = "123456";
//		final String tlPublicKey = "F:\\yun\\sdk-junit-sample\\TLCertsc.cer";
		final OpenConfig oc = new OpenConfig(url, appId, secretKey, privateKeyPath, pwd, tlPublicKey);
		try {
			client = new OpenClient(oc);
		} catch (final Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 打开默认浏览器，支持苹果和windows
	 *
	 * @param url
	 */
	protected void browser(final String url) {
		try {
			final String osName = System.getProperty("os.name");
			if (osName.startsWith("Windows")) {
				Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler  " + url);
			} else if (osName.startsWith("Mac OS")) {
				final Class<?> fileMgr = Class.forName("com.apple.eio.FileManager");
				final Method openURL = fileMgr.getDeclaredMethod("openURL", new Class[] { String.class });
				openURL.invoke(null, new Object[] { url });
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}

}
