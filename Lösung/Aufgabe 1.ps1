# Scriptname: setPassword.ps1 
<#  
.SYNOPSIS 
    First PowerShell-practice
  
.NOTES 
    Author:         Alejandro Probst 
    Version:        1.0 
    Date v1.0:      27.05.2019  
  
    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ 
    Changelog: 
    27.05.2019    APO    Version 1.0 
#>  

#> # Level 1 
<#
$PasswordSet = $false

# Do while the password is not set
while(!$PasswordSet){
    # Ask user for the password
    $Userinput = Read-Host "Geben Sie das Passwort ein"
    # Ask user to repeat the password
    $UserinputRepeat = Read-Host "Geben Sie dasselbe Passwort erneut ein"
    # Check if the password is -eq
    if($Userinput -eq $UserinputRepeat){
        # Set $PasswordSet to true to break the queue
        $PasswordSet = $true
    }
}


#> # Level 2 <#


$PasswordSet = $false

# Declare Array
$ArrWord = @("Buch", "Katze", "Baum", "Fisch", "Peter")
$ArrCharacter = @("$", ".", ",", "!", "?")


<# 
    .DESCRIPTION   
    This function returns a password  
 
    .OUTPUT 
    Returns a password as a string (varaible $Password)
#> 
function generatePassword(){
    $Number = Get-Random -Minimum 10 -Maximum 99
    $PosWord = Get-Random -Minimum 0 -Maximum 4
    $PosCharacter = Get-Random -Minimum 0 -Maximum 4    
    $Password = ($ArrWord[$PosWord]+$ArrCharacter[$PosCharacter]+$Number)
    return $Password
}
echo ""

while(!$PasswordSet){
    # Ask user if he wants to generate or create a password
    $Userinput = Read-Host "Geben Sie eine leere Eingabe ein, falls ein Passwort generiert werden soll, geben Sie ansonsten Ihr Passwort ein"
    # If there is userinput
    if($Userinput){
        # Ask user to repeat the password
        $UserinputRepeat = Read-Host "Geben Sie dasselbe Passwort erneut ein"
        # Check if the password is -eq
        if($Userinput -eq $UserinputRepeat){
            # Set $PasswordSet to true to break the queue
            $PasswordSet = $true
        }
    } else {
        Write-Host (generatePassword)
    }
}

# #>