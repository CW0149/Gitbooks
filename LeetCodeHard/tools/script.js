// 从leetcode获取题目数据
var tableDom = document.querySelector('.reactable-data')
var trs = tableDom.getElementsByTagName('tr'), links = [], eles = [], tdLink, link, eName;
for (let tr of trs) {
	tdLink = tr.getElementsByTagName('td')[2]
	link = tdLink.querySelector('a')
	eName = tdLink.querySelector('span').dataset.originalTitle.split(' ').join('').replace(/\W/g, '')
	links.push({ link, eName })
	let ele = tr.innerText.split(/[\t]/).filter(item => item).map(item => item.trim())
	eles.push({ num: ele[0], name: ele[1], passRate: ele[2], difficulty: ele[3], href: link.href, eName })
}

function getCurrent(links, start = 1, times) {
	return {
		 links: links.slice(start - 1, start - 1 + times || undefined),
		 start
	}
}
function getSummaryRef(links) {
	return links.map(({link, eName}, index) => {
		return `	* [${link.innerText}](QA/${eName}.md#${link.href})`
	}).join('\n')
}
function getSummary(links) {
	return links.map(({link, eName}, index) => {
		return `	* [${link.innerText}](QA/${eName}.md)`
	}).join('\n')
}
function getAll(eles) {
	return eles.map((ele, index) => [ele.num, `[${ele.name}](${ele.href} "${ele.eName}")`, `[${ele.eName}](QA/${ele.eName}.md)`, ele.passRate].join('\t|\t')).join('\n')
}

var current = getCurrent(links, 1)

var summaryRef = getSummaryRef(current.links, current.start)
var summary = getSummary(current.links, current.start)
// var data = current.links.map(({link}) => `# [${link.innerText}](${link.href})`).join('\n')
// var dataArr = current.links.map(({link}) => `# [${link.innerText}](${link.href})`)
var all = getAll(eles) // 题目列表

console.log(summary)
