// hdstart.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "hdstart.h"
#include <shellapi.h>
#include <stdlib.h>
#include <string.h>

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
	/*
	LPTSTR* argv;
	int argc;
	LPTSTR file;
	LPTSTR params;
	argv = CommandLineToArgvW(GetCommandLine(),&argc);
	if(argc==1) {
		MessageBox(NULL, TEXT("hdstart\n\t--start in hidden window\nUsage:\n\thdstart filename [Parameter,...]") ,APPNAME, 0);
		return 0;
	}
	file = argv[1];
	params = (LPTSTR)malloc(1024*sizeof(char)+1);
	params[0] = 0;
	if(argc>2) {
		lstrcpy(params,TEXT("\""));
		lstrcat(params,argv[2]);
		lstrcat(params,TEXT("\""));
	}
	for(int i=3;i<argc;i++) {
		lstrcat(params,TEXT(" \""));
		lstrcat(params,argv[i]);
		lstrcat(params,TEXT("\""));
	}
	ShellExecute(NULL,TEXT("open"),file,params,NULL,SW_HIDE);
	*/
#ifdef _UNICODE
	size_t length = strlen(lpCmdLine)*2 + 1;
	LPTSTR wline = (LPTSTR)malloc(length*sizeof(TCHAR));
	mbstowcs(wline,lpCmdLine,length);
	//MessageBox(NULL,wline,TEXT("TEST"),MB_OK);
	ShellExecute(NULL,TEXT("open"),wline,NULL,NULL,SW_HIDE);
#else
	//MessageBox(NULL,lpCmdLine,"TEST",MB_OK);
	ShellExecute(NULL,TEXT("open"),lpCmdLine,NULL,NULL,SW_HIDE);
#endif
	return 0;

}



