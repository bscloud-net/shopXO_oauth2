<?php
namespace app\plugins\bs_oauth2;

// 自定义OAuth2登录插件 - 事件回调文件
class Event
{
    // 上传事件
    public function Upload($params = [])
    {
        // 处理上传相关逻辑
    }
    
    // 安装事件
    public function Install($params = [])
    {
        // 处理安装相关逻辑
        // 例如创建表结构、初始化配置等
    }
    
    // 卸载事件
    public function Uninstall($params = [])
    {
        // 处理卸载相关逻辑
        // 例如清理数据、删除表等
    }
    
    // 下载事件
    public function Download($params = [])
    {
        // 处理下载相关逻辑
    }
    
    // 删除事件
    public function Delete($params = [])
    {
        // 处理删除相关逻辑
    }
    
    // 更新事件
    public function Upgrade($params = [])
    {
        // 处理更新相关逻辑
    }
    
    // 安装前事件（验证返回状态）
    public function BeginInstall($params = [])
    {
        // 安装前的验证逻辑
        return true;
    }
    
    // 更新前事件（验证返回状态）
    public function BeginUpgrade($params = [])
    {
        // 更新前的验证逻辑
        return true;
    }
}