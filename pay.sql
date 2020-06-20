-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2020-06-20 22:17:29
-- 服务器版本： 5.6.44-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pay`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pos` tinyint(1) NOT NULL,
  `agent_code` varchar(32) NOT NULL,
  `money` int(11) NOT NULL,
  `cash_password` varchar(64) NOT NULL DEFAULT 'e10adc3949ba59abbe56e057f20f883e',
  `mark` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `fixed_money_ali_percent_fee` float(5,2) NOT NULL,
  `fixed_money_wechat_percent_fee` float(5,2) NOT NULL,
  `unfixed_money_wechat_percent_fee` float(5,2) NOT NULL,
  `unfixed_money_ali_percent_fee` float(5,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `admin_user`
--

INSERT INTO `admin_user` (`id`, `username`, `password`, `create_time`, `pos`, `agent_code`, `money`, `cash_password`, `mark`, `is_active`, `fixed_money_ali_percent_fee`, `fixed_money_wechat_percent_fee`, `unfixed_money_wechat_percent_fee`, `unfixed_money_ali_percent_fee`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1588575540, 9, '1', 1, 'e10adc3949ba59abbe56e057f20f883e', 'add', 1, 1.00, 1.00, 1.00, 1.00),
(2, 'administrator', 'e10adc3949ba59abbe56e057f20f883e', 1591936464, 1, '1', 0, 'e10adc3949ba59abbe56e057f20f883e', '', 1, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- 表的结构 `cash`
--

CREATE TABLE IF NOT EXISTS `cash` (
  `id` int(11) NOT NULL,
  `user_type` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  `deal_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `money_account_id` int(11) NOT NULL,
  `mark` text NOT NULL,
  `money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `client_mession`
--

CREATE TABLE IF NOT EXISTS `client_mession` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  `update_time` int(11) NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT 'pay_notify'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2267 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `log`
--

INSERT INTO `log` (`id`, `type`, `username`, `create_time`, `content`) VALUES
(2161, 'merchant', 'abc', 1588575902, '登录商户端，登录ip【127.0.0.1】'),
(2162, 'merchant', 'abc', 1588935610, '登录商户端，登录ip【171.82.121.179】'),
(2163, 'merchant', 'abc', 1588935658, '登录商户端，登录ip【171.82.121.179】'),
(2164, 'merchant', 'abc', 1588937614, '登录商户端，登录ip【171.82.121.179】'),
(2165, 'merchant', 'abc', 1588940884, '登录商户端，登录ip【124.64.220.89】'),
(2166, 'merchant', 'abc', 1588944528, '登录商户端，登录ip【112.241.197.77】'),
(2167, 'merchant', 'abc', 1588945579, '登录商户端，登录ip【112.241.197.77】'),
(2168, 'merchant', 'abc', 1588946844, '登录商户端，登录ip【112.241.197.77】'),
(2169, 'merchant', 'abc', 1589006342, '登录商户端，登录ip【112.241.197.77】'),
(2170, 'merchant', 'abc', 1589102498, '登录商户端，登录ip【124.64.220.89】'),
(2171, 'admin', 'admin', 1589103871, '登录后台，身份【代理人】，登录ip【124.64.220.89】'),
(2172, 'admin', 'admin', 1589164677, '登录后台，身份【代理人】，登录ip【123.171.27.188】'),
(2173, 'admin', 'admin', 1589179451, '登录后台，身份【代理人】，登录ip【123.113.0.167】'),
(2174, 'admin', 'admin', 1589179686, '登录后台，身份【代理人】，登录ip【123.113.0.167】'),
(2175, 'admin', 'admin', 1589179735, '登录后台，身份【代理人】，登录ip【123.113.0.167】'),
(2176, 'admin', 'admin', 1589179781, '登录后台，身份【代理人】，登录ip【123.113.0.167】'),
(2177, 'admin', 'admin', 1589180394, '登录后台，身份【代理人】，登录ip【123.113.0.167】'),
(2178, 'admin', 'admin', 1589180621, '登录后台，身份【管理员】，登录ip【123.113.0.167】'),
(2179, 'admin', 'admin', 1589180794, '登录后台，身份【管理员】，登录ip【123.113.0.167】'),
(2180, 'admin', 'admin', 1589180925, '登录后台，身份【超级管理员】，登录ip【123.113.0.167】'),
(2181, 'admin', 'admin', 1589181872, '添加了帐号[ceshi1]'),
(2182, 'admin', 'admin', 1589182018, '登录后台，身份【超级管理员】，登录ip【123.113.0.167】'),
(2183, 'admin', 'admin', 1589183010, '登录后台，身份【超级管理员】，登录ip【112.241.197.77】'),
(2184, 'admin', 'admin', 1589183568, '登录后台，身份【超级管理员】，登录ip【112.241.197.77】'),
(2185, 'admin', 'admin', 1589183657, '登录后台，身份【超级管理员】，登录ip【112.241.197.77】'),
(2186, 'admin', 'admin', 1589184814, '登录后台，身份【超级管理员】，登录ip【123.113.0.167】'),
(2187, 'admin', 'admin', 1589250337, '登录后台，身份【超级管理员】，登录ip【123.113.0.167】'),
(2188, 'merchant', 'abc', 1589253407, '登录商户端，登录ip【59.173.106.98】'),
(2189, 'admin', 'admin', 1589253906, '登录后台，身份【超级管理员】，登录ip【223.104.3.55】'),
(2190, 'admin', 'admin', 1589254037, '登录后台，身份【超级管理员】，登录ip【59.173.106.98】'),
(2191, 'admin', 'admin', 1589271416, '登录后台，身份【超级管理员】，登录ip【117.136.0.149】'),
(2192, 'admin', 'admin', 1589271907, '登录后台，身份【超级管理员】，登录ip【112.241.197.77】'),
(2193, 'admin', 'admin', 1589273011, '登录后台，身份【超级管理员】，登录ip【112.241.197.77】'),
(2194, 'admin', 'admin', 1589273875, '新增了支付通道，名称为【景涛】'),
(2195, 'admin', 'admin', 1589274607, '修改了支付通道【景涛】的信息'),
(2196, 'admin', 'admin', 1589361885, '登录后台，身份【超级管理员】，登录ip【119.103.166.165】'),
(2197, 'admin', 'admin', 1589364066, '登录后台，身份【超级管理员】，登录ip【112.241.197.77】'),
(2198, 'admin', 'admin', 1589368321, '登录后台，身份【超级管理员】，登录ip【119.103.166.165】'),
(2199, 'admin', 'admin', 1589421431, '登录后台，身份【超级管理员】，登录ip【123.113.0.167】'),
(2200, 'admin', 'admin', 1589469169, '修改了支付通道【景涛】的信息'),
(2201, 'admin', 'admin', 1589514033, '登录后台，身份【超级管理员】，登录ip【59.173.106.98】'),
(2202, 'admin', 'admin', 1589515848, '修改了支付通道【景涛】的信息'),
(2203, 'admin', 'admin', 1589515893, '修改了支付通道【景涛】的信息'),
(2204, 'admin', 'admin', 1589516066, '新增了支付通道，名称为【testwu】'),
(2205, 'admin', 'admin', 1589516091, '修改了支付通道【testwu】的信息'),
(2206, 'admin', 'admin', 1589516289, '删除了支付通道【testwu】'),
(2207, 'admin', 'admin', 1589523123, '登录后台，身份【超级管理员】，登录ip【123.113.0.167】'),
(2208, 'admin', 'admin', 1589526767, '新增了支付通道，名称为【张栋】'),
(2209, 'admin', 'admin', 1589528072, '删除了支付通道【张栋】'),
(2210, 'admin', 'admin', 1589529445, '新增了支付通道，名称为【张栋】'),
(2211, 'admin', 'admin', 1589529576, '删除了支付通道【张栋】'),
(2212, 'admin', 'admin', 1589529746, '新增了支付通道，名称为【九胜商贸】'),
(2213, 'admin', 'admin', 1589529818, '修改了支付通道【九胜商贸】的信息'),
(2214, 'admin', 'admin', 1589530787, '删除了支付通道【九胜商贸】'),
(2215, 'admin', 'admin', 1589607601, '登录后台，身份【超级管理员】，登录ip【112.241.197.77】'),
(2216, 'admin', 'admin', 1589880244, '登录后台，身份【超级管理员】，登录ip【59.173.106.98】'),
(2217, 'merchant', 'abc', 1589895849, '登录商户端，登录ip【124.64.220.22】'),
(2218, 'merchant', 'abc', 1589895901, '登录商户端，登录ip【112.241.197.77】'),
(2219, 'admin', 'admin', 1589895922, '登录后台，身份【超级管理员】，登录ip【124.64.220.22】'),
(2220, 'admin', 'admin', 1589896837, '登录后台，身份【超级管理员】，登录ip【124.64.220.22】'),
(2221, 'admin', 'admin', 1589896869, '登录后台，身份【超级管理员】，登录ip【112.241.197.77】'),
(2222, 'admin', 'admin', 1589944371, '登录后台，身份【超级管理员】，登录ip【114.245.57.255】'),
(2223, 'admin', 'admin', 1590216823, '登录后台，身份【超级管理员】，登录ip【171.82.190.91】'),
(2224, 'admin', 'admin', 1590465319, '登录后台，身份【超级管理员】，登录ip【114.245.57.255】'),
(2225, 'admin', 'admin', 1590490325, '登录后台，身份【超级管理员】，登录ip【112.241.197.77】'),
(2226, 'admin', 'admin', 1590495142, '登录后台，身份【超级管理员】，登录ip【59.173.107.7】'),
(2227, 'admin', 'admin', 1590558103, '登录后台，身份【超级管理员】，登录ip【59.174.216.229】'),
(2228, 'admin', 'admin', 1590560056, '登录后台，身份【超级管理员】，登录ip【114.245.57.255】'),
(2229, 'admin', 'admin', 1590568635, '修改了支付通道【景涛】的信息'),
(2230, 'admin', 'admin', 1590579859, '登录后台，身份【超级管理员】，登录ip【59.173.107.7】'),
(2231, 'admin', 'admin', 1590582020, '登录后台，身份【超级管理员】，登录ip【124.64.220.37】'),
(2232, 'admin', 'admin', 1590591668, '登录后台，身份【超级管理员】，登录ip【124.64.220.37】'),
(2233, 'admin', 'admin', 1591345489, '登录后台，身份【超级管理员】，登录ip【114.245.52.73】'),
(2234, 'admin', 'admin', 1591594450, '登录后台，身份【超级管理员】，登录ip【112.241.197.77】'),
(2235, 'admin', 'admin', 1591595959, '新增了支付通道，名称为【景涛2】'),
(2236, 'admin', 'admin', 1591596787, '新增了支付通道，名称为【李兴华】'),
(2237, 'admin', 'admin', 1591596886, '新增了支付通道，名称为【李兴华2】'),
(2238, 'admin', 'admin', 1591596975, '新增了支付通道，名称为【孙伟】'),
(2239, 'admin', 'admin', 1591597070, '新增了支付通道，名称为【孙伟2】'),
(2240, 'admin', 'admin', 1591605912, '登录后台，身份【超级管理员】，登录ip【114.245.59.151】'),
(2241, 'admin', 'admin', 1591763600, '修改了支付通道【李兴华】的信息'),
(2242, 'admin', 'admin', 1591763619, '修改了支付通道【李兴华7873】的信息'),
(2243, 'admin', 'admin', 1591764211, '修改了支付通道【孙伟2】的信息'),
(2244, 'admin', 'admin', 1591764222, '修改了支付通道【孙伟】的信息'),
(2245, 'admin', 'admin', 1591764235, '修改了支付通道【李兴华2】的信息'),
(2246, 'admin', 'admin', 1591764248, '修改了支付通道【景涛2】的信息'),
(2247, 'admin', 'admin', 1591764354, '删除了支付通道【孙伟2】'),
(2248, 'admin', 'admin', 1591764369, '删除了支付通道【孙伟】'),
(2249, 'admin', 'admin', 1591764375, '删除了支付通道【李兴华2】'),
(2250, 'admin', 'admin', 1591764382, '删除了支付通道【景涛2】'),
(2251, 'admin', 'admin', 1591768157, '登录后台，身份【超级管理员】，登录ip【111.172.26.176】'),
(2252, 'admin', 'admin', 1591770978, '登录后台，身份【超级管理员】，登录ip【218.57.251.195】'),
(2253, 'admin', 'admin', 1591773057, '新增了支付通道，名称为【个人李兴华3624】'),
(2254, 'admin', 'admin', 1591773507, '新增了支付通道，名称为【个人景涛0179】'),
(2255, 'admin', 'admin', 1591932981, '登录后台，身份【超级管理员】，登录ip【112.239.140.71】'),
(2256, 'admin', 'admin', 1591936311, '登录后台，身份【超级管理员】，登录ip【112.239.140.71】'),
(2257, 'admin', 'admin', 1591936464, '添加了帐号[administrator]'),
(2258, 'admin', 'admin', 1591936581, '登录后台，身份【超级管理员】，登录ip【112.239.140.71】'),
(2259, 'admin', 'admin', 1591936595, '修改了帐号[]'),
(2260, 'admin', 'admin', 1591936613, '修改了帐号[]'),
(2261, 'admin', 'admin', 1591936714, '登录后台，身份【超级管理员】，登录ip【112.239.140.71】'),
(2262, 'admin', 'admin', 1591936795, '创建了商户【administrator】'),
(2263, 'merchant', 'administrator', 1591936811, '登录商户端，登录ip【112.239.140.71】'),
(2264, 'admin', 'administrator', 1591936832, '登录后台，身份【代理人】，登录ip【112.239.140.71】'),
(2265, 'admin', 'admin', 1592017943, '登录后台，身份【超级管理员】，登录ip【222.133.219.74】'),
(2266, 'admin', 'admin', 1592662229, '登录后台，身份【超级管理员】，登录ip【106.117.176.207】');

-- --------------------------------------------------------

--
-- 表的结构 `merchant`
--

CREATE TABLE IF NOT EXISTS `merchant` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  `creater_agent_code` varchar(32) NOT NULL,
  `money` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mark` varchar(255) NOT NULL,
  `cash_password` varchar(32) NOT NULL DEFAULT 'e10adc3949ba59abbe56e057f20f883e',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `fixed_money_ali_percent_fee` float(5,2) NOT NULL,
  `fixed_money_wechat_percent_fee` float(5,2) NOT NULL,
  `unfixed_money_wechat_percent_fee` float(5,2) NOT NULL,
  `unfixed_money_ali_percent_fee` float(5,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `merchant`
--

INSERT INTO `merchant` (`id`, `username`, `password`, `create_time`, `creater_agent_code`, `money`, `name`, `mark`, `cash_password`, `status`, `fixed_money_ali_percent_fee`, `fixed_money_wechat_percent_fee`, `unfixed_money_wechat_percent_fee`, `unfixed_money_ali_percent_fee`) VALUES
(1, 'abc', 'e10adc3949ba59abbe56e057f20f883e', 1588575540, '111', 10, 'aabbcc', '1', 'e10adc3949ba59abbe56e057f20f883e', 1, 1.00, 1.00, 1.00, 1.00),
(2, 'administrator', 'e10adc3949ba59abbe56e057f20f883e', 1591936795, '1', 0, 'administrator', '', 'e10adc3949ba59abbe56e057f20f883e', 1, 2.00, 2.00, 2.00, 2.00);

-- --------------------------------------------------------

--
-- 表的结构 `money_account`
--

CREATE TABLE IF NOT EXISTS `money_account` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `account_type` varchar(255) NOT NULL,
  `mark` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `account_info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `money_log`
--

CREATE TABLE IF NOT EXISTS `money_log` (
  `id` int(11) NOT NULL,
  `user_type` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `time` datetime NOT NULL,
  `date` date NOT NULL,
  `money` int(11) NOT NULL,
  `mark` text NOT NULL,
  `order_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `notify_data`
--

CREATE TABLE IF NOT EXISTS `notify_data` (
  `id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `notify_send`
--

CREATE TABLE IF NOT EXISTS `notify_send` (
  `id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `payway`
--

CREATE TABLE IF NOT EXISTS `payway` (
  `id` int(11) NOT NULL,
  `payway` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_wechat` tinyint(1) NOT NULL,
  `is_ali` tinyint(1) NOT NULL,
  `params` text NOT NULL,
  `could_use` tinyint(1) NOT NULL DEFAULT '1',
  `last_use_no` int(11) NOT NULL,
  `next_use_time` int(11) NOT NULL,
  `success_max_money` int(11) NOT NULL DEFAULT '1',
  `success_max_num` int(11) NOT NULL DEFAULT '1',
  `mark` text NOT NULL,
  `frequence` int(11) NOT NULL,
  `max_failed_times` int(11) NOT NULL,
  `belong` varchar(255) NOT NULL,
  `user` varchar(32) NOT NULL,
  `is_fixed_money` tinyint(1) NOT NULL DEFAULT '1',
  `identify_id` varchar(255) NOT NULL DEFAULT '',
  `tag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '游标，按顺序取每一条记录'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `payway`
--

INSERT INTO `payway` (`id`, `payway`, `name`, `create_time`, `is_active`, `is_wechat`, `is_ali`, `params`, `could_use`, `last_use_no`, `next_use_time`, `success_max_money`, `success_max_num`, `mark`, `frequence`, `max_failed_times`, `belong`, `user`, `is_fixed_money`, `identify_id`, `tag`) VALUES
(1, 'shouyinbao', '景涛', 1590568635, 1, 1, 1, '{"qr_code":"https:\\/\\/syb.allinpay.com\\/op?c=U9TXGAyT","appid":"00188840","md5key":"sdfsfsdfsfsdfsfs"}', 1, 0, 0, 80000, 100, '', 2, 3, '景涛', '', 0, 'syb-景涛', 0),
(2, 'shouyinbao', '李兴华7873', 1591763619, 1, 1, 1, '{"qr_code":"https:\\/\\/syb.allinpay.com\\/op?c=USQAZ2co","appid":"00190705","md5key":"sdfsfsdfsfsdfsfs"}', 1, 0, 0, 80000, 20, '农行7873', 2, 3, '李兴华', '', 0, 'syb-李兴华7873', 0),
(7, 'shouyinbao', '个人李兴华3624', 1591773057, 1, 1, 1, '{"qr_code":"https:\\/\\/syb.allinpay.com\\/op?c=US0UFs46","appid":"00190724","md5key":"sdl2fL3KH3J3G92327Kh"}', 1, 0, 0, 1000000, 20, '个人李兴华3624', 2, 3, '个人李兴华3624', '', 0, 'syb-个人李兴华3624', 0),
(8, 'shouyinbao', '个人景涛0179', 1591773507, 1, 1, 1, '{"qr_code":"https:\\/\\/syb.allinpay.com\\/op?c=WXWFBnJX","appid":"00190727","md5key":"sdl2fL3KH3J3G92327Kh"}', 1, 0, 0, 1000000, 20, '个人景涛0179', 2, 3, '个人景涛0179', '', 0, 'syb-个人景涛0179', 0);

-- --------------------------------------------------------

--
-- 表的结构 `payway_date_log`
--

CREATE TABLE IF NOT EXISTS `payway_date_log` (
  `id` int(11) NOT NULL,
  `payway_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `request_money` int(11) NOT NULL,
  `request_times` int(11) NOT NULL,
  `success_money` int(11) NOT NULL,
  `success_times` int(11) NOT NULL,
  `faild_times` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `pay_order`
--

CREATE TABLE IF NOT EXISTS `pay_order` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `order_id` varchar(64) NOT NULL,
  `fee` int(11) NOT NULL,
  `method` varchar(32) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `pay_time` datetime NOT NULL,
  `qr_code` varchar(255) NOT NULL,
  `qr_code_image_url` varchar(255) NOT NULL,
  `notify_url` text NOT NULL,
  `payway_id` int(11) NOT NULL,
  `agent_code` varchar(32) NOT NULL,
  `agent_type` varchar(32) NOT NULL,
  `payway_order_id` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `expire_time` int(11) NOT NULL,
  `payway` varchar(32) NOT NULL DEFAULT 'shouqianba',
  `act_fee` int(11) NOT NULL,
  `return_url` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `pay_order`
--

INSERT INTO `pay_order` (`id`, `username`, `order_id`, `fee`, `method`, `status`, `create_time`, `pay_time`, `qr_code`, `qr_code_image_url`, `notify_url`, `payway_id`, `agent_code`, `agent_type`, `payway_order_id`, `transaction_id`, `expire_time`, `payway`, `act_fee`, `return_url`) VALUES
(93, 'abc', '2020052815315036706', 1, 'wechat', 1, 1590651283, '2020-05-28 15:34:43', '', '', '', 1, '', 'mobile', '2020052815315036706', '2020052815315036706', 1590651483, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(94, 'abc', '2020052815325497628', 1, 'wechat', 1, 1590651347, '2020-05-28 15:35:47', '', '', '', 1, '', 'mobile', '2020052815325497628', '2020052815325497628', 1590651547, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(95, 'abc', '2020052815342276327', 1, 'wechat', 1, 1590651434, '2020-05-28 15:37:14', '', '', '', 1, '', 'mobile', '2020052815342276327', '2020052815342276327', 1590651634, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(96, 'abc', '2020052815351075671', 1, 'wechat', -2, 1590651483, '2020-05-28 15:38:03', '', '', '', 1, '', 'mobile', '2020052815351075671', '2020052815351075671', 1590651683, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(97, 'abc', '2020052815444566645', 1, 'wechat', 1, 1590652058, '2020-05-28 15:47:38', '', '', '', 1, '', 'mobile', '2020052815444566645', '2020052815444566645', 1590652258, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(98, 'abc', '2020052815470861783', 1, 'wechat', 1, 1590652201, '2020-05-28 15:50:01', '', '', '', 1, '', 'mobile', '2020052815470861783', '2020052815470861783', 1590652401, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(99, 'abc', '2020052815480987754', 1, 'wechat', 1, 1590652261, '2020-05-28 15:51:01', '', '', '', 1, '', 'mobile', '2020052815480987754', '2020052815480987754', 1590652461, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(100, 'abc', '2020052816350243726', 1, 'wechat', -2, 1590655075, '2020-05-28 16:37:55', '', '', '', 1, '', 'mobile', '2020052816350243726', '2020052816350243726', 1590655275, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(101, 'abc', '2020052909044265993', 1, 'wechat', 1, 1590714455, '2020-05-29 09:07:35', '', '', '', 1, '', 'mobile', '2020052909044265993', '2020052909044265993', 1590714655, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(102, 'abc', '2020052909085168341', 1, 'ali', 1, 1590714704, '2020-05-29 09:11:44', '', '', '', 1, '', 'mobile', '2020052909085168341', '2020052909085168341', 1590714904, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(103, 'abc', '2020060311541338350', 1, 'wechat', -2, 1591156454, '2020-06-03 11:54:14', '', '', '', 1, '', 'mobile', '2020060311541338350', '2020060311541338350', 1591156654, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(104, 'abc', '2020060311562731672', 1, 'wechat', 1, 1591156587, '2020-06-03 11:56:27', '', '', '', 1, '', 'mobile', '2020060311562731672', '2020060311562731672', 1591156787, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(105, 'abc', '2020060516254940566', 10, 'wechat', -2, 1591345549, '2020-06-05 16:25:49', '', '', '', 1, '', 'mobile', '2020060516254940566', '2020060516254940566', 0, 'shouyinbao', 10, ''),
(106, 'abc', '2020060814195742093', 10, 'wechat', -2, 1591597197, '2020-06-08 14:19:57', '', '', '', 1, '', 'mobile', '2020060814195742093', '2020060814195742093', 0, 'shouyinbao', 10, ''),
(107, 'abc', '2020060814232053923', 100, 'wechat', -2, 1591597400, '2020-06-08 14:23:20', '', '', '', 2, '', 'mobile', '2020060814232053923', '2020060814232053923', 0, 'shouyinbao', 100, ''),
(108, 'abc', '2020060911384167229', 1, 'wechat', -2, 1591673921, '2020-06-09 11:38:41', '', '', '', 2, '', 'mobile', '2020060911384167229', '2020060911384167229', 0, 'shouyinbao', 1, ''),
(109, 'abc', '2020060911392553446', 1, 'wechat', 1, 1591673965, '2020-06-09 11:39:25', '', '', '', 1, '', 'mobile', '2020060911392553446', '2020060911392553446', 0, 'shouyinbao', 1, ''),
(110, 'abc', '2020060911401578966', 1, 'wechat', -2, 1591674015, '2020-06-09 11:40:15', '', '', '', 3, '', 'mobile', '2020060911401578966', '2020060911401578966', 0, 'shouyinbao', 1, ''),
(111, 'abc', '2020060911403753676', 1, 'wechat', -2, 1591674037, '2020-06-09 11:40:37', '', '', '', 4, '', 'mobile', '2020060911403753676', '2020060911403753676', 0, 'shouyinbao', 1, ''),
(112, 'abc', '2020060912252112862', 1, 'wechat', -2, 1591676721, '2020-06-09 12:25:21', '', '', '', 2, '', 'mobile', '2020060912252112862', '2020060912252112862', 0, 'shouyinbao', 1, ''),
(113, 'abc', '2020060912254713306', 1, 'wechat', -2, 1591676747, '2020-06-09 12:25:47', '', '', '', 3, '', 'mobile', '2020060912254713306', '2020060912254713306', 0, 'shouyinbao', 1, ''),
(114, 'abc', '2020060912260891656', 1, 'wechat', -2, 1591676768, '2020-06-09 12:26:08', '', '', '', 1, '', 'mobile', '2020060912260891656', '2020060912260891656', 0, 'shouyinbao', 1, ''),
(115, 'abc', '2020060912265024674', 1, 'wechat', -2, 1591676810, '2020-06-09 12:26:50', '', '', '', 1, '', 'mobile', '2020060912265024674', '2020060912265024674', 0, 'shouyinbao', 1, ''),
(116, 'abc', '2020060912271697183', 1, 'wechat', -2, 1591676836, '2020-06-09 12:27:16', '', '', '', 4, '', 'mobile', '2020060912271697183', '2020060912271697183', 0, 'shouyinbao', 1, ''),
(117, 'abc', '2020061012340124907', 1, 'wechat', 1, 1591763641, '2020-06-10 12:34:01', '', '', '', 3, '', 'mobile', '2020061012340124907', '2020061012340124907', 0, 'shouyinbao', 1, ''),
(118, 'abc', '2020061012414680536', 1, 'wechat', 1, 1591764106, '2020-06-10 12:41:46', '', '', '', 1, '', 'mobile', '2020061012414680536', '2020061012414680536', 0, 'shouyinbao', 1, ''),
(119, 'abc', '2020061012444184534', 1, 'wechat', -2, 1591764281, '2020-06-10 12:44:41', '', '', '', 5, '', 'mobile', '2020061012444184534', '2020061012444184534', 0, 'shouyinbao', 1, ''),
(120, 'abc', '2020061012492821743', 1, 'wechat', 1, 1591764568, '2020-06-10 12:49:28', '', '', '', 1, '', 'mobile', '2020061012492821743', '2020061012492821743', 0, 'shouyinbao', 1, ''),
(121, 'abc', '2020061012495297376', 1, 'wechat', -2, 1591764592, '2020-06-10 12:49:52', '', '', '', 1, '', 'mobile', '2020061012495297376', '2020061012495297376', 0, 'shouyinbao', 1, ''),
(122, 'abc', '2020061012501645150', 1, 'wechat', -2, 1591764616, '2020-06-10 12:50:16', '', '', '', 1, '', 'mobile', '2020061012501645150', '2020061012501645150', 0, 'shouyinbao', 1, ''),
(123, 'abc', '2020061012511840733', 1, 'wechat', 1, 1591764678, '2020-06-10 12:51:18', '', '', '', 1, '', 'mobile', '2020061012511840733', '2020061012511840733', 0, 'shouyinbao', 1, ''),
(124, 'abc', '2020061012513889265', 1, 'wechat', 1, 1591764698, '2020-06-10 12:51:38', '', '', '', 1, '', 'mobile', '2020061012513889265', '2020061012513889265', 0, 'shouyinbao', 1, ''),
(125, 'abc', '2020061012520636174', 1, 'wechat', 1, 1591764726, '2020-06-10 12:52:06', '', '', '', 3, '', 'mobile', '2020061012520636174', '2020061012520636174', 0, 'shouyinbao', 1, ''),
(126, 'abc', '2020061012533199606', 1, 'wechat', -2, 1591764811, '2020-06-10 12:53:31', '', '', '', 1, '', 'mobile', '2020061012533199606', '2020061012533199606', 0, 'shouyinbao', 1, ''),
(127, 'abc', '2020061012540635629', 1, 'wechat', 1, 1591764846, '2020-06-10 12:54:06', '', '', '', 1, '', 'mobile', '2020061012540635629', '2020061012540635629', 0, 'shouyinbao', 1, ''),
(128, 'abc', '2020061012575077753', 1, 'wechat', 1, 1591765070, '2020-06-10 12:57:50', '', '', '', 3, '', 'mobile', '2020061012575077753', '2020061012575077753', 0, 'shouyinbao', 1, ''),
(129, 'abc', '2020061013325166207', 1, 'wechat', 1, 1591767171, '2020-06-10 13:32:51', '', '', '', 1, '', 'mobile', '2020061013325166207', '2020061013325166207', 1591767371, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(130, 'abc', '2020061013333928250', 1, 'wechat', -2, 1591767219, '2020-06-10 13:33:39', '', '', '', 1, '', 'mobile', '2020061013333928250', '2020061013333928250', 1591767419, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(131, 'abc', '2020061013335056473', 1, 'wechat', -2, 1591767231, '2020-06-10 13:33:51', '', '', '', 1, '', 'mobile', '2020061013335056473', '2020061013335056473', 1591767431, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(132, 'abc', '2020061013340693699', 1, 'wechat', -2, 1591767246, '2020-06-10 13:34:06', '', '', '', 1, '', 'mobile', '2020061013340693699', '2020061013340693699', 1591767446, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(133, 'abc', '2020061013342340085', 1, 'wechat', -2, 1591767263, '2020-06-10 13:34:23', '', '', '', 1, '', 'mobile', '2020061013342340085', '2020061013342340085', 1591767463, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(134, 'abc', '2020061013345740011', 1, 'wechat', -2, 1591767297, '2020-06-10 13:34:57', '', '', '', 1, '', 'mobile', '2020061013345740011', '2020061013345740011', 1591767497, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(135, 'abc', '2020061013363461350', 1, 'wechat', -2, 1591767394, '2020-06-10 13:36:34', '', '', '', 1, '', 'mobile', '2020061013363461350', '2020061013363461350', 1591767594, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(136, 'abc', '2020061013405067424', 1, 'wechat', -2, 1591767650, '2020-06-10 13:40:50', '', '', '', 1, '', 'mobile', '2020061013405067424', '2020061013405067424', 1591767850, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(137, 'abc', '2020061014053087589', 1, 'wechat', -2, 1591769130, '2020-06-10 14:05:30', '', '', '', 1, '', 'mobile', '2020061014053087589', '2020061014053087589', 1591769330, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(138, 'abc', '2020061014055062329', 1, 'wechat', -2, 1591769151, '2020-06-10 14:05:51', '', '', '', 1, '', 'mobile', '2020061014055062329', '2020061014055062329', 1591769351, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(139, 'abc', '2020061015113016583', 1, 'ali', 1, 1591773090, '2020-06-10 15:11:30', '', '', '', 7, '', 'mobile', '2020061015113016583', '2020061015113016583', 0, 'shouyinbao', 1, ''),
(140, 'abc', '2020061015185311837', 1, 'ali', 1, 1591773533, '2020-06-10 15:18:53', '', '', '', 8, '', 'mobile', '2020061015185311837', '2020061015185311837', 0, 'shouyinbao', 1, ''),
(144, 'abc', '2020061018181871387', 10, 'wechat', 1, 1591784298, '2020-06-10 18:18:18', '', '', '', 8, '', 'mobile', '2020061018181871387', '2020061018181871387', 0, 'shouyinbao', 10, ''),
(145, 'abc', '2020061018183714077', 2, 'wechat', 1, 1591784317, '2020-06-10 18:18:37', '', '', '', 8, '', 'mobile', '2020061018183714077', '2020061018183714077', 0, 'shouyinbao', 2, ''),
(146, 'abc', '2020061018185528672', 0, 'wechat', -2, 1591784335, '2020-06-10 18:18:55', '', '', '', 8, '', 'mobile', '2020061018185528672', '2020061018185528672', 0, 'shouyinbao', 0, ''),
(147, 'abc', '2020061018191189801', 1, 'wechat', 1, 1591784351, '2020-06-10 18:19:11', '', '', '', 8, '', 'mobile', '2020061018191189801', '2020061018191189801', 0, 'shouyinbao', 1, ''),
(148, 'abc', '2020061018215166097', 1, 'wechat', 1, 1591784511, '2020-06-10 18:21:51', '', '', '', 2, '', 'mobile', '2020061018215166097', '2020061018215166097', 0, 'shouyinbao', 1, ''),
(149, 'abc', '2020061018224896643', 1, 'wechat', 1, 1591784568, '2020-06-10 18:22:48', '', '', '', 7, '', 'mobile', '2020061018224896643', '2020061018224896643', 0, 'shouyinbao', 1, ''),
(150, 'abc', '2020061018240859960', 1, 'ali', 1, 1591784648, '2020-06-10 18:24:08', '', '', '', 1, '', 'mobile', '2020061018240859960', '2020061018240859960', 0, 'shouyinbao', 1, ''),
(151, 'abc', '2020061211370342101', 1, 'wechat', -2, 1591933023, '2020-06-12 11:37:03', '', '', '', 1, '', 'mobile', '2020061211370342101', '2020061211370342101', 0, 'shouyinbao', 1, ''),
(152, 'abc', '2020061211372233350', 1, 'wechat', -2, 1591933042, '2020-06-12 11:37:22', '', '', '', 1, '', 'mobile', '2020061211372233350', '2020061211372233350', 0, 'shouyinbao', 1, ''),
(153, 'abc', '2020061211375518303', 1, 'wechat', -2, 1591933075, '2020-06-12 11:37:55', '', '', '', 1, '', 'mobile', '2020061211375518303', '2020061211375518303', 0, 'shouyinbao', 1, ''),
(154, 'abc', '2020061211381232171', 1, 'wechat', -2, 1591933092, '2020-06-12 11:38:12', '', '', '', 2, '', 'mobile', '2020061211381232171', '2020061211381232171', 0, 'shouyinbao', 1, ''),
(155, 'abc', '2020061211382886192', 1, 'wechat', -2, 1591933108, '2020-06-12 11:38:28', '', '', '', 8, '', 'mobile', '2020061211382886192', '2020061211382886192', 0, 'shouyinbao', 1, ''),
(156, 'abc', '2020061211384588445', 1, 'wechat', -2, 1591933125, '2020-06-12 11:38:45', '', '', '', 7, '', 'mobile', '2020061211384588445', '2020061211384588445', 0, 'shouyinbao', 1, ''),
(157, 'abc', '2020061211392965734', 1, 'wechat', -2, 1591933169, '2020-06-12 11:39:29', '', '', '', 2, '', 'mobile', '2020061211392965734', '2020061211392965734', 0, 'shouyinbao', 1, ''),
(158, 'abc', '2020061211400262420', 1, 'wechat', -2, 1591933202, '2020-06-12 11:40:02', '', '', '', 2, '', 'mobile', '2020061211400262420', '2020061211400262420', 0, 'shouyinbao', 1, ''),
(159, 'abc', '2020061211412379379', 1, 'wechat', -2, 1591933283, '2020-06-12 11:41:23', '', '', '', 1, '', 'mobile', '2020061211412379379', '2020061211412379379', 0, 'shouyinbao', 1, ''),
(160, 'abc', '2020061211443231915', 30000, 'wechat', -2, 1591933472, '2020-06-12 11:44:32', '', '', '', 1, '', 'mobile', '2020061211443231915', '2020061211443231915', 0, 'shouyinbao', 30000, ''),
(161, 'abc', '2020061211450167425', 1, 'wechat', -2, 1591933501, '2020-06-12 11:45:01', '', '', '', 1, '', 'mobile', '2020061211450167425', '2020061211450167425', 0, 'shouyinbao', 1, ''),
(162, 'abc', '2020061211464916998', 1, 'wechat', 1, 1591933609, '2020-06-12 11:46:49', '', '', '', 1, '', 'mobile', '2020061211464916998', '2020061211464916998', 0, 'shouyinbao', 1, ''),
(163, 'abc', '2020061211473777915', 1, 'wechat', 1, 1591933657, '2020-06-12 11:47:37', '', '', '', 1, '', 'mobile', '2020061211473777915', '2020061211473777915', 0, 'shouyinbao', 1, ''),
(164, 'abc', '2020061211485651667', 1, 'wechat', 1, 1591933736, '2020-06-12 11:48:56', '', '', '', 1, '', 'mobile', '2020061211485651667', '2020061211485651667', 0, 'shouyinbao', 1, ''),
(165, 'abc', '2020061211491744688', 1, 'wechat', 1, 1591933757, '2020-06-12 11:49:17', '', '', '', 1, '', 'mobile', '2020061211491744688', '2020061211491744688', 0, 'shouyinbao', 1, ''),
(166, 'abc', '2020061212085799670', 1, 'wechat', -2, 1591934937, '2020-06-12 12:08:57', '', '', '', 1, '', 'mobile', '2020061212085799670', '2020061212085799670', 1591935137, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(167, 'abc', '2020061212092322693', 1, 'wechat', 1, 1591934963, '2020-06-12 12:09:23', '', '', '', 2, '', 'mobile', '2020061212092322693', '2020061212092322693', 1591935163, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(168, 'abc', '2020061212110321160', 1, 'wechat', -2, 1591935063, '2020-06-12 12:11:03', '', '', '', 7, '', 'mobile', '2020061212110321160', '2020061212110321160', 1591935263, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(169, 'abc', '2020061212114886942', 1, 'wechat', -2, 1591935107, '2020-06-12 12:11:47', '', '', '', 8, '', 'mobile', '2020061212114886942', '2020061212114886942', 1591935307, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(170, 'abc', '2020061212121158136', 1, 'wechat', -2, 1591935131, '2020-06-12 12:12:11', '', '', '', 1, '', 'mobile', '2020061212121158136', '2020061212121158136', 1591935331, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(171, 'abc', '2020061212122010843', 1, 'wechat', -2, 1591935139, '2020-06-12 12:12:19', '', '', '', 2, '', 'mobile', '2020061212122010843', '2020061212122010843', 1591935339, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(172, 'abc', '2020061212122839141', 1, 'wechat', 1, 1591935148, '2020-06-12 12:12:28', '', '', '', 7, '', 'mobile', '2020061212122839141', '2020061212122839141', 1591935348, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(173, 'abc', '2020061212231565573', 1, 'wechat', 1, 1591935795, '2020-06-12 12:23:15', '', '', '', 8, '', 'mobile', '2020061212231565573', '2020061212231565573', 1591935995, 'shouyinbao', 1, 'http://www.dongdongmeiche.cn/ceshi'),
(174, 'abc', '2020061311104964461', 1, 'wechat', -2, 1592017849, '2020-06-13 11:10:49', '', '', '', 1, '', 'mobile', '2020061311104964461', '2020061311104964461', 0, 'shouyinbao', 1, ''),
(175, 'abc', '2020061311111965367', 1, 'wechat', -2, 1592017879, '2020-06-13 11:11:19', '', '', '', 1, '', 'mobile', '2020061311111965367', '2020061311111965367', 0, 'shouyinbao', 1, ''),
(176, 'abc', '2020061311113261637', 1, 'wechat', -2, 1592017892, '2020-06-13 11:11:32', '', '', '', 1, '', 'mobile', '2020061311113261637', '2020061311113261637', 0, 'shouyinbao', 1, ''),
(177, 'abc', '2020061311115230052', 1, 'wechat', -2, 1592017912, '2020-06-13 11:11:52', '', '', '', 1, '', 'mobile', '2020061311115230052', '2020061311115230052', 0, 'shouyinbao', 1, ''),
(178, 'abc', '2020061311131666984', 1, 'wechat', -2, 1592017996, '2020-06-13 11:13:16', '', '', '', 1, '', 'mobile', '2020061311131666984', '2020061311131666984', 0, 'shouyinbao', 1, ''),
(179, 'abc', '2020061311133679401', 1, 'wechat', -2, 1592018016, '2020-06-13 11:13:36', '', '', '', 8, '', 'mobile', '2020061311133679401', '2020061311133679401', 0, 'shouyinbao', 1, ''),
(180, 'abc', '2020062022081548188', 1, 'wechat', 1, 1592662096, '2020-06-20 22:08:16', '', '', '', 7, '', 'mobile', '2020062022081548188', '2020062022081548188', 0, 'shouyinbao', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `key` varchar(255) NOT NULL,
  `val` text NOT NULL,
  `mark` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `cash`
--
ALTER TABLE `cash`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `client_mession`
--
ALTER TABLE `client_mession`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `merchant`
--
ALTER TABLE `merchant`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `money_account`
--
ALTER TABLE `money_account`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `money_log`
--
ALTER TABLE `money_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `notify_data`
--
ALTER TABLE `notify_data`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `notify_send`
--
ALTER TABLE `notify_send`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payway`
--
ALTER TABLE `payway`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payway_date_log`
--
ALTER TABLE `payway_date_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pay_order`
--
ALTER TABLE `pay_order`
  ADD PRIMARY KEY (`id`,`order_id`) USING BTREE;

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`key`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cash`
--
ALTER TABLE `cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client_mession`
--
ALTER TABLE `client_mession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2267;
--
-- AUTO_INCREMENT for table `merchant`
--
ALTER TABLE `merchant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `money_account`
--
ALTER TABLE `money_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `money_log`
--
ALTER TABLE `money_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notify_data`
--
ALTER TABLE `notify_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notify_send`
--
ALTER TABLE `notify_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payway`
--
ALTER TABLE `payway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `payway_date_log`
--
ALTER TABLE `payway_date_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pay_order`
--
ALTER TABLE `pay_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=181;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
