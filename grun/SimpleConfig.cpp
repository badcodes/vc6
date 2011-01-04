// SimpleConfig.cpp: implementation of the CSimpleConfig class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "SimpleConfig.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
#define APPNAME _T("SimpleConfig")
#define MAX_STRING 1024
#define MAX_INT_LENGTH 256
#define LIST_HEAD _T("@LIST_")
#define LIST_HEAD_LENGTH 6
#define TEMP_A_FROM_I(A,I) TCHAR A[MAX_INT_LENGTH];_itot((I),(A),10);
#define TEMP_I_FROM_A(I,A) int I=_ttoi((A));


CSimpleConfig::CSimpleConfig() {
    TCHAR exename[MAX_PATH];
    GetModuleFileName(NULL,exename,MAX_PATH);
    _tcscat(exename,_T(".ini"));
    inifile = _tcsdup(exename);
    //inifile = inifile + ".ini";
    //MessageBox(NULL,inifile,"SimpleConfig",MB_OK);
}

CSimpleConfig::~CSimpleConfig() {
    //delete inifile;
    free(inifile);
}

const TCHAR* create_listkey(const TCHAR* key,const int idx) {
    static TCHAR newkey[MAX_STRING];
    _tcscpy(newkey,LIST_HEAD);
    _itot(idx,newkey + LIST_HEAD_LENGTH,10);
    _tcscat(newkey,key);
    return newkey;
}

TCHAR* create_listkey(const TCHAR* key,const int idx,TCHAR* dest) {
    _tcscpy(dest,LIST_HEAD);
    _itot(idx,dest + LIST_HEAD_LENGTH,10);
    _tcscat(dest,key);
    return dest;
}

BOOL CSimpleConfig::write(const TCHAR *key, const TCHAR *value) {
    //MessageBox(NULL,value,key,MB_OK);
    if (WritePrivateProfileString(APPNAME,key,value,inifile))
        return true;
    return false;
}

TCHAR* CSimpleConfig::read(const TCHAR* key,TCHAR* value) {
    TCHAR tmp[MAX_STRING];
    GetPrivateProfileString(APPNAME,key,NULL,tmp,MAX_STRING,inifile);


    //MessageBox(NULL,tmp,"CSimpleConfig::read",MB_OK);
    if (NULL == value) {
        return _tcsdup(tmp);
    } else {
        _tcscpy(value,tmp);
        return value;
    }
}

const TCHAR* CSimpleConfig::read(const TCHAR *key) {
    static TCHAR BUFFER[MAX_STRING];
    return this->read(key,BUFFER);
}

int CSimpleConfig::read(const TCHAR *key, int *value) {
    TCHAR tmp[MAX_STRING];
    this->read(key,tmp);
    if (NULL == value) {
        return _ttoi(tmp);
    } else {
        *value = _ttoi(tmp);
        return *value;
    }
}


TCHAR* CSimpleConfig::read(const TCHAR *key, int idx) {
    return this->read(create_listkey(key,idx),(TCHAR*)NULL);
}


TCHAR* CSimpleConfig::read(const TCHAR *key, const int idx, TCHAR *value) {
    return this->read(create_listkey(key,idx),value);
}

int CSimpleConfig::read(const TCHAR *key, const int idx, int *value) {
    return this->read(create_listkey(key,idx),value);
}

#ifdef _GLIBCXX_STRING
string CSimpleConfig::read(const string &key) {
    return string(this->read(key.c_str()));
}


string CSimpleConfig::read(const string &key, const int idx) {
    return this->read(create_listkey(key.c_str(),idx));
}


int CSimpleConfig::read(const string &key, int *value) {
    return this->read(key.c_str(),value);
}

bool CSimpleConfig::write(const string &key, const string &value) {
    return (bool)this->write(key.c_str() ,value.c_str());
}

bool CSimpleConfig::write(const string &key, const int value) {
    return (bool)this->write(key.c_str(),value);
}

bool CSimpleConfig::write(const string &key, const int idx, const string &value) {
    return this->write(create_listkey(key.c_str(),idx),value);
}

#endif

BOOL CSimpleConfig::write(const TCHAR *key, const int value) {
    TCHAR a[MAX_INT_LENGTH];
    _itot(value,a,10);
    return this->write(key,a);
}

BOOL CSimpleConfig::write(const TCHAR *key, const int idx, const TCHAR *value) {
    return this->write(create_listkey(key,idx),value);
}


/*
TCHAR* create_listkey(const string& key,const int idx) {
	return create_listkey(key.c_str(),idx);
}
*/

