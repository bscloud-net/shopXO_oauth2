<?php
namespace app\plugins\bs_oauth2;

// 自定义OAuth2登录插件 - 钩子入口
class Hook
{
    // 应用响应入口
    public function handle($params = [])
    {
        // 钩子名称
        if(!empty($params['hook_name']))
        {
            // 判断当前是否为后台请求（通过URL参数s判断）
            $isAdmin = (isset($_GET['s']) && strpos($_GET['s'], 'admin/') === 0);
            
            // 走钩子
            $ret = '';
            switch($params['hook_name'])
            {
                case 'plugins_css' :
                    if($isAdmin) {
                        // 后台CSS
                        $ret = 'static/plugins/bs_oauth2/css/admin/common.css';
                    } else {
                        // 前端CSS
                        $ret = 'static/plugins/bs_oauth2/css/index/common.css';
                    }
                    break;
                case 'plugins_js' :
                    if($isAdmin) {
                        // 后台JS
                        $ret = 'static/plugins/bs_oauth2/js/admin/common.js';
                    } else {
                        // 前端JS
                        $ret = 'static/plugins/bs_oauth2/js/index/common.js';
                    }
                    break;
                case 'plugins_common_page_bottom' :
                    // 可以在这里添加一些全局的JS代码
                    break;
            }
            return $ret;
        }
    }
}