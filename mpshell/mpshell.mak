# Microsoft Developer Studio Generated NMAKE File, Based on mpshell.dsp
!IF "$(CFG)" == ""
CFG=mpshell - Win32 Debug
!MESSAGE No configuration specified. Defaulting to mpshell - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "mpshell - Win32 Release" && "$(CFG)" != "mpshell - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "mpshell.mak" CFG="mpshell - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "mpshell - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "mpshell - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "mpshell - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\mpshell.exe"


CLEAN :
	-@erase "$(INTDIR)\files.obj"
	-@erase "$(INTDIR)\mpshell.obj"
	-@erase "$(INTDIR)\options.obj"
	-@erase "$(INTDIR)\paths.obj"
	-@erase "$(INTDIR)\resources.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\mpshell.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "NDEBUG" /D "_MBCS" /D "_UNICODE" /D "WIN32" /D "_WINDOWS" /D "UNICODE" /Fp"$(INTDIR)\mpshell.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\resources.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mpshell.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\mpshell.pdb" /machine:I386 /out:"$(OUTDIR)\mpshell.exe" 
LINK32_OBJS= \
	"$(INTDIR)\mpshell.obj" \
	"$(INTDIR)\options.obj" \
	"$(INTDIR)\paths.obj" \
	"$(INTDIR)\resources.res" \
	"$(INTDIR)\files.obj"

"$(OUTDIR)\mpshell.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "mpshell - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\mpshell.exe" "$(OUTDIR)\mpshell.bsc"


CLEAN :
	-@erase "$(INTDIR)\files.obj"
	-@erase "$(INTDIR)\files.sbr"
	-@erase "$(INTDIR)\mpshell.obj"
	-@erase "$(INTDIR)\mpshell.sbr"
	-@erase "$(INTDIR)\options.obj"
	-@erase "$(INTDIR)\options.sbr"
	-@erase "$(INTDIR)\paths.obj"
	-@erase "$(INTDIR)\paths.sbr"
	-@erase "$(INTDIR)\resources.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\mpshell.bsc"
	-@erase "$(OUTDIR)\mpshell.exe"
	-@erase "$(OUTDIR)\mpshell.ilk"
	-@erase "$(OUTDIR)\mpshell.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /D "_DEBUG" /D "_UNICODE" /D "WIN32" /D "_WINDOWS" /D "UNICODE" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\mpshell.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x804 /fo"$(INTDIR)\resources.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mpshell.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\mpshell.sbr" \
	"$(INTDIR)\options.sbr" \
	"$(INTDIR)\paths.sbr" \
	"$(INTDIR)\files.sbr"

"$(OUTDIR)\mpshell.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\mpshell.pdb" /debug /machine:I386 /out:"$(OUTDIR)\mpshell.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\mpshell.obj" \
	"$(INTDIR)\options.obj" \
	"$(INTDIR)\paths.obj" \
	"$(INTDIR)\resources.res" \
	"$(INTDIR)\files.obj"

"$(OUTDIR)\mpshell.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("mpshell.dep")
!INCLUDE "mpshell.dep"
!ELSE 
!MESSAGE Warning: cannot find "mpshell.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "mpshell - Win32 Release" || "$(CFG)" == "mpshell - Win32 Debug"
SOURCE=..\..\codebase\c\xrzlib\src\files.c

!IF  "$(CFG)" == "mpshell - Win32 Release"


"$(INTDIR)\files.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mpshell - Win32 Debug"


"$(INTDIR)\files.obj"	"$(INTDIR)\files.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\src\mpshell.c

!IF  "$(CFG)" == "mpshell - Win32 Release"


"$(INTDIR)\mpshell.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mpshell - Win32 Debug"


"$(INTDIR)\mpshell.obj"	"$(INTDIR)\mpshell.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\codebase\c\xrzlib\src\options.c

!IF  "$(CFG)" == "mpshell - Win32 Release"


"$(INTDIR)\options.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mpshell - Win32 Debug"


"$(INTDIR)\options.obj"	"$(INTDIR)\options.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\codebase\c\xrzlib\src\paths.c

!IF  "$(CFG)" == "mpshell - Win32 Release"


"$(INTDIR)\paths.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "mpshell - Win32 Debug"


"$(INTDIR)\paths.obj"	"$(INTDIR)\paths.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\res\resources.rc

!IF  "$(CFG)" == "mpshell - Win32 Release"


"$(INTDIR)\resources.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x804 /fo"$(INTDIR)\resources.res" /i "res" /d "NDEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "mpshell - Win32 Debug"


"$(INTDIR)\resources.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x804 /fo"$(INTDIR)\resources.res" /i "res" /d "_DEBUG" $(SOURCE)


!ENDIF 


!ENDIF 

