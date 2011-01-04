// SimpleConfig.h: interface for the CSimpleConfig class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_SIMPLECONFIG_H__59DE8C3D_A190_4E55_8662_3063DB113F2C__INCLUDED_)
#define AFX_SIMPLECONFIG_H__59DE8C3D_A190_4E55_8662_3063DB113F2C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifdef _GLIBCXX_STRING
using namespace std;
#endif

class CSimpleConfig
{
public:
	TCHAR* read(const TCHAR* key,TCHAR* value);
	const TCHAR* read(const TCHAR *key);
	int read(const TCHAR* key,int* value);
	TCHAR* read(const TCHAR* key,int idx);
	TCHAR* read(const TCHAR* key,const int idx,TCHAR* value);
	int read(const TCHAR *key, const int idx, int *value);


    BOOL write(const TCHAR *key, const TCHAR *value);
	BOOL write(const TCHAR *key, const int value);
	BOOL write(const TCHAR *key, const int idx, const TCHAR *value);
	CSimpleConfig();
	virtual ~CSimpleConfig();

#ifdef _GLIBCXX_STRING
    int read(const string &key,int* value);
	string read(const string &key);
	string read(const string &key,const int idx);
	bool write(const string& key,const int value);
	bool write(const string &key,const int idx,const string &value);
	bool write(const string &key,const string& value);
#endif

private:
	TCHAR* inifile;
};

#endif // !defined(AFX_SIMPLECONFIG_H__59DE8C3D_A190_4E55_8662_3063DB113F2C__INCLUDED_)
