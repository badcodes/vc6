#ifndef MYPLACE_HDSTART_HEADER
#define MYPLACE_HDSTART_HEADER
	#ifndef APPNAME
		#define APPNAME TEXT("hdstart")
	#endif
	#define APP_AUTHOR TEXT("xiaoranzzz, MyPlace")
	#define APP_COPYRIGHT TEXT("2011-2012")
	#define APP_USAGE_MESSAGE APPNAME TEXT("\n") \
				TEXT("\t--start in hidden window\nUsage:\n") \
				TEXT("\t") APPNAME TEXT(" [command [arguments...]]\n\n") \
				TEXT("Copyright ") APP_COPYRIGHT TEXT(", ") APP_AUTHOR TEXT(".")
#endif