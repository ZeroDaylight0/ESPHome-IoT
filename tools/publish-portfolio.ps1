param(
    [string]$Remote = "https://github.com/sdfghjkl404/ESPHome-IoT.git"
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

$yamlRoots = @(
    "esphome/energy-monitoring",
    "esphome/battery-management",
    "esphome/displays",
    "esphome/sensors",
    "esphome/camera",
    "esphome/networking"
)

git add .gitignore README.md secrets.example.yaml tools/publish-portfolio.ps1
git add $yamlRoots
git add esphome/assets
git add -u

$stagedSecrets = git diff --cached --name-only | Where-Object {
    $_ -match '(^|/)(secrets\.yaml|\.env($|\.)|dontwork/|Experements/|venv/|\.esphome/)'
}
if ($stagedSecrets) {
    throw "Refusing to publish excluded files: $($stagedSecrets -join ', ')"
}

$credentialMatches = git diff --cached -- '*.yaml' '*.yml' '*.py' '*.ps1' |
    Select-String -Pattern '(?i)(password|token|api[_-]?key|username|ssid|broker)\s*:\s*["'']' |
    Where-Object { $_.Line -notmatch '!secret|YOUR_|CHANGE_ME' }
if ($credentialMatches) {
    throw "Potential hard-coded credentials found in staged files."
}

git remote set-url origin $Remote
git branch -M main
git diff --cached --check
git commit -m "Create ESPHome IoT portfolio"
git push -u origin main
