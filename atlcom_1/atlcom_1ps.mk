
atlcom_1ps.dll: dlldata.obj atlcom_1_p.obj atlcom_1_i.obj
	link /dll /out:atlcom_1ps.dll /def:atlcom_1ps.def /entry:DllMain dlldata.obj atlcom_1_p.obj atlcom_1_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del atlcom_1ps.dll
	@del atlcom_1ps.lib
	@del atlcom_1ps.exp
	@del dlldata.obj
	@del atlcom_1_p.obj
	@del atlcom_1_i.obj
