/*
@TargetNode='DC1'
@GeneratedBy=Administrator
@GenerationDate=01/24/2019 13:27:11
@GenerationHost=DC1
*/

instance of MSFT_xIPAddress as $MSFT_xIPAddress1ref
{
ResourceID = "[xIPAddress]PrimaryIPAddress";
 InterfaceAlias = "Ethernet";
 AddressFamily = "IPv4";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::32::13::xIPAddress";
 ModuleName = "xNetworking";
 IPAddress = {
    "10.11.12.34"
};
 ModuleVersion = "5.7.0.0";

 ConfigurationName = "conf";

};
instance of MSFT_xDefaultGatewayAddress as $MSFT_xDefaultGatewayAddress1ref
{
ResourceID = "[xDefaultGatewayAddress]PrimaryDefaultGateway";
 AddressFamily = "IPv4";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::42::17::xDefaultGatewayAddress";
 Address = "10.11.12.1";
 ModuleName = "xNetworking";
 InterfaceAlias = "Ethernet";
 ModuleVersion = "5.7.0.0";

 ConfigurationName = "conf";

};
instance of MSFT_xDNSServerAddress as $MSFT_xDNSServerAddress1ref
{
ResourceID = "[xDNSServerAddress]PrimaryDNSClient";
 AddressFamily = "IPv4";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::52::17::xDnsServerAddress";
 Address = {
    "127.0.0.1"
};
 ModuleName = "xNetworking";
 InterfaceAlias = "Ethernet";
 ModuleVersion = "5.7.0.0";

 ConfigurationName = "conf";

};
instance of MSFT_xComputer as $MSFT_xComputer1ref
{
SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::78::9::xComputer";
 ModuleName = "xComputerManagement";
 ModuleVersion = "4.1.0.0";
 ResourceID = "[xComputer]Hostname";
 Name = "DC1";

 ConfigurationName = "conf";

};
instance of MSFT_RoleResource as $MSFT_RoleResource1ref
{
ResourceID = "[WindowsFeature]ADDomainServices";
 IncludeAllSubFeature = True;
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::89::13::WindowsFeature";
 Name = "AD-Domain-Services";
 ModuleName = "PSDesiredStateConfiguration";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_RoleResource as $MSFT_RoleResource2ref
{
ResourceID = "[WindowsFeature]GPMC";
 IncludeAllSubFeature = True;
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::89::13::WindowsFeature";
 Name = "GPMC";
 ModuleName = "PSDesiredStateConfiguration";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_RoleResource as $MSFT_RoleResource3ref
{
ResourceID = "[WindowsFeature]RSATADTools";
 IncludeAllSubFeature = True;
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::89::13::WindowsFeature";
 Name = "RSAT-AD-Tools";
 ModuleName = "PSDesiredStateConfiguration";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential1ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_Credential as $MSFT_Credential2ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADDomain as $MSFT_xADDomain1ref
{
ResourceID = "[xADDomain]ADDomain";
 DomainAdministratorCredential = $MSFT_Credential1ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::97::9::xADDomain";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 SafemodeAdministratorPassword = $MSFT_Credential2ref;
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[WindowsFeature]ADDomainServices"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential3ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser1ref
{
ResourceID = "[xADUser]User1";
 Description = "Lability Test Lab user";
 UserName = "User1";
 Ensure = "Present";
 Password = $MSFT_Credential3ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::105::9::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_xADGroup as $MSFT_xADGroup1ref
{
ResourceID = "[xADGroup]DomainAdmins";
 MembersToInclude = {
    "User1"
};
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::115::9::xADGroup";
 GroupName = "Domain Admins";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADUser]User1"};

 ConfigurationName = "conf";

};
instance of MSFT_xADGroup as $MSFT_xADGroup2ref
{
ResourceID = "[xADGroup]EnterpriseAdmins";
 MembersToInclude = {
    "User1"
};
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::122::9::xADGroup";
 GroupScope = "Universal";
 GroupName = "Enterprise Admins";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADUser]User1"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential4ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser2ref
{
ResourceID = "[xADUser]CheErd";
 Description = "Lability Test Lab user";
 UserName = "CheErd";
 Ensure = "Present";
 Password = $MSFT_Credential4ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::129::3::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential5ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser3ref
{
ResourceID = "[xADUser]MadLue";
 Description = "Lability Test Lab user";
 UserName = "MadLue";
 Ensure = "Present";
 Password = $MSFT_Credential5ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::138::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential6ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser4ref
{
ResourceID = "[xADUser]AmeGua";
 Description = "Lability Test Lab user";
 UserName = "AmeGua";
 Ensure = "Present";
 Password = $MSFT_Credential6ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::147::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential7ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser5ref
{
ResourceID = "[xADUser]BriGlo";
 Description = "Lability Test Lab user";
 UserName = "BriGlo";
 Ensure = "Present";
 Password = $MSFT_Credential7ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::156::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential8ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser6ref
{
ResourceID = "[xADUser]AllGoo";
 Description = "Lability Test Lab user";
 UserName = "AllGoo";
 Ensure = "Present";
 Password = $MSFT_Credential8ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::165::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential9ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser7ref
{
ResourceID = "[xADUser]SavSpo";
 Description = "Lability Test Lab user";
 UserName = "SavSpo";
 Ensure = "Present";
 Password = $MSFT_Credential9ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::174::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential10ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser8ref
{
ResourceID = "[xADUser]JerVeu";
 Description = "Lability Test Lab user";
 UserName = "JerVeu";
 Ensure = "Present";
 Password = $MSFT_Credential10ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::183::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential11ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser9ref
{
ResourceID = "[xADUser]DeoSch";
 Description = "Lability Test Lab user";
 UserName = "DeoSch";
 Ensure = "Present";
 Password = $MSFT_Credential11ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::192::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential12ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser10ref
{
ResourceID = "[xADUser]BetLub";
 Description = "Lability Test Lab user";
 UserName = "BetLub";
 Ensure = "Present";
 Password = $MSFT_Credential12ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::201::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential13ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser11ref
{
ResourceID = "[xADUser]VivGay";
 Description = "Lability Test Lab user";
 UserName = "VivGay";
 Ensure = "Present";
 Password = $MSFT_Credential13ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::210::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential14ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser12ref
{
ResourceID = "[xADUser]LavSip";
 Description = "Lability Test Lab user";
 UserName = "LavSip";
 Ensure = "Present";
 Password = $MSFT_Credential14ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::219::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential15ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser13ref
{
ResourceID = "[xADUser]JanVan";
 Description = "Lability Test Lab user";
 UserName = "JanVan";
 Ensure = "Present";
 Password = $MSFT_Credential15ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::228::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential16ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser14ref
{
ResourceID = "[xADUser]TonCri";
 Description = "Lability Test Lab user";
 UserName = "TonCri";
 Ensure = "Present";
 Password = $MSFT_Credential16ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::237::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential17ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser15ref
{
ResourceID = "[xADUser]GonPac";
 Description = "Lability Test Lab user";
 UserName = "GonPac";
 Ensure = "Present";
 Password = $MSFT_Credential17ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::246::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential18ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser16ref
{
ResourceID = "[xADUser]BriJac";
 Description = "Lability Test Lab user";
 UserName = "BriJac";
 Ensure = "Present";
 Password = $MSFT_Credential18ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::255::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential19ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser17ref
{
ResourceID = "[xADUser]CalMed";
 Description = "Lability Test Lab user";
 UserName = "CalMed";
 Ensure = "Present";
 Password = $MSFT_Credential19ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::264::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential20ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser18ref
{
ResourceID = "[xADUser]DocBay";
 Description = "Lability Test Lab user";
 UserName = "DocBay";
 Ensure = "Present";
 Password = $MSFT_Credential20ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::273::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential21ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser19ref
{
ResourceID = "[xADUser]MauRei";
 Description = "Lability Test Lab user";
 UserName = "MauRei";
 Ensure = "Present";
 Password = $MSFT_Credential21ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::282::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential22ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser20ref
{
ResourceID = "[xADUser]GinMue";
 Description = "Lability Test Lab user";
 UserName = "GinMue";
 Ensure = "Present";
 Password = $MSFT_Credential22ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::291::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_Credential as $MSFT_Credential23ref
{
Password = "Linux4Ever";
 UserName = "Administrator";

};

instance of MSFT_xADUser as $MSFT_xADUser21ref
{
ResourceID = "[xADUser]EldKli";
 Description = "Lability Test Lab user";
 UserName = "EldKli";
 Ensure = "Present";
 Password = $MSFT_Credential23ref;
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::300::13::xADUser";
 DomainName = "fadijalka.local";
 ModuleName = "xActiveDirectory";
 ModuleVersion = "2.23.0.0";

DependsOn = {

    "[xADDomain]ADDomain"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration1ref
{
ResourceID = "[File]Resurser";
 Type = "Directory";
 DestinationPath = "C:\\Resurser";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::359::3::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare1ref
{
ResourceID = "[xSmbShare]Resurser";
 ChangeAccess = {
    "chrille\\Everyone"
};
 Path = "C:\\Resurser";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::364::9::xSmbShare";
 Name = "Resurser";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]Resurser"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration2ref
{
ResourceID = "[File]Gemensam";
 Type = "Directory";
 DestinationPath = "C:\\Gemensam";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::372::3::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare2ref
{
ResourceID = "[xSmbShare]FilesShare";
 ChangeAccess = {
    "chrille\\Everyone"
};
 Path = "C:\\Gemensam";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::377::9::xSmbShare";
 Name = "Gemensam";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]Gemensam"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration3ref
{
ResourceID = "[File]CheErd";
 Type = "Directory";
 DestinationPath = "C:\\CheErd";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::387::3::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare3ref
{
ResourceID = "[xSmbShare]CheErd$";
 ChangeAccess = {
    "chrille\\CheErd"
};
 Path = "C:\\CheErd";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::391::9::xSmbShare";
 Name = "CheErd$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]CheErd"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration4ref
{
ResourceID = "[File]MadLue";
 Type = "Directory";
 DestinationPath = "C:\\MadLue";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::399::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare4ref
{
ResourceID = "[xSmbShare]MadLue$";
 ChangeAccess = {
    "chrille\\MadLue"
};
 Path = "C:\\MadLue";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::404::9::xSmbShare";
 Name = "MadLue$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]MadLue"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration5ref
{
ResourceID = "[File]AmeGua";
 Type = "Directory";
 DestinationPath = "C:\\AmeGua";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::412::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare5ref
{
ResourceID = "[xSmbShare]AmeGua$";
 ChangeAccess = {
    "chrille\\AmeGua"
};
 Path = "C:\\AmeGua";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::417::9::xSmbShare";
 Name = "AmeGua$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]AmeGua"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration6ref
{
ResourceID = "[File]BriGlo";
 Type = "Directory";
 DestinationPath = "C:\\BriGlo";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::425::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare6ref
{
ResourceID = "[xSmbShare]BriGlo$";
 ChangeAccess = {
    "chrille\\BriGlo"
};
 Path = "C:\\BriGlo";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::430::9::xSmbShare";
 Name = "BriGlo$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]BriGlo"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration7ref
{
ResourceID = "[File]AllGoo";
 Type = "Directory";
 DestinationPath = "C:\\AllGoo";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::438::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare7ref
{
ResourceID = "[xSmbShare]AllGoo$";
 ChangeAccess = {
    "chrille\\AllGoo"
};
 Path = "C:\\AllGoo";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::443::9::xSmbShare";
 Name = "AllGoo$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]AllGoo"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration8ref
{
ResourceID = "[File]SavSpo";
 Type = "Directory";
 DestinationPath = "C:\\SavSpo";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::451::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare8ref
{
ResourceID = "[xSmbShare]SavSpo$";
 ChangeAccess = {
    "chrille\\SavSpo"
};
 Path = "C:\\SavSpo";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::456::9::xSmbShare";
 Name = "SavSpo$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]SavSpo"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration9ref
{
ResourceID = "[File]JerVeu";
 Type = "Directory";
 DestinationPath = "C:\\JerVeu";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::464::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare9ref
{
ResourceID = "[xSmbShare]JerVeu$";
 ChangeAccess = {
    "chrille\\JerVeu"
};
 Path = "C:\\JerVeu";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::469::9::xSmbShare";
 Name = "JerVeu$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]JerVeu"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration10ref
{
ResourceID = "[File]DeoSch";
 Type = "Directory";
 DestinationPath = "C:\\DeoSch";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::477::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare10ref
{
ResourceID = "[xSmbShare]DeoSch$";
 ChangeAccess = {
    "chrille\\DeoSch"
};
 Path = "C:\\DeoSch";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::482::9::xSmbShare";
 Name = "DeoSch$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]DeoSch"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration11ref
{
ResourceID = "[File]BetLub";
 Type = "Directory";
 DestinationPath = "C:\\BetLub";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::490::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare11ref
{
ResourceID = "[xSmbShare]BetLub$";
 ChangeAccess = {
    "chrille\\BetLub"
};
 Path = "C:\\BetLub";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::495::9::xSmbShare";
 Name = "BetLub$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]BetLub"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration12ref
{
ResourceID = "[File]VivGay";
 Type = "Directory";
 DestinationPath = "C:\\VivGay";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::503::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare12ref
{
ResourceID = "[xSmbShare]VivGay$";
 ChangeAccess = {
    "chrille\\VivGay"
};
 Path = "C:\\VivGay";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::508::9::xSmbShare";
 Name = "VivGay$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]VivGay"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration13ref
{
ResourceID = "[File]LavSip";
 Type = "Directory";
 DestinationPath = "C:\\LavSip";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::516::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare13ref
{
ResourceID = "[xSmbShare]LavSip$";
 ChangeAccess = {
    "chrille\\LavSip"
};
 Path = "C:\\LavSip";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::521::9::xSmbShare";
 Name = "LavSip$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]LavSip"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration14ref
{
ResourceID = "[File]JanVan";
 Type = "Directory";
 DestinationPath = "C:\\JanVan";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::529::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare14ref
{
ResourceID = "[xSmbShare]JanVan$";
 ChangeAccess = {
    "chrille\\JanVan"
};
 Path = "C:\\JanVan";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::534::9::xSmbShare";
 Name = "JanVan$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]JanVan"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration15ref
{
ResourceID = "[File]TonCri";
 Type = "Directory";
 DestinationPath = "C:\\TonCri";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::542::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare15ref
{
ResourceID = "[xSmbShare]TonCri$";
 ChangeAccess = {
    "chrille\\TonCri"
};
 Path = "C:\\TonCri";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::547::9::xSmbShare";
 Name = "TonCri$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]TonCri"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration16ref
{
ResourceID = "[File]GonPac";
 Type = "Directory";
 DestinationPath = "C:\\GonPac";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::555::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare16ref
{
ResourceID = "[xSmbShare]GonPac$";
 ChangeAccess = {
    "chrille\\GonPac"
};
 Path = "C:\\GonPac";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::560::9::xSmbShare";
 Name = "GonPac$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]GonPac"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration17ref
{
ResourceID = "[File]BriJac";
 Type = "Directory";
 DestinationPath = "C:\\BriJac";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::568::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare17ref
{
ResourceID = "[xSmbShare]BriJac$";
 ChangeAccess = {
    "chrille\\BriJac"
};
 Path = "C:\\BriJac";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::573::9::xSmbShare";
 Name = "BriJac$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]BriJac"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration18ref
{
ResourceID = "[File]CalMed";
 Type = "Directory";
 DestinationPath = "C:\\CalMed";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::581::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare18ref
{
ResourceID = "[xSmbShare]CalMed$";
 ChangeAccess = {
    "chrille\\CalMed"
};
 Path = "C:\\CalMed";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::586::9::xSmbShare";
 Name = "CalMed$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]CalMed"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration19ref
{
ResourceID = "[File]DocBay";
 Type = "Directory";
 DestinationPath = "C:\\DocBay";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::594::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare19ref
{
ResourceID = "[xSmbShare]DocBay$";
 ChangeAccess = {
    "chrille\\DocBay"
};
 Path = "C:\\DocBay";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::599::9::xSmbShare";
 Name = "DocBay$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]DocBay"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration20ref
{
ResourceID = "[File]MauRei";
 Type = "Directory";
 DestinationPath = "C:\\MauRei";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::607::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare20ref
{
ResourceID = "[xSmbShare]MauRei$";
 ChangeAccess = {
    "chrille\\MauRei"
};
 Path = "C:\\MauRei";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::612::9::xSmbShare";
 Name = "MauRei$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]MauRei"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration21ref
{
ResourceID = "[File]GinMue";
 Type = "Directory";
 DestinationPath = "C:\\GinMue";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::620::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare21ref
{
ResourceID = "[xSmbShare]GinMue$";
 ChangeAccess = {
    "chrille\\GinMue"
};
 Path = "C:\\GinMue";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::625::9::xSmbShare";
 Name = "GinMue$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]GinMue"};

 ConfigurationName = "conf";

};
instance of MSFT_FileDirectoryConfiguration as $MSFT_FileDirectoryConfiguration22ref
{
ResourceID = "[File]EldKli";
 Type = "Directory";
 DestinationPath = "C:\\EldKli";
 ModuleName = "PSDesiredStateConfiguration";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::633::9::File";

ModuleVersion = "1.0";

 ConfigurationName = "conf";

};
instance of MSFT_xSmbShare as $MSFT_xSmbShare22ref
{
ResourceID = "[xSmbShare]EldKli$";
 ChangeAccess = {
    "chrille\\EldKli"
};
 Path = "C:\\EldKli";
 Ensure = "Present";
 SourceInfo = "C:\\Lability\\Configurations\\conf.ps1::638::9::xSmbShare";
 Name = "EldKli$";
 ModuleName = "xSmbShare";
 ModuleVersion = "2.1.0.0";

DependsOn = {

    "[File]EldKli"};

 ConfigurationName = "conf";

};
instance of OMI_ConfigurationDocument


                    {
 Version="2.0.0";
 

                        MinimumCompatibleVersion = "1.0.0";
 

                        CompatibleVersionAdditionalProperties= {"Omi_BaseResource:ConfigurationName"};
 

                        Author="Administratör";
 

                        GenerationDate="01/18/2019 14:26:19";
 

                        GenerationHost="DC1";
 

                        Name="conf";


};