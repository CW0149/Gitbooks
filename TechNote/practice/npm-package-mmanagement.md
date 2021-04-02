# npm 依赖管理

## 升级依赖

有时候我们项目依赖的一个软件包 A 依赖另一个急需更新或者不维护的依赖 B（`yarn install` 时有 warning ），如果你想更新 B 需要怎么做呢？`

**问题**

yarn add antd` 时抛出以下 warning. 这时你想将 core-js < 3 升级到 core-js@3.

```
 antd > rc-editor-mention > draft-js > fbjs > core-js@1.2.7: core-js@<2.6.8 is no longer maintained. Please, upgrade to core-js@3 or at least to actual version of core-js@2.
```

`yarn.lock` 中：

```
core-js@^1.0.0:
  version "1.2.7"
  resolved "https://registry.npmjs.org/core-js/-/core-js-1.2.7.tgz#652294c14651db28fa93bd2d5ff2983a4f08c636"
  integrity sha1-ZSKUwUZR2yj6k70tX/KYOk8IxjY=

core-js@^2.4.0:
  version "2.6.9"
  resolved "https://registry.npmjs.org/core-js/-/core-js-2.6.9.tgz#6b4b214620c834152e179323727fc19741b084f2"
  integrity sha512-HOpZf6eXmnl7la+cUdMnLvUxKNqLUzJvgIziQ0DiF3JwSImNphIqdGqzj6hIKyX04MmV0poclQ7+wjWvxQyR2A==
```

**解答**

`yarn` 支持 resolutions 功能，通过在 `package.json` 中将 core-js@3 加入 resolutions 字段，再`yarn install`. 可安装 core-js@3, 并使得 dependencies 中依赖 core-js < 3 的依赖都指向 core-js@3

```
"resolutions": {
  "core-js": "3.2.1"
}
```

**结果**

yarn.lock 中：

```
core-js@3.2.1, core-js@^1.0.0, core-js@^2.4.0:
  version "3.2.1"
  resolved "https://registry.npmjs.org/core-js/-/core-js-3.2.1.tgz#cd41f38534da6cc59f7db050fe67307de9868b09"
  integrity sha512-Qa5XSVefSVPRxy2XfUC13WbvqkxhkwB3ve+pgCQveNgYzbM/UxZeu1dcOX/xr4UmfUd+muuvsaxilQzCyUurMw==
```

控制台：

```
warning Resolution field "core-js@3.2.1" is incompatible with requested version "core-js@^2.4.0"
warning Resolution field "core-js@3.2.1" is incompatible with requested version "core-js@^1.0.0"
```

### 资料

* [选择性依赖项解决](https://yarnpkg.com/lang/zh-hans/docs/selective-version-resolutions/)
* [npm equivalent of yarn resolutions?](https://stackoverflow.com/questions/52416312/npm-equivalent-of-yarn-resolutions)