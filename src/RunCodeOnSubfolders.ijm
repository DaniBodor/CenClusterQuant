
MacroPath = "C:\\Users\\dani\\Dropbox (Personal)\\____Recovery\\Fiji.app\\Custom_Codes\\CenClusterQuant\\src";
MacroName = "CenClusterQuant.ijm";
outputPath = "C:/Users/dani/Dropbox (Personal)/____Recovery/Fiji.app/Custom_Codes/CenClusterQuant/results/output/";
printDIRname = 1;		// set to 0 or 1 depending on whether you want directory name printed to log
printIMname = 0;		// set to 0 or 1 depending on whether you want image name printed to log
printStartEnd = 1;		// set to 0 or 1 depending on whether you want start and end time printed to log



// set string identifier of images to include. Only files containing this identifier in the file name will be opened (empty string will include all)
image_identifier	= "D3D_PRJ";


run ("Close All");	print ("\\Clear");
dir = getDirectory ("Choose a Directory");
print(MacroName, "==>" , dir);

timestamp = fetchTimeStamp();
if(printStartEnd==1)	print(substring(timestamp,lengthOf(timestamp)-4));


subdirs = getFileList (dir);

// lots of loops and conditions to find correct files in correct folders
for (d = 0; d < subdirs.length; d++) {
	subdirname = dir + subdirs [d];
	if ( endsWith (subdirname, "/")){
		filelist = getFileList (subdirname);
		if (printDIRname == 1)	print(subdirname);
		for (f = 0; f < filelist.length; f++) {
			filename = subdirname + filelist [f];
			if ( endsWith (filename, ".tif") || endsWith (filename, ".dv") ){
				if (indexOf(filelist [f] , image_identifier) >= 0 ){
					// correct files were found
					
					//print(filename);
					open ( filename );
					ori = getTitle ();
					
					RunCode (ori);
					
					run ("Close All"); 	
					for (i = 0; i < 3; i++) run("Collect Garbage");

					// save output
					selectWindow("Log");
					saveAs("Text", outputPath+"Log_"+timestamp+".txt");
				}
			}
		}
	}
}


if(printStartEnd==1){
	endtime = fetchTimeStamp();
	print(substring(endtime,lengthOf(endtime)-4));
}
print ("All done");
saveAs("Text", outputPath+"Log_"+timestamp+".txt");




function RunCode(IM){
	if (printIMname == 1)	print(IM);
	fullMacroFileLocation = MacroPath + File.separator + MacroName;
	runMacro(fullMacroFileLocation,outputPath);
	
	//waitForUser(IM);
	
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function fetchTimeStamp(){
	getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);

	// set to readable output
	year = substring(d2s(year,0),2);
	DateString = year + IJ.pad(month+1,2) + IJ.pad(dayOfMonth,2);
	TimeString = IJ.pad(hour,2) + IJ.pad(minute,2);

	// concatenate and return
	DateTime = DateString+TimeString;
	return DateTime;
}
