// GasOnlineDoc.h : CGasOnlineDoc ��Ľӿ�
//


#pragma once

class CGasOnlineDoc : public CDocument
{
protected: // �������л�����
	CGasOnlineDoc();
	DECLARE_DYNCREATE(CGasOnlineDoc)

// ����
public:

// ����
public:

// ��д
public:
	virtual BOOL OnNewDocument();

	virtual void Serialize(CArchive& ar);


// ʵ��
public:
	virtual ~CGasOnlineDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
#endif

protected:

// ���ɵ���Ϣӳ�亯��
protected:
	DECLARE_MESSAGE_MAP()
};


