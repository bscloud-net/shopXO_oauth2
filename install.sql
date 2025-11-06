-- 自定义OAuth2登录插件 - 安装SQL语句

-- 创建用户OAuth授权记录表
CREATE TABLE IF NOT EXISTS `{PREFIX}plugins_bs_oauth2_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0未绑定, 1已绑定, 2已解绑）',
  `platform` char(30) NOT NULL DEFAULT 'oauth2' COMMENT '平台类型',
  `openid` char(60) NOT NULL DEFAULT '' COMMENT 'openid',
  `unionid` char(60) NOT NULL DEFAULT '' COMMENT 'unionid',
  `nickname` char(60) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` char(255) NOT NULL DEFAULT '' COMMENT '用户头像地址',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别（0保密，1女，2男）',
  `oauth_info` text COMMENT 'OAuth详细信息',
  `plugins_name` varchar(50) NOT NULL DEFAULT 'bs_oauth2' COMMENT '插件名称',

  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `platform` (`platform`),
  KEY `openid` (`openid`),
  KEY `unionid` (`unionid`),

  UNIQUE KEY `uk_plugins_openid` (`plugins_name`,`openid`)
) ENGINE=InnoDB DEFAULT CHARSET={CHARSET} ROW_FORMAT=DYNAMIC COMMENT='关联用户 - OAuth2登录';

-- 创建OAuth2配置表
CREATE TABLE IF NOT EXISTS `{PREFIX}plugins_bs_oauth2_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `app_id` varchar(255) NOT NULL DEFAULT '' COMMENT '应用ID',
  `app_secret` varchar(255) NOT NULL DEFAULT '' COMMENT '应用密钥',
  `authorize_url` varchar(255) NOT NULL DEFAULT '' COMMENT '授权URL',
  `token_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'Token URL',
  `user_info_url` varchar(255) NOT NULL DEFAULT '' COMMENT '用户信息URL',
  `scope` varchar(255) NOT NULL DEFAULT 'openid profile email' COMMENT '权限范围',
  `user_id_field` varchar(50) NOT NULL DEFAULT 'id' COMMENT '用户ID字段',
  `username_field` varchar(50) NOT NULL DEFAULT 'username' COMMENT '用户名字段',
  `email_field` varchar(50) NOT NULL DEFAULT 'email' COMMENT '邮箱字段',
  `user_map` text COMMENT '用户映射配置',
  `button_text` varchar(50) DEFAULT NULL COMMENT '按钮文字',
  `button_icon` varchar(50) DEFAULT NULL COMMENT '按钮图标',
  `login_redirect` tinyint(4) DEFAULT '1' COMMENT '登录后跳转',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '启用状态：0=禁用，1=启用',
  `remark` text COMMENT '备注信息',
  `description` varchar(255) DEFAULT NULL COMMENT '描述信息',

  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET={CHARSET} ROW_FORMAT=DYNAMIC COMMENT='OAuth2配置表';

-- 初始化默认配置
INSERT INTO `{PREFIX}plugins_bs_oauth2_config` (`app_id`, `app_secret`, `authorize_url`, `token_url`, `user_info_url`, `scope`, `user_id_field`, `username_field`, `email_field`, `user_map`, `status`, `description`) VALUES
('', '', '', '', '', 'openid profile email', 'id', 'username', 'email', '{"id":"id", "nickname":"nickname", "avatar":"avatar", "email":"email"}', 0, '自定义OAuth2登录插件配置');