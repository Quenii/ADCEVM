#include "stdafx.h"
#include "gkhy/qplotlib/qscope.hpp"
#include "gkhy/qplotlib/plotlab/CSLScope.h"
#include <QSize>
#include <QResizeEvent>
#include <QHBoxLayout>

#pragma comment(lib, "VCLLoaderMS.lib")
#ifdef _DEBUG
#pragma comment(lib, "QtSolutions_MFCMigrationFramework-headd.lib")
#pragma comment(lib, "QtCored4.lib")
#pragma comment(lib, "QtGuid4.lib")
#pragma comment(lib, "qwtd.lib")
#else 
#pragma comment(lib, "QtSolutions_MFCMigrationFramework-head.lib")
#pragma comment(lib, "QtCore4.lib")
#pragma comment(lib, "QtGui4.lib")
#pragma comment(lib, "qwt.lib")
#endif
#include <QtGui>
#include <QWinHost>
#include <windows.h>

class QCTSLScope : public QWinHost
{
	//Q_OBJECT
public:
	QCTSLScope(QWidget *parent = 0, Qt::WFlags f = 0)
		: QWinHost(parent, f), m_scope(0)
	{
		setFocusPolicy(Qt::StrongFocus);

		// force createWindow to be called thus m_scope to be created.
		ensurePolished();
	}

	~QCTSLScope()
	{
		if (m_scope)
		{
			delete m_scope;
			m_scope = 0;
		}
	}

	// this function can only be called after the construction of QCTSLScope;
	CTSLScope& scope() { return *m_scope; }

	HWND createWindow(HWND parent, HINSTANCE instance)
	{
		static ATOM windowClass = 0;
		if (!windowClass) {
			WNDCLASSEX wcex;
			wcex.cbSize		= sizeof(WNDCLASSEX);
			wcex.style		= CS_HREDRAW | CS_VREDRAW;
			wcex.lpfnWndProc	= (WNDPROC)WndProc;
			wcex.cbClsExtra	= 0;
			wcex.cbWndExtra	= 0;
			wcex.hInstance	= instance;
			wcex.hIcon		= NULL;
			wcex.hCursor	= LoadCursor(NULL, IDC_ARROW);
			wcex.hbrBackground	= (HBRUSH)(COLOR_WINDOW+1);
			wcex.lpszMenuName	= NULL;
			wcex.lpszClassName	= L"QCTSLScopeClass";
			wcex.hIconSm	= NULL;

			windowClass = RegisterClassEx(&wcex);
		}

		HWND hwnd = CreateWindow((TCHAR*)windowClass, 0, WS_CHILD|WS_CLIPSIBLINGS|WS_TABSTOP, 
			CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, parent, NULL, instance, NULL);

		m_scope = new CTSLScope;
		VCL_InitControls(hwnd);
		m_scope->Open(hwnd);	
		VCL_Loaded();

		//m_scope->Visible = false;

		return hwnd;
	}

protected:
	static LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
	{
		return DefWindowProc(hWnd, message, wParam, lParam);
	}

	void resizeEvent(QResizeEvent * event)
	{
		QWinHost::resizeEvent(event);

		if (m_scope)
		{
			QSize size = event->size();
			m_scope->Left = 0;
			m_scope->Top = 0;
			m_scope->Width = size.width();
			m_scope->Height = size.height();
		}
	}

	void showEvent (QShowEvent * event) 
	{
		QWinHost::showEvent(event);

		if (m_scope)
			m_scope->Visible = true;
	}

	void hideEvent(QHideEvent *event)
	{
		if (m_scope)
			m_scope->Visible = false;

		QWinHost::hideEvent(event);
	}

private:
	CTSLScope* m_scope;
};


//#include "qscope.moc"

using namespace gkhy::QPlotLab;

QScope::QScope(QWidget* parent /* = 0 */, Qt::WindowFlags f /* = 0 */) :
QWidget(parent, f)
{
	QCTSLScope * b = new QCTSLScope(this);	
	m_scope = &(b->scope());

	QHBoxLayout* hbox = new QHBoxLayout(this);
	hbox->setSpacing(0);
	hbox->setMargin(0);
	hbox->addWidget(b);

	m_scope->YAxis.AxisLabel.Visible = true;
	m_scope->XAxis.AxisLabel.Visible = true;
}

QScope::~QScope()
{
	
}

void QScope::plot(const double* data, int len)
{
	if(len > 0)
	{
		if (m_scope->Channels.Count <= 1)
		{
			//Q_ASSERT(false);
			m_scope->Channels.Add(1);
		}

		m_scope->Channels[0].Data.SetYData(data, len);
	}
	//	rawScope().Channels[0].Data.SetYData(data, len); 	
}

void QScope::adjust(double min, double max)
{
	rawScope().YAxis.AutoScaling.Enabled = false;
	rawScope().YAxis.Max.AutoScale = false;	
	rawScope().YAxis.Min.AutoScale = false;

	rawScope().YAxis.Max.Value = max;
	rawScope().YAxis.Min.Value = min;
}