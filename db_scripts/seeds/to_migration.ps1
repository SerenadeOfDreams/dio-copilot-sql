#Encontrar o diretório atual
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent 

#Arquivo de saída
$outputFile = Join-Path -Path $scriptDirectory -ChildPath "migration.sql"

#Verificando se o arquivo de saída já existe e deleta caso exista
if (Test-Path $outputFile)
{
    Remove-Item $outputFile
}

#Pega o conteúdo dos arquivos
$sqlFiles = Get-ChildItem -Path $scriptDirectory -Filter *.sql -File | Sort-Object Name

#Concatena os aqruivos
foreach ($file in $sqlFiles){
    Get-Content $file.FullName | Out-File -Append -FilePath $outputFile
}

Write-Host "Todos os arquivos foram combinados em $outputFile"