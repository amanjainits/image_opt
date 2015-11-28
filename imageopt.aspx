
	\\source image path
	string sourcepath= @"C:\Users\Dell\Desktop\SourceNATURE.jpg"
        if (File.Exists(imgpath))
        {
        	\\destination Path
            string destination = @"C:\Users\Dell\Desktop\DestinationNATURE.jpg";
            ProcessStartInfo startInfo = new ProcessStartInfo();
            startInfo.CreateNoWindow = false;
            startInfo.UseShellExecute = false;
            startInfo.FileName = @"C:\Users\Dell\Desktop\imageoptimize\jpegtran.exe";\\complete exe path i.e jpegtran.exe
            startInfo.WindowStyle = ProcessWindowStyle.Hidden;
            string switchs = String.Format(@"-optimize -progressive {0} {1}", imgpath, destination);\\switch to run exe
            startInfo.Arguments = switchs;
            try
            {
                // Start the process with the info we specified.
                // Call WaitForExit and then the using statement will close.
                using (Process exeProcess = Process.Start(startInfo))
                {
                    exeProcess.WaitForExit();
                }
            }
            catch
            {
                // Log error.
            }
        }
