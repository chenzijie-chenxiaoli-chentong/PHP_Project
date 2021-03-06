<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:62:"/www/wwwroot/123.206.213.22/addons/cms/view/default/index.html";i:1598231226;s:74:"/www/wwwroot/123.206.213.22/addons/cms/view/default/common/index_list.html";i:1598234727;s:68:"/www/wwwroot/123.206.213.22/addons/cms/view/default/common/item.html";i:1598234732;}*/ ?>
<!DOCTYPE html>
<html lang="zh-Hans">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <title><?php echo \think\Config::get("cms.title"); ?> - <?php echo \think\Config::get("cms.sitename"); ?></title>
    <meta name="keywords" content="<?php echo \think\Config::get("cms.keywords"); ?>"/>
    <meta name="description" content="<?php echo \think\Config::get("cms.description"); ?>"/>
    <meta property="og:image" content="https://www.yinsiduanxin.com/favicon.ico">
    <meta property="og:type" content="website" />
    <meta property="og:locale" content="zh-Hans" />
    <link rel="stylesheet" href="/static/css/layui.css">
    <!--<link rel="stylesheet" href="/static/css/layui_1.css">-->
    <!--<link rel="stylesheet" href="/static/css/common.min.css">-->
    <link rel="stylesheet" href="/static/css/okaynav.temp.min.css">
    <link rel="stylesheet" href="/static/css/index.css">
    <!--hreflang-->
    <link rel="alternate" hreflang="zh-Hans" href="https://www.yinsiduanxin.com/gat-phone-number.html" />
    <link rel="alternate" hreflang="zh-Hant" href="https://tw.yinsiduanxin.com/gat-phone-number.html" />
    <link rel="alternate" hreflang="en" href="https://mytempsms.com/receive-sms-online/gat-phone-number.html" />
    <link rel="alternate" hreflang="ru" href="https://ru.yinsiduanxin.com/gat-phone-number.html" />
    <link rel="alternate" hreflang="ja" href="https://ja.yinsiduanxin.com/gat-phone-number.html" />
    <link rel="alternate" hreflang="ko" href="https://ko.yinsiduanxin.com/gat-phone-number.html" />
    <link rel="alternate" hreflang="es" href="https://es.yinsiduanxin.com/gat-phone-number.html" />
    <link rel="alternate" hreflang="fr" href="https://fr.yinsiduanxin.com/gat-phone-number.html" />
    <link rel="alternate" hreflang="de" href="https://de.yinsiduanxin.com/gat-phone-number.html" />
    <link rel="alternate" hreflang="ar" href="https://ar.yinsiduanxin.com/gat-phone-number.html" />
    <link rel="alternate" hreflang="vi" href="https://vi.yinsiduanxin.com/gat-phone-number.html" />
    <!--hreflang-->
    <script src="/static/js/layui.js"></script>
    <!--<script src="/static/js/layui.js"></script>-->
    <script src="/static/js/jquery-3.4.1.min.js"></script>
    <script>
        layui.use(['layer', 'element'], function () {
            var layer = layui.layer
        })
    </script>
    <script data-ad-client="ca-pub-5224126064747013" async src="/static/js/adsbygoogle.js"></script>

        
    <!--Global site tag (gtag.js) - Google Analytics11 -->
    <script async src="/static/js/167cb49c947a4c9484e7eb6c737a2a4d.js"></script>
    <script>
      var _hmt = _hmt || [];
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'UA-148166685-3');
      (function() {var ys = document.createElement("script");
      ys.src = "/static/sms/js/jquery.min.js";
      var s = document.getElementsByTagName("script")[0]; 
      s.parentNode.insertBefore(ys, s);})();
    </script>
            
    </head>
    <body>
    <div class="container">
        <div class="top-bar-box"></div>
            <div class="layui-container">
                <div id="header" class="okayNav-header header" style="max-height: 70px;">
                    <a class="okayNav-header__logo" href="/">
                        <img src="/static/picture/logo.png" class="logo">
                    </a>
                    <nav role="navigation" id="nav-main" class="okayNav">
                        <ul>

                              <?php $__7oSB50KRx1__ = \addons\cms\model\Channel::getChannelList(["id"=>"nav","type"=>"top","condition"=>"1=isnav"]); if(is_array($__7oSB50KRx1__) || $__7oSB50KRx1__ instanceof \think\Collection || $__7oSB50KRx1__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__7oSB50KRx1__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i;?>
                
                     <li class="layui-nav-item"><a href="<?php echo $nav['url']; ?>" id="china" title="<?php echo $nav['name']; ?>"  <?php if($nav->is_active): ?> class="link-hr"<?php endif; ?>><?php echo $nav['name']; ?></a></li>
                    <?php endforeach; endif; else: echo "" ;endif; $__LASTLIST__=$__7oSB50KRx1__; ?>
                    <!--如果需要无限级请使用cms:nav标签-->
                    


                         
                        </ul>
                    </nav>
                </div>
            </div>
        <div class="nav-null"></div>
        <div class="layui-container">
            
            <div class="index-warn" style="display:none;">
                <blockquote class="site-text layui-elem-quote">
                    <div class="layui-row">
                        <div class="layui-col-md10 quote-left">
                            <span><i class="layui-icon">&#xe645; </i> </span>
                        </div>
                        <div class="layui-col-md2 quote-right">
                            <span><a href="/">查看详情</a></span>
                        </div>
                    </div>
                </blockquote>
            </div>
            <div>

            </div>
<div class="info-top">
    <div class="info-top-h1"><h1> 短信验证码在线接收平台</h1></div>
    <div class="info-top-h4"><h4>本页主要提供 临时手机电话号码,使用这些 <?php echo $__CHANNEL__['name']; ?>号码可以用来注册一次性Facebook,Twitter,Instagram,Telegram,Gamil,htomail,netflix...！</h4></div>
</div>
<!--        <div class="search">
            <form class="layui-form search-form" action="">
                <i class="layui-icon layui-icon-search search-search"></i>
                <input type="text" name="phone_num" required="" lay-verify="required"
                       placeholder="请输入要查询的号码"
                       autocomplete="off"
                       class="layui-input search-input">
                <i class="layui-icon layui-icon-close search-close"></i>
            </form>
        </div>-->
                <!-- phone_banner_top -->
<div id="mys-wrapper" class="mys-wrapper"><div id="mys-content" style="width:1140px;height:280px;background: #ccc"><img src="/static/ad1.png" style="width:1140px;height:280px;">
</div></div>
        <div class="main" style="margin-top:10px;">
            <div class="breadcrumb">
                <span class="layui-breadcrumb">
                                                <a href="/">隐私短信</a>
                                                                        <a><cite>中国港澳台号码</cite></a>
                                                            </span>
            </div>  
                    <div class="layui-row layui-col-space15">
                    
                
                                            

  <?php $page=request()->get('page/d',1);$offset=($page-1)*12; ?>

<!-- S 首页列表 -->
<?php $__g1cx9JuWo0__ = \addons\cms\model\Archives::getArchivesList(["id"=>"item","cache"=>"false","addon"=>"true","model"=>1,"orderby"=>"weigh","limit"=>"$offset,12"]); if(is_array($__g1cx9JuWo0__) || $__g1cx9JuWo0__ instanceof \think\Collection || $__g1cx9JuWo0__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__g1cx9JuWo0__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
  <div class="layui-col-lg4 layui-col-md4 layui-col-sm6 layui-col-xs12 card">
                    <div class="layui-card" style="height:150px;">
                        <div class="layui-card-header">
                                                        <span class="layui-badge-dot layui-bg-green"></span> <span style="color: #8D8D8D" title="在线接码中">在线</span>
                                                        <a href="javascript:;">
                            <img class="guoqi" src="/static/picture/852.png"
                                 alt="香港号码">
                            </a>
                        </div>
                        <div class="layui-card-body layuiadmin-card-list">
                            <p class="layuiadmin-big-font card-phone" id="<?php echo $item['title']; ?>" lang="18"
                               title="点击接收短信验证码">
                                <a href="<?php echo $item['url']; ?>" class="clickA" target="_self"><span class="country-bh">+<?php echo $item['quhao']; ?></span> <?php echo $item['title']; ?></a>
                            </p>
                            <p>
                                &nbsp;
                                <span class="layuiadmin-span-color" style="margin-top:15px;">查询 <?php echo $item['views']; ?> <span class="copy"
                                                                                                           data-clipboard-text="<?php echo $item['title']; ?>" title="复制手机电话号码">复制</span></span>
                            </p>
                        </div>
                    </div>
                </div>             
<?php endforeach; endif; else: echo "" ;endif; $__LASTLIST__=$__g1cx9JuWo0__; ?>
<!-- E 首页列表 -->

<!--<?php if(!$__LASTLIST__): ?>
    <div class="loadmore loadmore-line loadmore-nodata"><span class="loadmore-tips">暂无更多数据</span></div>
<?php else: ?>
    <div class="text-center">
        <a href="?page=<?php echo $page+1; ?>" data-page="<?php echo $page; ?>" class="btn btn-default my-4 px-4 btn-loadmore">加载更多</a>
    </div>
<?php endif; ?>-->

                    
                        <!-- E 列表 -->

                       


                                    
               
                                            </div>
        </div>
             





 <div style="text-align: center;margin-top:10px;">
                    <!-- phone_banner_bottom -->
<div id="mys-wrapper" class="mys-wrapper"><div id="mys-content" style="width:1140px;height:280px;background: #ccc"><img src="/static/ad2.png" style="width:1140px;height:280px;">
</div></div>
            </div>

    </div>
   
    
        <div id="foot-null" class="foot-null"></div>
    <div id="foot" class="foot">
        <p class="">Copyright © 2020 <a class="foot-link" href="https://www.yinsiduanxin.com">隐私短信</a> <a class="foot-link" href="https://www.yinsiduanxin.com">短信验证码接收</a><a class="foot-link" href="https://www.yinsiduanxin.com"> 在线接码平台</a> <a class="foot-link" href="https://mytempsms.com"> Receive SMS Online</a> <a class="foot-link" href="https://www.yinsiduanxin.com/yinsiduanxin.com_sitemap.xml" target="_blank"> Sitemap</a>
        </p>
    </div>
    <div class="main-right">
        <!-- 右侧垂直大幅广告 -- 在线 -->
        <ins class="adsbygoogle main-right-adsense"
             style="display:block;min-width:120px;max-width:300px;"
             data-ad-client="ca-pub-5224126064747013"
             data-ad-slot="5921958055"
             data-ad-format="auto"
             data-full-width-responsive="true"></ins>
        <script>
        $(document).ready(function(){
            (adsbygoogle = window.adsbygoogle || []).push({});
        })
        </script>
    </div>
</div>

    </body>
<script src="/static/js/clipboard.js"></script>
<script src="/static/js/jquery.okaynav-min.js.js"></script>
<!--<script src="/static/js/api.js"></script>-->
<script type="text/javascript">
    var navigation = $('#nav-main').okayNav({
        swipe_enabled: false,
    });
</script>
<!--<script>
    layui.use(['layer', 'element'], function () {
        var layer = layui.layer
    })
</script>-->

    <script>
        //nav link当前
        let get_region = window.location.pathname
        if(get_region !== '/'){
            let regExp = /[a-zA-Z]+/
            link_title = regExp.exec(get_region)
            link_title = link_title[0]
            $('#' + link_title).addClass('link-hr')
        }
    //点击复制
    $('.copy').click(function (e) {
        var clipboard = new Clipboard('.copy')
        clipboard.on('success', function (e) {
            layer.msg('复制' + e.text + '成功', {icon: 1})
        })
        clipboard.on('error', function (e) {
            layer.msg('复制' + e.text + '失败', {icon: 2})
        })
    })

    $('.clickA').click(function (e) {
        if(window.matchMedia("(min-width: 767px)").matches){
            layer.msg('数据较多，努力加载中...', {
                time: 0,
                icon: 16,
                shade: 0.05
                })
        }
    })
    //活动每日弹出一次
/*    var today = new Date();
    if (localStorage.getItem('alert') != today.getDate()){
        layer.confirm("平台域名<br />【<span style='color: red;font-weight:bold;'>隐私短信</span>】www.<span style='color: red;font-weight:bold;'>Yin</span><span style='color: blue;font-weight:bold;'>Si</span><span style='color: brown;font-weight:bold;'>Duan</span><span style='color:cadetblue;font-weight:bold;'>Xin</span>.com <br />请大家按住Ctrl+D键收藏或者跟我一起默念！\\(^o^)/", {
            btn: ['我记住了','就是不记'] //按钮
        })
        localStorage.setItem('alert', today.getDate())
    }*/
  
    //右侧广告自适应宽度
    var win_width =  $(window).width()
    if (win_width > 772 && win_width < 990){
        $('.main-right').width((win_width - 772)/2);
    }
    if (win_width > 992 && win_width < 1200){
        $('.main-right').width((win_width - 992)/2);
    }
    if (win_width > 1200){
        $('.main-right').width((win_width - 1200)/2);
    }
    
        //top
        layui.use('util', function(){
        var util = layui.util;
        util.fixbar({
            bar1: false
            ,click: function(type){
                if (type === 'bar1'){
                    layer.prompt({
                        formType: 2,
                        value: '',
                        title: '给站长反馈您的建议、BUG',
                        offset: (document.documentElement.clientHeight/2)-157,
                    }, function(value, index, elem){
                        $.ajax({
                            url: '/api/feedback',
                            type: 'post',
                            data: {content: value, email: $("#email").val(), type: 1},
                            beforeSend: function(){
                                var index = layer.load(2);
                            },
                            success: function (e) {
                                if (e.error_code == 0) {
                                    layer.msg(e.msg , {icon: 1})
                                    layer.close(index);
                                } else {
                                    layer.msg(e.msg, {icon: 2})
                                }
                            },
                            complete: function () {
                                layer.closeAll('loading');
                            }
                        })
                    })
                    $(".layui-layer-input").attr("placeholder", "填写您需要反馈的内容")
                    $(".layui-layer-content").append('<div style="margin-top: 10px;"><input type="text" id="email" name="email" lay-verify="email" placeholder="联系方式Email" class="layui-input"></div>')
                    $(".layui-layer-btn0").css({"border-color":"#4A5E77", "background-color":"#4A5E77", "color":"#FFF"})
                }
            }
        })
    })
        //高度
        var windows_height = $(window).height()
        var full_height = $(".foot-null").offset().top
        var height = windows_height - full_height - 100
        if (height > 0){
            $('.foot-null').height(height)
        }

    //
/*    grecaptcha.ready(function() {
        var renderKey = '6Lea0MAUAAAAAEjQFEvEUEdPK_gJmntXnudEG6mA'
        grecaptcha.execute(renderKey, {action: 'meessage'}).then(function(token) {
            $.ajax({
                url: "/recaptcha.html",
                type: 'post',
                data: {token:token},
                success: function (e) {
                    console.log(e)
                }
            })
        })
    })*/
            function subscription_mailbox (){
            layer.prompt({
                formType: 3,
                value: '',
                title: '请输入订阅的邮箱地址',
                offset: (document.documentElement.clientHeight/2)-240
            }, function(value, index, elem){
                $.ajax({
                    url: '/api/mailbox',
                    type: 'post',
                    data: {mailbox: value},
                    beforeSend: function(){
                        var index = layer.load(2);
                    },
                    success: function (e) {
                        if (e.error_code == 0) {
                            layer.msg(e.msg , {icon: 1})
                            layer.close(index);
                        } else {
                            layer.msg(e.msg, {icon: 2})
                        }
                    },
                    complete: function () {
                        layer.closeAll('loading');
                    }
                })

            })
            $(".layui-layer-content").prepend('<div style="text-align: center;margin-bottom: 10px;"><img src="/static/picture/mailbox.png" width="90px" height="90px" /></div>')
            $(".layui-layer-content").append('<p style="color: #FF0000;margin-top: 10px;text-align: center;">订阅成功后您将第一时间获取平台最新号码邮件通知</p>')
            $(".layui-layer-btn0").css({"border-color":"#4A5E77", "background-color":"#4A5E77", "color":"#FFF"})
        }
</script>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
    <script type="text/javascript" src="/static/js/addthis_widget.js"></script>
</html>

