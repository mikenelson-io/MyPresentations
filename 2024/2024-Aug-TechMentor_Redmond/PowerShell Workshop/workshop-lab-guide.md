## Learn PowerShell Live - Student Lab Guide

### Lab 1: Installing PowerShell

#### Objective:

Learn how to install PowerShell on various platforms.

#### Instructions:

**Windows:**

_Using the msi installer_

1. Open a web browser and navigate to the [PowerShell GitHub releases page](https://github.com/PowerShell/PowerShell/releases).
2. Download the latest `.msi` package for Windows.
3. Run the installer and follow the prompts:
   - Accept the license agreement.
   - Choose the installation directory.
   - Select additional options as needed (e.g., adding PowerShell to the PATH environment variable).
4. Once the installation is complete, open PowerShell by searching for "PowerShell" in the Start menu and selecting "Windows PowerShell" or "PowerShell".

_Using winget (Windows Package Manager)_

1. Open a terminal.
2. Install PowerShell using winget:

```powershell
winget install --id Microsoft.PowerShell -e
```

3. Start PowerShell by typing `pwsh`.
4. If winget is not installed, you can download it from the [Microsoft Store](https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1).

**Linux:**

1. Open a terminal.
2. Depending on your Linux distribution, follow the appropriate commands to install PowerShell:

**Debian/Ubuntu:**

```bash
sudo apt update
sudo apt install -y wget apt-transport-https software-properties-common
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update
sudo apt install -y powershell
```

Start PowerShell by typing `pwsh`.

**CentOS/RHEL:**

```bash
sudo yum install -y wget
sudo wget -q https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
sudo rpm -Uvh packages-microsoft-prod.rpm
sudo yum install -y powershell
```

Start PowerShell by typing `pwsh`.

**macOS:**

1. Open a terminal.
2. Install Homebrew if it is not already installed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. Use Homebrew to install PowerShell:

```bash
brew update
brew install --cask powershell
```

Start PowerShell by typing `pwsh`.

#### Verification:

1. Open PowerShell by typing `pwsh` in the terminal.
2. Verify the installation by checking the version:

```powershell
$PSVersionTable.PSVersion
```

#### Open a CMD Prompt (Windows users):

1. Open a CMD prompt by searching for "Command Prompt" in the Start menu.
2. Type `pwsh` to start PowerShell from the CMD prompt.
3. Change the window size and font settings.
4. Exit PowerShell by typing `exit`.

#### Open Windows Terminal (Windows users):

1. Install Windows Terminal if not installed on your laptop.

```powershell
winget install --id Microsoft.WindowsTerminal -e
```

2. Open Windows Terminal by searching for "Windows Terminal" in the Start menu.
3. Select the PowerShell profile to open a new PowerShell session.
4. Use the tabs to switch between different PowerShell sessions.
5. Use the dropdown menu to open a new PowerShell session or customize the terminal settings.

#### Open Terminal (macOS/Linux users):

1. Open the Terminal application.
2. Type `pwsh` to start PowerShell from the terminal.
3. Change the window size and font settings.
4. Exit PowerShell by typing `exit`.

### Lab 2: Exploring Cmdlets

#### Objective:

Learn how to use Get-Help, Get-Command, Get-Member, & Select-Object cmdlets. Learn how to view and add aliases. Learn how to use basic navigation.

#### Instructions:

1. **Basic navigation:**

Using Windows Terminal:

- Using tab completion:
  - Type `Get-` and press `Tab` to see available cmdlets.
  - Type `Get-` and press `Tab` twice to see all cmdlets starting with `Get-`.
  - Type `Get-Pro` and press `Tab` to complete the cmdlet name.
- Using command history:
  - Use the up and down arrow keys to navigate through command history.
- Use `Get-History` and `Invoke-History` to show and run a command from history:

```powershell
Get-History
Invoke-History -Id 1
```

- Use `Fn-F7` to view and select from command history.
- Use `Ctrl-R` to search command history. (Requires PSReadline)
- Run commands like Notepad, Calc, etc., from PowerShell.
- Use `cd` to change directories and `dir` or `ls` to list files.

1. **Using Get-Help:**

   - Open PowerShell.
   - Display help for a cmdlet:

   ```powershell
   Get-Help Get-Process
   ```

   - Display detailed help:

   ```powershell
   Get-Help Get-Process -Detailed
   ```

   - Display full help:

   ```powershell
   Get-Help Get-Process -Full
   ```

   - BONUS: Update the help content if available online:

   ```powershell
   Update-Help
   ```

2. **Using Get-Command:**

   - List all available cmdlets:

   ```powershell
   Get-Command
   ```

   - Find a specific cmdlet:

   ```powershell
   Get-Command *service*
   ```

3. **Using Get-Member:**

   - Retrieve properties and methods of an object:

   ```powershell
   Get-Process | Get-Member
   ```

4. **Using Select-Object:**

   - Select specific properties of an object:

   ```powershell
   Get-Process | Select-Object -Property Name, CPU
   ```

5. **Viewing and Adding Aliases:**

   - View all aliases:

   ```powershell
   Get-Alias
   ```

   - Add an alias for a cmdlet:

   ```powershell
   New-Alias -Name "gp" -Value "Get-Process"
   ```

   - Use the alias:

   ```powershell
   gp
   ```

#### Exercises to try:

1. Use `Get-Help` to find detailed information about the `Get-Command` cmdlet.
2. Use `Get-Command` to find cmdlets that contain the verb `Get`.
3. Use `Get-Member` to explore properties and methods of the `Get-Command` output.
4. Create a new alias for the `Get-Command` cmdlet and use it.

### Lab 3: Using the Pipeline

#### Objective:

Learn how to filter and sort data using the PowerShell pipeline.

#### Instructions:

1. **Filtering Data:**

   - Open PowerShell.
   - Use `Where-Object` to filter processes:

   ```powershell
   Get-Process | Where-Object { $_.CPU -gt 10 }
   ```

2. **Sorting Data:**

   - Sort processes by CPU usage:

   ```powershell
   Get-Process | Sort-Object -Property CPU -Descending
   ```

3. **Selecting Data:**

   - Select specific properties of processes:

   ```powershell
   Get-Process | Select-Object -Property Name, SessionId, CPU
   ```

4. **Combining Commands:**

   - Filter, sort, & select processes:

   ```powershell
   Get-Process | Where-Object { $_.CPU -gt 10 } | Sort-Object -Property CPU -Descending | Select-Object -first 5
   ```

5. **Formatting the output:**

   - Format the output as a table:

   ```powershell
   Get-Process | Format-Table -Property Name, SessionId, CPU
   ```

#### Exercises to try:

1. List all services that are currently running.
2. Sort the list of running processes by memory usage.
3. Select only the name and session ID of all running processes and display them in a table format.
4. Combine the above commands to filter, sort, and select services.
5. BONUS: Get all running processes and format the output as a table that is Grouped by the SessionId.

### Lab 4: Variables and Arrays

#### Objective:

Learn how to create and manipulate variables, arrays, and hash tables.

#### Instructions:

1. **Creating Variables:**

   - Open PowerShell.
   - Create a variable:

   ```powershell
   $greeting = "Hello, PowerShell!"
   ```

2. **Creating Arrays:**

   - Create an array:

   ```powershell
   $numbers = 1, 2, 3, 4, 5
   ```

3. **Creating Hash Tables:**

   - Create a hash table:

   ```powershell
   $person = @{
       Name = "John Doe"
       Age = 30
       Occupation = "Developer"
   }
   ```

4. **Manipulating Variables:**

   - Access array elements:

   ```powershell
   $numbers[0]
   ```

   - Add elements to an array:

   ```powershell
   $numbers += 6
   ```

   - Access hash table values:

   ```powershell
   $person["Name"]
   ```

#### Exercises to try:

1. Create a variable to store your name.
2. Create an array of the first five prime numbers.
3. Create a hash table to store information about your favorite book.

### Lab 5: Writing Scripts

#### Objective:

Learn how to write and run basic PowerShell scripts.

#### Instructions:

1. **Writing a Simple Script:**

   - Open a text editor (e.g., Notepad).
   - Write a simple script:

   ```powershell
   # My first script
   $greeting = "Greetings TechMentor PowerShell Workshop!"
   Write-Output $greeting
   ```

2. **Saving a Script:**

   - Save the file with a `.ps1` extension, e.g., `script1.ps1`.

3. **Running a Script:**

   - Open PowerShell.
   - Navigate to the directory where the script is saved.
   - Run the script:

   ```powershell
   .\script1.ps1
   ```

4. **Writing More Scripts:**

- Open a text editor (e.g., Visual Studio Code).
- Write the script and save it with a `.ps1` extension (eg. script2.ps1"):

```powershell
if ($PSVersionTable.PSVersion.Major -le 5) {
   Write-Host "PowerShell version is 5 or lower"
}
elseif ($PSVersionTable.PSVersion.Major -gt 5) {
   Write-Host "pwsh is version 7 or higher"
}
```

3. **Running the Script:**

   - Open PowerShell.
   - Navigate to the directory where the script is saved.
   - Run the script:

   ```powershell
   .\script2.ps1
   ```

4. **Handling Errors:**
   - Add error handling to your script:
   ```powershell
   try {
       Get-Process -Name "NonExistentProcess" -ErrorAction Stop
   } catch {
       Write-Host "Process not found."
   }
   ```
   - What happens if you leave the `-ErrorAction Stop` parameter out?

#### Exercises to try:

1. Write a script that prints "Hello, [Your Name]!".
2. Modify the script to handle cases where a non-existent process is queried.
3. Save and run your script.

### Lab 6: Working with Modules

#### Objective:

Learn how to install and create PowerShell modules.

#### Instructions:

1. **Installing Modules:**

   - Open PowerShell.
   - Find a module in the PowerShell Gallery:

   ```powershell
   Find-Module -Name PSReadLine
   ```

   - Install the module:

   ```powershell
   Install-Module -Name PSReadLine
   ```

2. **Using Modules:**

   - Import a module:

   ```powershell
   Import-Module -Name PSReadLine
   ```

3. **Creating Modules:**

   - Create a module file:

   ```powershell
   function Get-Greeting {
       param ($Name)
       "Hello, $Name!"
   }

   Export-ModuleMember -Function Get-Greeting
   ```

   - Save the file with a `.psm1` extension, e.g., `MyModule.psm1`.

4. **Using Custom Modules:**

   - Import your custom module:

   ```powershell
   Import-Module -Name C:\Path\To\MyModule.psm1
   ```

   - Use the function from your module:

   ```powershell
   Get-Greeting -Name "PowerShell"
   ```

#### Exercises to try:

1. Install a module from the PowerShell Gallery.
2. Create a custom module with a function that prints a greeting.
3. Import and use your custom module.

### Lab 7 (If time permits): Automation

#### Objective:

Learn how to set up PowerShell to automate tasks.

#### Instructions:

1. **Automating Tasks:**
   - Create a scheduled task:
   ```powershell
   $action = New-ScheduledTaskAction -Execute 'pwsh.exe' -Argument '-File C:\Scripts\MyScript.ps1'
   $trigger = New-ScheduledTaskTrigger -Daily -At 7am
   Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "MyDailyTask"
   ```

#### Exercises to try:

1. Create a scheduled task to run a script at a specific time.
