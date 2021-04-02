# 问题库

## 什么是Source Map?

A source map is a file that maps from the transformed source to the original source, enabling the browser to reconstruct the original source and present the reconstructed original in the debugger.

To enable the debugger to work with a source map, you must:
- generate the source map
- include a comment in the transformed file, that points to the source map. The comment's syntax is like this:
```
//# sourceMappingURL=http://example.com/path/to/your/sourcemap.map
```

生产环境下，我们会通过压缩JS、CSS等文件来优化程序，通常压缩后的代码没有换行符。那么如果程序生产环境下出错，比如，打开浏览器，我们看到一个JS报错信息，又如何定位错误所在的程序行呢？source map是它的解决方案。source map不仅限于压缩文件中使用，它是通用的将最终文件代码行映射到源文件代码行的工具文件，例如将CoffeeScript生成的JavaScript文件映射到CoffeeScript源码。

Source map是后缀名通常是.map的JSON文件，包含了最终代码对应源码位置的信息，帮助我们既能优化源码还能顺利debug。也就是说，source maps是可以供浏览器使用的帮助debug的文件。

Chrome和Firefox开发者工具都对source map文件提供了内部支持。在Chrome控制台的setting中可以设置是否支持js/css source map。

通过在最终代码行末添加`//# sourceMappingURL=http://example.com/path/to/your/sourcemap.map`，在浏览器控制台打开的情况下，浏览器看到这行代码就会加载url指向的map文件。

**资料**

* [WTF is a Source Map](https://www.schneems.com/2017/11/14/wtf-is-a-source-map/)
* [Use a source map(MDN)](https://developer.mozilla.org/en-US/docs/Tools/Debugger/How_to/Use_a_source_map)

## 什么是sitemaps？

A sitemap is a file where you **provide information about the pages, videos, and other files on your site, and the relationships between them. Search engines like Google read this file to more intelligently crawl your site.**

A sitemap tells the crawler which files you think are important in your site, and also provides valuable information about these files: for example, for pages, when the page was last updated, how often the page is changed, and any alternate language versions of a page.

You can use a sitemap to provide information about specific types of content on your pages, including video and image content. For example:

- A sitemap video entry can specify the video running time, category, and age appropriateness rating.
- A sitemap image entry can include the image subject matter, type, and license.

**Do I need a sitemap?**

If your site’s pages are properly linked, our web crawlers can usually discover most of your site. Even so, a sitemap can improve the crawling of your site, particularly if your site meets one of the following criteria:

- Your site is really large. As a result, it’s more likely Google web crawlers might overlook crawling some of your new or recently updated pages.
- Your site has a large archive of content pages that are isolated or not well linked to each other. If your site pages do not naturally reference each other, you can list them in a sitemap to ensure that Google does not overlook some of your pages.
- Your site is new and has few external links to it. Googlebot and other web crawlers crawl the web by following links from one page to another. As a result, Google might not discover your pages if no other sites link to them.
- Your site uses rich media content, is shown in Google News, or uses other sitemaps-compatible annotations. Google can take additional information from sitemaps into account for search, where appropriate.

Using a sitemap doesn't guarantee that all the items in your sitemap will be crawled and indexed, as Google processes rely on complex algorithms to schedule crawling. However, in most cases, your site will benefit from having a sitemap, and you'll never be penalized for having one.

**资料**

* [Learn about sitemaps(Google Support)](https://support.google.com/webmasters/answer/156184?hl=en)

## 什么是robots.txt?

A robots.txt file tells search engine crawlers which pages or files the crawler can or can't request from your site. This is used mainly to avoid overloading your site with requests; **it is not a mechanism for keeping a web page out of Google.** To keep a web page out of Google, you should use noindex tags or directives, or password-protect your page.robots.txt is used primarily to **manage crawler traffic to your site**, and occasionally to keep a page off Google, depending on the file type。

**资料**
* [robots.txt示例](https://stackoverflow.com/robots.txt)
* [Learn about robots.txt files(Google Support)](https://support.google.com/webmasters/answer/6062608?hl=en&ref_topic=6061961)

## path.resolve 与 path.join 的区别

path.join returns a normalized path by merging two paths together. It can return an absolute path, but it doesn't necessarily always do so. path.resolve, on the other hand, will resolve to an absolute path.

```
path.join('bar', '../../') // ../
path.resolve('bar', '../../') // /Users
path.resolve('bar', '/foo') // /foo
```

**资料**

* [path.join vs path.resolve with \_\_dirname](https://stackoverflow.com/questions/39110801/path-join-vs-path-resolve-with-dirname)

## `process.cwd()` 与 `__dirname` 的区别

`process.cwd()` returns the current working directory. `__dirname` returns the directory name of the directory containing the JavaScript source code file you run in current working directory.


## style-loader 与 css-loader 的区别

The CSS loader takes a CSS file and returns the CSS with imports and url(...) resolved via webpack's require functionality.

style-loader takes those styles and creates a `<style>` tag in the page's `<head>` element containing those styles.

**资料**

* [Webpack style-loader vs css-loader](https://stackoverflow.com/questions/34039826/webpack-style-loader-vs-css-loader)

## [Webpack: Does the order of plugins matter?](https://stackoverflow.com/questions/41470771/webpack-does-the-order-of-plugins-matter)


## [webpack中的hash、chunkhash、contenthash区别](https://juejin.im/post/5a4502be6fb9a0450d1162ed)

## [What is the difference between save and save-dev](https://medium.com/@dylanavery720/npmmmm-1-dev-dependencies-dependencies-8931c2583b0c)

## dom.append() 与 dom.appendChild() 的区别

* ParentNode.append() allows you to also append DOMString objects, whereas Node.appendChild() only accepts Node objects.
* ParentNode.append() has no return value, whereas Node.appendChild() returns the appended Node object.
* ParentNode.append() can append several nodes and strings, whereas Node.appendChild() can only append one node.

**资料**

* [ParentNode.append](https://developer.mozilla.org/en-US/docs/Web/API/ParentNode/append)

## Node.js 如何支持 es6 module

* [ECMAScript Modules](https://nodejs.org/api/esm.html#esm_ecmascript_modules)
* [Node.js JS最新标准支持情况](https://node.green/#ESNEXT-strawman--stage-0--syntactic-tail-calls)
* [how-can-i-use-an-es6-import-in-node](https://stackoverflow.com/questions/45854169/how-can-i-use-an-es6-import-in-node)

## instanceof、obj.isPrototypeOf()、Object.getPrototypeOf()

a instanceof Foo 回答的问题是，在 a 的整条 [[Prototype]] 链中是否有指向 Foo.prototype 的对象。这种方法只能判断对象与构造函数之间的关系，如果你想判断两个对象(比如 a 和 b)之间是否通过 [[Prototype]] 链关联，只用 instanceof 无法实现。

isPrototypeOf(..) 。Foo.prototype.isPrototypeOf( a ) 回答的问题是，在 a 的整条 [[Prototype]] 链中是否出现过 Foo.prototype。

在 ES5 中可以直接获取一个对象的 [[Prototype]] 链。Object.getPrototypeOf( a ) === Foo.prototype; // true。

## for...in、propertyIsEnumerable()、Object.keys()、Object.getOwnPropertyNames()

for...in 会遍历对象(包括原型链上所有可枚举属性)，所以 for...in 一般用于遍历对象而不是数组。

propertyIsEnumerable(..) 会检查给定的属性名是否直接存在于对象中(而不是在原型链上)并且满足 enumerable:true。

Object.keys(..) 会返回一个数组，包含所有可枚举属性，Object.getOwnPropertyNames(..) 会返回一个数组，包含所有属性，无论它们是否可枚举。它们只获取对象直接属性。


##  `while (child = node.firstChild) { frag.appendChild(child) }`

[如果被插入的节点已经存在于当前文档的文档树中,则那个节点会首先从原先的位置移除,然后再插入到新的位置.](https://developer.mozilla.org/zh-CN/docs/Web/API/Node/appendChild)


