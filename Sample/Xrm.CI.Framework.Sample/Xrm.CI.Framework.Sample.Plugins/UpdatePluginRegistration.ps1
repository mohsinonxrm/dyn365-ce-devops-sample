﻿[CmdletBinding()]

param
(
	[string]$CrmConnectionString #The connection string as per CRM Sdk
)

$ErrorActionPreference = "Stop"

#Script Location
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Write-Verbose "Script Path: $scriptPath"

Write-Verbose "ConnectionString = $connectionString"

if ($CrmConnectionString -eq '')
{
	$CrmConnectionString = $Env:CrmConnection
}
$AssemblyPath = "$scriptPath\bin\Debug\Xrm.CI.Framework.Sample.Plugins.dll"
$SolutionName = 'xRMCISample'
$MappingFile = "$scriptPath\PluginRegistration.json"
$RegistrationType = "upsert"
$Timeout = 360

& "$scriptPath\..\packages\XrmCIFramework.9.0.0.23\tools\PluginRegistration.ps1" -Verbose -CrmConnectionString "$CrmConnectionString" -AssemblyPath "$AssemblyPath" -MappingFile "$MappingFile" -SolutionName $SolutionName -RegistrationType $RegistrationType -Timeout $Timeout