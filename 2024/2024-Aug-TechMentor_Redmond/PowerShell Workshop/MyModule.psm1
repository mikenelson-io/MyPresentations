 function Get-Greeting {
       param ($Name)
       "Hello, $Name!"
   }
Export-ModuleMember -Function Get-Greeting