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

