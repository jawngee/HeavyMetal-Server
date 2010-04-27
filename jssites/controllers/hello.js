var input=request.value("xss");

[response addHeader:@"Content-Type" withValue:@"text/html"];

response.write("hello "+input);

var apps=[[NSWorkspace sharedWorkspace] launchedApplications];
for (var i=0; i<apps.length; i++)
	response.write(apps[i].NSApplicationName+'<br/>')