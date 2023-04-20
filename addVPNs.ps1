#name the connections
$Site1name = "name of vpn1"
$Site2name = "name of vpn2"

#WAN ips of vpn servers
$Site1IP = "208.105.x.x"
$Site2IP = "71.79.x.x"

$VPNTunnelType = "L2tp"
$VPNEncryptionLevel  = "Required"
$VPNAuthMethod = "MSChapv2"

#networks to be routed over vpns
$Destination1Prefix = "172.29.0.0/16"
$Destination2Prefix = "172.30.0.0/16"

#shared secrets
$Site1SharedSecret = "h448wUH6pdPMnTWytftht6ED"
$Site2SharedSecret = "BW8X94QaeYpDcfqu6N3XJhhU"

Add-VpnConnection -Name $Site1name -ServerAddress $Site1IP -TunnelType $VPNTunnelType -EncryptionLevel $VPNEncryptionLevel -L2tpPsk $Site1SharedSecret -AllUserConnection -AuthenticationMethod $VPNAuthMethod -SplitTunneling -Force 
Add-VpnConnection -Name $Site2name -ServerAddress $Site2IP -TunnelType $VPNTunnelType -EncryptionLevel $VPNEncryptionLevel -L2tpPsk $Site2SharedSecret -AllUserConnection -AuthenticationMethod $VPNAuthMethod -SplitTunneling -Force 

$InstalledVPNs = Get-VpnConnection -AllUserConnection

 foreach ($InstalledVPN in $InstalledVPNs) {
 
 $InstalledVPNName = $InstalledVPN.Name                                                                            
 
Add-VpnConnectionRoute -ConnectionName $InstalledVPN.Name -DestinationPrefix $Destination1Prefix -AllUserConnection
Add-VpnConnectionRoute -ConnectionName $InstalledVPN.Name -DestinationPrefix $Destination2Prefix -AllUserConnection

                                                         }
