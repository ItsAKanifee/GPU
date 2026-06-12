param(
    [Parameter(Mandatory=$true)][string]$FilePath,
    [Parameter(Mandatory=$true)][string]$Message,
    [string]$Author = $env:USERNAME,
    [string]$CommitHash = ""
)

if (-not (Test-Path -LiteralPath $FilePath)) {
    Write-Error "File not found: $FilePath"
    exit 1
}

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitPart = if ($CommitHash -ne "") { " | commit: $CommitHash" } else { "" }
$entryHeader = "=== IN-FILE CHANGELOG ===`n"
$entry = "$timestamp | $Author$commitPart | $Message`n"
$entry += "- file: $(Split-Path -Leaf $FilePath)`n"
$entry += "- details: \n"
$entry += "`n"

# Read existing content and prepend entry
$content = Get-Content -Raw -LiteralPath $FilePath
Set-Content -LiteralPath $FilePath -Value ($entryHeader + $entry + $content) -Encoding UTF8

Write-Output "Prepended changelog entry to $FilePath"
