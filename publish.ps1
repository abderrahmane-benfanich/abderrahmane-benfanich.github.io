$ErrorActionPreference = "Stop"

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$message = "auto update $timestamp"

Write-Host "Staging changes..."
git add -A

# Stop early when there is nothing new to publish.
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "No changes to commit."
    exit 0
}

Write-Host "Committing: $message"
git commit -m $message

Write-Host "Pushing to origin main..."
git push origin main

Write-Host "Publish complete."
