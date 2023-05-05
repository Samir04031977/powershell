# Q1
New-Alias -Name pss -Value Get-Process

# Q2
pss | Sort-Object -Property WorkingSet64 -Descending

# Q3
pss | Where-Object -Property Name -Like p* | Sort-Object -Property WorkingSet64 -Descending 

# Q4
pss | 
Where-Object -Property Name -Like p* | 
Sort-Object -Property WorkingSet64 -Descending | 
Select-Object Name, Id, WorkingSet64