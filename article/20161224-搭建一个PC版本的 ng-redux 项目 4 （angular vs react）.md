# angular vs react 我的几点感受

## 前言
在用react做了好几个手机项目之后，突然转到ng去做，实在是有些不习惯。具体体会如下。

## ng大而全，react只专注于视图
从视图到数据，ng想要做到的是大包揽，把一切功能都包括在里面，甚至于报错信息都 try catch 起来，再抛出自己格式化之后的的错误。这样开者在定位问题的时候会比较疑惑。
而react解决了两个非常大的难题：1.组件化。2.DOM性能。其他的就交给社区去处理了，这引导出一个非常繁荣的生态社区。

## ng中各模块与中心功能重叠，react则是分离的
在ng中，一个模板与ng结合，一定要注册在ng里面，比如ui-router里面的某个模块，代码是这样的
```
angular.module('ui.router.state').provider('$view', $ViewProvider);
```
ng中心与该组件的耦合很紧，并且这个耦合是发生在框架代码里，而不是业务代码中。反观在react中，路由、数据中心、用户界面视图等每一个部分都可以分别发展，只需要根据commonjs的规则结合起来即可。也就是在业务代码中
```
import 'react';
import 'react-xxx';
```
然后再分别处理。这样就不会导致前面`WARNING: Tried to load angular more than once.`那样的问题。

## 概念多，认识复杂
directive,controller,service... ng创造了很多概念，但实际上并不需要区分得这么细。react只定义了组件component，而且对于stateless component，一个函数足已表达。

## 模板语言另外解释，直接用js的规则
ng是在html中自己定义一套语法去解释一些动态规则的，在早期版本问题较大，比如一些三元表达符是不支持。虽然这套语法比较简单也接近js的语法，但还是有所区别。而react创造的jsx语法，虽然也有些问题，但由于本质上这是js，而不是用js去解释的html，所以一些js的高级用法还是支持的。可以直接在里面调用一些js的函数如encodeURIComponent等而不需要把函数加入到scope中。

## 最后的话
当然ng也提出一些前端领域新的想法，比如依赖注入。这个概念我最早是在java的Spring框架中听到，能把其他语言中的优点应用到前端上，是一个不错的突破。 
ng2现在还是beta，本人没有很深入地去了解过，对于以上缺点有无改进不太清楚。我觉得ng与react应该是各有所长，各自有适应的具体应用场景，而不是一个相互排斥的关系。

