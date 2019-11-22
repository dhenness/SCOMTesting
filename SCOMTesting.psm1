function Create-Test_SCOM_Database
{
	[cmdletbinding()]
	param([string]$Instance)

$Query = @"
-- Create testing database
USE [master]
IF EXISTS(select * from sys.databases where name='Test_SCOM_Database')
DROP DATABASE Test_SCOM_Database

CREATE DATABASE [Test_SCOM_Database]
"@

	$x = invoke-sqlcmd -ServerInstance $Instance -query $Query
	return $x

} # end Function 


Set-Alias -Name ctsdb -Value Create-Test_SCOM_Database
Export-ModuleMember -Function Create-Test_SCOM_Database -Alias *