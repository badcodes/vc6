//     Main.cpp : implementation file
//

#include "stdafx.h"
#include "start.h"
#include "main.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMain dialog


CMain::CMain(CWnd* pParent /*=NULL*/,Start* const pStarter)
	: CDialog(CMain::IDD, pParent)
{
	EnableAutomation();
	m_starter = pStarter;
	//{{AFX_DATA_INIT(CMain)
	//}}AFX_DATA_INIT
}


void CMain::OnFinalRelease()
{
	// When the last reference for an automation object is released
	// OnFinalRelease is called.  The base class will automatically
	// deletes the object.  Add additional cleanup required for your
	// object before calling the base class.

	CDialog::OnFinalRelease();
}

void CMain::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CMain)
	DDX_Control(pDX, ID_MAIN_ADDRESS_EDIT, m_url);
	DDX_Control(pDX, ID_MAIN_STATUS_TEXT, m_status);
	DDX_Control(pDX, ID_MAIN_ADDRESS_BUTTON, m_button);
	DDX_Control(pDX, ID_MAIN_HTMLVIEW, m_htmlview);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CMain, CDialog)
	//{{AFX_MSG_MAP(CMain)
	ON_BN_CLICKED(ID_MAIN_ADDRESS_BUTTON, OnMainAddressButton)
	ON_WM_SIZE()
	ON_WM_CLOSE()
	//}}AFX_MSG_MAP
	//ON_MESSAGE(DM_GETDEFID, OnGetDefID)
END_MESSAGE_MAP()

BEGIN_DISPATCH_MAP(CMain, CDialog)
	//{{AFX_DISPATCH_MAP(CMain)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_DISPATCH_MAP
END_DISPATCH_MAP()

// Note: we add support for IID_IMain to support typesafe binding
//  from VBA.  This IID must match the GUID that is attached to the 
//  dispinterface in the .ODL file.

// {7180A253-F5F6-4F3A-B050-7FA804405F9D}
static const IID IID_IMain =
{ 0x7180a253, 0xf5f6, 0x4f3a, { 0xb0, 0x50, 0x7f, 0xa8, 0x4, 0x40, 0x5f, 0x9d } };

BEGIN_INTERFACE_MAP(CMain, CDialog)
	INTERFACE_PART(CMain, IID_IMain, Dispatch)
END_INTERFACE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMain message handlers

void CMain::OnMainAddressButton() 
{
	CString url;
	m_url.GetWindowText(url);
	m_htmlview.Navigate(url,NULL,NULL,NULL,NULL);	
}

BEGIN_EVENTSINK_MAP(CMain, CDialog)
    //{{AFX_EVENTSINK_MAP(CMain)
	ON_EVENT(CMain, ID_MAIN_HTMLVIEW, 102 /* StatusTextChange */, OnStatusTextChangeMainHtmlview, VTS_BSTR)
	ON_EVENT(CMain, ID_MAIN_HTMLVIEW, 250 /* BeforeNavigate2 */, OnBeforeNavigate2MainHtmlview, VTS_DISPATCH VTS_PVARIANT VTS_PVARIANT VTS_PVARIANT VTS_PVARIANT VTS_PVARIANT VTS_PBOOL)
	ON_EVENT(CMain, ID_MAIN_HTMLVIEW, 251 /* NewWindow2 */, OnNewWindow2MainHtmlview, VTS_PDISPATCH VTS_PBOOL)
	//}}AFX_EVENTSINK_MAP
END_EVENTSINK_MAP()

void CMain::OnStatusTextChangeMainHtmlview(LPCTSTR Text) 
{
	// TODO: Add your control notification handler code here
	m_status.SetWindowText(Text);
}

void CMain::OnSize(UINT nType, int cx, int cy) 
{
	RECT bRect;
	RECT uRect;
	RECT hRect;
	RECT sRect;
	int w;
	int h;
	static w_sp = 5;
	static h_sp = 5;

	CDialog::OnSize(nType, cx, cy);

	LockWindowUpdate();
	m_url.GetClientRect(&uRect);
	m_button.GetClientRect(&bRect);	
	m_status.GetClientRect(&sRect);
	m_htmlview.GetClientRect(&hRect);

	
	
	
	//align to bottom, fill all gap
	//uRect.bottom = uRect.bottom - uRect.top;
	uRect.bottom = 24;
	uRect.top = 0;
	
	
	w = bRect.right - bRect.left;
	h = bRect.bottom - bRect.top;
	bRect.right = cx - w_sp;
	bRect.left = bRect.right - w;
	bRect.top = uRect.bottom - h;
	bRect.bottom = uRect.bottom;
		
	uRect.left = w_sp;
	uRect.right = bRect.left - w_sp;
	
	sRect.left = w_sp;
	sRect.right = cx - w_sp;
	sRect.bottom = cy - h_sp;
	sRect.top = sRect.bottom - 24;
	

	hRect.left = w_sp;
	hRect.top = uRect.bottom + h_sp;
	hRect.right = cx - w_sp;
	hRect.bottom = sRect.top;// - h_sp;
	
	m_button.MoveWindow(&bRect,TRUE);
	m_url.MoveWindow(&uRect,TRUE);
	m_htmlview.MoveWindow(&hRect,TRUE);
	m_status.MoveWindow(&sRect,TRUE);

	UnlockWindowUpdate();
	//UpdateWindow();
	//m_htmlview.MoveWindow(0,bRect.bottom ,cx,cy,TRUE);
	// TODO: Add your message handler code here
	
}

BOOL CMain::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	m_htmlview.Navigate(_T("about:blank"),NULL,NULL,NULL,NULL);
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CMain::OnBeforeNavigate2MainHtmlview(LPDISPATCH pDisp, VARIANT FAR* URL, VARIANT FAR* Flags, VARIANT FAR* TargetFrameName, VARIANT FAR* PostData, VARIANT FAR* Headers, BOOL FAR* Cancel) 
{
	// TODO: Add your control notification handler code here
	//url = m_htmlview.GetLocationURL();
	BSTR bURL = URL->bstrVal;
	LPCWSTR wURL = (LPCWSTR)bURL;
	if(NULL == wURL) {
		return;
	}
	#if defined(_MBCS)
		char* cURL = (char*)malloc(sizeof(CHAR)*MAX_PATH);
		WideCharToMultiByte(CP_OEMCP,0,wURL,-1,cURL,MAX_PATH,NULL,NULL);
		m_url.SetWindowText(cURL);
		free(cURL);
	#else
		m_url.SetWindowText(wURL);
	#endif
}

void CMain::OnNewWindow2MainHtmlview(LPDISPATCH FAR* ppDisp, BOOL FAR* Cancel) 
{
	//*Cancel=TRUE;
	CMain* m_dlgNewWB = m_starter->CreateNewWindow();//new CMain;
	m_dlgNewWB->Create(CMain::IDD);
	m_dlgNewWB->m_htmlview.SetRegisterAsBrowser(TRUE);
	m_dlgNewWB->ShowWindow(SW_SHOW);
	m_dlgNewWB->UpdateWindow();
	*ppDisp = m_dlgNewWB->m_htmlview.GetApplication();
}	

void CMain::OnCancel()
{

}

/*
LRESULT CMain::OnGetDefID(WPARAM wp, LPARAM lp) 
{
    return MAKELONG(0,DC_HASDEFID); 
} 
*/

void CMain::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	// m_htmlview.Quit();
	CDialog::OnCancel();
}
