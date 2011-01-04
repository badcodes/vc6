# Microsoft Developer Studio Project File - Name="ZCmd" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=ZCmd - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "ZCmd.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ZCmd.mak" CFG="ZCmd - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ZCmd - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "ZCmd - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "ZCmd - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x804 /d "NDEBUG"
# ADD RSC /l 0x804 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "ZCmd - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I "G:\DOS\WORK\C\XRZLIB\SRC" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x804 /d "_DEBUG"
# ADD RSC /l 0x804 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ../XRZLib/Debug/xrzlib.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "ZCmd - Win32 Release"
# Name "ZCmd - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\cd.c
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\cmd.c
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\echo.c
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\exit.c
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\filecmd.c
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\help.c
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\modpath.c
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\printf.c
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\script.c
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\utils.c
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\zcmd.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\cd.h
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\cmd.h
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\config.h
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\echo.h
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\filecmd.h
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\help.h
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\modpath.h
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\printf.h
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\script.h
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\utils.h
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\version.h
# End Source File
# Begin Source File

SOURCE=G:\dos\work\c\zcmd\src\zcmd.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
