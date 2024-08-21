# Define the domain entries to add
$hosts = @{
    "api.ecom.local" = "127.0.0.1"
    "api.awesomemediaplayer.local" = "127.0.0.1"
    "awesomemediaplayer.local" = "127.0.0.1"
}

# Define the path to the hosts file
$hostsFilePath = "$env:SystemRoot\System32\drivers\etc\hosts"

# Function to check if a host entry exists
function HostExists {
    param (
        [string]$domain
    )
    return Select-String -Path $hostsFilePath -Pattern $domain -Quiet
}

# Add missing entries to the hosts file
function AddHostEntries {
    foreach ($domain in $hosts.Keys) {
        if (HostExists -domain $domain) {
            Write-Host "Host entry for $domain already exists."
        } else {
            Write-Host "Adding host entry for $domain..."
            "$($hosts[$domain]) $domain" | Out-File -Append -FilePath $hostsFilePath -Encoding ascii
        }
    }
    Write-Host "Host entries added successfully."
}

# Ensure the script is run as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You need to run this script as an administrator."
    exit
}

# Run the function to add host entries
AddHostEntries
