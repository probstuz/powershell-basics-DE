# Scriptname: counterGui.ps1 
<#  
.SYNOPSIS 
    Third PowerShell-practice
  
.NOTES 
    Author:         Alejandro Probst 
    Version:        1.0 
    Date v1.0:      27.05.2019  
  
    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ 
    Changelog: 
    27.05.2019    APO    Version 1.0 
#>  

#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()


Function checkPointState(){
    if(([int]$TextBoxPoints.Text) -lt 10){
        $ButtonSubTen.Enabled = $false
        if(([int]$TextBoxPoints.Text) -lt 1){
            $ButtonSubOne.Enabled = $false
        } else {
            $ButtonSubOne.Enabled = $true
        }
    } else {
        $ButtonSubTen.Enabled = $true
    }
}

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '220,150'
$Form.text                       = "Form"
$Form.TopMost                    = $false

$ButtonAddTen                       = New-Object system.Windows.Forms.Button
$ButtonAddTen.text                  = "+10 Punkte"
$ButtonAddTen.width                 = 79
$ButtonAddTen.height                = 30
$ButtonAddTen.location              = New-Object System.Drawing.Point(24,70)
$ButtonAddTen.Font                  = 'Microsoft Sans Serif,9'

$ButtonSubTen                       = New-Object system.Windows.Forms.Button
$ButtonSubTen.text                  = "-10 Punkte"
$ButtonSubTen.width                 = 82
$ButtonSubTen.height                = 30
$ButtonSubTen.location              = New-Object System.Drawing.Point(114,70)
$ButtonSubTen.Font                  = 'Microsoft Sans Serif,9'

$ButtonAddOne                       = New-Object system.Windows.Forms.Button
$ButtonAddOne.text                  = "+1 Punkt"
$ButtonAddOne.width                 = 79
$ButtonAddOne.height                = 30
$ButtonAddOne.location              = New-Object System.Drawing.Point(24,110)
$ButtonAddOne.Font                  = 'Microsoft Sans Serif,9'

$ButtonSubOne                       = New-Object system.Windows.Forms.Button
$ButtonSubOne.text                  = "-1 Punkt"
$ButtonSubOne.width                 = 82
$ButtonSubOne.height                = 30
$ButtonSubOne.location              = New-Object System.Drawing.Point(114,110)
$ButtonSubOne.Font                  = 'Microsoft Sans Serif,9'

$LabelPoints                     = New-Object system.Windows.Forms.Label
$LabelPoints.text                = "Punkte:"
$LabelPoints.AutoSize            = $true
$LabelPoints.width               = 25
$LabelPoints.height              = 10
$LabelPoints.location            = New-Object System.Drawing.Point(25,22)
$LabelPoints.Font                = 'Microsoft Sans Serif,10'

$TextBoxPoints                   = New-Object system.Windows.Forms.TextBox
$TextBoxPoints.multiline         = $false
$TextBoxPoints.width             = 173
$TextBoxPoints.height            = 20
$TextBoxPoints.location          = New-Object System.Drawing.Point(24,38)
$TextBoxPoints.Font              = 'Microsoft Sans Serif,10'
$TextBoxPoints.Text              = "50"
$TextBoxPoints.Enabled           = $false

$ButtonAddTen.Add_Click({
    $TextBoxPoints.Text = [int]$TextBoxPoints.Text + 10
    checkPointState
})

$ButtonAddOne.Add_Click({
    $TextBoxPoints.Text = [int]$TextBoxPoints.Text + 1
    checkPointState  
})

$ButtonSubOne.Add_Click({
    $TextBoxPoints.Text = [int]$TextBoxPoints.Text - 1
    checkPointState
})

$ButtonSubTen.Add_Click({
    $TextBoxPoints.Text = [int]$TextBoxPoints.Text - 10
    checkPointState
})

$Form.controls.AddRange(@($ButtonAddTen,$ButtonAddOne,$ButtonSubTen,$ButtonSubOne,$LabelPoints,$TextBoxPoints))

$Form.ShowDialog()