# Microsoft Developer Studio Generated NMAKE File, Based on atlcom_1.dsp
!IF "$(CFG)" == ""
CFG=atlcom_1 - Win32 Debug
!MESSAGE No configuration specified. Defaulting to atlcom_1 - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "atlcom_1 - Win32 Debug" && "$(CFG)" != "atlcom_1 - Win32 Unicode Debug" && "$(CFG)" != "atlcom_1 - Win32 Release MinSize" && "$(CFG)" != "atlcom_1 - Win32 Release MinDependency" && "$(CFG)" != "atlcom_1 - Win32 Unicode Release MinSize" && "$(CFG)" != "atlcom_1 - Win32 Unicode Release MinDependency"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "atlcom_1.mak" CFG="atlcom_1 - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "atlcom_1 - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "atlcom_1 - Win32 Unicode Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "atlcom_1 - Win32 Release MinSize" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "atlcom_1 - Win32 Release MinDependency" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "atlcom_1 - Win32 Unicode Release MinSize" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "atlcom_1 - Win32 Unicode Release MinDependency" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "atlcom_1 - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\atlcom_1.dll" ".\Debug\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\atlcom_1.obj"
	-@erase "$(INTDIR)\atlcom_1.pch"
	-@erase "$(INTDIR)\atlcom_1.res"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\atlcom_1.dll"
	-@erase "$(OUTDIR)\atlcom_1.exp"
	-@erase "$(OUTDIR)\atlcom_1.ilk"
	-@erase "$(OUTDIR)\atlcom_1.lib"
	-@erase "$(OUTDIR)\atlcom_1.pdb"
	-@erase ".\atlcom_1.h"
	-@erase ".\atlcom_1.tlb"
	-@erase ".\atlcom_1_i.c"
	-@erase ".\Debug\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /Fp"$(INTDIR)\atlcom_1.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ     /c 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\atlcom_1.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\atlcom_1.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\atlcom_1.pdb" /debug /machine:I386 /def:".\atlcom_1.def" /out:"$(OUTDIR)\atlcom_1.dll" /implib:"$(OUTDIR)\atlcom_1.lib" /pdbtype:sept 
DEF_FILE= \
	".\atlcom_1.def"
LINK32_OBJS= \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\atlcom_1.obj" \
	"$(INTDIR)\atlcom_1.res"

"$(OUTDIR)\atlcom_1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\Debug
TargetPath=.\Debug\atlcom_1.dll
InputPath=.\Debug\atlcom_1.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg"
<< 
	

!ELSEIF  "$(CFG)" == "atlcom_1 - Win32 Unicode Debug"

OUTDIR=.\DebugU
INTDIR=.\DebugU
# Begin Custom Macros
OutDir=.\DebugU
# End Custom Macros

ALL : "$(OUTDIR)\atlcom_1.dll" ".\atlcom_1.h" ".\atlcom_1_i.c" ".\atlcom_1.tlb" ".\DebugU\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\atlcom_1.obj"
	-@erase "$(INTDIR)\atlcom_1.pch"
	-@erase "$(INTDIR)\atlcom_1.res"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\atlcom_1.dll"
	-@erase "$(OUTDIR)\atlcom_1.exp"
	-@erase "$(OUTDIR)\atlcom_1.ilk"
	-@erase "$(OUTDIR)\atlcom_1.lib"
	-@erase "$(OUTDIR)\atlcom_1.pdb"
	-@erase ".\atlcom_1.h"
	-@erase ".\atlcom_1.tlb"
	-@erase ".\atlcom_1_i.c"
	-@erase ".\DebugU\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)\atlcom_1.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ   /c 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\atlcom_1.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\atlcom_1.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\atlcom_1.pdb" /debug /machine:I386 /def:".\atlcom_1.def" /out:"$(OUTDIR)\atlcom_1.dll" /implib:"$(OUTDIR)\atlcom_1.lib" /pdbtype:sept 
DEF_FILE= \
	".\atlcom_1.def"
LINK32_OBJS= \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\atlcom_1.obj" \
	"$(INTDIR)\atlcom_1.res"

"$(OUTDIR)\atlcom_1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\DebugU
TargetPath=.\DebugU\atlcom_1.dll
InputPath=.\DebugU\atlcom_1.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	if "%OS%"=="" goto NOTNT 
	if not "%OS%"=="Windows_NT" goto NOTNT 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
	goto end 
	:NOTNT 
	echo Warning : Cannot register Unicode DLL on Windows 95 
	:end
<< 
	

!ELSEIF  "$(CFG)" == "atlcom_1 - Win32 Release MinSize"

OUTDIR=.\ReleaseMinSize
INTDIR=.\ReleaseMinSize
# Begin Custom Macros
OutDir=.\ReleaseMinSize
# End Custom Macros

ALL : "$(OUTDIR)\atlcom_1.dll" ".\atlcom_1.h" ".\atlcom_1_i.c" ".\atlcom_1.tlb" ".\ReleaseMinSize\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\atlcom_1.obj"
	-@erase "$(INTDIR)\atlcom_1.pch"
	-@erase "$(INTDIR)\atlcom_1.res"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\atlcom_1.dll"
	-@erase "$(OUTDIR)\atlcom_1.exp"
	-@erase "$(OUTDIR)\atlcom_1.lib"
	-@erase ".\atlcom_1.h"
	-@erase ".\atlcom_1.tlb"
	-@erase ".\atlcom_1_i.c"
	-@erase ".\ReleaseMinSize\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\atlcom_1.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\atlcom_1.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\atlcom_1.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\atlcom_1.pdb" /machine:I386 /def:".\atlcom_1.def" /out:"$(OUTDIR)\atlcom_1.dll" /implib:"$(OUTDIR)\atlcom_1.lib" 
DEF_FILE= \
	".\atlcom_1.def"
LINK32_OBJS= \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\atlcom_1.obj" \
	"$(INTDIR)\atlcom_1.res"

"$(OUTDIR)\atlcom_1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseMinSize
TargetPath=.\ReleaseMinSize\atlcom_1.dll
InputPath=.\ReleaseMinSize\atlcom_1.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg"
<< 
	

!ELSEIF  "$(CFG)" == "atlcom_1 - Win32 Release MinDependency"

OUTDIR=.\ReleaseMinDependency
INTDIR=.\ReleaseMinDependency
# Begin Custom Macros
OutDir=.\ReleaseMinDependency
# End Custom Macros

ALL : "$(OUTDIR)\atlcom_1.dll" ".\atlcom_1.h" ".\atlcom_1_i.c" ".\atlcom_1.tlb" ".\ReleaseMinDependency\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\atlcom_1.obj"
	-@erase "$(INTDIR)\atlcom_1.pch"
	-@erase "$(INTDIR)\atlcom_1.res"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\atlcom_1.dll"
	-@erase "$(OUTDIR)\atlcom_1.exp"
	-@erase "$(OUTDIR)\atlcom_1.lib"
	-@erase ".\atlcom_1.h"
	-@erase ".\atlcom_1.tlb"
	-@erase ".\atlcom_1_i.c"
	-@erase ".\ReleaseMinDependency\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_STATIC_REGISTRY" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\atlcom_1.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\atlcom_1.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\atlcom_1.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\atlcom_1.pdb" /machine:I386 /def:".\atlcom_1.def" /out:"$(OUTDIR)\atlcom_1.dll" /implib:"$(OUTDIR)\atlcom_1.lib" 
DEF_FILE= \
	".\atlcom_1.def"
LINK32_OBJS= \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\atlcom_1.obj" \
	"$(INTDIR)\atlcom_1.res"

"$(OUTDIR)\atlcom_1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseMinDependency
TargetPath=.\ReleaseMinDependency\atlcom_1.dll
InputPath=.\ReleaseMinDependency\atlcom_1.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg"
<< 
	

!ELSEIF  "$(CFG)" == "atlcom_1 - Win32 Unicode Release MinSize"

OUTDIR=.\ReleaseUMinSize
INTDIR=.\ReleaseUMinSize
# Begin Custom Macros
OutDir=.\ReleaseUMinSize
# End Custom Macros

ALL : "$(OUTDIR)\atlcom_1.dll" ".\atlcom_1.h" ".\atlcom_1_i.c" ".\atlcom_1.tlb" ".\ReleaseUMinSize\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\atlcom_1.obj"
	-@erase "$(INTDIR)\atlcom_1.pch"
	-@erase "$(INTDIR)\atlcom_1.res"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\atlcom_1.dll"
	-@erase "$(OUTDIR)\atlcom_1.exp"
	-@erase "$(OUTDIR)\atlcom_1.lib"
	-@erase ".\atlcom_1.h"
	-@erase ".\atlcom_1.tlb"
	-@erase ".\atlcom_1_i.c"
	-@erase ".\ReleaseUMinSize\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\atlcom_1.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\atlcom_1.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\atlcom_1.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\atlcom_1.pdb" /machine:I386 /def:".\atlcom_1.def" /out:"$(OUTDIR)\atlcom_1.dll" /implib:"$(OUTDIR)\atlcom_1.lib" 
DEF_FILE= \
	".\atlcom_1.def"
LINK32_OBJS= \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\atlcom_1.obj" \
	"$(INTDIR)\atlcom_1.res"

"$(OUTDIR)\atlcom_1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseUMinSize
TargetPath=.\ReleaseUMinSize\atlcom_1.dll
InputPath=.\ReleaseUMinSize\atlcom_1.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	if "%OS%"=="" goto NOTNT 
	if not "%OS%"=="Windows_NT" goto NOTNT 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
	goto end 
	:NOTNT 
	echo Warning : Cannot register Unicode DLL on Windows 95 
	:end
<< 
	

!ELSEIF  "$(CFG)" == "atlcom_1 - Win32 Unicode Release MinDependency"

OUTDIR=.\ReleaseUMinDependency
INTDIR=.\ReleaseUMinDependency
# Begin Custom Macros
OutDir=.\ReleaseUMinDependency
# End Custom Macros

ALL : "$(OUTDIR)\atlcom_1.dll" ".\atlcom_1.h" ".\atlcom_1_i.c" ".\atlcom_1.tlb" ".\ReleaseUMinDependency\regsvr32.trg"


CLEAN :
	-@erase "$(INTDIR)\atlcom_1.obj"
	-@erase "$(INTDIR)\atlcom_1.pch"
	-@erase "$(INTDIR)\atlcom_1.res"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\atlcom_1.dll"
	-@erase "$(OUTDIR)\atlcom_1.exp"
	-@erase "$(OUTDIR)\atlcom_1.lib"
	-@erase ".\atlcom_1.h"
	-@erase ".\atlcom_1.tlb"
	-@erase ".\atlcom_1_i.c"
	-@erase ".\ReleaseUMinDependency\regsvr32.trg"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_ATL_STATIC_REGISTRY" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\atlcom_1.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\atlcom_1.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\atlcom_1.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\atlcom_1.pdb" /machine:I386 /def:".\atlcom_1.def" /out:"$(OUTDIR)\atlcom_1.dll" /implib:"$(OUTDIR)\atlcom_1.lib" 
DEF_FILE= \
	".\atlcom_1.def"
LINK32_OBJS= \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\atlcom_1.obj" \
	"$(INTDIR)\atlcom_1.res"

"$(OUTDIR)\atlcom_1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

OutDir=.\ReleaseUMinDependency
TargetPath=.\ReleaseUMinDependency\atlcom_1.dll
InputPath=.\ReleaseUMinDependency\atlcom_1.dll
SOURCE="$(InputPath)"

"$(OUTDIR)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	if "%OS%"=="" goto NOTNT 
	if not "%OS%"=="Windows_NT" goto NOTNT 
	regsvr32 /s /c "$(TargetPath)" 
	echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg" 
	goto end 
	:NOTNT 
	echo Warning : Cannot register Unicode DLL on Windows 95 
	:end
<< 
	

!ENDIF 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL_PROJ=

!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("atlcom_1.dep")
!INCLUDE "atlcom_1.dep"
!ELSE 
!MESSAGE Warning: cannot find "atlcom_1.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "atlcom_1 - Win32 Debug" || "$(CFG)" == "atlcom_1 - Win32 Unicode Debug" || "$(CFG)" == "atlcom_1 - Win32 Release MinSize" || "$(CFG)" == "atlcom_1 - Win32 Release MinDependency" || "$(CFG)" == "atlcom_1 - Win32 Unicode Release MinSize" || "$(CFG)" == "atlcom_1 - Win32 Unicode Release MinDependency"
SOURCE=.\atlcom_1.cpp

"$(INTDIR)\atlcom_1.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\atlcom_1.pch" ".\atlcom_1_i.c" ".\atlcom_1.h"


SOURCE=.\atlcom_1.idl
MTL_SWITCHES=/tlb ".\atlcom_1.tlb" /h "atlcom_1.h" /iid "atlcom_1_i.c" /Oicf 

".\atlcom_1.tlb"	".\atlcom_1.h"	".\atlcom_1_i.c" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


SOURCE=.\atlcom_1.rc

"$(INTDIR)\atlcom_1.res" : $(SOURCE) "$(INTDIR)" ".\atlcom_1.tlb"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "atlcom_1 - Win32 Debug"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /Fp"$(INTDIR)\atlcom_1.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ     /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\atlcom_1.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "atlcom_1 - Win32 Unicode Debug"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)\atlcom_1.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ   /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\atlcom_1.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "atlcom_1 - Win32 Release MinSize"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\atlcom_1.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\atlcom_1.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "atlcom_1 - Win32 Release MinDependency"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_ATL_STATIC_REGISTRY" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\atlcom_1.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\atlcom_1.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "atlcom_1 - Win32 Unicode Release MinSize"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_ATL_DLL" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\atlcom_1.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\atlcom_1.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "atlcom_1 - Win32 Unicode Release MinDependency"

CPP_SWITCHES=/nologo /MT /W3 /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_UNICODE" /D "_ATL_STATIC_REGISTRY" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\atlcom_1.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\atlcom_1.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 


!ENDIF 

