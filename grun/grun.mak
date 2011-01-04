# Microsoft Developer Studio Generated NMAKE File, Based on grun.dsp
!IF "$(CFG)" == ""
CFG=grun - Win32 Debug
!MESSAGE No configuration specified. Defaulting to grun - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "grun - Win32 Release" && "$(CFG)" != "grun - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "grun.mak" CFG="grun - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "grun - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "grun - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "grun - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\grun.exe" "$(OUTDIR)\grun.bsc"


CLEAN :
	-@erase "$(INTDIR)\grun.obj"
	-@erase "$(INTDIR)\grun.pch"
	-@erase "$(INTDIR)\grun.res"
	-@erase "$(INTDIR)\grun.sbr"
	-@erase "$(INTDIR)\Shell.obj"
	-@erase "$(INTDIR)\Shell.sbr"
	-@erase "$(INTDIR)\SimpleConfig.obj"
	-@erase "$(INTDIR)\SimpleConfig.sbr"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\StdAfx.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\grun.bsc"
	-@erase "$(OUTDIR)\grun.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\grun.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\grun.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\grun.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\grun.sbr" \
	"$(INTDIR)\Shell.sbr" \
	"$(INTDIR)\SimpleConfig.sbr" \
	"$(INTDIR)\StdAfx.sbr"

"$(OUTDIR)\grun.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\grun.pdb" /machine:I386 /out:"$(OUTDIR)\grun.exe" /verbose:lib 
LINK32_OBJS= \
	"$(INTDIR)\grun.obj" \
	"$(INTDIR)\Shell.obj" \
	"$(INTDIR)\SimpleConfig.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\grun.res"

"$(OUTDIR)\grun.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "grun - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\grun.exe" "$(OUTDIR)\grun.bsc"


CLEAN :
	-@erase "$(INTDIR)\grun.obj"
	-@erase "$(INTDIR)\grun.pch"
	-@erase "$(INTDIR)\grun.res"
	-@erase "$(INTDIR)\grun.sbr"
	-@erase "$(INTDIR)\Shell.obj"
	-@erase "$(INTDIR)\Shell.sbr"
	-@erase "$(INTDIR)\SimpleConfig.obj"
	-@erase "$(INTDIR)\SimpleConfig.sbr"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\StdAfx.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\grun.bsc"
	-@erase "$(OUTDIR)\grun.exe"
	-@erase "$(OUTDIR)\grun.ilk"
	-@erase "$(OUTDIR)\grun.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\grun.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\grun.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\grun.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\grun.sbr" \
	"$(INTDIR)\Shell.sbr" \
	"$(INTDIR)\SimpleConfig.sbr" \
	"$(INTDIR)\StdAfx.sbr"

"$(OUTDIR)\grun.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\grun.pdb" /debug /machine:I386 /out:"$(OUTDIR)\grun.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\grun.obj" \
	"$(INTDIR)\Shell.obj" \
	"$(INTDIR)\SimpleConfig.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\grun.res"

"$(OUTDIR)\grun.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("grun.dep")
!INCLUDE "grun.dep"
!ELSE 
!MESSAGE Warning: cannot find "grun.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "grun - Win32 Release" || "$(CFG)" == "grun - Win32 Debug"
SOURCE=.\grun.cpp

"$(INTDIR)\grun.obj"	"$(INTDIR)\grun.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\grun.pch"


SOURCE=.\grun.rc

"$(INTDIR)\grun.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\Shell.cpp

"$(INTDIR)\Shell.obj"	"$(INTDIR)\Shell.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\grun.pch"


SOURCE=.\SimpleConfig.cpp

"$(INTDIR)\SimpleConfig.obj"	"$(INTDIR)\SimpleConfig.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\grun.pch"


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "grun - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\grun.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\StdAfx.sbr"	"$(INTDIR)\grun.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "grun - Win32 Debug"

CPP_SWITCHES=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\grun.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\StdAfx.sbr"	"$(INTDIR)\grun.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 


!ENDIF 

