---
layout: page
title: the-first-post
date: 2015-01-02 00:00:00
footer: true
---

* this is my first post
* i had test it
* it works
* 中文测试aa
<!--more-->
## 读书笔记 《JS高级程序设计》

### 第15章 使用canvas绘图

由于之前接触较少，快速阅读。主要要理解canvas能达到的效果

基本上一些css的常见效果都能达到，由于本人徧程序逻辑，知道有这些效果即可

可以使用其他图像数据，<img>元素或者另外一个canvas元素

WebGL是canvas的3D上下文，规范还比较新

* 设想练习：用svg,canvas,dom各实现一个时钟效果
------------------

* 第16章 HTML5脚本编程

几个HTML5新增的脚本特性

**历史状态管理**接触得比较多

* 第17章 错误管理 

目前较流行开发人员工具，此章弱化

* 第18章，Js与XML；第19章，E4X

主都是讲述在JS环境下操作XML，先过一遍，等项目有需要的时候重补

------------------

### 第20章 JSON
20.2.2 序列化选项，P566

`JSON.stringify(object,filter/replacer,padding)`
* filter/replacer可以是一个数组，只过滤出object中相应的key集合
* filter/replacer也可以是一个函数，有两个参数key,value，决定怎么序列化
* padding是 缩进字符，可以是空白，制表符或其他符号，不超过10字符

`object.toJSON()` 定义特定对象序列化的方法

`JSON.parse(string,reviver)`
* reviver 是一个函数，有两个参数key,value，决定怎么还原JSON字符串，如果返回undefined，则会删除特定键值 

------------------------
### 第21章 ajax与Comet

`xhr.send(请求主体的数据，get请求可以写null，post则写相应的请求主体数据);`

`xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");`

XMLHttpRequest 2级 定义了进度事件，其中progress事件有百分比API

跨域技术：图像Ping,JSONP(最经典),Comet,Web Scokets等，目前接触得比较少，但鉴于面试很经常遇到，*需要整理*

---
### 第22章 高级技巧

`var isNativeJSON = window.JSON && Object.prototype.toString.call(JSON) === "[object JSON]";`

作用域安全函数，要注意用原型链继承

```javascript
	function Person(name,age,job){
	if (this instanceof Person){
		this.name = name;
		this.age = age;
		this.job = job;
		} else {
			return new Person(name,age,job)
		}
	}
```

```