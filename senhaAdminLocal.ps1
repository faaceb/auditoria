###################################################################################################################
# Script em PowerShell para verificar se o usuario Administrador local possui senha "em branco" de varias maquinas#
###################################################################################################################

#Obtem a listagem de maquinas a serem analisadas
$estacoes = Get-Content "C:\TEMP\maquinasInventarioEscopo.txt"

#Senha em branco que sera utilizada no teste
[string]$Password = ""

#Para cada maquina da listagem, execute...
foreach ($i in $estacoes){
    
    Write-host "---" $i "---"
    [string]$UserName = $i + "\Administrador"
    Add-Type -AssemblyName System.DirectoryServices.AccountManagement
    $DS = New-Object System.DirectoryServices.AccountManagement.PrincipalContext('machine',$i)
    $DS.ValidateCredentials($UserName, $Password)
}