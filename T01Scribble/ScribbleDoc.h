// ScribbleDoc.h : interface of the CScribbleDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_SCRIBBLEDOC_H__0FA183E3_3504_4109_B488_50A88D1D9776__INCLUDED_)
#define AFX_SCRIBBLEDOC_H__0FA183E3_3504_4109_B488_50A88D1D9776__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////
// class CStroke
// A stroke is a series of connected points in the Scribble drawing.
// A Scribble document may have multiple strokes.
class CStroke : public CObject
{
public:
CStroke( UINT nPenWidth );

protected:
CStroke( );
DECLARE_SERIAL( CStroke )

// Attributes
protected:
UINT   m_nPenWidth;  // One width applies to entire stroke

protected:
CRect m_rectBounding;  // smallest rect that surrounds all
  // of the points in the stroke
public:
CRect& GetBoundingRect() { return m_rectBounding; }

public:
CArray<CPoint, CPoint>   m_pointArray;  // Series of connected                                                    // points

// Operations
public:
BOOL DrawStroke( CDC* pDC );

public:
	void FinishStroke();
virtual void Serialize( CArchive& ar );
};


class CScribbleDoc : public CDocument
{
protected: // create from serialization only
	CScribbleDoc();
	DECLARE_DYNCREATE(CScribbleDoc)
	BOOL    m_bThickPen;    // Thick currently selected or not 
	UINT    m_nThinWidth;    // Current definition of thin
	UINT    m_nThickWidth;    // Current definition of thick 

// Attributes
public:
	CTypedPtrList<CObList, CStroke*> m_strokeList;
	CPen*   GetCurrentPen( ) { return &m_penCur; }

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CScribbleDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	virtual BOOL OnOpenDocument(LPCTSTR lpszPathName);
	virtual void DeleteContents();
	//}}AFX_VIRTUAL

// Implementation
public:
	CStroke* NewStroke();
	virtual ~CScribbleDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	void InitDocument();
	CPen m_penCur;
	UINT m_nPenWidth;

// Generated message map functions
protected:
	void ReplacePen ();

	//{{AFX_MSG(CScribbleDoc)
	afx_msg void OnEditClearAll();
	afx_msg void OnPenThickOrThin();
	afx_msg void OnUpdateEditClearAll(CCmdUI* pCmdUI);
	afx_msg void OnUpdatePenThickOrThin(CCmdUI* pCmdUI);
	afx_msg void OnPenWidths();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SCRIBBLEDOC_H__0FA183E3_3504_4109_B488_50A88D1D9776__INCLUDED_)
