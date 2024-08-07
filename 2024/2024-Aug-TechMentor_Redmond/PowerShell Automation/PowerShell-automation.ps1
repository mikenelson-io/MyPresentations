
# Open Microsoft Graph explorer and web pages

# Open PowerShell and connect to MSGraph
Import-Module Microsoft.Graph.Authentication
Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.DirectoryObjects
Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All", "Directory.Read.All", "User.Invite.All", "Group.ReadWrite.All", "Directory.ReadWrite.All"
Get-MgUser -All
Get-MgUser | Where-Object DisplayName -like "Mike"
Get-MgUser | Get-Member

# Open swagger


# Create a new user in AD
## Define user details
$userName = "JohnDoe"
$firstName = "John"
$lastName = "Doe"
$password = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force
$email = "john.doe@example.com"

## Create user account
New-ADUser -SamAccountName $userName -GivenName $firstName -Surname $lastName -AccountPassword $password -EmailAddress $email -Enabled $true

## Add user to a group
Add-ADGroupMember -Identity "GroupName" -Members $userName

# Automate for multiple users via a .csv file
$users = Import-Csv "C:\demo\poshautomate\newADusers.csv"
foreach ($user in $users) {
    $userName = $user.UserName
    $firstName = $user.FirstName
    $lastName = $user.LastName
    $password = ConvertTo-SecureString $user.Password -AsPlainText -Force
    $email = $user.Email
    $groupName = $user.GroupName

    New-ADUser -SamAccountName $userName -GivenName $firstName -Surname $lastName -AccountPassword $password -EmailAddress $email -Enabled $true
    Add-ADGroupMember -Identity $GroupName -Members $userName
}

# Automate for multiple users using Power Automate
$users = Get-Content "C:\demo\poshautomate\newADusers.txt"
foreach ($user in $users) {
    $userDetails = $user -split ","
    $userName = $userDetails[0]
    $firstName = $userDetails[1]
    $lastName = $userDetails[2]
    $password = ConvertTo-SecureString $userDetails[3] -AsPlainText -Force
    $email = $userDetails[4]
    $groupName = $userDetails[5]

    New-ADUser -SamAccountName $userName -GivenName $firstName -Surname $lastName -AccountPassword $password -EmailAddress $email -Enabled $true
    Add-ADGroupMember -Identity $groupName -Members $userName
}

# Automate for a user from a web form
$param = @{
    UserName = $Request.Form["UserName"]
    FirstName = $Request.Form["FirstName"]
    LastName = $Request.Form["LastName"]
    Password = ConvertTo-SecureString $Request.Form["Password"] -AsPlainText -Force
    Email = $Request.Form["Email"]
    GroupName = $Request.Form["GroupName"]
}

New-ADUser @param
Add-ADGroupMember -Identity $param.GroupName -Members $param.UserName

# Automate for a user from a REST API
$uri = "http://example.com/api/newuser"
$response = Invoke-RestMethod -Uri $uri -Method Get
$user = $response | ConvertFrom-Json

$param = @{
    UserName = $user.UserName
    FirstName = $user.FirstName
    LastName = $user.LastName
    Password = ConvertTo-SecureString $user.Password -AsPlainText -Force
    Email = $user.Email
    GroupName = $user.GroupName
}

New-ADUser @param
Add-ADGroupMember -Identity $param.GroupName -Members $param.UserName

# Automate for a user from a database
$connectionString = "Server=ServerName;Database=DatabaseName;Integrated Security=True;"
$query = "SELECT * FROM Users WHERE Status = 'New'"
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString
$connection.Open()

$command = $connection.CreateCommand()
$command.CommandText = $query
$reader = $command.ExecuteReader()

while ($reader.Read()) {
    $param = @{
        UserName = $reader["UserName"]
        FirstName = $reader["FirstName"]
        LastName = $reader["LastName"]
        Password = ConvertTo-SecureString $reader["Password"] -AsPlainText -Force
        Email = $reader["Email"]
        GroupName = $reader["GroupName"]
    }

    New-ADUser @param
    Add-ADGroupMember -Identity $param.GroupName -Members $param.UserName
}

$connection.Close()

# Automate for a user from ServiceNow Ticket
$uri = "https://demo.service-now.com/api/now/table/incident?sysparm_query=active=true"
$headers =
@{
    "Accept" = "application/json"
    "Authorization { "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("username:password")) }
}

$response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get
$incidents = $response.result

foreach ($incident in $incidents) {
    $param = @{
        UserName = $incident.caller_id
        FirstName = $incident.caller_id.first_name
        LastName = $incident.caller_id.last_name
        Password = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force
        Email = $incident.caller_id.email
        GroupName = $incident.GroupName"
    }

    New-ADUser @param
    Add-ADGroupMember -Identity $param.GroupName -Members $param.UserName

## Update the incident in ServiceNow
    $uri = "https://demo.service-now.com/api/now/table/incident/" + $incident.sys_id
    $body = @{
        state = "Resolved"
    }

    Invoke-RestMethod -Uri $uri -Headers $headers -Method Patch -Body ($body | ConvertTo-Json)


##### Ctrl-Enter



# Find and delete log files older than 7 days on multiple servers
## List of servers
$servers = "Server1", "Server2", "Server3"

## File path
$logPath = "C:\Logs"

## Delete log files older than 7 days
foreach ($server in $servers) {
    Get-ChildItem -Path "\\$server\$logPath" -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) } | Remove-Item -Force
}

# Automate for multiple servers using Power Automate
$servers = Get-Content "C:\demo\poshautomate\servers.txt"
$logPath = "C:\Logs"

foreach ($server in $servers) {
    Get-ChildItem -Path "\\$server\$logPath" -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) } | Remove-Item -Force
}

# Automate for multiple servers using a web form
$servers = $Request.Form["Servers"]
$logPath = $Request.Form["LogPath"]

foreach ($server in $servers) {
    Get-ChildItem -Path "\\$server\$logPath" -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) } | Remove-Item -Force
}

## SQL example
# Script to connect to SQL Server and retrieve database names
   Import-Module SQLPS -DisableNameChecking
   $serverInstance = "localhost"
   $databases = Invoke-Sqlcmd -ServerInstance $serverInstance -Query "SELECT name FROM sys.databases"
   $databases | ForEach-Object { Write-Output $_.name }


## API Examples

# Load script files