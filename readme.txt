【缘起】
本程序是本人在想用THINKPHP3开发一小项目时，旧的环境不适合，也看到了有一些新人还不懂怎样搭开发环境，所以有了做一个小小的环境的想法。
只想为THINKPHP做一点小小的贡献，无论老手新手都能用比较简单的方法快速搭起一个符合THINKPHP的开发环境。
程序很简单，用autoit3编的，很容易，大家也可以根据我的代码编译出一个自己专属的开发环境。

【感谢】
本程序借鉴了很多很优秀的集成开发环境：
	Xampp：www.apachefriends.org
	Apmxe：www.dualface.com
	EasyPHP：www.easyphp.org
	…………
本程序没有版权，如果你觉得还不错，请感谢以上软件的作者。
当然，我要感谢THINKPHP!

【联系】
本项目网址：https://code.google.com/p/think-s/
如果您有任何建议请请联系我：lee99.com[at]gmail.com，能帮到您将是我莫大的荣幸。

【注意】
本软件只适合于开发环境，不适合于生产环境！切记！
另：本软件由AUTOIT3编写的，有些国产杀毒软件会认为有恶意脚本（如果360之列……），请先查毒再试用！
要不然你也可以用我的源码自己编译一版本出来，这也是快乐的事情。
地址：https://code.google.com/p/think-s/trunk/Source/THINK-S.au3

【软件特色】
1.100%适合THINKPHP的运行环境。
2.绿色，不写注册表，不写系统服务，不限制运行目录名，不限制执行文件名，不私自开机运行。招之即来，挥之即去。
3.可升级，随时同步官方SVN库（核心程序，示例，扩展库）。
4.组件配置可编辑，一步应用新配置。
5.实际开发环境和示例演示环境分开。开发环境工作目录为[THINK-S]/www,占用80端口;示例工作目录为[THINK-S]/THINKPHP/Examples,占用10080端口。数据管理工具‘phpmyadmin’、‘rock_mongo’为虚拟路径共用。

【组件版本】
PHP:5.2.9-2
Apache:2.2.10 
SQLite:2.8
Mysql:5.0.67-community-nt
MongoDB:2.0
Phpmyadmin:3.5.0.0
Rock_mongo:1.1.0

【开发环境】
本版本在win7下开发，winxp测试正常。有些组件可能会因为php的vc版本问题产生不兼容，请更新你的vc版本.
http://www.microsoft.com/zh-cn/download/details.aspx?id=29

【使用方法】
下载压缩包解压到任何非中文目录下，运行THINK-S.exe，如果第一次使用请执行：状态栏图标右键->管理及配置相关->更新->更新所有项目即可。

【常用问题】
1.为什么我系统无法启动THINK-S里面的服务？
答：1.您的系统可能有一些程序占用了组件包所需要的端口，如：迅雷，BT等会占用80端口，请检查。2.您之前有安装过类似的软件，他们以服务的形式让您开机启动。请关闭即可。THINK-S为绿色软件不写注册表，不写系统服务，不限制运行目录名，不限制执行文件名。之后我也可能会做一个小小的脚本让你一目了然看到哪些端口被哪些程序占用。

2.THINK-S的重要文件夹有哪些？各有什么作用？
答：具体如下：
[THINK-S]->				(根目录，无限制，任意起名，非中文)
	|->[SERVER]			(服务组件存放处)
		|->[conf_template]	(组件的配置模板目录)
		|->[etc]		(组件真实运行的配置存放目录，每次启动时间THINK-S都会重新生成)
	|->[DATA]			(所有组件的数据存放目录，如日志，数据库文件..)
	|->[www]			(您的PHP程序的工作目录)
	|->[THINKPHP]			(和THINKPHP相关的一切文件存送处，可以从think-S.exe更新获得，和官网SVN同步)
	|->[Source]			(本程序的脚本源代码，你兴趣你可以根据你的想法定制)


3.每次我都要手动启动，麻烦！怎样才可以设成开机启动？
答：如下步骤：状态栏图标右键->管理及配置相关->辅助工具->开机运行THINK-S，即可以。
4.为什么我打不开官方的例子？
答：如下步骤：状态栏图标右键->管理及配置相关->更新->更新所有项目，即可以。

【后期计划】
1.扩大测试、收集需求，综合考虑各种因素，完善程序，以达到可以发布的程度。
2.加入基本的数据及配置的备份机制。以让使用更方心。
3.做成可扩展安装形式，可以在上面按项目的需求替换安装不同的组件，如：Nginx、lighthttpd、PostgreSQL、Memcached……等

