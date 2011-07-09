#include <windows.h>
#include <ctype.h>
#include <tchar.h>
#include "mpshell.h"
#include "options.h"
#include "paths.h"
#include "wdebug.h"
#include "files.h"

HWND reg_win (HINSTANCE hInstance) {
	return NULL;
/*
    WNDCLASS wc; 
	HWND hwndMain = NULL;
    // Register the window class for the main window. 
 
   
        wc.style = 0; 
        //wc.lpfnWndProc = (WNDPROC) WndProc; 
        wc.cbClsExtra = 0; 
        wc.cbWndExtra = 0; 
        wc.hInstance = hInstance; 
		wc.hIcon = LoadIcon((HINSTANCE) NULL, IDI_APPLICATION); 

        //wc.hIcon = Load) Icon((HINSTANCE) NULL,  IDI_ICON_MAIN); 
        wc.hCursor = LoadCursor((HINSTANCE) NULL, 
            IDC_ARROW); 
        wc.hbrBackground = GetStockObject(WHITE_BRUSH); 
        wc.lpszMenuName =  TEXT("MainMenu"); 
        wc.lpszClassName = TEXT("MainWndClass"); 
 
        if (!RegisterClass(&wc)) 
            return	NULL;

 
    //hinst = hInstance;  // save instance handle 
 
    // Create the main window. 
 
   
	//hwndMain = CreateWindow(TEXT("MainWndClass"), APPNAME, 
    //    WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, 
    //    CW_USEDEFAULT, CW_USEDEFAULT, (HWND) NULL, 
    //    (HMENU) NULL, hInstance, (LPVOID) NULL); 
	
    // If the main window cannot be created, terminate 
    // the application. 
 
    if (!hwndMain) 
        return NULL; 
	return hwndMain;
	*/

}

LPTSTR get_my_dir(const LPTSTR appname) {
	LPTSTR pdir;
	TCHAR topdir[_MAX_PATH];
	LPTSTR filename;
	pdir = get_parent_dir(appname);
	if(pdir == NULL){
		pdir = get_current_dir();
	}
	if(pdir == NULL) {
		pdir = _tcsdup(TEXT("\\"));
	}	
	_tfullpath(topdir,pdir,_MAX_PATH);
	free(pdir);

	filename = build_path(topdir, DEFAULT_PROG);
	if(file_exists(filename)) {
		free(filename);
		return _tcsdup(topdir);
	}
//	free(filename);
	filename = build_path(topdir,SYSTEM_DIR TEXT("\\") DEFAULT_PROG);
	if(file_exists(filename)) {
		free(filename);
		return build_path(topdir,SYSTEM_DIR);
	}
//	free(filename);
	pdir = get_current_dir();
	_tcscpy(topdir,pdir);
	free(pdir);
	filename = build_path(topdir,SYSTEM_DIR TEXT("\\") DEFAULT_PROG);
	if(file_exists(filename)) {
		free(filename);
		return build_path(topdir,SYSTEM_DIR);
	}
//	free(filename);
	return NULL;
}

int APIENTRY WinMain( 
			HINSTANCE hInstance, 
			HINSTANCE hPrevInstance, 
			LPSTR lpCmdLine, 
			int nShowCmd 
			) 
{

	#ifdef _UNICODE
		size_t length = strlen(lpCmdLine)*sizeof(CHAR) + 1;
		LPTSTR command = (LPTSTR)malloc(length*sizeof(TCHAR));
	#else
		LPSTR command = lpCmdLine;
	#endif
	int nShow;
	LPTSTR got;
	LPTSTR remain;
	LPTSTR pdir;
	LPTSTR shellprog;
	
	HWND window = reg_win(hInstance);
		
	
	if(!(stricmp(lpCmdLine,"help") && stricmp(lpCmdLine,"--help") && stricmp(lpCmdLine,"-h"))) {
		MessageBox(window, APP_USAGE_MESSAGE, TEXT("Usage"),0);
		return 0;
	}
	opt_get_word(GetCommandLine(),&got,&remain);
#ifdef _DEBUG
	MessageBox(window,got,APPNAME,MB_OK);
#endif
	pdir = get_my_dir(got);
	if(pdir == NULL) {
		MessageBox(window,APP_ERROR_NO_SYSTEM, APP_ERROR_MSG,MB_ICONERROR | MB_OK);
		return 1;
	}

	
	//MessageBox(window,command,APPNAME,MB_OK);
	
	
	#ifdef _UNICODE
		mbstowcs(command,lpCmdLine,length);
	#endif

	opt_get_word(command,&got,&remain);
	if(_tcsicmp(got,TEXT("run"))==0) {
		//free(got);
		shellprog = build_path(pdir,DEFAULT_PROG);
		nShow = SW_HIDE;
	}
	else if(_tcsicmp(got,TEXT("shell"))==0) {
		//free(got);
		opt_get_word(remain,&got,&remain);
		shellprog = build_path(pdir,got);
		//free(got);
		nShow = SW_SHOW;
	}
	else {
		//free(got);
		shellprog = build_path(pdir,DEFAULT_PROG);
		remain = command;
		nShow = SW_SHOW;
	}
	
#ifndef _DEBUG		
	ShellExecute(NULL,TEXT("open"),shellprog,remain,NULL,nShow);
#else
	DEBUG_PRINT3(TEXT("shellprog = %s\ncommandline = %s%s"),shellprog,remain,TEXT("\n"));
#endif
	return 0;
}