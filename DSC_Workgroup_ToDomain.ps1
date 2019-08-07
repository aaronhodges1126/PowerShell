configuration WorkgroupToDomain 
{ 
    param 
    ( 
        [string[]]$NodeName="localhost", 
 
        [Parameter(Mandatory)] 
        [string]$MachineName, 
 
        [Parameter(Mandatory)] 
        [string]$Domain, 
 
        [Parameter(Mandatory)] 
        [pscredential]$Credential 
    ) 
 
    #Import the required DSC Resources 
    Import-DscResource -Module xComputerManagement 
 
    Node $NodeName 
    { 
        xComputer JoinDomain 
        { 
            Name          = $MachineName  
            DomainName    = $Domain 
            Credential    = $Credential  # Credential to join to domain 
        } 
    } 
} 
 
<#**************************** 
To save the credential in plain-text in the mof file, use the following configuration data 
 
$ConfigData = @{   
                 AllNodes = @(        
                              @{     
                                 NodeName = "localhost" 
                                 # Allows credential to be saved in plain-text in the the *.mof instance document.                             
                                 PSDscAllowPlainTextPassword = $true 
                              } 
                            )  
              } 
 
Sample_xComputer_WorkgroupToDomain -ConfigurationData $ConfigData -MachineName <machineName> -credential (Get-Credential) -Domain <domainName> 
****************************#> 
