$ErrorActionPreference = 'Stop'
$repo = (Split-Path $PSScriptRoot -Parent).Replace('\','/')
$branch = 'codex/project-architecture'
Write-Host 'Subiendo la rama de arquitectura a sebastianurrutiauy/botija.'
Write-Host 'Si GitHub solicita iniciar sesion, completa el acceso en tu navegador.'
& git -c "safe.directory=$repo" -c http.sslBackend=openssl -C $repo push -u origin $branch
if ($LASTEXITCODE -ne 0) {
 Write-Host 'La subida no se completo. Revisa el mensaje de Git antes de volver a intentar.'
 exit 1
}
Write-Host 'Rama subida. Puedes revisar los cambios y abrir un pull request:'
Write-Host 'https://github.com/sebastianurrutiauy/botija/compare/main...codex/project-architecture'
exit 0
