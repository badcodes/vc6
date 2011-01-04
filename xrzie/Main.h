//{{AFX_INCLUDES()
#include "webbrowser2.h"
//}}AFX_INCLUDES
#if !defined(AFX_MAIN_H__EE4E8C42_37E5_4C2D_9DE9_BBFD2E103D5F__INCLUDED_)
#define AFX_MAIN_H__EE4E8C42_37E5_4C2D_9DE9_BBFD2E103D5F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Main.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CMain dialog

class CMain : public CDialog
{
// Construction
public:
	CMain(CWnd* pParent = NULL,Start* const pStarter = NULL);   // standard constructor
	Start* m_starter;
//CList<CMain,CMain&> m_children;
// Dialog Data
	//{{AFX_DATA(CMain)
	enum { IDD = IDD_MAIN };
	CEdit	m_url;
	CStatic	m_status;
	CButton	m_button;
	CWebBrowser2	m_htmlview;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMain)
	public:
	virtual void OnFinalRelease();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CMain)
	afx_msg void OnMainAddressButton();
	afx_msg void OnStatusTextChangeMainHtmlview(LPCTSTR Text);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	virtual BOOL OnInitDialog();
	afx_msg void OnBeforeNavigate2MainHtmlview(LPDISPATCH pDisp, VARIANT FAR* URL, VARIANT FAR* Flags, VARIANT FAR* TargetFrameName, VARIANT FAR* PostData, VARIANT FAR* Headers, BOOL FAR* Cancel);
	afx_msg void OnNewWindow2MainHtmlview(LPDISPATCH FAR* ppDisp, BOOL FAR* Cancel);
	afx_msg void OnClose();
	DECLARE_EVENTSINK_MAP()
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
	// Generated OLE dispatch map functions
	//{{AFX_DISPATCH(CMain)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_DISPATCH
	DECLARE_DISPATCH_MAP()
	DECLARE_INTERFACE_MAP()
	//afx_msg LRESULT OnGetDefID(WPARAM wp, LPARAM lp);
	void CMain::OnCancel();
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MAIN_H__EE4E8C42_37E5_4C2D_9DE9_BBFD2E103D5F__INCLUDED_)
