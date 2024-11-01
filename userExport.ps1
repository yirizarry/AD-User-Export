# Imports the module Active Directory, otherwise the export will fail
Import-Module ActiveDirectory

# to test whether module is imported you can run the command get-module
# sets current script localtion, may need to modify
set-location .\desktop

# modify this section and Update the distinguished Name for the OU you'd like to export users from
$OU = "OU=exampleOU,DC=exampleDC,DC=domain,DC=com"

# exports users to CSV, exclusively filtered by enabled users
Get-ADUser -Filter {Enabled -eq $true} -Properties * -SearchBase $OU | select samaccountname, userprincipalname, description | Export-Csv -Path .\userExport.csv