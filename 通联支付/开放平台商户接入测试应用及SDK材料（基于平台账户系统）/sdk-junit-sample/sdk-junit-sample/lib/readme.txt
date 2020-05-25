---------------------------
open-sdk-java使用说明
---------------------------
1.解压zip

2.将lib下jar包添加到buildpath中

3.配置OpenClient:
	
    protected OpenClient client;

    @Before
    public void configClient() {
		final String url = "http://test.allinpay.com/op/gateway";
		final String appId = "661520093552836608";
		final String secretKey = "CRcZWcErbbuOwwCPwsrqOtoIDwGmTJCa";
		final String privateKeyPath = "E:\\openspace\\open-sdk-java\\src\\test\\resources\\661520093552836608.pfx";
		final String pwd = "123456";
		final String tlPublicKey = "E:\\openspace\\open-sdk-java\\src\\test\\resources\\TLCert-test.cer";
		final OpenConfig oc = new OpenConfig(url, appId, secretKey, privateKeyPath, pwd, tlPublicKey);
		try {
		    client = new OpenClient(oc);
		} catch (final Exception e) {
		    e.printStackTrace();
		}
    }
	
4.client.execute(method,bizParameter)方法返回为json字符串,可根据项目自身用的json工具解析获得具体返回值

5.上送请求信息中包含卡号,身份证等接口文档中需要加密的敏感字段信息,调用client.encrypt(data)方法加密

6.同样响应信息中包含卡号,身份证等接口文档中需要解密的敏感字段信息,调用client.dencrypt(data)方法解密

7.接口文档中有的接口如“电子协议签约”，“设置支付密码”等接口需要跳转页面，调用client.concatUrlParams(method,bizParameter)生成跳转页面url

---------------------
调用代码示例：
	
	// 1.会员注册(简单参数示例)
	@Test
    public void createMember() {
		BizParameter param = new BizParameter();
		param.put("bizUserId", "test0001");
		param.put("memberType", 3L);
		param.put("source", 1L);
		try {
		    client.execute("allinpay.yunst.memberService.createMember", param);
		} catch (final Exception e) {
		    e.printStackTrace();
		}
    }
    
    // 2.批量代付(参数比较复杂的情况示例)
    @Test
    public void batchAgentPaySimplify() {
		// 准备数据
		final Map<String, Object> pay1BankCardInfo = new LinkedHashMap<>();
		pay1BankCardInfo.put("bankCardNo", client.encrypt("6214785123654445"));// 卡号需要加密
		pay1BankCardInfo.put("amount", 100000);
		pay1BankCardInfo.put("backUrl", "https://www.baidu.com");
		pay1BankCardInfo.put("withdrawType", "");
	
		final Map<String, Object> pay1 = new LinkedHashMap<>();
		pay1.put("bizOrderNo", "1234567890");
		pay1.put("bizUserId", "test0001");
		pay1.put("accountSetNo", "100002");
		pay1.put("backUrl", "https://www.allinpay.com");
		pay1.put("payToBankCardInfo", pay1BankCardInfo);
		pay1.put("amount", 100000);
		pay1.put("fee", 1000);
		pay1.put("splitRuleList", new ArrayList<>());
	
		final List<Map<String, Object>> payList = new ArrayList<>();
		payList.add(pay1);
	
		final BizParameter param = new BizParameter();
		param.put("bizBatchNo", "201807170001");
		param.put("batchPayList", payList);
		param.put("goodsType", 2L);
		param.put("goodsNo", "654321");
		param.put("tradeCode", "1001");
		try {
		    client.execute("allinpay.yunst.orderService.batchAgentPaySimplify", param);
		} catch (final Exception e) {
		    e.printStackTrace();
		}
    }
    
    // 3. 页面跳转调用示例
	@Test
	public void signContract() {
		final BizParameter param = new BizParameter();
		param.put("bizUserId", "test0001");
		param.put("jumpUrl", "https://www.baidu.com");
		param.put("backUrl", "https://www.baidu.com");
		param.put("source", 2L);
		try {
			final String url = client.concatUrlParams("allinpay.yunst.memberService.signContract", param);
			System.out.println(url);//返回拼好签名的页面url
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}
    
    
