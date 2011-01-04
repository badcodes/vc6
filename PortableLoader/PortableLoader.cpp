// msdev.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include <tchar.h>
#include <shellapi.h>
#include <stdlib.h>

#define APPNAME _T("PortableLoader")
#define MAX_CMDLINE 1024
#define MAX_KEYS	32


TCHAR program[MAX_CMDLINE];
TCHAR* keys[MAX_KEYS];
int keys_count;
TCHAR data_file[MAX_PATH];

#ifdef NDEBUG
	#define say(MSG) 
#else
void say(const TCHAR* what) {
	MessageBox(NULL,what,_T("Are you listening?"),MB_OK);
}
#endif

int execute(const TCHAR* cmd,int nCmdShow)
{
    STARTUPINFO si;
    PROCESS_INFORMATION pi;
	TCHAR pcmd[MAX_PATH];

	if(!cmd) {
		return 0;
	}
	_tcscpy(pcmd,cmd);

    ZeroMemory( &si, sizeof(si) );
    si.cb = sizeof(si);
    ZeroMemory( &pi, sizeof(pi) );
	si.wShowWindow = nCmdShow;
	
	say(pcmd);
	//return 1;
    // Start the child process. 
    if( !CreateProcess( NULL,   // No module name (use command line)
        pcmd,	        // Command line
        NULL,           // Process handle not inheritable
        NULL,           // Thread handle not inheritable
        FALSE,          // Set handle inheritance to FALSE
        0,              // No creation flags
        NULL,           // Use parent's environment block
        NULL,           // Use parent's starting directory 
        &si,            // Pointer to STARTUPINFO structure
        &pi )           // Pointer to PROCESS_INFORMATION structure
    ) 
    {
        return 0;
    }

    // Wait until child process exits.
    WaitForSingleObject( pi.hProcess, INFINITE );

    // Close process and thread handles. 
    CloseHandle( pi.hProcess );
    CloseHandle( pi.hThread );
	return 1;
}

TCHAR* build_cmd(const TCHAR* prefix1,const TCHAR* prefix2) {
	static TCHAR R[MAX_CMDLINE];
	int i=0;
	int len=0;
	TCHAR* src;
	src = (TCHAR*)prefix1;
	while(*src && len<MAX_CMDLINE-1) {
		R[len++] = *(src++);
	}
	src = (TCHAR*)prefix2;
	if(src && len<MAX_CMDLINE-1) {
		R[len++] = ' ';
	}
	while(*src && len<MAX_CMDLINE-1) {
		R[len++] = *(src++);
	}
	for(i=0;i<keys_count;i++) {
		if(len>=MAX_CMDLINE-1) {
			break;
		}
		if(keys[i][0]) {
			R[len++] = ' ';
		}
		int j=0;
		while(keys[i][j] && len<MAX_CMDLINE-1) {
			R[len++]=keys[i][j++];
		}
	}
	R[len]='\0';
	return R;
}

int save() {
	TCHAR* cmd;
	if(keys_count<1) {
		return 0;
	}
	cmd = build_cmd(_T("regedit.exe /S /E"),data_file);
	execute(cmd,SW_HIDE);
	return 1;
}

int load() {
	TCHAR* cmd;
	cmd = (TCHAR*)malloc(sizeof(TCHAR)*MAX_CMDLINE);
	_tcscpy(cmd,_T("regedit.exe /S"));
	_tcscat(cmd,_T(" "));
	_tcscat(cmd,data_file);
	execute(cmd,SW_HIDE);
	free(cmd);
	return 1;
}

int msdev()
{
	if(program[0]) {
		load();
		execute(program,SW_SHOW);
		save();
		return 1;
	}
	else {
		MessageBox(NULL,
			_T("Error: No program.\n\nUsage:\n\n    ") APPNAME _T(" commands... --reg REGISTRY KEY\n"),
			APPNAME,
			MB_OK);
	}
	return 0;
}

int APIENTRY _tWinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
 	
	TCHAR cwd[MAX_PATH];
	LPTSTR basename;
	int argc;
#ifndef _UNICODE
	char** argv;

	argc=__argc;
	argv=__argv;
#else
	TCHAR** argv; 
    argv = CommandLineToArgvW(GetCommandLineW(), &argc);
#endif

	say(_T("Begin"));
	GetCurrentDirectory(MAX_PATH,cwd);
	
	basename = _tcsrchr(argv[0],'\\');
	if(basename == NULL) 
		basename = argv[0];
	else
		basename++;
	_tcscpy(data_file,cwd);
	_tcscat(data_file,_T("\\"));
	_tcscat(data_file,basename);
	_tcscat(data_file,_T(".reg"));
	say(data_file);

	int i=2;
	program[0]='\0';
	if(argc>1) {
		_tcscpy(program,argv[1]);
	}
	for(i=2;i<argc;i++) {
		if(_tcsicmp(argv[i],_T("--reg"))==0) {
			i++;
			break;
		}
		_tcscat(program,_T(" "));
		_tcscat(program,argv[i]);
	}
	for(;i<argc;i++) {
		keys[keys_count]=argv[i];
		keys_count++;
		if(keys_count>=MAX_KEYS) {
			break;
		}
	}
	msdev();
	say(_T("Terminated"));
	return 0;
}




