# Use Ant Design Pro

## 基本步骤

### 安装

```
git clone --depth=1 https://github.com/ant-design/ant-design-pro.git my-project &&
cd my-project &&
npm install
```

### Layout

layout 在 router.config.js 中引用，是 component 的值，代表 router 页面的布局方式。可以通过修改文件中 component 的值来修改页面的布局方式。

Ant Design Pro 默认提供了三种视图：BasicLayout、UserLayout、BlanckLayout，它们在文件夹 `src/layouts` 中。我们可以在文件夹中自行添加和修改 layout 文件。

* BasicLayout - 布局：顶部导航 + 左边栏菜单 + 内容区 + 页面底部
* UserLayout - 登录注册页面：选择lang + 内容区域 + 底部
* BlanckLayout - 空白

### Login

#### 用户权限

Ant Design Pro 会在返回页面前调用 `getAuthority` 函数做权限校验，权限校验写在 `src/utils/authority.js` 中。pro 使用 localstorage 存储，并从 中获取权限信息。实际项目中权限信息来自后台。

#### 权限校验

常用的权限校验方式为 token，点击登录后页面向后台发送账号密码，后台生成并放回 token，前台拿到 token 后进行存储，之后每次请求后台 api 都在 header 中的 Cookie 或者 Authorization 字段中带上 token 信息供后台做数据访问权限校验。token 在后台通常会设置过期时间。

### 多语言支持

Pro 利用了 React context 通过在组件外面包一层 Provider 传入语言包数据。在组件里面引用 `umi-plugin-react/locale` 的 FormattedMessage 组件或 formatMessage 函数可以来应用语言。这俩方法和组件接收一个 id 用以在语言包中定位数据。id 格式如  `menu.account.center`，这个 id 字符串也是语言包 js 中 export 出的对象中的 key 名。

总之，Pro 使用 umi-plugin-locale 的 IntlProvider 来提供语言包数据给下面的组件，下面的组件利用 `umi-plugin-react/locale` 的 FormattedMessage 组件或 formatMessage 函数定位语言数据。原理应该是，FormattedMessage 会读取 provider 提供的 context 里面的语言包来应用语言。

### WebSocket

WebSocket 是服务器向客户端推送数据的一种方式。有些常用情况需要用到 WebSocket，例如：

* 页面聊天功能。用户 A 和 B 需要通信。A 发消息后消息传到服务器，服务器将消息推送给 B，B 也如此推给 A。
* 后台操作需要时间，并且操作结束后需要将结果返回客户端。

