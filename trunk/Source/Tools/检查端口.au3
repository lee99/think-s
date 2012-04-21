Func _IsPortBusy($Port, $ProtoMode = 5);$Port：端口号；$ProtoMode=协议类型，IP,IPv6,ICMP,ICMPv6,TCP,TCPv6,UDP,UDPv6分别对应整数1-6
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



Local $res = ""
If _IsPortBusy(80, 5) = 1 Then
	$res = $res & @CRLF & "UDP端口:80已经被占用。"
Else
	$res = $res & @CRLF & "UDP端口:80未被占用。"
EndIf


;MsgBox(0, 0, $res)
