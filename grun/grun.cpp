// grun.cpp  : Defines the entry point for the application.
//




#include "stdafx.h"
#include "resource.h"
#include "SimpleConfig.h"
#include "Shell.h"




#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;
/*							// current instance
TCHAR szTitle[MAX_LOADSTRING];								// The title bar text
TCHAR szWindowClass[MAX_LOADSTRING];								// The title bar text
*/
// Foward declarations of functions included in this code module:
//HWND				InitInstance(HINSTANCE, int);
BOOL CALLBACK AppProcD(HWND, UINT, WPARAM, LPARAM);


HWND hDialog;
HWND hInput;


int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{

	hInst = hInstance;
	DialogBox(hInst,(LPCTSTR)IDD_ABOUTBOX,NULL,(DLGPROC)AppProcD);
	return 0;
	/*
	CreateDialog(hInst,(LPCTSTR)IDD_ABOUTBOX,NULL,(DLGPROC)AppProcD);


 	// TODO: Place code here.
	HWND hWnd;
	MSG msg;
	HACCEL hAccelTable;

	DialogBox
	// Initialize global strings
	//LoadString(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
	//LoadString(hInstance, IDC_GRUN, szWindowClass, MAX_LOADSTRING);
	//MyRegisterClass(hInstance);
	MessageBox(NULL,TEXT("Starting..."),TEXT("GRUN"),MB_OK);
	// Perform application initialization:
	if (! (hWnd = InitInstance (hInstance, nCmdShow)))
	{
		MessageBox(NULL,TEXT("Init Error"),TEXT("GRUN"),MB_OK);
		return FALSE;
	}

	hAccelTable = LoadAccelerators(hInstance, (LPCTSTR)IDC_GRUN);

	// Main message loop:
	while (GetMessage(&msg, NULL, 0, 0))
	{
		if (!TranslateAccelerator(hWnd, hAccelTable, &msg) && (!IsDialogMessage(hWnd, &msg)))
		{
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}
	}

	MessageBox(NULL,TEXT("Exiting..."),TEXT("GRUN"),MB_OK);
	return msg.wParam;
	*/
}



//
//   FUNCTION: InitInstance(HANDLE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//

int PopupMenu(HWND hWnd,int x,int y) {
	HMENU hmenu;
	HMENU hmenuTrackPopup;
	if ((hmenu = LoadMenu(hInst,MAKEINTRESOURCE(ID_POPUPMENU))) == NULL)
        return 1;

    // TrackPopupMenu cannot display the menu bar so get
    // a handle to the first shortcut menu.

    hmenuTrackPopup = GetSubMenu(hmenu, 0);

    // Display the shortcut menu. Track the right mouse
    // button.

    TrackPopupMenu(hmenuTrackPopup,TPM_LEFTALIGN | TPM_RIGHTBUTTON, x, y, 0, hWnd, NULL);

    // Destroy the menu.

    DestroyMenu(hmenu);
	return 0;
}

void ClearInput(HWND hWnd)
{
	if(hWnd) {
		SendMessage(hWnd,CB_RESETCONTENT,0,0);
	}
}


void ResetInputText(HWND hWnd) {
	if(hWnd) {
		SendMessage(hWnd,WM_SETTEXT,0,(LPARAM)"");
	}
}

void InitInput(HWND hWnd) {
	if(hWnd) {
		int count=0;
		CSimpleConfig inihnd;
		ResetInputText(hWnd);
		count = inihnd.read(_T("InputCount"),&count);// _ttoi(inihnd.read("InputCount").c_str());
		for(int i=count-1;i>=0;i--) {
			SendMessage(hWnd,CB_ADDSTRING,0,(LPARAM)(inihnd.read(_T("InputText"),i)));
		}
	}
}
void SaveInput(HWND hWnd) {
	if(hWnd) {
		int count=0;
		CSimpleConfig inihnd;
		int len=256;
		TCHAR* tmp = new TCHAR[len+1];
		count = SendMessage(hWnd,CB_GETCOUNT,0,0);
		inihnd.write(_T("InputCount"), count);
		for(int i=0;i<count;i++) {
			int l = SendMessage(hWnd,CB_GETLBTEXTLEN,(WPARAM)i,(LPARAM)0);
			if(l>len) {
				len = l;
				delete [] tmp;
				tmp = new TCHAR[sizeof(TCHAR)*(len+1)];
			}
			SendMessage(hWnd,CB_GETLBTEXT,(WPARAM)i,(LPARAM)tmp);
			if(*tmp) {
				inihnd.write(_T("InputText"),i,tmp);
			}
		}
		delete [] tmp;
	}
}
void RecordInputText(HWND hWnd,TCHAR* text) {
	if(hWnd && text) {
		int count=0;
		int len=256;
		TCHAR* tmp = new TCHAR[sizeof(TCHAR)*(len+1)];
		count = SendMessage(hWnd,CB_GETCOUNT,0,0);
		for(int i=0;i<count;i++) {
			int l = SendMessage(hWnd,CB_GETLBTEXTLEN,(WPARAM)i,(LPARAM)0);
			if(l>len) {
				len = l;
				delete [] tmp;
				tmp = (TCHAR*)malloc(sizeof(TCHAR)*(len+1));
			}
			SendMessage(hWnd,CB_GETLBTEXT,(WPARAM)i,(LPARAM)tmp);
			if(_tcsicmp(text,tmp)==0) {
				SendMessage(hWnd,CB_DELETESTRING,(WPARAM)i,0);
				break;
			}
		}
		SendMessage(hWnd,CB_ADDSTRING,0,(LPARAM)text);
		delete [] tmp;
	}
}

void ProcessInputText(HWND hWnd) {
	if(hWnd) {
		int len;
		TCHAR* text;
		len = SendMessage(hWnd,WM_GETTEXTLENGTH,0,0);
		if(len>0) {
			text = (TCHAR*)malloc(sizeof(TCHAR)*(len+1));
			SendMessage(hWnd,WM_GETTEXT,(WPARAM)(len+1),(LPARAM)text);
			if(text) {
				if(ExecuteCmdBG(text)){ //(int)ShellExecute(NULL,"open",text,NULL,NULL,SW_SHOW)>32) {
					RecordInputText(hWnd,text);
				}
				//CreateProcess(NULL,text,NULL,NULL,FALSE,0,NULL,NULL,NULL,NULL);
			}
		}
	}
}
//
//  FUNCTION: AppProcD(HWND, unsigned, WORD, LONG)
//
//  PURPOSE:  Processes messages for the main window.
//
//  WM_COMMAND	- process the application menu
//  WM_PAINT	- Paint the main window
//  WM_DESTROY	- post a quit message and return
//
//
BOOL CALLBACK AppProcD(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		int wmId, wmEvent;
		case WM_INITDIALOG:
			hDialog = hWnd;
			hInput = GetDlgItem(hDialog,IDC_INPUT);
			InitInput(hInput);
			return TRUE;
			break;
		case WM_COMMAND:
			wmId    = LOWORD(wParam);
			wmEvent = HIWORD(wParam);
			// Parse the menu selections:
			switch (wmId)
			{
				case IDCANCEL:
					ResetInputText(hInput);
					return TRUE;
					break;
				case IDOK:
					ProcessInputText(hInput);
					return TRUE;
					break;
				case IDM_EXIT:
				   SaveInput(hInput);
				   EndDialog(hWnd,0);
				   return TRUE;
				   break;
				case IDM_CLEAR:
					ClearInput(hInput);
					return TRUE;
					break;
				default:
				   //return DefWindowProc(hWnd, message, wParam, lParam);
				   break;
			}
			break;
		//case WM_DESTROY:
		case WM_CLOSE:
			SaveInput(hInput);
			EndDialog(hWnd,0);
			return TRUE;
			break;
		case WM_CONTEXTMENU:
			return PopupMenu(hWnd, LOWORD(lParam),HIWORD(lParam));
			break;
		default:
			return FALSE;

   }
   return FALSE;
}

