#+feature dynamic-literals
package http

Status_Code :: enum u16 {
	OK                                   = 200,
	Continue                             = 100,
	Switching_Protocols                  = 101,
	Processing                           = 102,
	Early_Hints                          = 103,
	Created                              = 201,
	Accepted                             = 202,
	Non_Authoritative_Information        = 203,
	No_Content                           = 204,
	Reset_Content                        = 205,
	Partial_Content                      = 206,
	Multi_Status                         = 207,
	Already_Reported                     = 208,
	This_is_fine                         = 218,
	IM_Used                              = 226,
	Multiple_Choices                     = 300,
	Moved_Permanently                    = 301,
	Found                                = 302,
	See_Other                            = 303,
	Not_Modified                         = 304,
	Switch_Proxy                         = 306,
	Temporary_Redirect                   = 307,
	Resume_Incomplete                    = 308,
	Bad_Request                          = 400,
	Unauthorized                         = 401,
	Payment_Required                     = 402,
	Forbidden                            = 403,
	Not_Found                            = 404,
	Method_Not_Allowed                   = 405,
	Not_Acceptable                       = 406,
	Proxy_Authentication_Required        = 407,
	Request_Timeout                      = 408,
	Conflict                             = 409,
	Gone                                 = 410,
	Length_Required                      = 411,
	Precondition_Failed                  = 412,
	Request_Entity_Too_Large             = 413,
	Request_URI_Too_Long                 = 414,
	Unsupported_Media_Type               = 415,
	Requested_Range_Not_Satisfiable      = 416,
	Expectation_Failed                   = 417,
	I_Am_A_Teapot                        = 418,
	Page_Expired                         = 419,
	Method_Failure                       = 420,
	Misdirected_Request                  = 421,
	Unprocessable_Entity                 = 422,
	Locked                               = 423,
	Failed_Dependency                    = 424,
	Upgrade_Required                     = 426,
	Precondition_Required                = 428,
	Too_Many_Requests                    = 429,
	Request_Header_Fields_Too_Large      = 431,
	Login_Time                           = 440,
	Connection_Closed_Without_Response   = 444,
	Retry_With                           = 449,
	Blocked_by_Windows_Parental_Controls = 450,
	Unavailable_For_Legal_Reasons        = 451,
	Request_Header_Too_Large             = 494,
	SSL_Certificate_Error                = 495,
	SSL_Certificate_Required             = 496,
	HTTP_Request_Sent_to_HTTPS_Port      = 497,
	Invalid_Token                        = 498,
	Client_Closed_Request                = 499,
	Internal_Server_Error                = 500,
	Not_Implemented                      = 501,
	Bad_Gateway                          = 502,
	Service_Unavailable                  = 503,
	Gateway_Timeout                      = 504,
	HTTP_Version_Not_Supported           = 505,
	Variant_Also_Negotiates              = 506,
	Insufficient_Storage                 = 507,
	Loop_Detected                        = 508,
	Bandwidth_Limit_Exceeded             = 509,
	Not_Extended                         = 510,
	Network_Authentication_Required      = 511,
	Unknown_Error                        = 520,
	Web_Server_Is_Down                   = 521,
	Connection_Timed_Out                 = 522,
	Origin_Is_Unreachable                = 523,
	A_Timeout_Occurred                   = 524,
	SSL_Handshake_Failed                 = 525,
	Invalid_SSL_Certificate              = 526,
	Railgun_Listener_to_Origin_Error     = 527,
	Origin_DNS_Error                     = 530,
	Network_Read_Timeout_Error           = 598,
}

Status_Text: map[Status_Code]string = {
	Status_Code.OK                                   = "OK",
	Status_Code.Continue                             = "Continue",
	Status_Code.Switching_Protocols                  = "Switching Protocols",
	Status_Code.Processing                           = "Processing",
	Status_Code.Early_Hints                          = "Early Hints",
	Status_Code.Created                              = "Created",
	Status_Code.Accepted                             = "Accepted",
	Status_Code.Non_Authoritative_Information        = "Non-Authoritative Information",
	Status_Code.No_Content                           = "No Content",
	Status_Code.Reset_Content                        = "Reset Content",
	Status_Code.Partial_Content                      = "Partial Content",
	Status_Code.Multi_Status                         = "Multi-Status",
	Status_Code.Already_Reported                     = "Already Reported",
	Status_Code.This_is_fine                         = "This is fine (Apache Web Server)",
	Status_Code.IM_Used                              = "IM Used",
	Status_Code.Multiple_Choices                     = "Multiple Choices",
	Status_Code.Moved_Permanently                    = "Moved Permanently",
	Status_Code.Found                                = "Found",
	Status_Code.See_Other                            = "See Other",
	Status_Code.Not_Modified                         = "Not Modified",
	Status_Code.Switch_Proxy                         = "Switch Proxy",
	Status_Code.Temporary_Redirect                   = "Temporary Redirect",
	Status_Code.Resume_Incomplete                    = "Resume Incomplete",
	Status_Code.Bad_Request                          = "Bad Request",
	Status_Code.Unauthorized                         = "Unauthorized",
	Status_Code.Payment_Required                     = "Payment Required",
	Status_Code.Forbidden                            = "Forbidden",
	Status_Code.Not_Found                            = "Not Found",
	Status_Code.Method_Not_Allowed                   = "Method Not Allowed",
	Status_Code.Not_Acceptable                       = "Not Acceptable",
	Status_Code.Proxy_Authentication_Required        = "Proxy Authentication Required",
	Status_Code.Request_Timeout                      = "Request Timeout",
	Status_Code.Conflict                             = "Conflict",
	Status_Code.Gone                                 = "Gone",
	Status_Code.Length_Required                      = "Length Required",
	Status_Code.Precondition_Failed                  = "Precondition Failed",
	Status_Code.Request_Entity_Too_Large             = "Request Entity Too Large",
	Status_Code.Request_URI_Too_Long                 = "Request-URI Too Long",
	Status_Code.Unsupported_Media_Type               = "Unsupported Media Type",
	Status_Code.Requested_Range_Not_Satisfiable      = "Requested Range Not Satisfiable",
	Status_Code.Expectation_Failed                   = "Expectation Failed",
	Status_Code.I_Am_A_Teapot                        = "I'm a teapot",
	Status_Code.Page_Expired                         = "Page Expired (Laravel Framework)",
	Status_Code.Method_Failure                       = "Method Failure (Spring Framework)",
	Status_Code.Misdirected_Request                  = "Misdirected Request",
	Status_Code.Unprocessable_Entity                 = "Unprocessable Entity",
	Status_Code.Locked                               = "Locked",
	Status_Code.Failed_Dependency                    = "Failed Dependency",
	Status_Code.Upgrade_Required                     = "Upgrade Required",
	Status_Code.Precondition_Required                = "Precondition Required",
	Status_Code.Too_Many_Requests                    = "Too Many Requests",
	Status_Code.Request_Header_Fields_Too_Large      = "Request Header Fields Too Large",
	Status_Code.Login_Time                           = "Login Time-out",
	Status_Code.Connection_Closed_Without_Response   = "Connection Closed Without Response",
	Status_Code.Retry_With                           = "Retry With",
	Status_Code.Blocked_by_Windows_Parental_Controls = "Blocked by Windows Parental Controls",
	Status_Code.Unavailable_For_Legal_Reasons        = "Unavailable For Legal Reasons",
	Status_Code.Request_Header_Too_Large             = "Request Header Too Large",
	Status_Code.SSL_Certificate_Error                = "SSL Certificate Error",
	Status_Code.SSL_Certificate_Required             = "SSL Certificate Required",
	Status_Code.HTTP_Request_Sent_to_HTTPS_Port      = "HTTP Request Sent to HTTPS Port",
	Status_Code.Invalid_Token                        = "Invalid Token (Esri)",
	Status_Code.Client_Closed_Request                = "Client Closed Request",
	Status_Code.Internal_Server_Error                = "Internal Server Error",
	Status_Code.Not_Implemented                      = "Not Implemented",
	Status_Code.Bad_Gateway                          = "Bad Gateway",
	Status_Code.Service_Unavailable                  = "Service Unavailable",
	Status_Code.Gateway_Timeout                      = "Gateway Timeout",
	Status_Code.HTTP_Version_Not_Supported           = "HTTP Version Not Supported",
	Status_Code.Variant_Also_Negotiates              = "Variant Also Negotiates",
	Status_Code.Insufficient_Storage                 = "Insufficient Storage",
	Status_Code.Loop_Detected                        = "Loop Detected",
	Status_Code.Bandwidth_Limit_Exceeded             = "Bandwidth Limit Exceeded",
	Status_Code.Not_Extended                         = "Not Extended",
	Status_Code.Network_Authentication_Required      = "Network Authentication Required",
	Status_Code.Unknown_Error                        = "Unknown Error",
	Status_Code.Web_Server_Is_Down                   = "Web Server Is Down",
	Status_Code.Connection_Timed_Out                 = "Connection Timed Out",
	Status_Code.Origin_Is_Unreachable                = "Origin Is Unreachable",
	Status_Code.A_Timeout_Occurred                   = "A Timeout Occurred",
	Status_Code.SSL_Handshake_Failed                 = "SSL Handshake Failed",
	Status_Code.Invalid_SSL_Certificate              = "Invalid SSL Certificate",
	Status_Code.Railgun_Listener_to_Origin_Error     = "Railgun Listener to Origin Error",
	Status_Code.Origin_DNS_Error                     = "Origin DNS Error",
	Status_Code.Network_Read_Timeout_Error           = "Network Read Timeout Error",
}

Response :: struct {
	status:  Status_Code,
	headers: map[string]string,
	body:    [dynamic]byte,
}

Method :: enum {
	Get,
	Post,
	Delete,
	Put,
	Patch,
}

Request :: struct {
	method:  Method,
	version: string,
	path:    string,
	headers: map[string]string,
	body:    string,
}
