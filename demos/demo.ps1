<###################
BASES DE POWERSHELL
####################>

# Variable contenant les informations de PowerShell
$PSVersionTable

# Chemin du répertoire de l'utilisateur
$HOME

# Affiche l'aide de Get-Help
Get-Help -Name Get-Help

# Alias de la commande Get-Help
man Get-Help

# Alias de la commande Get-Help
help Get-Help

# Affiche les exemples d'une commande
help Get-Help -Examples

# Le caractère ? remplace un seul caractère
help about_?sing

# Affiche les aides du langage PowerShell
help about_*

# Affiche toutes les commandes dispos sur PowerShell
Get-Command

# Aide de la commande Get-Command
help Get-Command

# Affiche les commandes par rapport à un type (alias, function, cmdlet ...)
Get-Command -CommandType Alias

# Récupère les commandes avec le verbe Get
Get-Command -Verb Get

# Affiche la langue de l'ordinateur
Get-Language

# Récupère la partie après le verbe qui commence par Item
Get-Command -Noun Item*

# Filtre par rapport au nom complet de la commande
Get-Command -Name *e-i*

# Liste les verbes de PowerShell
Get-Verb

help Get-Member -Examples

Get-Service | Get-Member

$prenom = "Arthur"

# Affiche les membres du type String
$prenom | Get-Member

# Utilisation d'un propriété
$prenom.Length

# Utilisation d'une méthode
$prenom.ToUpper()

Get-Process | Get-Member

# Pipeline

Get-Command | Out-File .\demos\commands.txt

Get-Content .\demos\commands.txt | Sort-Object

Get-Content .\demos\commands.txt

cat .\demos\commands.txt

Out-File -?

# Manipulation de résultats

# Récupère les processus dont le CPU est > 200
Get-Process | Where-Object -Property CPU -gt 200
# Syntaxe avec un alias
Get-Process | ? -Property ProcessName -eq Code

# Permet de sélectionner les colonnes à afficher
Get-Service | Select-Object Name

Get-Service | Select-Object Name, Status | Sort-Object -Property Name

help Select-Object -Examples

# $_ ou $PSItem : Variable automatique qui contient l’objet actuel dans l’objet pipeline
Get-Command | ForEach-Object { $_.Name.ToUpper() }
Get-Command | ForEach-Object { $PSItem.Name.ToUpper() }
Get-Command | % { $_.Name.ToUpper() }

Get-Command | Get-Member

Get-Command | select -last 1

Get-Service | Group-Object -Property Status
Get-Service | group -Property Status

# Récupère les alias d'une cmdlet
Get-Alias -Definition Group-Object

# Récupère la commande d'un alias
Get-Alias pwd

Get-Alias -Definition Get-Command

# Format d'affichage

Get-Command -Verb Format

Get-Command | Where-Object -Property Name -Like *Process* | Format-List
Get-Command | Where-Object -Property Name -Like *Process* | Format-Table
Get-Command | Where-Object -Property Name -Like *Process* | Format-Wide

Get-Disk | Select-Object  Model, Size | Format-List

# Création d'un Alias
New-Alias -Name ww -Value Write-Warning

# Providers
Get-PSProvider

Get-PSDrive

# Variable Automatiques
$PSVersionTable | Get-Member
$PSVersionTable.GetType()

# Chemin d'accès du répertoire de l'utilisateur courant
$HOME

$PROFILE

$HOME > .\demos\home.txt
$Profile > .\demos\home.txt

# Redirection du flux d'erreur dans la réussite
Get-ChildItem 'C:\', 'fakepath' 2>&1 > .\demos\dir.log
Get-ChildItem 'C:\', 'fakepath' > .\demos\dir.log

cat .\demos\dir.log

# Simuler une action
New-Item -Path .\demos\test.xyz -WhatIf

# Confirmation avant exécution
Remove-Item -Path .\demos\home.txt -Confirm

<###############
SCRIPTS
################>

Get-ExecutionPolicy

#region MaRegion

Write-Host "Hello"
Write-Host "ça va ?"

#endregion

# Execution du script uniquement si les prérequis sont remplis
#Requires -Version 7.0

# Variables

$chien = "Rex"

$age = 30

$argent = 12.5

[int]$pieds = 2
[string]$surnom = "dupont"
[double]$money = 12.5
[char]$titre = "M"

# Exception levée, convertion de type impossible
$pieds = "toto"

# Création d'une constante
New-Variable -Name "REPERTOIRE" -Value "C:\Users\PC\Documents\session_formation\20230504_M2I\demos" -Option Constant

$REPERTOIRE

# Concaténation de chaînes

$message = "Bonjour, " + $surnom
$message

$message = "Au revoir $surnom"

# La chaîne n'est pas interprétée
$message = 'Au revoir $surnom'

$directory = Get-Item .\demos

# $() permet d'exécuter des méthodes
$message = "Date création: $($directory.CreationTime)"

<#########################
STRUCTURES CONDITIONNELLES
##########################>

if ($surnom.Length -gt 5 -and $surnom -notin "toto", "benard") {
    Write-Host "Votre surnom: $surnom est long"
}

if ($surnom.Length -gt 5) {
    Write-Host "Votre surnom: $surnom est long"
}
else {
    Write-Host "Votre surnom: $surnom est court"
}

if ( Test-Path -Path "C:\Users\PC\Documents\session_formation\20230504_M2I\demos" -PathType Leaf ) {
    Write-Host "Le chemin existe"
}
elseif ( Test-Path -Path "C:\Users\PC\Documents\session_formation\20230504_M2I\demos" ) {
    Write-Warning "A file was required but a directory was found instead."
}
else {
    Write-Host "Rien"
}

switch ($surnom) {
    'toto' {
        Write-Host "Bonjour $surnom"
    }

    'dupont' {
        Write-Debug "Bonjour $surnom"
    }

    'jean' {
        Write-Error "Bonjour $surname"
    }
    default {
        Write-Host "RIEN"
    }
}