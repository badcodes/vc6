#ifndef XR_MPSHELL_INCLUDE
	#define XR_MPSHELL_INCLUDE
	#define SYSTEM_DIR TEXT("CORE\\SBIN")
	#define DEFAULT_PROG TEXT("Shell.bat")
	#ifndef APPNAME
		#define APPNAME TEXT("MPSHELL")
	#endif
	#define APP_AUTHOR TEXT("xiaoranzzz, MyPlace")
	#define APP_COPYRIGHT TEXT("2011-2012")
	#define APP_USAGE_MESSAGE APPNAME TEXT("\n") \
				TEXT("\t-- MyPlace Shell Loader\nUsage:\n") \
				TEXT("\t") APPNAME TEXT(" [shell|run] [SHELL_PROG [SHELL_OPTIONS...]]\n\n") \
				TEXT("Copyright ") APP_COPYRIGHT TEXT(", ") APP_AUTHOR TEXT(".")
	#define APP_ERROR_NO_SYSTEM TEXT("System Directory Not Found!\n")
	#define APP_ERROR_MSG TEXT("Error")
#endif