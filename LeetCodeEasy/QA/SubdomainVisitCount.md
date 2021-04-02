# [子域名访问计数](https://leetcode-cn.com/problems/subdomain-visit-count)

### 问题

接下来会给出一组访问次数和域名组合的列表cpdomains 。要求解析出所有域名的访问次数，输出格式和输入格式相同，不限定先后顺序。

示例 1:
```
输入:
["9001 discuss.leetcode.com"]
输出:
["9001 discuss.leetcode.com", "9001 leetcode.com", "9001 com"]
说明:
例子中仅包含一个网站域名："discuss.leetcode.com"。按照前文假设，子域名"leetcode.com"和"com"都会被访问，所以它们都被访问了9001次。
```
示例 2
```
输入:
["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
输出:
["901 mail.com","50 yahoo.com","900 google.mail.com","5 wiki.org","5 org","1 intel.mail.com","951 com"]
说明:
按照假设，会访问"google.mail.com" 900次，"yahoo.com" 50次，"intel.mail.com" 1次，"wiki.org" 5次。
而对于父域名，会访问"mail.com" 900+1 = 901次，"com" 900 + 50 + 1 = 951次，和 "org" 5 次。
```
注意事项：

* cpdomains 的长度小于 100。
* 每个域名的长度小于100。
* 每个域名地址包含一个或两个"."符号。
* 输入中任意一个域名的访问次数都小于10000。

### 解答

```
/**
 * @param {string[]} cpdomains
 * @return {string[]}
 */
// 直接遍历
var subdomainVisits = function(cpdomains) {
    const mp = {}
    for (let cpd of cpdomains) {
        const a1 = cpd.split(' '), a2 = a1[1].split('.')
        let s = ''
        for (let i = a2.length - 1; i >= 0; i -= 1) {
            s = s ? `${a2[i]}.${s}` : a2[i]
            mp[s] = (mp[s] || 0) + Number(a1[0])
        }
    }

    const res = []
    Object.keys(mp).forEach(name => {
        res.push(`${mp[name]} ${name}`)
    })
    return res
};
```
