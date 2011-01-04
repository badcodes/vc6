// Start.h: interface for the Start class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_START_H__65A6D2E5_E7CE_41AB_900F_7B91FF21C960__INCLUDED_)
#define AFX_START_H__65A6D2E5_E7CE_41AB_900F_7B91FF21C960__INCLUDED_

#include "Main.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class Start : public CWinApp  
{
public:
	CMain* CreateNewWindow();
	CList <CMain*,CMain*> m_windows;
	Start();
	virtual ~Start();
	virtual BOOL InitInstance( );
};

#endif // !defined(AFX_START_H__65A6D2E5_E7CE_41AB_900F_7B91FF21C960__INCLUDED_)
