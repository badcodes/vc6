#include <ctype.h>
#include "stdafx.h"
#include "Shell.h"

int ParseCommandLine(TCHAR* appname,int bufApp,TCHAR* arguments,int bufArg,const TCHAR* line)
{
	TCHAR* pline=NULL;
	int applen=0;
	int arglen=0;
	if(NULL == line || bufApp<1) {
		return 0;
	}
	pline = (TCHAR*)line;
	while(_istspace(*pline)) pline++;;
	if(!*pline) {
		*appname = 0;
		if(bufArg>0) {
			*arguments = 0;
		}
		return 1;
	}
	if(*pline == '\"') {
		char c=1;
		while(applen<bufApp-1 && (c = *(pline++))) {
			if(c=='\"') {
				break;
			}
			else {
				appname[applen++]=c;
			}
		}
		if(!c) {
			pline--;
		}
	}
	else {
		char c=1;
		while(applen<bufApp-1 && (c = *(pline++))) {
			if(_istspace(c)) {
				break;
			}
			else {
				appname[applen++]=c;
			}
		}
		if(!c) {
			pline--;
		}
	}
	appname[applen]=0;
	while(*pline && _istspace(*pline))
		pline++;

	if (bufArg>0 && !*pline) {
		*arguments=0;
	}
	else {
		_tcsncpy(arguments,pline,bufArg);
	}
	return 1;
}

int ExecuteCmdBG (const TCHAR* cmdline)
{
	STARTUPINFO si;
    PROCESS_INFORMATION pi;

    ZeroMemory( &si, sizeof(si) );
    si.cb = sizeof(si);
	si.wShowWindow = SW_SHOW;
    ZeroMemory( &pi, sizeof(pi) );

	TCHAR name[MAX_PATH];
	TCHAR pcmdline[MAX_PATH];
	TCHAR fullname[MAX_PATH];



	ParseCommandLine(name,MAX_PATH,pcmdline,MAX_PATH,cmdline);

	_tcscpy(fullname,name);
	if(!SearchPath(NULL,fullname,NULL,MAX_PATH,fullname,NULL)) {
		TCHAR* extname;
		extname = _tcsrchr(name,'.');
		if((NULL == extname) || _tcsicmp(extname,_T(".bat"))!=0) {
			_tcscat(fullname,_T(".bat"));
			if(SearchPath(NULL,fullname,NULL,MAX_PATH,fullname,NULL)) {
				_tcscpy(name,fullname);
			}
		}
	}
	else {
		_tcscpy(name,fullname);
	}
	//MessageBox(NULL,name,"ExecuteCmdBG",MB_OK);
	//if(_tcsrpbrk
	if((int)ShellExecute(NULL,_T("open"),name, pcmdline,NULL,SW_SHOW)<=32) {
		return 0;
	}

	/*
    // Start the child process.
    if( !CreateProcess( NULL, // No module name (use command line).
        pcmdline, // Command line.
        NULL,             // Process handle not inheritable.
        NULL,             // Thread handle not inheritable.
        FALSE,            // Set handle inheritance to FALSE.
        0, //CREATE_NO_WINDOW,                // No creation flags.
        NULL,             // Use parent's environment block.
        NULL,             // Use parent's starting directory.
        &si,              // Pointer to STARTUPINFO structure.
        &pi )             // Pointer to PROCESS_INFORMATION structure.
		)
    {
		return 0;
    }
    */
	return 1;

    //Wait until child process exits.
    //WaitForSingleObject( pi.hProcess, INFINITE );
    //Close process and thread handles.
    //CloseHandle( pi.hProcess );
    //CloseHandle( pi.hThread );

}
