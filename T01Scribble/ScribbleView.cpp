// ScribbleView.cpp : implementation of the CScribbleView class
//

#include "stdafx.h"
#include "Scribble.h"

#include "ScribbleDoc.h"
#include "ScribbleView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CScribbleView

IMPLEMENT_DYNCREATE(CScribbleView, CView)

BEGIN_MESSAGE_MAP(CScribbleView, CView)
	//{{AFX_MSG_MAP(CScribbleView)
	ON_WM_LBUTTONDOWN()
	ON_WM_LBUTTONUP()
	ON_WM_MOUSEMOVE()
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CScribbleView construction/destruction

CScribbleView::CScribbleView()
{
	// TODO: add construction code here

}

CScribbleView::~CScribbleView()
{
}

BOOL CScribbleView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CScribbleView drawing

void CScribbleView::OnDraw(CDC* pDC)
{
	CScribbleDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here
	// The view delegates the drawing of individual strokes to
	// CStroke::DrawStroke( ).
	CTypedPtrList<CObList, CStroke*>& strokeList = 	pDoc->m_strokeList;
	POSITION pos = strokeList.GetHeadPosition( );
	while (pos != NULL)
	{
		CStroke* pStroke = strokeList.GetNext(pos);
		pStroke->DrawStroke( pDC );
	}

}

/////////////////////////////////////////////////////////////////////////////
// CScribbleView printing

BOOL CScribbleView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CScribbleView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CScribbleView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CScribbleView diagnostics

#ifdef _DEBUG
void CScribbleView::AssertValid() const
{
	CView::AssertValid();
}

void CScribbleView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CScribbleDoc* CScribbleView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CScribbleDoc)));
	return (CScribbleDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CScribbleView message handlers

void CScribbleView::OnLButtonDown(UINT nFlags, CPoint point) 
{
	// TODO: Add your message handler code here and/or call default
	// Pressing the mouse button in the view window
	// starts a new stroke.

	m_pStrokeCur = GetDocument( )->NewStroke( );
	// Add first point to the new stroke
	m_pStrokeCur->m_pointArray.Add(point); 

	SetCapture( );  // Capture the mouse until button up
	m_ptPrev = point;  // Serves as the MoveTo( ) anchor point 
	// for the LineTo() the next point, as 
	// the user drags the mouse
	return;

	CView::OnLButtonDown(nFlags, point);
}

void CScribbleView::OnLButtonUp(UINT nFlags, CPoint point) 
{
	// TODO: Add your message handler code here and/or call default
	// Mouse button up is interesting in the Scribble 

	// application only if the user is currently drawing a new 
	// stroke by dragging the captured mouse.

	if( GetCapture( ) != this )
	return;    // If this window (view) didn't capture the 
	// mouse, the user isn't drawing in this window.

	CScribbleDoc* pDoc = GetDocument();
	CClientDC dc( this );
	CPen* pOldPen = dc.SelectObject( pDoc->GetCurrentPen( ) );
	dc.MoveTo( m_ptPrev );
	dc.LineTo( point );
	dc.SelectObject( pOldPen );
	m_pStrokeCur->m_pointArray.Add(point);

	ReleaseCapture( );    // Release the mouse capture established 
	// at the beginning of the mouse drag.
	return;


	CView::OnLButtonUp(nFlags, point);
}

void CScribbleView::OnMouseMove(UINT nFlags, CPoint point) 
{
	// Mouse movement is interesting in the Scribble application
	// only if the user is currently drawing a new stroke by 
	// dragging the captured mouse.

	if( GetCapture( ) != this )
	return;        // If this window (view) didn't capture the 
	// mouse, the user isn't drawing in this window.

	CClientDC dc( this );

	m_pStrokeCur->m_pointArray.Add(point);

	// Draw a line from the previous detected point in the mouse
	// drag to the current point.
	CPen* pOldPen = 
	dc.SelectObject( GetDocument( )->GetCurrentPen( ) );
	   dc.MoveTo( m_ptPrev );
	   dc.LineTo( point );
	   dc.SelectObject( pOldPen );
	   m_ptPrev = point;
	   return;

	CView::OnMouseMove(nFlags, point);
}
