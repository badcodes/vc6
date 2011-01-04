
TESTATLps.dll: dlldata.obj TESTATL_p.obj TESTATL_i.obj
	link /dll /out:TESTATLps.dll /def:TESTATLps.def /entry:DllMain dlldata.obj TESTATL_p.obj TESTATL_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del TESTATLps.dll
	@del TESTATLps.lib
	@del TESTATLps.exp
	@del dlldata.obj
	@del TESTATL_p.obj
	@del TESTATL_i.obj
