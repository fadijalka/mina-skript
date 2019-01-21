$events = Get-EventLog -LogName System | Where-Object {$_.EntryType -ne "Information"}
$events_count = $events.Count #varningar och errors
$events_last_24h = Get-EventLog -LogName System -After ([DateTime]::Now.AddDays(-1)) | Where-Object {$_.EntryType -ne "Information"}
$el24h = $events_last_24h.Count
$last100 = $events | Select-Object -First 100 #ladda ner de senaste 100 felen
$warningtext = " "
if ($el24h -gt 10
){
    $warningtext= "<p style='font-size:90px; color:red; font-weight: bolder'>warning: mer än 10 errors/varningar!</p>"
}
$precontent = @"
    <p> Totalt antal varningar och errors: $events_count </p>
    <p> Totalt antal varningar de senaste 24 timmarna: $el24h </p>
    $warningtext
"@
$head = @"
<style>
  body {
    font-family: "Arial";
    font-size: 8pt;
    color: #4C607B;
    }
  th, td { 
    border: 1px solid #e57300;
    border-collapse: collapse;
    padding: 5px;
    }
  th {
    font-size: 1.2em;
    text-align: left;
    background-color: #003366;
    color: #ffffff;
    }
  td {
    color: #000000;
    }
    td:nth-child(odd){
        background-color: #bfbfbf;
    }
</style>
"@

$Eject = New-Object -ComObject "Shell.Application"
$Eject.Namespace(17).Items() |
    Where-Object { $_.Type -eq "CD Drive" } |
        foreach { $_.InvokeVerb("Eject") } 
$speech = New-Object -ComObject SAPI.SPVoice
$speech.Speak("Command complete")
#Send-MailMessage -to "mats.karlsson@nackademin.se" -from "fadi.jalka@yh.nackademin.se" -subject "Powershell" -SmtpServer smtp.server.com