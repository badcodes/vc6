# Microsoft Developer Studio Generated NMAKE File, Based on xrzie.dsp
!IF "$(CFG)" == ""
CFG=xrzie - Win32 Debug
!MESSAGE No configuration specified. Defaulting to xrzie - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "xrzie - Win32 Release" && "$(CFG)" != "xrzie - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "xrzie.mak" CFG="xrzie - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "xrzie - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "xrzie - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "xrzie - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\xrzie.exe"


CLEAN :
	-@erase "$(INTDIR)\Main.obj"
	-@erase "$(INTDIR)\Start.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\webbrowser2.obj"
	-@erase "$(INTDIR)\xrzie.res"
	-@erase "$(OUTDIR)\xrzie.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /Fp"$(INTDIR)\xrzie.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\xrzie.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\xrzie.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\xrzie.pdb" /machine:I386 /out:"$(OUTDIR)\xrzie.exe" 
LINK32_OBJS= \
	"$(INTDIR)\xrzie.res" \
	"$(INTDIR)\Main.obj" \
	"$(INTDIR)\webbrowser2.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\Start.obj"

"$(OUTDIR)\xrzie.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "xrzie - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\xrzie.exe" "$(OUTDIR)\xrzie.bsc"


CLEAN :
	-@erase "$(INTDIR)\Main.obj"
	-@erase "$(INTDIR)\Main.sbr"
	-@erase "$(INTDIR)\Start.obj"
	-@erase "$(INTDIR)\Start.sbr"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\webbrowser2.obj"
	-@erase "$(INTDIR)\webbrowser2.sbr"
	-@erase "$(INTDIR)\xrzie.res"
	-@erase "$(OUTDIR)\xrzie.bsc"
	-@erase "$(OUTDIR)\xrzie.exe"
	-@erase "$(OUTDIR)\xrzie.ilk"
	-@erase "$(OUTDIR)\xrzie.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\xrzie.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\xrzie.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\xrzie.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\Main.sbr" \
	"$(INTDIR)\webbrowser2.sbr" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\Start.sbr"

"$(OUTDIR)\xrzie.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\xrzie.pdb" /debug /machine:I386 /out:"$(OUTDIR)\xrzie.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\xrzie.res" \
	"$(INTDIR)\Main.obj" \
	"$(INTDIR)\webbrowser2.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\Start.obj"

"$(OUTDIR)\xrzie.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
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


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("xrzie.dep")
!INCLUDE "xrzie.dep"
!ELSE 
!MESSAGE Warning: cannot find "xrzie.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "xrzie - Win32 Release" || "$(CFG)" == "xrzie - Win32 Debug"
SOURCE=.\Main.cpp

!IF  "$(CFG)" == "xrzie - Win32 Release"


"$(INTDIR)\Main.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "xrzie - Win32 Debug"


"$(INTDIR)\Main.obj"	"$(INTDIR)\Main.sbr" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\Start.cpp

!IF  "$(CFG)" == "xrzie - Win32 Release"


"$(INTDIR)\Start.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "xrzie - Win32 Debug"


"$(INTDIR)\Start.obj"	"$(INTDIR)\Start.sbr" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\stdafx.cpp

!IF  "$(CFG)" == "xrzie - Win32 Release"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "xrzie - Win32 Debug"


"$(INTDIR)\stdafx.obj"	"$(INTDIR)\stdafx.sbr" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\webbrowser2.cpp

!IF  "$(CFG)" == "xrzie - Win32 Release"


"$(INTDIR)\webbrowser2.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "xrzie - Win32 Debug"


"$(INTDIR)\webbrowser2.obj"	"$(INTDIR)\webbrowser2.sbr" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\xrzie.rc

"$(INTDIR)\xrzie.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

