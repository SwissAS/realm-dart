# symlinks.ps1

$root = Split-Path -Parent $MyInvocation.MyCommand.Definition

$sourceData = Join-Path $root "packages\realm_dart\test\data"
$targetData = Join-Path $root "packages\realm\tests\test\data"

$sourceRealmFiles = Join-Path $root "packages\realm_dart\test\data\realm_files"
$targetRealmFiles = Join-Path $root "packages\realm\tests\test\data\realm_files"

# Create junction for data directory
if (-not (Test-Path $targetData)) {
    New-Item -ItemType Junction -Path $targetData -Target $sourceData
}

# Create junction for realm_files directory
if (-not (Test-Path $targetRealmFiles)) {
    New-Item -ItemType Junction -Path $targetRealmFiles -Target $sourceRealmFiles
}
