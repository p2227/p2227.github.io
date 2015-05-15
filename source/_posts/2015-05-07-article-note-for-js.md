---
layout: page
title: article note for js
date: 2015-01-22 13:14:15
footer: true
---

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

惰性载入函数，对于有分支判断的情况，在判断完分支后直接把结果函数赋值出去 P600

函数绑定

原生有`Function.prototype.bind`，也可以这样实现

```javascript
Function.prototype.mybind = function(content){ 
    var that = this;
    return function(){ 
        return that.apply(content,arguments) 
    } 
}

var obj1 = { prop:1};

var obj2 = { prop:2,fn:function(){ return this.prop} };

console.log(obj2.fn.mybind(obj1)()); //1
```

定时器的高级使用
JS单线程，故定时器的时间只能保证任务加到列队，重复的setTimeout能保证上一个任务执行完毕后再把下一次任务加到列队
把大的任务分割（chunk）开来，浏览器容易及时响应用户

自定义事件
用原生方法实现

联想，《基于MVC》，用jQuery实现：

```javascript
    (function(){
        var o = $({});
        $.subscribe = function(){
            o.bind.apply(o,arguments);
        };

        $.unsubscribe = function(){
            o.unbind.apply(o,arguments);
        };

        $.publish = function() {
            o.trigger.apply(o, arguments);
        };
    })(jQuery)
```
[拖放](http://gh.p2227.com/m/drag/)

---
### 第23章 离线应用
* navigator.onLine,  window的online事件，用LG旧手机测试有效
* appcache 说是要配置mime type，但没配置也生效，也许tomcat默认是这样的
* appcache verson 信息放在注释里即可   # VERSION 1.32
* appcache 的版本更新后，要到下一次刷新页面才生效

```javascript
	window.addEventListener("load",function(){
		if (window.applicationCache) {
			window.applicationCache.addEventListener('updateready', function(e) {
				if (window.applicationCache.status == window.applicationCache.UPDATEREADY) {
					window.applicationCache.swapCache();
					console.log("有新版本可更新，正在更新缓存:"+ new Date)
					window.location.reload();
				} else {
					// Manifest didn't changed. Nothing new to server.
				}
			}, false);
		};
	},false);
```

---
### 第24章 最佳实践
少对dom交互，经常读取的dom一定要用变量储存起来
JSLint的验证过程可以放在自动化构建中，ant可以，grunt,gulp也应该可以

---
### 第25章 新兴的API
requestAnimationFrame 针对动画，不知道css3新兴的动画animation与之孰优孰劣

Page Visibility ，浏览器窗口是否隐藏

Geolocation 地理定位

`File API`:基本读取，读取部分，拖放的文件`event.dataTransfer.files`

blob url：指向该文件对象的路径

xhr上传文件：xhr.send(data)中的data来源于new FormData()   则可以用data.append方法去增加file对象

web计时：页面重定向次数
web workers ：js多线程