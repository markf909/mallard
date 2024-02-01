Add-Type -AssemblyName System.Windows.Forms

# Display a message box with OK button
$result = [System.Windows.Forms.MessageBox]::Show('You have been hacked by the Dark Side.  Press OK to witness our wrath!', 'Message Box', 'OK', 'Information')

# Check if the user clicked OK (DialogResult.OK)
if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    # Open a webpage using the default web browser
    Start-Process 'https://www.youtube.com/watch?v=C8ZvsFCxxCU'
}
