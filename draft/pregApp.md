
* 20160129 打算以全栈的方式做一个app，由于不想陷入回调地狱，打算以koa为服务端底层框架。
* 20160130 koa的hello world很好写，目前在探索如何跟模板结合在一起。应该直接选型react 服务端渲染。
* 20160201 react server render 和jade这些不同，直接用renderToString就ok了。
* 20160202 加上redux router等的服务端渲染比较麻烦，社区比较混乱，没有统一的对应的说明。先做传统的客户端，再做接口，再考虑服务端渲染。
* 20160203 今天主要是加了nodemon实时监控，服务端还要加上websocket。