// Start.cpp: implementation of the Start class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Start.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

Start app;
//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

Start::Start()
{

}

Start::~Start()
{

}

BOOL Start::InitInstance( ) 
{
	AfxEnableControlContainer( );
	CMain* main = CreateNewWindow();
	m_pMainWnd = main;
	main->DoModal();
	return TRUE;
}


CMain* Start::CreateNewWindow()
{
	CMain* pWin= new CMain(NULL,this);
	return pWin;
}
