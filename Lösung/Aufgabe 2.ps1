# Scriptname: inputValidator.ps1 
<#  
.SYNOPSIS 
    Second PowerShell-practice
  
.NOTES 
    Author:         Alejandro Probst 
    Version:        1.0 
    Date v1.0:      27.05.2019  
  
    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ 
    Changelog: 
    27.05.2019    APO    Version 1.0 
#>  

$NameValid = $PLZValid = $PhoneValid = $StreetValid = $MailValid = $false

#> # Level 1 + 2 <#
while(!$NameValid){
    $Name = Read-Host "Geben Sie folgende Angabe ein - Name und Vorname"
    if($Name -match '^[A-Za-z]{2,}\ [A-Za-z]{2,}$'){
        $NameValid = $true
    }
}

while(!$PhoneValid){
    $Phone = Read-Host "Geben Sie folgende Angabe ein - Telefonnummer"
    if($Phone.Replace(" ","") -match '^[\d+]{10,13}$'){
        $PhoneValid = $true
    }
}

while(!$PLZValid){
    $PLZ = Read-Host "Geben Sie folgende Angabe ein - Postleitzahl und Ort"
    if($PLZ -match '^[\d]{4}[\ ]?[a-zA-Z]{2,80}$'){
        $PLZValid = $true
    }
}

while(!$StreetValid){
    $Street = Read-Host "Geben Sie folgende Angabe ein - Adresse (Strasse und Nummer)"
    if($Street -match '^[\ a-zA-Z]{2,80}[\d]{1,3}$'){
        $StreetValid = $true
    }
}

while(!$MailValid){
    $Mail = Read-Host "Geben Sie folgende Angabe ein - Mailadresse"
    if($Mail -match '^[a-zA-Z_\-\.\d]{1,100}@[a-zA-Z_\-\.\d]{1,100}\.[a-zA-Z]{2,6}$'){
        $MailValid = $true
    }
}
Write-Host "-------------------"
Write-Host "Name: `t`t$Name"
Write-Host "Telefon: `t$Phone"
Write-Host "Strasse: `t$Street"
Write-Host "PLZ: `t`t$PLZ"
Write-Host "E-Mail:  `t$Mail"
Write-Host "-------------------"

# #>