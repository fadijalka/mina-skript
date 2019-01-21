# Skapa en fil "C:\temp\gronsaker.txt"

New-Item -path c:\temp\gronsaker.txt -ItemType File

Clear-Content c:\temp\gronsaker.txt

# Skriv in två grönsaker dubbelt i listan

Add-Content c:\temp\gronsaker.txt "isberssallad`r`ntomat`r`ngurka`r`nbroccoli`r`navokado`r"

# Sortera listan i bokstavsordning och med unikt förekommande grönsaker.

Get-Content C:\temp\gronsaker.txt | Sort-Object -Unique

Write-Host Hur många unika grönsaker innehåller listan:

(Get-Content C:\temp\gronsaker.txt | Sort-Object -Unique).count