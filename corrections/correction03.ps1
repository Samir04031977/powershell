# Redirection des erreurs vers errors.txt et succès vers process.txt
Get-Process -Id 20693 2>>.\corrections\redirections\errors.txt 1>>.\corrections\redirections\process.txt
