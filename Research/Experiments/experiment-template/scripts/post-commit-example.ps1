#!pwsh
# Example post-commit hook caller — place in `.git\hooks\post-commit` or call from your hook manager.

# Get latest commit short hash
$hash = (& git rev-parse --short HEAD) -join ""

# List files in this commit
$files = (& git diff-tree --no-commit-id --name-only -r $hash) -split "`n" | Where-Object { $_ -ne "" }

foreach ($f in $files) {
    if (Test-Path -LiteralPath $f) {
        Write-Output "Adding changelog entry to $f"
        $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
        & "$scriptDir\log_change.ps1" -FilePath $f -Message "Auto: commit $hash" -Author $env:USERNAME -CommitHash $hash
    }
}
