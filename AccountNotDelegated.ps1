
Get-ADGroupMember -Identity "Domain Admins" | ForEach-Object {

Get-ADUser -Identity $_ -Properties AccountNotDelegated |

Where-Object {$_.AccountNotDelegated -eq $false} |

Format-Table DistinguishedName,AccountNotDelegated -AutoSize

}
