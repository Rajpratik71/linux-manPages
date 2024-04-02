AA-EASYPROF(8)                                                                                     AppArmor                                                                                    AA-EASYPROF(8)



NAME
       aa-easyprof - AppArmor profile generation made easy.

SYNOPSIS
       aa-easyprof [option] <path to binary>

DESCRIPTION
       aa-easyprof provides an easy to use interface for AppArmor policy generation. aa-easyprof supports the use of templates and policy groups to quickly profile an application. Please note that while
       this tool can help with policy generation, its utility is dependent on the quality of the templates, policy groups and abstractions used. Also, this tool may create policy which is less restricted
       than creating policy by hand or with aa-genprof and aa-logprof.

OPTIONS
       aa-easyprof accepts the following arguments:

       -t TEMPLATE, --template=TEMPLATE
           Specify which template to use. May specify either a system template from /usr/share/apparmor/easyprof/templates or a filename for the template to use. If not specified, use
           /usr/share/apparmor/easyprof/templates/default.

       -p POLICYGROUPS, --policy-groups=POLICYGROUPS
           Specify POLICY as a comma-separated list of policy groups. See --list-templates for supported policy groups. The available policy groups are in /usr/share/apparmor/easyprof/policy. Policy groups
           are simply groupings of AppArmor rules or policies. They are similar to AppArmor abstractions, but usually encompass more policy rules.

       -a ABSTRACTIONS, --abstractions=ABSTRACTIONS
           Specify ABSTRACTIONS as a comma-separated list of AppArmor abstractions. It is usually recommended you use policy groups instead, but this is provided as a convenience. AppArmor abstractions are
           located in /etc/apparmor.d/abstractions.  See apparmor.d(5) for details.

       -r PATH, --read-path=PATH
           Specify a PATH to allow owner reads. May be specified multiple times. If the PATH ends in a '/', then PATH is treated as a directory and reads are allowed to all files under this directory. Can
           optionally use '/*' at the end of the PATH to only allow reads to files directly in PATH.

       -w PATH, --write-dir=PATH
           Like --read-path but also allow owner writes in additions to reads.

       -n NAME, --name=NAME
           Specify NAME of policy. If not specified, NAME is set to the name of the binary. The NAME of the policy is often used as part of the path in the various templates.

       --template-var="@{VAR}=VALUE"
           Set VAR to VALUE in the resulting policy. This typically only makes sense if the specified template uses this value. May be specified multiple times.

       --list-templates
           List available templates.

       --show-template=TEMPLATE
           Display template specified with --template.

       --templates-dir=PATH
           Use PATH instead of system templates directory.

       --list-policy-groups
           List available policy groups.

       --show-policy-group
           Display policy groups specified with --policy.

       --policy-groups-dir=PATH
           Use PATH instead of system policy-groups directory.

       --author
           Specify author of the policy.

       --copyright
           Specify copyright of the policy.

       --comment
           Specify comment for the policy.

EXAMPLE
       Example usage for a program named 'foo' which is installed in /opt/foo:

           $ aa-easyprof --template=user-application --template-var="@{APPNAME}=foo" --policy-groups=opt-application,user-application /opt/foo/bin/FooApp

BUGS
       If you find any additional bugs, please report them to Launchpad at <https://bugs.launchpad.net/apparmor/+filebug>.

SEE ALSO
       apparmor(7) apparmor.d(5)



AppArmor 2.8.2                                                                                    2012-05-08                                                                                   AA-EASYPROF(8)
