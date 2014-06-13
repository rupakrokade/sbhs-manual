On Error Resume Next
'Following code is duct-tape code.
'This is done because directory structure is not fixed
'and minimal libraries have to be used.
'One of following 5 works. Rest will give error in command line.
'VBscript will go unterminated
CreateObject("Wscript.Shell").Run "..\common_files\sbhsclient.exe", 0, True
CreateObject("Wscript.Shell").Run "..\..\common_files\sbhsclient.exe", 0, True
CreateObject("Wscript.Shell").Run "..\..\..\common_files\sbhsclient.exe", 0, True
CreateObject("Wscript.Shell").Run "..\..\..\..\common_files\sbhsclient.exe", 0, True
CreateObject("Wscript.Shell").Run "..\..\..\..\..\common_files\sbhsclient.exe", 0, True
