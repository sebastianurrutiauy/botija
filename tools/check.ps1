param([Parameter(Mandatory=$true)][string]$GodotPath)
$ErrorActionPreference = 'Stop'
$projectDir = Split-Path $PSScriptRoot -Parent
$checkDir = Join-Path ([IO.Path]::GetTempPath()) ('botija-check-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $checkDir | Out-Null
$stages = @(
 @{ Name='import'; Args=@('--headless','--editor','--import','--quit') },
 @{ Name='tour'; Args=@('--headless','--fixed-fps','60','--','--test') }
)
foreach ($stage in $stages) {
 $stdout = Join-Path $checkDir ($stage.Name + '.log')
 $stderr = Join-Path $checkDir ($stage.Name + '.err')
 $process = Start-Process -FilePath $GodotPath -ArgumentList (@('--path',('"'+$projectDir+'"')) + $stage.Args) -NoNewWindow -PassThru -RedirectStandardOutput $stdout -RedirectStandardError $stderr
 if (-not $process.WaitForExit(120000)) {
  $process.Kill()
  throw "Godot excedio el tiempo de espera. Logs: $checkDir"
 }
 $process.WaitForExit()
 $result = [IO.File]::ReadAllText($stdout)
 $errors = [IO.File]::ReadAllText($stderr)
 Write-Host $result
 # Windows sandbox can report certificate-store failure; it does not affect this offline game.
 $errors = $errors -replace '(?m)^ERROR: Failed to read the root certificate store\.\r?\n\s+at:.*\r?\n', ''
 if ($process.ExitCode -ne 0 -or $errors -match '(SCRIPT ERROR|ERROR:|FAIL:)') {
  throw "Fallo en $($stage.Name): $errors. Logs: $checkDir"
 }
 if ($stage.Name -eq 'tour' -and $result -notmatch 'TOUR_COMPLETE checks=\d+ failures=0') {
  throw "No se completo el recorrido. Logs: $checkDir"
 }
}
Write-Host "Verificacion completada. Logs: $checkDir"
exit 0
