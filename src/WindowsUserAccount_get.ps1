

## https://copilot.cloud.microsoft/chat/share/eyJzaGFyZUlkIjoiNjBkZGIyODctZWM1ZS00YmJhLTg5YzYtYmQ0MTBjYTM3M2ZkIiwiY29udmVyc2F0aW9uSWQiOiI2YmRjOGJmOC1kYjVlLTQ2MzMtOTJhNS03MWZhMWFkYTMyMzIifQ%3D%3D

## カンマ完全排除版
## もし「カンマ忘れ」を完全に防ぎたいのであれば、配列変数にして += で積み上げる方法もあります。

$currentDtStr = Get-Date -Format 'yyyy/MM/dd HH:mm:ss'

$hostName = hostname

$ipv4Str = (
    Get-NetIPAddress -AddressFamily IPv4 |
    Where-Object {
        $_.IPAddress -ne '127.0.0.1'
    } |
    Select-Object -ExpandProperty IPAddress
) -join ';'


$properties = @()

$properties += @{ Name='DateTime_InfoGotten'; Expression={ $currentDtStr } }
$properties += @{ Name='HostName'; Expression={ $hostName } }
$properties += @{ Name='IPv4Address'; Expression={ $ipv4Str } }

$properties += 'Name'
$properties += 'Domain'
$properties += 'FullName'
$properties += 'Caption'
$properties += 'Description'
$properties += 'Status'
$properties += 'PasswordExpires'
$properties += 'InstallDate'
$properties += 'LocalAccount'
$properties += 'SID'
$properties += 'SIDType'
$properties += 'AccountType'
$properties += 'Disabled'
$properties += 'Lockout'
$properties += 'PasswordChangeable'
$properties += 'PasswordRequired'
$properties += 'PSComputerName'
$properties += 'CimClass'
$properties += 'CimInstanceProperties'
$properties += 'CimSystemProperties'

Get-CimInstance Win32_UserAccount |
    Select-Object $properties |
    Export-Csv '.\Win32_UserAccount_list.tsv.txt' `
        -Delimiter "`t" `
        -Encoding UTF8 `
        -NoTypeInformation
