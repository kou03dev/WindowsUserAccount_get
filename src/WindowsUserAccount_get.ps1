
Get-CimInstance Win32_UserAccount | Select-Object * | Export-Csv ".\Win32_UserAccount_list.tsv.txt" -Delimiter "`t" -Encoding UTF8 -NoTypeInformation
