
Configuration Chrome {
    Import-DscResource -ModuleName cChoco
    Node localhost  {
        cChocoinstaller Install {
            InstallDir = "C:\Choco"
            }
        
        cChocoPackageInstaller InstallChrome {
            Name = 'googlechrome'
            DependsOn = '[cChocoInstaller]Install'
            }
        }
    }
Chrome


Start-DscConfiguration -Path C:\it\Chrome -Wait  -Verbose -Force
