# Define the target time zone for France
$targetTimeZone = "Romance Standard Time"

# Get the status of the tzautoupdate service
$tzAutoUpdateStatus = Get-Service -Name "tzautoupdate"

# Get the current time zone
$currentTimeZone = (Get-TimeZone).Id

# Detection: Check if tzautoupdate is enabled or if the time zone is not set to France
if ($tzAutoUpdateStatus.StartType -ne 'Disabled' -or $currentTimeZone -ne $targetTimeZone) {
    # If either condition is not met, return 1 (indicating remediation is required)
    Write-Host "Detection failed: tzautoupdate is not disabled or the time zone is not set to France."
    exit 1
} else {
    # Return 0 (no remediation required)
    Write-Host "Detection passed: tzautoupdate is disabled and the time zone is set to France."
    exit 0
}
