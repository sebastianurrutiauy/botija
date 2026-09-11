param(
 [ValidateSet('play','editor','test','capture')] [string]$Mode = 'play',
 [string]$GodotPath = $env:GODOT_BIN
)
$ErrorActionPreference = 'Stop'
$projectDir = Split-Path $PSScriptRoot -Parent
if (-not $GodotPath) {
 foreach ($commandName in @('godot','godot4','Godot_v4.7.2-stable_win64.exe')) {
  $command = Get-Command $commandName -ErrorAction SilentlyContinue
  if ($command) { $GodotPath = $command.Source; break }
 }
}
if (-not $GodotPath -or -not (Test-Path -LiteralPath $GodotPath)) {
 throw 'Indica -GodotPath C:\ruta\Godot.exe o configura GODOT_BIN con la ruta de tu ejecutable.'
}
$arguments = @('--path', ('"' + $projectDir + '"'))
if ($Mode -eq 'editor') { $arguments += '--editor' }
if ($Mode -eq 'test') { $arguments += @('--headless','--fixed-fps','60','--','--test') }
if ($Mode -eq 'capture') { $arguments += @('--','--capture') }
$process = Start-Process -FilePath $GodotPath -ArgumentList $arguments -Wait -PassThru -NoNewWindow
exit $process.ExitCode
