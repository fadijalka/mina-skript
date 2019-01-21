New-Item c:\temp\test2.txt

Clear-Content c:\temp\test2.txt

Add-Content c:\temp\test2.txt (Get-Date)

Add-Content c:\temp\test2.txt "Välkommen hem" 

Compare-Object -ReferenceObject $(Get-Content "C:\temp\test2.txt") -DifferenceObject $(Get-Content "C:\temp\test.txt")