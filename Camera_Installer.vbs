strNewCameraPNP = "PID_C44E"
Set oShell = CreateObject("WScript.Shell")
sScriptFolder = oFSO.GetParentFolderName(Wscript.ScriptFullName)

If PNPMatch(strNewCameraPNP) Then
	sCmd = "CMD /C """ & sScriptFolder & "install.bat"""
	sRet = oShell.Run(sCmd, 0, True)
End If

Function PNPMatch(strPNPDeviceID)
	Set objWMIService = GetObject("winmgmts:\\.\root\CIMV2")
	Set colItems = objWMIService.ExecQuery("SELECT * FROM Win32_PnPEntity WHERE PNPDeviceID LIKE '%" & strPNPDeviceID & "%'")
	PNPMatch = colItems.Count
End Function