#region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=logo.ico
#PRE_Outfile=../THINK-S.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=THINKPHP专用开发环境
#PRE_Res_Fileversion=0.1.0.0
#PRE_Res_LegalCopyright=Thinkphp
#PRE_Res_requestedExecutionLevel=None
#endregion ;**** 参数创建于 ACNWrapper_GUI ****
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
#include <array.au3>
IniCheck();检查环境
TrayTip("", "THINK-S[THINKPHP专用开发环境]", 3, 1)
Opt("TrayMenuMode", 3) ;不运行其它形式图标菜单
_ResetConf();重置配置环境
_RunServer()
_TRAYMENU() ;设置托盘菜单



Global $server_run, $server_restart, $server_stop
Func _TRAYMENU()
	
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
	Local $ConfSetup = TrayCreateItem("应用新的设置", $iSettings)
	Local $iUpdate = TrayCreateMenu("更新", $iMgr)
	Local $SvnUp0 = TrayCreateItem("更新所有项目", $iUpdate)
	Local $SvnUp1 = TrayCreateItem("更新[官方示例]", $iUpdate)
	Local $SvnUp2 = TrayCreateItem("更新[THINKPHP]", $iUpdate)
	Local $SvnUp3 = TrayCreateItem("更新[扩展库]", $iUpdate)
	;Local $SvnUp4 = TrayCreateItem("更新[帮助文档]", $iUpdate)
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
			Case $ConfSetup
				_ConfSetup()
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
				FileCreateShortcut(@ScriptDir & "\" & @ScriptName, @DesktopDir & "\THINKPHP专用开发环境.lnk", @ScriptDir, "", "欢迎使用THINK-S!")
			Case $tool_startup
				FileCreateShortcut(@ScriptDir & "\" & @ScriptName, @StartupDir & "\THINKPHP专用开发环境.lnk", @ScriptDir, "", "欢迎使用THINK-S!")
			Case $SvnUp0
				_SvnUp0()
			Case $SvnUp1
				_SvnUp1();更新所有项目
			Case $SvnUp2
				_SvnUp2();更新[THINKPHP]
			Case $SvnUp3
				_SvnUp3();更新[扩展库]
			Case $server_run
				_RunServer()
			Case $iAbout
				_about()
			Case $server_restart
				_RestartServer()
			Case $server_stop
				_StopServer()
			Case $iExit ; Exit the loop.
				_StopServer()
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>_TRAYMENU

;;应用新的配置
Func _ConfSetup()
	_StopServer()
	TrayTip("", "正在应用新的配置……", 3, 1)
	Sleep(500)
	_ResetConf()
	TrayTip("", "正在重新启动THINK_S……", 3, 1)
	Sleep(500)
	_RunServer()
EndFunc   ;==>_ConfSetup

;;启动服务器
Func _RunServer()
	Global $server_run, $server_restart, $server_stop
	TrayTip("", "正在启动THINK-S……", 3, 1)
	_RunHttpd();apache
	_RunMysql();mysql
	_RunMongodb();mongodb
	
	TrayTip("", "THINK-S已启动！", 3, 1)
	TrayItemSetText($server_run, '运行THINK-S[运行中]')
	TrayItemSetState($server_run, 128)
	TrayItemSetText($server_stop, '停止THINK-S')
	TrayItemSetState($server_stop, 64)
	TrayItemSetState($server_restart, 64)
EndFunc   ;==>_RunServer

;;关闭服务器
Func _StopServer()
	Global $server_run, $server_restart, $server_stop
	TrayTip("", "正在关闭THINK-S！", 5, 1)
	_StopHttpd();apache
	_StopMysql();mysql
	_StopMongodb();mongodb
	TrayTip("", "THINK-S已经关闭！", 5, 1)
	TrayItemSetText($server_stop, '停止THINK-S[已停止]')
	TrayItemSetState($server_stop, 128)
	TrayItemSetState($server_restart, 128)
	TrayItemSetText($server_run, '运行THINK-S')
	TrayItemSetState($server_run, 64)
EndFunc   ;==>_StopServer


;;重启服务器
Func _RestartServer()
	_StopServer()
	_RunServer()
EndFunc   ;==>_RestartServer

;;开启HTTPD
Func _RunHttpd()
	_StopHttpd()
	Sleep(500)
	
	;第一次，先关闭相关的进程
	If (_IsPortBusy(80, 5) == 1) Then
		_killPortProcess(80)
	EndIf
	If (_IsPortBusy(10080, 5) == 1) Then
		_killPortProcess(10080)
	EndIf
	
	Local $i = 0
	TrayTip("", "正在启动APACHE……", 3, 1)
	While ProcessExists("httpd.exe") == 0
		ShellExecute(@ScriptDir & "\SERVER\apache22\bin\httpd.exe", "-f " & @ScriptDir & "\SERVER\etc\httpd.conf", '', '', @SW_HIDE)
		Sleep(250)
		$i = $i + 1
		If $i = 10 Then;尝试10次
			If (_IsPortBusy(80, 5) == 1) Then
				MsgBox(0, '提示', '貌似Apache的80端口被占用了， ' & @CRLF & '迅雷、QQ下载、BT、360升级助手等软件会占用80端口，请检查后再试!Think-S自动退出。')
				Exit
			EndIf
		EndIf
	WEnd
EndFunc   ;==>_RunHttpd

;;停止HTTPD
Func _StopHttpd()
	_KillProcess("httpd.exe")
EndFunc   ;==>_StopHttpd

Func _RunMysql()
	_StopMysql()
	If _IsPortBusy(3306, 5) == 1 Then
		MsgBox(0, '提示', '貌似MYSQL的3306端口被占用了，请检查后再试!Think-S自动退出。')
		Exit
	Else
		Sleep(500)
		TrayTip("", "正在启动MYSQL……", 3, 1)
		ShellExecute(@ScriptDir & "\SERVER\mysql5\bin\mysqld-nt.exe", "--defaults-file=" & @ScriptDir & "\SERVER\etc\mysql.ini", '', '', @SW_HIDE)
	EndIf
EndFunc   ;==>_RunMysql

Func _StopMysql()
	_KillProcess("mysqld-nt.exe")
EndFunc   ;==>_StopMysql

Func _RunMongodb()
	_StopMongodb()
	If (_IsPortBusy(27017, 5) == 1) Then
		MsgBox(0, '提示', '貌似MongoDB的27017端口被占用了，请检查后再试!Think-S自动退出。')
		Exit
	ElseIf (_IsPortBusy(28017, 5) == 1) Then
		MsgBox(0, '提示', '貌似MongoDB的28017口被占用了，请检查后再试!Think-S自动退出。')
		Exit
	Else
		Sleep(500)
		TrayTip("", "正在启动MongoDB……", 3, 1)
		ShellExecute(@ScriptDir & "\SERVER\mongodb2\bin\mongod.exe", "--config " & @ScriptDir & "\SERVER\etc\mongodb.conf", '', '', @SW_HIDE)
	EndIf
EndFunc   ;==>_RunMongodb

Func _StopMongodb()
	_KillProcess("mongod.exe")
	Sleep(1000)
	If FileExists(@ScriptDir & "\DATA\mongodb\mongod.lock") Then FileDelete(@ScriptDir & "\DATA\mongodb\mongod.lock")
EndFunc   ;==>_StopMongodb

;;重置配置文件
Func _ResetConf()
	If FileExists(@ScriptDir & "\SERVER\etc") Then
		WriteFile(@ScriptDir & "\SERVER\conf_template\php.conf", @ScriptDir & "\SERVER\etc\php.conf")
		WriteFile(@ScriptDir & "\SERVER\conf_template\php.ini", @ScriptDir & "\SERVER\etc\php.ini")
		WriteFile(@ScriptDir & "\SERVER\conf_template\mysql.ini", @ScriptDir & "\SERVER\etc\mysql.ini")
		WriteFile(@ScriptDir & "\SERVER\conf_template\httpd.conf", @ScriptDir & "\SERVER\etc\httpd.conf")
		WriteFile(@ScriptDir & "\SERVER\conf_template\mongodb.conf", @ScriptDir & "\SERVER\etc\mongodb.conf")
	Else
		MsgBox(0, '提示', @ScriptDir & "\SERVER\etc\目录不存在！" & @CRLF & '请检查后再试!')
	EndIf
EndFunc   ;==>_ResetConf

Func _SvnUp1()
	SvnUp("Examples")
EndFunc   ;==>_SvnUp1

Func _SvnUp2()
	SvnUp("ThinkPHP")
EndFunc   ;==>_SvnUp2

Func _SvnUp3()
	SvnUp("Extend")
EndFunc   ;==>_SvnUp3



Func _SvnUp0()
	_SvnUp1()
	_SvnUp2()
	_SvnUp3()
EndFunc   ;==>_SvnUp0


;;初始化时间检查
Func IniCheck()
	If _Singleton(@ScriptName, 1) = 0 Then
		MsgBox(4096, "错误", "只能同时运行一个THINK-S程序！" & @CRLF & "Think-S自动退出。")
		Exit
	EndIf
	If (_Regexp(@ScriptDir, 0) <> @ScriptDir) Then
		MsgBox(4096, "错误", "貌似程序的运行路径包含有双字节的字符，可能会让某部分组件运行不正常！" & @CRLF & "Think-S自动退出。")
		Exit
	EndIf
EndFunc   ;==>IniCheck

;;关于
Func _about()
	MsgBox(32 + 4096 + 262144, "关于本程序", "【缘起】" & @CRLF & @CRLF & "本程序是本人在想用THINKPHP3开发一小项目时，旧的环境不适合，也有一些新人还不懂怎样搭开发环境，所以有了做一个小小的环境的想法，无论老手新手都能用比较简单的方法快速搭起一个开发环境。" & @CRLF & @CRLF & "【感谢】" & @CRLF & @CRLF & "本程序借鉴了很多很优秀的专用开发环境：" & @CRLF & @CRLF & "Xampp：www.apachefriends.org" & @CRLF & "Apmxe：www.dualface.com" & @CRLF & "EasyPHP：www.easyphp.org" & @CRLF & @CRLF & "…………" & @CRLF & @CRLF & "本程序没有版权，如果你觉得还不错，请感谢以上软件的作者。当然，我要感谢THINKPHP!" & @CRLF & @CRLF & "【联系】" & @CRLF & @CRLF & "如果程序有问题请联系我：lee99.com[at]gmail.com" & @CRLF & @CRLF & "【注意】" & @CRLF & @CRLF & "本软件只适合于开发环境，不适合于生产环境！切记！")
EndFunc   ;==>_about

;;以SVN更新
Func SvnUp($target)
	;Local $target="Examples"
	DllCall('imm32.dll', 'int', 'ImmDisableIME', 'DWORD', 0)
	Local $base_dir = @ScriptDir & "\THINKPHP";
	Local $target_dir = $base_dir & "\" & $target & "";
	;If MsgBox(36, "程序更新", "点击[是]开始使用SVN更新程序.点击[否]取消更新") = 6 Then
	If FileExists(@ScriptDir & "\SERVER\SVN\svn.exe") And FileExists($target_dir & "\.svn") Then
		Run("cmd.exe /k title SVN 更新中... ")
		Local $hWnd = WinWait("[CLASS:ConsoleWindowClass]", "", 0)
		Send('cd{SPACE}' & $target_dir & '{ENTER}')
		Send(@ScriptDir & "\SERVER\SVN\svn.exe {SPACE} update{ENTER};exit{ENTER}")
		;Send('exit{ENTER}')
		MsgBox(4096, "提示", "更新操作已经完成！Think-S自动退出。")
	Else
		Run("cmd.exe /k title SVN 更新中... ")
		Local $hWnd = WinWait("[CLASS:ConsoleWindowClass]", "", 0)
		Send('cd{SPACE}' & $base_dir & '{ENTER}')
		
		Local $svnurl
		If $target=='ThinkPHP' Then $svnurl='https://github.com/liu21st/thinkphp/trunk/ThinkPHP' EndIf
		If $target=='Extend' Then $svnurl='https://github.com/liu21st/extend/trunk/Extend' EndIf
		If $target=='Examples' Then $svnurl='https://github.com/liu21st/examples/trunk/Examples' EndIf
	
		Send(@ScriptDir & "\SERVER\SVN\svn.exe {SPACE} checkout {SPACE} " & $svnurl & "/{ENTER};exit{ENTER}")
		
		;Send(@ScriptDir & "\SERVER\SVN\svn.exe {SPACE} checkout {SPACE} https://thinkphp.googlecode.com/svn/trunk/" & $target & "/{ENTER};exit{ENTER}")
		MsgBox(4096, "提示", "更新操作已经完成！Think-S自动退出。")
	EndIf
	;EndIf
EndFunc   ;==>SvnUp

;;格式化路径
Func FormatPath($str)
	$str = StringReplace($str, "\", "\\")
	Return $str
EndFunc   ;==>FormatPath

;;写入文件的函数
Func WriteFile($in, $out)
	Local $file_in = FileRead($in)
	Local $file_out = FileOpen($out, 266)
	; 检查打开的文件可写
	If $file_out = -1 Then
		MsgBox(4096, "错误", "不能打开配置文件.请检查是否程序被占用！")
		Exit
	EndIf
	Local $str = StringReplace($file_in, "[THINK_SERVER_PATH]", FormatPath(@ScriptDir & "\SERVER"))
	$str = StringReplace($str, "[THINK_WWW_PATH]", FormatPath(@ScriptDir & "\www"))
	$str = StringReplace($str, "[THINK_TP_PATH]", FormatPath(@ScriptDir & "\THINKPHP\Examples"))
	$str = StringReplace($str, "[THINK_DATA_PATH]", FormatPath(@ScriptDir & "\DATA"))
	FileWrite($file_out, $str)
	FileClose($file_out)
	Sleep(500)
EndFunc   ;==>WriteFile

;;判断字符，返回你的过滤条件
Func _Regexp($input, $flag = 1);flag,0='单字节字符',1='简体中文',2='其它双字节字符'
	Local $single, $due, $other
	If StringRegExp($input, '[^\x00-\xff]+', 0) Then
		$temp = StringSplit($input, '')
		For $i = 1 To $temp[0]
			If BinaryLen(StringToBinary($temp[$i])) = 2 Then
				$high = BinaryMid(StringToBinary($temp[$i]), 1, 1)
				$low = BinaryMid(StringToBinary($temp[$i]), 2, 1)
				If $high >= 0xb0 And $high <= 0xf7 And $low >= 0xa1 And $low <= 0xfe Then
					$due &= $temp[$i]
				Else
					$other &= $temp[$i]
				EndIf
			ElseIf BinaryLen(StringToBinary($temp[$i])) = 1 Then
				$single &= $temp[$i]
			EndIf
		Next
		Select
			Case $flag = 0
				Return $single
			Case $flag = 1
				Return $due
			Case $flag = 2
				Return $other
		EndSelect
	EndIf
EndFunc   ;==>_Regexp


;$Port：端口号；$ProtoMode=协议类型，IP,IPv6,ICMP,ICMPv6,TCP,TCPv6,UDP,UDPv6分别对应整数1-6
Func _IsPortBusy($Port, $ProtoMode = 5)
	$Port = Number($Port)
	$ProtoMode = Number($ProtoMode)
	If ($ProtoMode < 1) Or ($ProtoMode > 8) Then MsgBox(0, 0, "错误的网络类型!")
	$ProtoModeCollection = StringSplit("IP,IPv6,ICMP,ICMPv6,TCP,TCPv6,UDP,UDPv6", ",")

	Local $foo = Run(@ComSpec & " /c netstat -an -p " & $ProtoModeCollection[$ProtoMode], @SystemDir, @SW_HIDE, 4 + 2);增加o参数会显示占用的进程pid
	Local $line
	While 1
		$line = StdoutRead($foo)
		If @error Then
			Return -1
			ExitLoop
		EndIf
		If StringLen(StringReplace($line, " ", "")) > 0 Then
			If StringInStr($line, ":" & $Port & " ", 0) > 0 Then
				Return 1
			Else
				Return 0
			EndIf
		EndIf
	WEnd
EndFunc   ;==>_IsPortBusy

;;杀某一个进程
Func _KillProcess($Process)
	Local $PID = ProcessList($Process)
	For $i = 1 To $PID[0][0]
		ProcessClose($PID[$i][1])
	Next
EndFunc   ;==>_KillProcess


Func _killPortProcess($Port)
	#comments-start
		Local $foo = Run(@ComSpec & ' /c Netstat -ano|findstr /C:"0.0.0.0:"' & $Port, @SystemDir, @SW_HIDE, 4 + 2)
		Local $line
		While 1
		$line = StdoutRead($foo)
		If @error Then
		Return -1
		ExitLoop
		EndIf
		If StringLen($line) > 0 Then
		$ls = StringSplit($line, 'LISTENING', 1)
		Run(@ComSpec & ' /c TASKKILL /PID ' & Int($ls[2]), @SystemDir, @SW_HIDE, 4 + 2);
		EndIf
		WEnd
	#comments-end
	Local $foo = Run(@ComSpec & ' /c netstat -p TCP -aonvb', @SystemDir, @SW_HIDE, 4 + 2)
	Local $line
	While 1
		$line = StdoutRead($foo)
		If @error Then
			Return -1
			ExitLoop
		EndIf
		If StringLen($line) > 0 Then
			Local $ls_a, $ls_b, $ls_c
			
			;用了笨方法,正则老不灵光
			If (StringInStr($line, '0.0.0.0:' & $Port) <> 0) Then
				$ls_a = StringSplit($line, '0.0.0.0:' & $Port, 1)
				If (StringInStr($ls_a[2], ']') <> 0) Then
					$ls_b = StringSplit($ls_a[2], ']', 1)
					If (StringInStr($ls_b[1], '[') <> 0) Then
						$ls_c = StringSplit($ls_b[1], '[', 1)
						If IsArray($ls_c) Then
							_KillProcess($ls_c[2])
						EndIf
					EndIf
				EndIf
			EndIf

			#cs
				If (StringInStr($line, '0.0.0.0:' & $Port)) Then
				$ls_a = StringSplit($line, '0.0.0.0:' & $Port, 1)
				$array = StringRegExp($line, '\[(.*?)\]', 3)
				If IsArray($ls_c) Then
				_KillProcess($ls_c[2])
				EndIf
				EndIf
			#ce
		EndIf
	WEnd
EndFunc   ;==>_killPortProcess
