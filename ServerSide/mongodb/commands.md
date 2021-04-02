# 命令行操作

### 安装与启动

#### Mac

* 安装：`brew install mongodb`
* 启动：`brew services start mongodb`
* 停止：`brew services stop mongodb`
* 进入：`mongo`
* 显示服务列表：`brew services list`

### 常用操作

mongo进入后

#### 数据库操作
* 查看所有数据库： `show dbs`
* 切换数据库，若不存在则创建（若库内无collection show dbs无显示）： `use db_name`
* 显示当前数据库：`db`
* 删除当前数据库：`db.dropDatabase()`

#### 集合操作
* 查看collection: `show tables / show collections`
* 创建collection: `db.createCollection(name, options)`
* 删除collection: `db.collection.drop()`
* options属性：

| 字段	 | 类型 | 描述 |
| ------ | ------ | ------ |
| capped | 布尔	| （可选）如果为 true，则创建固定集合。固定集合是指有着固定大小的集合，当达到最大值时，它会自动覆盖最早的文档。当该值为 true 时，必须指定 size 参数。 |
| autoIndexId | 布尔 |（可选）如为 true，自动在 _id 字段创建索引。默认为 false。 |
| size |	数值 |	（可选）为固定集合指定一个最大值（以字节计）。如果 capped 为 true，也需要指定该字段。 |
| max |	数值 |（可选）指定固定集合中包含文档的最大数量。|

#### 文档操作
**增**
* 插入文档（无collection则创建）：`db.collection.insert(<document> || <documents>)`
* 插入一条文档： `db.collection.insertOne()`
* 插入多条文档： `db.collection.insertMany(arrType)`
* 定义变量：<br>
	```
document=({title: 'MongoDB 教程',
	description: 'MongoDB 是一个 Nosql 数据库',
	by: 'test',
	url: 'http://www.runoob.com',
	tags: ['mongodb', 'database', 'NoSQL'],
	likes: 100
});
db.[db_name].insert(document)
	```

**删**
* 删除文档：
	```
db.collection.remove(
	 <query>,
	 {
	   justOne: <boolean>,
	   writeConcern: <document>
	 }
)
query :（可选）删除的文档的条件。
justOne : （可选）如果设为 true 或 1，则只删除一个文档，如果不设置该参数，或使用默认值 false，则删除所有匹配条件的文档。
writeConcern :（可选）抛出异常的级别。
示例：
	db.col.remove({'title':'MongoDB 教程'})
	db.col.remove({}) // 清空数据
	```

**改**
* 更新文档：<br>
	```
db.collection.update(
	 <query>,
	 <update>,
	 {
	   upsert: <boolean>,
	   multi: <boolean>,
	   writeConcern: <document>
	 }
)
query : update的查询条件，类似sql update查询内where后面的。
update : update的对象和一些更新的操作符（如$,$inc...）等，也可以理解为sql update查询内set后面的
upsert : 可选，这个参数的意思是，如果不存在update的记录，是否插入objNew,true为插入，默认是false，不插入。
multi : 可选，mongodb 默认是false,只更新找到的第一条记录，如果这个参数为true,就把按条件查出来多条记录全部更新。
writeConcern :可选，抛出异常的级别。
	WriteConcern.NONE:没有异常抛出
	WriteConcern.NORMAL:仅抛出网络错误异常，没有服务器错误异常
	WriteConcern.SAFE:抛出网络错误异常、服务器错误异常；并等待服务器完成写操作。
	WriteConcern.MAJORITY: 抛出网络错误异常、服务器错误异常；并等待一个主服务器完成写操作。
	WriteConcern.FSYNC_SAFE: 抛出网络错误异常、服务器错误异常；写操作等待服务器将数据刷新到磁盘。
	WriteConcern.JOURNAL_SAFE:抛出网络错误异常、服务器错误异常；写操作等待服务器提交到磁盘的日志文件。
	WriteConcern.REPLICAS_SAFE:抛出网络错误异常、服务器错误异常；等待至少2台服务器完成写操作。
示例：
	db.col.update({'title':'MongoDB 教程'},{$set:{'title':'MongoDB'}},{multi:true})
	db.col.update({'title':'MongoDB 教程'},{$unset:{'title':'MongoDB'}},{multi:true})
	```
* 覆盖文档：`db.collection.save(
   <document>,
   {
     writeConcern: <document>
   }
)` 如果document未指定_id，作用与insert相同，指定_id后会覆盖重复_id的对象(使用insert会报错)。
* 更新单个文档： `db.collection.updateOne() `
* 更新多个文档：`db.collection.updateMany() `

**查**
* 查询文档：
	```
db.collection.find(query, projection)[.pretty()]
query ：可选，使用查询操作符指定查询条件
projection ：可选，使用投影操作符指定返回的键。查询时返回文档中所有键值， 只需省略该参数即可（默认省略）。
	若不指定 projection，则默认返回所有键，指定 projection 格式如下，有两种模式
	db.collection.find(query, {title: 1, by: 1}) // inclusion模式 指定返回的键，不返回其他键
	db.collection.find(query, {title: 0, by: 0}) // exclusion模式 指定不返回的键,返回其他键
	_id 键默认返回，需要主动指定 _id:0 才会隐藏
	两种模式不可混用（因为这样的话无法推断其他键是否应返回）
	db.collection.find(query, {title: 1, by: 0}) // 错误
	只能全1或全0，除了在inclusion模式时可以指定_id为0
	db.collection.find(query, {_id:0, title: 1, by: 1}) // 正确
示例：
	db.col.find({key1:value1, key2:value2}).pretty() // AND
	db.col.find({"by":"test", "title":"MongoDB 教程"}).pretty()
	db.col.find( // OR
	   {
	      $or: [
	         {key1: value1}, {key2:value2}
	      ]
	   }
	).pretty()
	db.col.find({$or:[{"by":"test"},{"title": "MongoDB 教程"}]}).pretty()
	db.col.find({"likes": {$gt:50}, $or: [{"by": "test"},{"title": "MongoDB 教程"}]}).pretty()
	```
* 查询单个文档：`db.collection.findOne(query)`

| 操作 | 	格式 | 范例 | RDBMS中的类似语句 |
| ------ | ------ | ------ | ------ |
| 等于	| `{<key>:<value>}`	| `db.col.find({"by":"test"}).pretty()`	| where by = 'test' |
| 小于	| `{<key>:{$lt:<value>}}`	| `db.col.find({"likes":{$lt:50}}).pretty()`	| where likes < 50 |
| 小于或等于	| `{<key>:{$lte:<value>}}`	| `db.col.find({"likes":{$lte:50}}).pretty()	`| where likes <= 50 |
| 大于	| `{<key>:{$gt:<value>}}`	| `db.col.find({"likes":{$gt:50}}).pretty()`	| where likes > 50 |
| 大于或等于	| `{<key>:{$gte:<value>}}`	| `db.col.find({"likes":{$gte:50}}).pretty()`	| where likes >= 50 |
| 不等于	| `{<key>:{$ne:<value>}}`	| `db.col.find({"likes":{$ne:50}}).pretty()`	| where likes != 50 |

### 操作符

* (>) 大于 - $gt
* (<) 小于 - $lt
* (>=) 大于等于 - $gte
* (<= ) 小于等于 - $lte
* 数据类型 - $type

**示例：**

```
db.col.find({likes : {$gt : 100}})
db.col.find({likes : {$lt : 100}})
db.col.find({likes : {$gte : 100}})
db.col.find({likes : {$lte : 100}})
db.col.find({likes : {$lt :200, $gt : 100}})
db.col.find({"title" : {$type : 2}}) OR db.col.find({"title" : {$type : 'string'}})
```

### 方法

* 限定读取条数(默认全部)：limit(NUMBER)
* 跳过NUMBER数量的数据(默认参数0)：skip(NUMBER)
* 数据排序：`sort({ KEY: 1 OR -1 })` // 按KEY字段排序，1升序，-1降序
* [创建索引](https://docs.mongodb.com/manual/indexes/)：`db.collection.createIndex(keys, options)`
	* 不会创建重复索引
	* 默认给_id创建索引，可确保_id唯一性
	* ![示意图](https://docs.mongodb.com/manual/_images/index-for-sort.bakedsvg.svg)
	* ![单索引](https://docs.mongodb.com/manual/_images/index-ascending.bakedsvg.svg)
	* ![复合索引](https://docs.mongodb.com/manual/_images/index-compound-key.bakedsvg.svg)
	* ![多键值索引](https://docs.mongodb.com/manual/_images/index-multikey.bakedsvg.svg)
	* ...
* 聚合：`db.collection.aggregate(AGGREGATE_OPERATION)`
	* 常用操作
		* $project：修改输入文档的结构。可以用来重命名、增加或删除域，也可以用于创建计算结果以及嵌套文档。
		* $match：用于过滤数据，只输出符合条件的文档。$match使用MongoDB的标准查询操作。
		* $limit：用来限制MongoDB聚合管道返回的文档数。
		* $skip：在聚合管道中跳过指定数量的文档，并返回余下的文档。
		* $unwind：将文档中的某一个数组类型字段拆分成多条，每条包含数组中的一个值。
		* $group：将集合中的文档分组，可用于统计结果。
		* $sort：将输入文档排序后输出。
		* $geoNear：输出接近某一地理位置的有序文档。
	* 聚合表达式

| 表达式	| 描述	| 实例 |
| ------ | ------ | ------ |
| $sum	| 计算总和。	| db.col.aggregate([{$group : {_id : "$by_user", num_tutorial : {$sum : "$likes"}}}]) |
| $avg	| 计算平均值	| db.col.aggregate([{$group : {_id : "$by_user", num_tutorial : {$avg : "$likes"}}}]) |
| $min	| 获取集合中所有文档对应值得最小值。	| db.col.aggregate([{$group : {_id : "$by_user", num_tutorial : {$min : "$likes"}}}]) |
| $max	| 获取集合中所有文档对应值得最大值。	| db.col.aggregate([{$group : {_id : "$by_user", num_tutorial : {$max : "$likes"}}}]) |
| $push	| 在结果文档中插入值到一个数组中。	| db.col.aggregate([{$group : {_id : "$by_user", url : {$push: "$url"}}}]) |
| $addToSet	| 在结果文档中插入值到一个数组中，但不创建副本。	| db.col.aggregate([{$group : {_id : "$by_user", url : {$addToSet : "$url"}}}]) |
| $first	| 根据资源文档的排序获取第一个文档数据。	| db.col.aggregate([{$group : {_id : "$by_user", first_url : {$first : "$url"}}}]) |
| $last	| 根据资源文档的排序获取最后一个文档数据	| db.col.aggregate([{$group : {_id : "$by_user", last_url : {$last : "$url"}}}]) |

