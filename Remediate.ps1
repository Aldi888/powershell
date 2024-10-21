# Define the target time zone for France
$targetTimeZone = "Romance Standard Time"

# Get the status of the tzautoupdate service
$tzAutoUpdateStatus = Get-Service -Name "tzautoupdate"

# Get the current time zone
$currentTimeZone = (Get-TimeZone).Id

# Remediation: Disable tzautoupdate service if it's enabled
if ($tzAutoUpdateStatus.StartType -ne 'Disabled') {
    Set-Service -Name "tzautoupdate" -StartupType Disabled
    Stop-Service -Name "tzautoupdate" -Force
    Write-Host "Remediation: tzautoupdate service has been disabled."
}

# Remediation: Set time zone to France (Romance Standard Time) if it's not already set
if ($currentTimeZone -ne $targetTimeZone) {
    Set-TimeZone -Id $targetTimeZone
    Write-Host "Remediation: Time zone has been set to France (Romance Standard Time)."
}
