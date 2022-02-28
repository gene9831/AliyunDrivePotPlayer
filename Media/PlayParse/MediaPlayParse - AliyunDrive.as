/*
	Aliyun drive media parse
*/	

// void OnInitialize()
// void OnFinalize()
// string GetTitle() 									-> get title for UI
// string GetVersion									-> get version for manage
// string GetDesc()										-> get detail information
// string GetLoginTitle()								-> get title for login dialog
// string GetLoginDesc()								-> get desc for login dialog
// string GetUserText()									-> get user text for login dialog
// string GetPasswordText()								-> get password text for login dialog
// string ServerCheck(string User, string Pass) 		-> server check
// string ServerLogin(string User, string Pass) 		-> login
// void ServerLogout() 									-> logout
//------------------------------------------------------------------------------------------------
// bool PlayitemCheck(const string &in)					-> check playitem
// array<dictionary> PlayitemParse(const string &in)	-> parse playitem
// bool PlaylistCheck(const string &in)					-> check playlist
// array<dictionary> PlaylistParse(const string &in)	-> parse playlist

string GetTitle()
{
	return "Aliyun";
}

string GetVersion()
{
	return "1";
}

string GetDesc()
{
	return "https://www.aliyundrive.com//";
}

bool PlayitemCheck(const string &in path) {
	return HostRegExpParse(path, "bj29.cn-beijing.data.alicloudccp.com/(.+)") != "";
}

string PlayitemParse(const string &in path, dictionary &MetaData, array<dictionary> &QualityList) {
	// HostOpenConsole();

	string userAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34';
	HostSetUrlUserAgentHTTP(path, userAgent);

	string header = 'Referer: https://www.aliyundrive.com/';
	header += '\nsec-ch-ua: " Not A;Brand";v="99", "Chromium";v="98", "Microsoft Edge";v="98"';
	header += '\nsec-ch-ua-mobile: ?0';
	header += '\nsec-ch-ua-platform: "Windows"';
	header += '\nSec-Fetch-Dest: document';
	header += '\nSec-Fetch-Mode: navigate';
	header += '\nSec-Fetch-Site: cross-site';
	header += '\nSec-Fetch-User: ?1';
	header += '\nUpgrade-Insecure-Requests: 1';

	HostSetUrlHeaderHTTP(path, header);

	int index = path.findFirst("filename");
	array<string> substrs = path.substr(index).split("&");

	if (substrs.length() == 0) {
		return path;
	}

	string filename = HostUrlDecode(HostUrlDecode(substrs[0]).substr(17));

	MetaData['title'] = filename;
	HostPrintUTF8(filename);

	return path;
}
