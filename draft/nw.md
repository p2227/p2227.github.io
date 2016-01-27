
* 20160125 用了大概三个小时完成了vue+babel+webpack的hello world
* 20160126 尝试用WEBPACK来构建应用，但是发现当引用到SQLITE3的模块时，因为上下文是NODE环境，有些模块不能引用（例如FS模块），所以今天主要是在NW中原始地刷新排错。应该可以配置WEBPACK的参数解决。
* 20160126 想利用RX去进行异步的数据流控制，在与SQLITE3结合的时候报错，先自己排查一下用法，最小化情景。
* 20160127 通过逐步排查，最小化代码，发现前面的rx报错是上下文问题，还是很基础的。而webpack问题通过http://jlongster.com/Backend-Apps-with-Webpack--Part-I 文章初步解决了，下一步是css的处理，以及bs编写ui