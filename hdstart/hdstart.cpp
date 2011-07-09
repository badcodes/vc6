// hdstart.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "hdstart.h"
#include <Shellapi.h>
#include <tchar.h>
#include <ctype.h>
#include <stdlib.h>

//int _stdcall opt_get_word(const TCHAR* source, TCHAR** dgot, TCHAR** dremain);
extern "C" {
	int opt_get_word(const TCHAR*,TCHAR**,TCHAR**);
}

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
	if(strlen(lpCmdLine) <1) {
		MessageBox(NULL, APP_USAGE_MESSAGE, TEXT("Usage"),0);
		return 0;
	}
	//MessageBox(NULL,command,APPNAME,MB_OK);
	
	#ifdef _DEBUG
		int nShow = SW_SHOW;
	#else
		int nShow = SW_HIDE;
	#endif
	#ifdef _UNICODE
		size_t length = strlen(lpCmdLine)*sizeof(CHAR) + 1;
		LPTSTR command = (LPTSTR)malloc(length*sizeof(TCHAR));
		mbstowcs(command,lpCmdLine,length);
	#else
		LPSTR command = lpCmdLine;
	#endif
	LPTSTR got;
	LPTSTR remain;
	opt_get_word(command,&got,&remain);
	ShellExecute(NULL,TEXT("open"),got,remain,NULL,nShow);
	free(got);
	return 0;

}



