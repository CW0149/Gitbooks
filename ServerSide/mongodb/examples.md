# 示例

增

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

删

```
db.col.remove({'title':'MongoDB 教程'})
db.col.remove({}) // 清空数据
```

改

```
db.col.updateMany( { "age":{ $gt: "10" } }, { $set:{ "status":"xyz" } } )
db.col.update({'title':'MongoDB 教程'},{$set:{'title':'MongoDB'}},{multi:true})
db.col.update({'title':'MongoDB 教程'},{$unset:{'title':'MongoDB'}},{multi:true})
```

查

```
db.col.find({"by":"test", "title":"MongoDB 教程"}).pretty()
db.col.find({$or:[{"by":"test"},{"title": "MongoDB 教程"}]}).pretty()
db.col.find({"likes": {$gt:50}, $or: [{"by": "test"},{"title": "MongoDB 教程"}]}).pretty()
db.col.find({"by":"test"}).pretty()
db.col.find({likes : {$gt : 100}})
db.col.find({likes : {$gte : 100}})
db.col.find({likes : {$lt : 150}})
db.col.find({likes : {$lte : 150}})
db.col.find({likes : {$lt :200, $gt : 100}})
db.col.find({},{"title":1,_id:0}).sort({"likes":-1})
```

索引

```
db.col.createIndex({"title":1})
db.col.createIndex({"title":1,"description":-1})
db.col.createIndex({open: 1, close: 1}, {background: true})
db.col.getIndexes()
db.col.totalIndexSize()
db.col.dropIndexes([index_name])
```

聚合

```
db.col.aggregate([{$group : {_id : "$by_user", num_tutorial : {$sum : 1}}}])
db.col.aggregate({ $project : { _id : 0 ,  title : 1 , author : 1 } })
db.cols.aggregate([
	{ $match : { score : { $gt : 70, $lte : 90 } } },
	{ $group: { _id: null, count: { $sum: 1 } } }
])
db.col.aggregate({ $skip : 5 })
```
