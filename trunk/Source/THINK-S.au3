#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=logo.ico
#PRE_Outfile=../THINK-S.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=THINKPHPר�ÿ�������
#PRE_Res_Fileversion=0.1.0.0
#PRE_Res_LegalCopyright=Thinkphp
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#region ACNԤ����������(���ò���)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#endregion ACNԤ����������(���ò���)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	�ű�����:ѩ��
	�����ʼ�:lee99.com@gmail.com
	�ű��汾:0.1
	�ű�����:THINKPHPר�ÿ�������
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

#include <Misc.au3>
_INI_CHECK();��黷��
TrayTip("", "THINK-S[THINKPHP���ɿ�������]", 3, 1)
_RESET_CONF();�������û���
_RUN_SERVER()
_TRAYMENU() ;�������̲˵�



Global $server_run, $server_restart, $server_stop

Func _TRAYMENU()
	Opt("TrayMenuMode", 3) ;������������ʽͼ��˵�
	Local $server_page = TrayCreateItem("����վ��ҳ...")
	Local $server_root = TrayCreateItem("����վ��Ŀ¼...")
	TrayCreateItem("") ;
	Local $iMgr = TrayCreateMenu("�����������")
	Local $iDb = TrayCreateMenu("���ݿ����", $iMgr)
	Local $iDb_mysql = TrayCreateItem("Mysql->phpmyadmin", $iDb)
	Local $iDb_mongo = TrayCreateItem("MongoDb->rock_mongo", $iDb)
	Local $iSettings = TrayCreateMenu("��������������", $iMgr)
	Local $conf_apache = TrayCreateItem("����Apache...", $iSettings)
	Local $conf_mysql = TrayCreateItem("����Mysql...", $iSettings)
	Local $conf_php = TrayCreateItem("����Php...", $iSettings)
	Local $conf_mongo = TrayCreateItem("����MongoDB...", $iSettings)
	Local $conf_setup = TrayCreateItem("Ӧ���µ�����", $iSettings)
	Local $iUpdate = TrayCreateMenu("����", $iMgr)
	Local $svn_up_0 = TrayCreateItem("����������Ŀ", $iUpdate)
	Local $svn_up_1 = TrayCreateItem("����[�ٷ�ʾ��]", $iUpdate)
	Local $svn_up_2 = TrayCreateItem("����[THINKPHP]", $iUpdate)
	Local $svn_up_3 = TrayCreateItem("����[��չ��]", $iUpdate)
	;Local $svn_up_4 = TrayCreateItem("����[�����ĵ�]", $iUpdate)
	Local $iTool = TrayCreateMenu("��������", $iMgr)
	Local $tool_shortcut = TrayCreateItem("���������ݷ�ʽ", $iTool)
	Local $tool_startup = TrayCreateItem("��������THINK-S", $iTool)


	Local $iRun = TrayCreateMenu("THINK-S���")
	$server_run = TrayCreateItem("����THINK-S[������]", $iRun)
	TrayItemSetState($server_run, 128)
	$server_restart = TrayCreateItem("����THINK-S", $iRun)
	$server_stop = TrayCreateItem("ֹͣTHINK-S", $iRun)


	Local $itp = TrayCreateMenu("THINKPHP���")
	Local $tp_home = TrayCreateItem("�򿪹ٷ�ʾ��", $itp)
	Local $tp_help = TrayCreateItem("�����߰����ĵ�", $itp)
	Local $tp_home_dir = TrayCreateItem("�򿪹ٷ�ʾ��Ŀ¼...", $itp)
	Local $tp_tp_dir = TrayCreateItem("��THINKPHPĿ¼...", $itp)
	Local $tp_ext_dir = TrayCreateItem("����չ��Ŀ¼...", $itp)


	TrayCreateItem("") ;
	Local $iAbout = TrayCreateItem("���ڱ�����...")
	Local $iExit = TrayCreateItem("�˳�THINK-S")



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
				FileCreateShortcut(@ScriptDir & "\" & @ScriptName, @DesktopDir & "\THINKPHP���ɿ�������.lnk", @ScriptDir, "", "��ӭʹ��THINK-S!")
			Case $tool_startup
				FileCreateShortcut(@ScriptDir & "\" & @ScriptName, @StartupDir & "\THINKPHP���ɿ�������.lnk", @ScriptDir, "", "��ӭʹ��THINK-S!")
			Case $svn_up_0
				_svn_up_0()
			Case $svn_up_1
				_svn_up_1();����������Ŀ
			Case $svn_up_2
				_svn_up_2();����[THINKPHP]
			Case $svn_up_3
				_svn_up_3();����[��չ��]
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
	TrayTip("", "����Ӧ���µ����ã�......", 3, 1)
	Sleep(1000)
	_RESET_CONF()
	TrayTip("", "������������THINK_S��......", 3, 1)
	Sleep(1000)
	_RUN_SERVER()
EndFunc   ;==>_conf_setup


Func _RUN_SERVER()
	Global $server_run, $server_restart, $server_stop
	TrayTip("", "��������THINK-S��......", 3, 1)
	_run_httpd();apache
	_run_mysql();mysql
	_run_mongodb();mongodb
	
	TrayTip("", "THINK-S��������", 3, 1)
	TrayItemSetText($server_run, '����THINK-S[������]')
	TrayItemSetState($server_run, 128)
	TrayItemSetText($server_stop, 'ֹͣTHINK-S')
	TrayItemSetState($server_stop, 64)
	TrayItemSetState($server_restart, 64)
EndFunc   ;==>_RUN_SERVER


Func _STOP_SERVER()
	Global $server_run, $server_restart, $server_stop
	TrayTip("", "���ڹر�THINK-S��......", 5, 1)
	_stop_httpd();apache
	_stop_mysql();mysql
	_stop_mongodb();mongodb
	TrayTip("", "THINK-S�Ѿ��رգ�", 5, 1)
	TrayItemSetText($server_stop, 'ֹͣTHINK-S[��ֹͣ]')
	TrayItemSetState($server_stop, 128)
	TrayItemSetState($server_restart, 128)
	TrayItemSetText($server_run, '����THINK-S')
	TrayItemSetState($server_run, 64)
	
EndFunc   ;==>_STOP_SERVER

Func _RESTART_SERVER()
	_STOP_SERVER()
	_RUN_SERVER()
EndFunc   ;==>_RESTART_SERVER

Func _write_file($in, $out)
	Local $file_in = FileRead($in)
	Local $file_out = FileOpen($out, 266)

	; ���򿪵��ļ���д
	If $file_out = -1 Then
		MsgBox(4096, "����", "���ܴ������ļ�.�����Ƿ����ռ�ã�")
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
	;If MsgBox(36, "�������", "���[��]��ʼʹ��SVN���³���.���[��]ȡ������") = 6 Then
	If FileExists(@ScriptDir & "\SERVER\SVN\svn.exe") And FileExists($target_dir & "\.svn") Then
		Run("cmd.exe /k title SVN ������... ")
		Local $hWnd = WinWait("[CLASS:ConsoleWindowClass]", "", 0)
		Send('cd{SPACE}' & $target_dir & '{ENTER}')
		Send(@ScriptDir & "\SERVER\SVN\svn.exe {SPACE} update{ENTER};exit{ENTER}")
		;Send('exit{ENTER}')
	Else
		Run("cmd.exe /k title SVN ������... ")
		Local $hWnd = WinWait("[CLASS:ConsoleWindowClass]", "", 0)
		Send('cd{SPACE}' & $base_dir & '{ENTER}')
		Send(@ScriptDir & "\SERVER\SVN\svn.exe {SPACE} checkout {SPACE} https://thinkphp.googlecode.com/svn/trunk/" & $target & "/{ENTER};exit{ENTER}")
		;Send('exit{ENTER}')
	EndIf
	
	;EndIf
EndFunc   ;==>_svn_up

Func _INI_CHECK()
	If _Singleton(@ScriptName, 1) = 0 Then
		MsgBox(4096, "����", "ֻ��ͬʱ����һ��THINK-S���򣡳����Զ��˳���")
		Exit
	EndIf
EndFunc   ;==>_INI_CHECK

Func _about()
	MsgBox(32 + 4096 + 262144, "���ڱ�����", "��Ե��" & @CRLF & @CRLF & "�������Ǳ���������THINKPHP3����һС��Ŀʱ���ɵĻ������ʺϣ�Ҳ��һЩ���˻����������������������������һ��СС�Ļ������뷨�������������ֶ����ñȽϼ򵥵ķ������ٴ���һ������������" & @CRLF & @CRLF & "����л��" & @CRLF & @CRLF & "���������˺ܶ������ļ��ɿ���������" & @CRLF & @CRLF & "Xampp��www.apachefriends.org" & @CRLF & "Apmxe��www.dualface.com" & @CRLF & "EasyPHP��www.easyphp.org" & @CRLF & @CRLF & "��������" & @CRLF & @CRLF & "������û�а�Ȩ���������û��������л������������ߡ���Ȼ����Ҫ��лTHINKPHP!" & @CRLF & @CRLF & "����ϵ��" & @CRLF & @CRLF & "�����������������ϵ�ң�lee99.com[at]gmail.com" & @CRLF & @CRLF & "��ע�⡿" & @CRLF & @CRLF & "�����ֻ�ʺ��ڿ������������ʺ��������������мǣ�")
EndFunc   ;==>_about
