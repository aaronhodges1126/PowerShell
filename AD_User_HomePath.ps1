Get-ADUser -Filter * -SearchBase "DC=domain,DC=com" | Foreach-Object{
$sam = $_.SamAccountName
Set-ADuser -Identity $_ -HomeDrive "H:" -HomeDirectory "\$sam"
}
