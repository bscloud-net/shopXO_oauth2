-- 自定义OAuth2登录插件 - 卸载SQL语句

-- 删除OAuth2配置表
DROP TABLE IF EXISTS `{PREFIX}plugins_bs_oauth2_config`;

-- 删除用户OAuth授权记录表
DROP TABLE IF EXISTS `{PREFIX}plugins_bs_oauth2_user`;