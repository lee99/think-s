#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=logo.ico
#PRE_Outfile=../THINK-S.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=THINKPHP专用开发环境
#PRE_Res_Fileversion=0.1.0.0
#PRE_Res_LegalCopyright=Thinkphp
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#region ACN预处理程序参数(常用参数)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#endregion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	脚本作者:雪狼
	电子邮件:lee99.com@gmail.com
	脚本版本:0.1
	脚本功能:THINKPHP专用开发环境
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

#include <Misc.au3>
_INI_CHECK();检查环境
TrayTip("", "THINK-S[THINKPHP集成开发环境]", 3, 1)
_RESET_CONF();重置配置环境
_RUN_SERVER()
_TRAYMENU() ;设置托盘菜单



Global $server_run, $server_restart, $server_stop

Func _TRAYMENU()
	Opt("TrayMenuMode", 3) ;不运行其它形式图标菜单
	Local $server_page = TrayCreateItem("打开网站首页...")
	Local $server_root = TrayCreateItem("打开网站根目录...")
	TrayCreateItem("") ;
	Local $iMgr = TrayCreateMenu("管理及配置相关")
	Local $iDb = TrayCreateMenu("数据库管理", $iMgr)
	Local $iDb_mysql = TrayCreateItem("Mysql->phpmyadmin", $iDb)
	Local $iDb_mongo = TrayCreateItem("MongoDb->rock_mongo", $iDb)
	Local $iSettings = TrayCreateMenu("服务器环境设置", $iMgr)
	Local $conf_apache = TrayCreateItem("设置Apache...", $iSettings)
	Local $conf_mysql = TrayCreateItem("设置Mysql...", $iSettings)
	Local $conf_php = TrayCreateItem("设置Php...", $iSettings)
	Local $conf_mongo = TrayCreateItem("设置MongoDB...", $iSettings)
	Local $conf_setup = TrayCreateItem("应用新的设置", $iSettings)
	Local $iUpdate = TrayCreateMenu("更新", $iMgr)
	Local $svn_up_0 = TrayCreateItem("更新所有项目", $iUpdate)
	Local $svn_up_1 = TrayCreateItem("更新[官方示例]", $iUpdate)
	Local $svn_up_2 = TrayCreateItem("更新[THINKPHP]", $iUpdate)
	Local $svn_up_3 = TrayCreateItem("更新[扩展库]", $iUpdate)
	;Local $svn_up_4 = TrayCreateItem("更新[帮助文档]", $iUpdate)
	Local $iTool = TrayCreateMenu("辅助工具", $iMgr)
	Local $tool_shortcut = TrayCreateItem("创建桌面快捷方式", $iTool)
	Local $tool_startup = TrayCreateItem("开机运行THINK-S", $iTool)


	Local $iRun = TrayCreateMenu("THINK-S相关")
	$server_run = TrayCreateItem("运行THINK-S[运行中]", $iRun)
	TrayItemSetState($server_run, 128)
	$server_restart = TrayCreateItem("重启THINK-S", $iRun)
	$server_stop = TrayCreateItem("停止THINK-S", $iRun)


	Local $itp = TrayCreateMenu("THINKPHP相关")
	Local $tp_home = TrayCreateItem("打开官方示例", $itp)
	Local $tp_help = TrayCreateItem("打开在线帮助文档", $itp)
	Local $tp_home_dir = TrayCreateItem("打开官方示例目录...", $itp)
	Local $tp_tp_dir = TrayCreateItem("打开THINKPHP目录...", $itp)
	Local $tp_ext_dir = TrayCreateItem("打开扩展库目录...", $itp)


	TrayCreateItem("") ;
	Local $iAbout = TrayCreateItem("关于本程序...")
	Local $iExit = TrayCreateItem("退出THINK-S")



	TraySetState(1) ; Show the tray menu.
	While 1
		Switch TrayGetMsg()
			Case $conf_apache
				Run(@WindowsDir & "\Notepad.exe " & @ScriptDir & "\SERVER\conf_template\httpd.conf")
			Case $conf_mysql
				Run(@WindowsDir & "\Notepad.exe " & @ScriptDir & "\SERVER\conf_template\mysql.ini")
			Case $conf_mongo
				Run(@WindowsDir & "\Notepad.exe " & @ScriptDir & "\SERVER\conf_template\mongodb.conf")
			Case $conf_php
				Run(@WindowsDir & "\Notepad.exe " & @ScriptDir & "\SERVER\conf_template\php.conf")
				Run(@WindowsDir & "\Notepad.exe " & @ScriptDir & "\SERVER\conf_template\php.ini")
			Case $conf_setup
				_conf_setup()
			Case $server_page
				ShellExecute('http://localhost:80/')
			Case $iDb_mysql
				ShellExecute('http://127.0.0.1:10080/phpmyadmin/')
			Case $iDb_mongo
				ShellExecute('http://127.0.0.1:10080/rock_mongo/')
			Case $tp_home
				ShellExecute('http://127.0.0.1:10080')
			Case $tp_help
				ShellExecute('http://doc.thinkphp.cn')
			Case $tp_home_dir
				Run("explorer.exe " & @ScriptDir & "\THINKPHP\Examples\")
			Case $tp_tp_dir
				Run("explorer.exe " & @ScriptDir & "\THINKPHP\ThinkPHP\")
			Case $tp_ext_dir
				Run("explorer.exe " & @ScriptDir & "\THINKPHP\Extend\")
			Case $server_root
				Run("explorer.exe " & @ScriptDir & "\www\")
			Case $tool_shortcut
				FileCreateShortcut(@ScriptDir & "\" & @ScriptName, @DesktopDir & "\THINKPHP集成开发环境.lnk", @ScriptDir, "", "欢迎使用THINK-S!")
			Case $tool_startup
				FileCreateShortcut(@ScriptDir & "\" & @ScriptName, @StartupDir & "\THINKPHP集成开发环境.lnk", @ScriptDir, "", "欢迎使用THINK-S!")
			Case $svn_up_0
				_svn_up_0()
			Case $svn_up_1
				_svn_up_1();更新所有项目
			Case $svn_up_2
				_svn_up_2();更新[THINKPHP]
			Case $svn_up_3
				_svn_up_3();更新[扩展库]
			Case $server_run
				_RUN_SERVER()
			Case $iAbout
				_about()
			Case $server_restart
				_RESTART_SERVER()
			Case $server_stop
				_STOP_SERVER()
			Case $iExit ; Exit the loop.
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>_TRAYMENU

Func _conf_setup()
	_STOP_SERVER()
	TrayTip("", "正在应用新的配置！......", 3, 1)
	Sleep(1000)
	_RESET_CONF()
	TrayTip("", "正在重新启动THINK_S！......", 3, 1)
	Sleep(1000)
	_RUN_SERVER()
EndFunc   ;==>_conf_setup


Func _RUN_SERVER()
	Global $server_run, $server_restart, $server_stop
	TrayTip("", "正在启动THINK-S！......", 3, 1)
	_run_httpd();apache
	_run_mysql();mysql
	_run_mongodb();mongodb
	
	TrayTip("", "THINK-S已启动！", 3, 1)
	TrayItemSetText($server_run, '运行THINK-S[运行中]')
	TrayItemSetState($server_run, 128)
	TrayItemSetText($server_stop, '停止THINK-S')
	TrayItemSetState($server_stop, 64)
	TrayItemSetState($server_restart, 64)
EndFunc   ;==>_RUN_SERVER


Func _STOP_SERVER()
	Global $server_run, $server_restart, $server_stop
	TrayTip("", "正在关闭THINK-S！......", 5, 1)
	_stop_httpd();apache
	_stop_mysql();mysql
	_stop_mongodb();mongodb
	TrayTip("", "THINK-S已经关闭！", 5, 1)
	TrayItemSetText($server_stop, '停止THINK-S[已停止]')
	TrayItemSetState($server_stop, 128)
	TrayItemSetState($server_restart, 128)
	TrayItemSetText($server_run, '运行THINK-S')
	TrayItemSetState($server_run, 64)
	
EndFunc   ;==>_STOP_SERVER

Func _RESTART_SERVER()
	_STOP_SERVER()
	_RUN_SERVER()
EndFunc   ;==>_RESTART_SERVER

Func _write_file($in, $out)
	Local $file_in = FileRead($in)
	Local $file_out = FileOpen($out, 266)

	; 检查打开的文件可写
	If $file_out = -1 Then
		MsgBox(4096, "错误", "不能打开配置文件.请检查是否程序被占用！")
		Exit
	EndIf
	Local $str = StringReplace($file_in, "[THINK_SERVER_PATH]", @ScriptDir & "\SERVER")
	$str = StringReplace($str, "[THINK_WWW_PATH]", @ScriptDir & "\www")
	$str = StringReplace($str, "[THINK_TP_PATH]", @ScriptDir & "\THINKPHP\Examples")
	FileWrite($file_out, $str)
	FileClose($file_out)
	Sleep(500)
	
EndFunc   ;==>_write_file

Func _run_httpd()
	_stop_httpd()
	Sleep(500)
	ShellExecute(@ScriptDir & "\SERVER\apache22\bin\httpd.exe", "-f " & @ScriptDir & "\SERVER\etc\httpd.conf", '', '', @SW_HIDE)
EndFunc   ;==>_run_httpd

Func _stop_httpd()
	Local $PID = ProcessList("httpd.exe")
	For $i = 1 To $PID[0][0]
		ProcessClose($PID[$i][1])
	Next
EndFunc   ;==>_stop_httpd

Func _run_mysql()
	_stop_mysql()
	Sleep(500)
	ShellExecute(@ScriptDir & "\SERVER\mysql5\bin\mysqld-nt.exe", "--defaults-file=" & @ScriptDir & "\SERVER\etc\mysql.ini", '', '', @SW_HIDE)
EndFunc   ;==>_run_mysql

Func _stop_mysql()
	Local $PID = ProcessList("mysqld-nt.exe")
	For $i = 1 To $PID[0][0]
		ProcessClose($PID[$i][1])
	Next
EndFunc   ;==>_stop_mysql

Func _run_mongodb()
	_stop_mongodb()
	Sleep(500)
	ShellExecute(@ScriptDir & "\SERVER\mongodb2\bin\mongod.exe", "--config " & @ScriptDir & "\SERVER\etc\mongodb.conf", '', '', @SW_HIDE)
EndFunc   ;==>_run_mongodb

Func _stop_mongodb()
	Local $PID = ProcessList("mongod.exe")
	For $i = 1 To $PID[0][0]
		ProcessClose($PID[$i][1])
	Next
	Sleep(1000)
	If FileExists(@ScriptDir & "\SERVER\var\mongodb\mongod.lock") Then FileDelete(@ScriptDir & "\SERVER\var\mongodb\mongod.lock")
EndFunc   ;==>_stop_mongodb

Func _RESET_CONF()
	_write_file(@ScriptDir & "\SERVER\conf_template\php.conf", @ScriptDir & "\SERVER\etc\php.conf")
	_write_file(@ScriptDir & "\SERVER\conf_template\php.ini", @ScriptDir & "\SERVER\etc\php.ini")
	_write_file(@ScriptDir & "\SERVER\conf_template\mysql.ini", @ScriptDir & "\SERVER\etc\mysql.ini")
	_write_file(@ScriptDir & "\SERVER\conf_template\httpd.conf", @ScriptDir & "\SERVER\etc\httpd.conf")
	_write_file(@ScriptDir & "\SERVER\conf_template\mongodb.conf", @ScriptDir & "\SERVER\etc\mongodb.conf")
EndFunc   ;==>_RESET_CONF

Func _svn_up_1()
	_svn_up("Examples")
EndFunc   ;==>_svn_up_1

Func _svn_up_2()
	_svn_up("ThinkPHP")
EndFunc   ;==>_svn_up_2

Func _svn_up_3()
	_svn_up("Extend")
EndFunc   ;==>_svn_up_3
Func _svn_up_4()
	_svn_up("Extend")
EndFunc   ;==>_svn_up_4

Func _svn_up_0()
	_svn_up_1()
	_svn_up_2()
	_svn_up_3()
EndFunc   ;==>_svn_up_0

Func _svn_up($target)
	;Local $target="Examples"
	Local $base_dir = @ScriptDir & "\THINKPHP";
	Local $target_dir = $base_dir & "\" & $target & "";
	;If MsgBox(36, "程序更新", "点击[是]开始使用SVN更新程序.点击[否]取消更新") = 6 Then
	If FileExists(@ScriptDir & "\SERVER\SVN\svn.exe") And FileExists($target_dir & "\.svn") Then
		Run("cmd.exe /k title SVN 更新中... ")
		Local $hWnd = WinWait("[CLASS:ConsoleWindowClass]", "", 0)
		Send('cd{SPACE}' & $target_dir & '{ENTER}')
		Send(@ScriptDir & "\SERVER\SVN\svn.exe {SPACE} update{ENTER};exit{ENTER}")
		;Send('exit{ENTER}')
	Else
		Run("cmd.exe /k title SVN 更新中... ")
		Local $hWnd = WinWait("[CLASS:ConsoleWindowClass]", "", 0)
		Send('cd{SPACE}' & $base_dir & '{ENTER}')
		Send(@ScriptDir & "\SERVER\SVN\svn.exe {SPACE} checkout {SPACE} https://thinkphp.googlecode.com/svn/trunk/" & $target & "/{ENTER};exit{ENTER}")
		;Send('exit{ENTER}')
	EndIf
	
	;EndIf
EndFunc   ;==>_svn_up

Func _INI_CHECK()
	If _Singleton(@ScriptName, 1) = 0 Then
		MsgBox(4096, "错误", "只能同时运行一个THINK-S程序！程序自动退出。")
		Exit
	EndIf
EndFunc   ;==>_INI_CHECK

Func _about()
	MsgBox(32 + 4096 + 262144, "关于本程序", "【缘起】" & @CRLF & @CRLF & "本程序是本人在想用THINKPHP3开发一小项目时，旧的环境不适合，也有一些新人还不懂怎样搭开发环境，所以有了做一个小小的环境的想法，无论老手新手都能用比较简单的方法快速搭起一个开发环境。" & @CRLF & @CRLF & "【感谢】" & @CRLF & @CRLF & "本程序借鉴了很多很优秀的集成开发环境：" & @CRLF & @CRLF & "Xampp：www.apachefriends.org" & @CRLF & "Apmxe：www.dualface.com" & @CRLF & "EasyPHP：www.easyphp.org" & @CRLF & @CRLF & "…………" & @CRLF & @CRLF & "本程序没有版权，如果你觉得还不错，请感谢以上软件的作者。当然，我要感谢THINKPHP!" & @CRLF & @CRLF & "【联系】" & @CRLF & @CRLF & "如果程序有问题请联系我：lee99.com[at]gmail.com" & @CRLF & @CRLF & "【注意】" & @CRLF & @CRLF & "本软件只适合于开发环境，不适合于生产环境！切记！")
EndFunc   ;==>_about
