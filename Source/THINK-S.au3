#region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=logo.ico
#PRE_Outfile=../THINK-S.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=THINKPHPר�ÿ�������
#PRE_Res_Fileversion=0.1.0.0
#PRE_Res_LegalCopyright=Thinkphp
#PRE_Res_requestedExecutionLevel=None
#endregion ;**** ���������� ACNWrapper_GUI ****
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
#include <array.au3>
IniCheck();��黷��
TrayTip("", "THINK-S[THINKPHPר�ÿ�������]", 3, 1)
Opt("TrayMenuMode", 3) ;������������ʽͼ��˵�
_ResetConf();�������û���
_RunServer()
_TRAYMENU() ;�������̲˵�



Global $server_run, $server_restart, $server_stop
Func _TRAYMENU()
	
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
	Local $ConfSetup = TrayCreateItem("Ӧ���µ�����", $iSettings)
	Local $iUpdate = TrayCreateMenu("����", $iMgr)
	Local $SvnUp0 = TrayCreateItem("����������Ŀ", $iUpdate)
	Local $SvnUp1 = TrayCreateItem("����[�ٷ�ʾ��]", $iUpdate)
	Local $SvnUp2 = TrayCreateItem("����[THINKPHP]", $iUpdate)
	Local $SvnUp3 = TrayCreateItem("����[��չ��]", $iUpdate)
	;Local $SvnUp4 = TrayCreateItem("����[�����ĵ�]", $iUpdate)
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
				FileCreateShortcut(@ScriptDir & "\" & @ScriptName, @DesktopDir & "\THINKPHPר�ÿ�������.lnk", @ScriptDir, "", "��ӭʹ��THINK-S!")
			Case $tool_startup
				FileCreateShortcut(@ScriptDir & "\" & @ScriptName, @StartupDir & "\THINKPHPר�ÿ�������.lnk", @ScriptDir, "", "��ӭʹ��THINK-S!")
			Case $SvnUp0
				_SvnUp0()
			Case $SvnUp1
				_SvnUp1();����������Ŀ
			Case $SvnUp2
				_SvnUp2();����[THINKPHP]
			Case $SvnUp3
				_SvnUp3();����[��չ��]
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

;;Ӧ���µ�����
Func _ConfSetup()
	_StopServer()
	TrayTip("", "����Ӧ���µ����á���", 3, 1)
	Sleep(500)
	_ResetConf()
	TrayTip("", "������������THINK_S����", 3, 1)
	Sleep(500)
	_RunServer()
EndFunc   ;==>_ConfSetup

;;����������
Func _RunServer()
	Global $server_run, $server_restart, $server_stop
	TrayTip("", "��������THINK-S����", 3, 1)
	_RunHttpd();apache
	_RunMysql();mysql
	_RunMongodb();mongodb
	
	TrayTip("", "THINK-S��������", 3, 1)
	TrayItemSetText($server_run, '����THINK-S[������]')
	TrayItemSetState($server_run, 128)
	TrayItemSetText($server_stop, 'ֹͣTHINK-S')
	TrayItemSetState($server_stop, 64)
	TrayItemSetState($server_restart, 64)
EndFunc   ;==>_RunServer

;;�رշ�����
Func _StopServer()
	Global $server_run, $server_restart, $server_stop
	TrayTip("", "���ڹر�THINK-S��", 5, 1)
	_StopHttpd();apache
	_StopMysql();mysql
	_StopMongodb();mongodb
	TrayTip("", "THINK-S�Ѿ��رգ�", 5, 1)
	TrayItemSetText($server_stop, 'ֹͣTHINK-S[��ֹͣ]')
	TrayItemSetState($server_stop, 128)
	TrayItemSetState($server_restart, 128)
	TrayItemSetText($server_run, '����THINK-S')
	TrayItemSetState($server_run, 64)
EndFunc   ;==>_StopServer


;;����������
Func _RestartServer()
	_StopServer()
	_RunServer()
EndFunc   ;==>_RestartServer

;;����HTTPD
Func _RunHttpd()
	_StopHttpd()
	Sleep(500)
	
	;��һ�Σ��ȹر���صĽ���
	If (_IsPortBusy(80, 5) == 1) Then
		_killPortProcess(80)
	EndIf
	If (_IsPortBusy(10080, 5) == 1) Then
		_killPortProcess(10080)
	EndIf
	
	Local $i = 0
	TrayTip("", "��������APACHE����", 3, 1)
	While ProcessExists("httpd.exe") == 0
		ShellExecute(@ScriptDir & "\SERVER\apache22\bin\httpd.exe", "-f " & @ScriptDir & "\SERVER\etc\httpd.conf", '', '', @SW_HIDE)
		Sleep(250)
		$i = $i + 1
		If $i = 10 Then;����10��
			If (_IsPortBusy(80, 5) == 1) Then
				MsgBox(0, '��ʾ', 'ò��Apache��80�˿ڱ�ռ���ˣ� ' & @CRLF & 'Ѹ�ס�QQ���ء�BT��360�������ֵ������ռ��80�˿ڣ����������!Think-S�Զ��˳���')
				Exit
			EndIf
		EndIf
	WEnd
EndFunc   ;==>_RunHttpd

;;ֹͣHTTPD
Func _StopHttpd()
	_KillProcess("httpd.exe")
EndFunc   ;==>_StopHttpd

Func _RunMysql()
	_StopMysql()
	If _IsPortBusy(3306, 5) == 1 Then
		MsgBox(0, '��ʾ', 'ò��MYSQL��3306�˿ڱ�ռ���ˣ����������!Think-S�Զ��˳���')
		Exit
	Else
		Sleep(500)
		TrayTip("", "��������MYSQL����", 3, 1)
		ShellExecute(@ScriptDir & "\SERVER\mysql5\bin\mysqld-nt.exe", "--defaults-file=" & @ScriptDir & "\SERVER\etc\mysql.ini", '', '', @SW_HIDE)
	EndIf
EndFunc   ;==>_RunMysql

Func _StopMysql()
	_KillProcess("mysqld-nt.exe")
EndFunc   ;==>_StopMysql

Func _RunMongodb()
	_StopMongodb()
	If (_IsPortBusy(27017, 5) == 1) Then
		MsgBox(0, '��ʾ', 'ò��MongoDB��27017�˿ڱ�ռ���ˣ����������!Think-S�Զ��˳���')
		Exit
	ElseIf (_IsPortBusy(28017, 5) == 1) Then
		MsgBox(0, '��ʾ', 'ò��MongoDB��28017�ڱ�ռ���ˣ����������!Think-S�Զ��˳���')
		Exit
	Else
		Sleep(500)
		TrayTip("", "��������MongoDB����", 3, 1)
		ShellExecute(@ScriptDir & "\SERVER\mongodb2\bin\mongod.exe", "--config " & @ScriptDir & "\SERVER\etc\mongodb.conf", '', '', @SW_HIDE)
	EndIf
EndFunc   ;==>_RunMongodb

Func _StopMongodb()
	_KillProcess("mongod.exe")
	Sleep(1000)
	If FileExists(@ScriptDir & "\DATA\mongodb\mongod.lock") Then FileDelete(@ScriptDir & "\DATA\mongodb\mongod.lock")
EndFunc   ;==>_StopMongodb

;;���������ļ�
Func _ResetConf()
	If FileExists(@ScriptDir & "\SERVER\etc") Then
		WriteFile(@ScriptDir & "\SERVER\conf_template\php.conf", @ScriptDir & "\SERVER\etc\php.conf")
		WriteFile(@ScriptDir & "\SERVER\conf_template\php.ini", @ScriptDir & "\SERVER\etc\php.ini")
		WriteFile(@ScriptDir & "\SERVER\conf_template\mysql.ini", @ScriptDir & "\SERVER\etc\mysql.ini")
		WriteFile(@ScriptDir & "\SERVER\conf_template\httpd.conf", @ScriptDir & "\SERVER\etc\httpd.conf")
		WriteFile(@ScriptDir & "\SERVER\conf_template\mongodb.conf", @ScriptDir & "\SERVER\etc\mongodb.conf")
	Else
		MsgBox(0, '��ʾ', @ScriptDir & "\SERVER\etc\Ŀ¼�����ڣ�" & @CRLF & '���������!')
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


;;��ʼ��ʱ����
Func IniCheck()
	If _Singleton(@ScriptName, 1) = 0 Then
		MsgBox(4096, "����", "ֻ��ͬʱ����һ��THINK-S����" & @CRLF & "Think-S�Զ��˳���")
		Exit
	EndIf
	If (_Regexp(@ScriptDir, 0) <> @ScriptDir) Then
		MsgBox(4096, "����", "ò�Ƴ��������·��������˫�ֽڵ��ַ������ܻ���ĳ����������в�������" & @CRLF & "Think-S�Զ��˳���")
		Exit
	EndIf
EndFunc   ;==>IniCheck

;;����
Func _about()
	MsgBox(32 + 4096 + 262144, "���ڱ�����", "��Ե��" & @CRLF & @CRLF & "�������Ǳ���������THINKPHP3����һС��Ŀʱ���ɵĻ������ʺϣ�Ҳ��һЩ���˻����������������������������һ��СС�Ļ������뷨�������������ֶ����ñȽϼ򵥵ķ������ٴ���һ������������" & @CRLF & @CRLF & "����л��" & @CRLF & @CRLF & "���������˺ܶ�������ר�ÿ���������" & @CRLF & @CRLF & "Xampp��www.apachefriends.org" & @CRLF & "Apmxe��www.dualface.com" & @CRLF & "EasyPHP��www.easyphp.org" & @CRLF & @CRLF & "��������" & @CRLF & @CRLF & "������û�а�Ȩ���������û��������л������������ߡ���Ȼ����Ҫ��лTHINKPHP!" & @CRLF & @CRLF & "����ϵ��" & @CRLF & @CRLF & "�����������������ϵ�ң�lee99.com[at]gmail.com" & @CRLF & @CRLF & "��ע�⡿" & @CRLF & @CRLF & "�����ֻ�ʺ��ڿ������������ʺ��������������мǣ�")
EndFunc   ;==>_about

;;��SVN����
Func SvnUp($target)
	;Local $target="Examples"
	DllCall('imm32.dll', 'int', 'ImmDisableIME', 'DWORD', 0)
	Local $base_dir = @ScriptDir & "\THINKPHP";
	Local $target_dir = $base_dir & "\" & $target & "";
	;If MsgBox(36, "�������", "���[��]��ʼʹ��SVN���³���.���[��]ȡ������") = 6 Then
	If FileExists(@ScriptDir & "\SERVER\SVN\svn.exe") And FileExists($target_dir & "\.svn") Then
		Run("cmd.exe /k title SVN ������... ")
		Local $hWnd = WinWait("[CLASS:ConsoleWindowClass]", "", 0)
		Send('cd{SPACE}' & $target_dir & '{ENTER}')
		Send(@ScriptDir & "\SERVER\SVN\svn.exe {SPACE} update{ENTER};exit{ENTER}")
		;Send('exit{ENTER}')
		MsgBox(4096, "��ʾ", "���²����Ѿ���ɣ�Think-S�Զ��˳���")
	Else
		Run("cmd.exe /k title SVN ������... ")
		Local $hWnd = WinWait("[CLASS:ConsoleWindowClass]", "", 0)
		Send('cd{SPACE}' & $base_dir & '{ENTER}')
		
		Local $svnurl
		If $target=='ThinkPHP' Then $svnurl='https://github.com/liu21st/thinkphp/trunk/ThinkPHP' EndIf
		If $target=='Extend' Then $svnurl='https://github.com/liu21st/extend/trunk/Extend' EndIf
		If $target=='Examples' Then $svnurl='https://github.com/liu21st/examples/trunk/Examples' EndIf
	
		Send(@ScriptDir & "\SERVER\SVN\svn.exe {SPACE} checkout {SPACE} " & $svnurl & "/{ENTER};exit{ENTER}")
		
		;Send(@ScriptDir & "\SERVER\SVN\svn.exe {SPACE} checkout {SPACE} https://thinkphp.googlecode.com/svn/trunk/" & $target & "/{ENTER};exit{ENTER}")
		MsgBox(4096, "��ʾ", "���²����Ѿ���ɣ�Think-S�Զ��˳���")
	EndIf
	;EndIf
EndFunc   ;==>SvnUp

;;��ʽ��·��
Func FormatPath($str)
	$str = StringReplace($str, "\", "\\")
	Return $str
EndFunc   ;==>FormatPath

;;д���ļ��ĺ���
Func WriteFile($in, $out)
	Local $file_in = FileRead($in)
	Local $file_out = FileOpen($out, 266)
	; ���򿪵��ļ���д
	If $file_out = -1 Then
		MsgBox(4096, "����", "���ܴ������ļ�.�����Ƿ����ռ�ã�")
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

;;�ж��ַ���������Ĺ�������
Func _Regexp($input, $flag = 1);flag,0='���ֽ��ַ�',1='��������',2='����˫�ֽ��ַ�'
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


;$Port���˿ںţ�$ProtoMode=Э�����ͣ�IP,IPv6,ICMP,ICMPv6,TCP,TCPv6,UDP,UDPv6�ֱ��Ӧ����1-6
Func _IsPortBusy($Port, $ProtoMode = 5)
	$Port = Number($Port)
	$ProtoMode = Number($ProtoMode)
	If ($ProtoMode < 1) Or ($ProtoMode > 8) Then MsgBox(0, 0, "�������������!")
	$ProtoModeCollection = StringSplit("IP,IPv6,ICMP,ICMPv6,TCP,TCPv6,UDP,UDPv6", ",")

	Local $foo = Run(@ComSpec & " /c netstat -an -p " & $ProtoModeCollection[$ProtoMode], @SystemDir, @SW_HIDE, 4 + 2);����o��������ʾռ�õĽ���pid
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

;;ɱĳһ������
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
			
			;���˱�����,�����ϲ����
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
