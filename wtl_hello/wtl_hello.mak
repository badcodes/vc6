# Microsoft Developer Studio Generated NMAKE File, Based on wtl_hello.dsp
!IF "$(CFG)" == ""
CFG=wtl_hello - Win32 Debug
!MESSAGE No configuration specified. Defaulting to wtl_hello - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "wtl_hello - Win32 Release" && "$(CFG)" != "wtl_hello - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wtl_hello.mak" CFG="wtl_hello - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wtl_hello - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "wtl_hello - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "wtl_hello - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\wtl_hello.exe"


CLEAN :
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\wtl_hello.obj"
	-@erase "$(INTDIR)\wtl_hello.pch"
	-@erase "$(INTDIR)\wtl_hello.res"
	-@erase "$(OUTDIR)\wtl_hello.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "STRICT" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\wtl_hello.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\wtl_hello.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wtl_hello.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\wtl_hello.pdb" /machine:I386 /out:"$(OUTDIR)\wtl_hello.exe" 
LINK32_OBJS= \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\wtl_hello.obj" \
	"$(INTDIR)\wtl_hello.res"

"$(OUTDIR)\wtl_hello.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtl_hello - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\wtl_hello.exe" "$(OUTDIR)\wtl_hello.bsc"


CLEAN :
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\wtl_hello.obj"
	-@erase "$(INTDIR)\wtl_hello.pch"
	-@erase "$(INTDIR)\wtl_hello.res"
	-@erase "$(INTDIR)\wtl_hello.sbr"
	-@erase "$(OUTDIR)\wtl_hello.bsc"
	-@erase "$(OUTDIR)\wtl_hello.exe"
	-@erase "$(OUTDIR)\wtl_hello.ilk"
	-@erase "$(OUTDIR)\wtl_hello.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "STRICT" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\wtl_hello.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\wtl_hello.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wtl_hello.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\wtl_hello.sbr"

"$(OUTDIR)\wtl_hello.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\wtl_hello.pdb" /debug /machine:I386 /out:"$(OUTDIR)\wtl_hello.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\wtl_hello.obj" \
	"$(INTDIR)\wtl_hello.res"

"$(OUTDIR)\wtl_hello.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wtl_hello.dep")
!INCLUDE "wtl_hello.dep"
!ELSE 
!MESSAGE Warning: cannot find "wtl_hello.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wtl_hello - Win32 Release" || "$(CFG)" == "wtl_hello - Win32 Debug"
SOURCE=.\stdafx.cpp

!IF  "$(CFG)" == "wtl_hello - Win32 Release"

CPP_SWITCHES=/nologo /MT /W3 /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "STRICT" /D "_ATL_MIN_CRT" /Fp"$(INTDIR)\wtl_hello.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\stdafx.obj"	"$(INTDIR)\wtl_hello.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "wtl_hello - Win32 Debug"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "STRICT" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\wtl_hello.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\stdafx.obj"	"$(INTDIR)\stdafx.sbr"	"$(INTDIR)\wtl_hello.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\wtl_hello.cpp

!IF  "$(CFG)" == "wtl_hello - Win32 Release"


"$(INTDIR)\wtl_hello.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\wtl_hello.pch"


!ELSEIF  "$(CFG)" == "wtl_hello - Win32 Debug"


"$(INTDIR)\wtl_hello.obj"	"$(INTDIR)\wtl_hello.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\wtl_hello.pch"


!ENDIF 

SOURCE=.\wtl_hello.rc

"$(INTDIR)\wtl_hello.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

