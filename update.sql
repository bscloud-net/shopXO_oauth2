-- 自定义OAuth2登录插件 - 更新SQL语句

-- 更新OAuth2配置表，添加缺失的字段
ALTER TABLE `{PREFIX}plugins_bs_oauth2_config`
ADD COLUMN IF NOT EXISTS `username_field` varchar(50) NOT NULL DEFAULT 'username' COMMENT '用户名字段',
ADD COLUMN IF NOT EXISTS `user_map` text COMMENT '用户映射配置',
ADD COLUMN IF NOT EXISTS `button_text` varchar(50) DEFAULT NULL COMMENT '按钮文字',
ADD COLUMN IF NOT EXISTS `button_icon` varchar(50) DEFAULT NULL COMMENT '按钮图标',
ADD COLUMN IF NOT EXISTS `login_redirect` tinyint(4) DEFAULT '1' COMMENT '登录后跳转',
ADD COLUMN IF NOT EXISTS `description` varchar(255) DEFAULT NULL COMMENT '描述信息';



-- 如果表中只有一条记录且没有设置user_map，则设置默认值
UPDATE `{PREFIX}plugins_bs_oauth2_config` 
SET `user_map` = '{"id":"id", "nickname":"nickname", "avatar":"avatar", "email":"email"}',
    `description` = '自定义OAuth2登录插件配置',
    `username_field` = 'username'
WHERE `id` = 1 AND (`user_map` IS NULL OR `user_map` = '');