Get-ADDomain | Select InfrastructureMaster, RIDMaster, PDCEmulator
Get-ADForest | Select DomainNamingMaster, SchemaMaster
Get-ADDomainController -Filter * | Select-Object Name, Domain, Forest, OperationMasterRoles | Where-Object {$_.OperationMasterRoles} | Format-Table -AutoSize
