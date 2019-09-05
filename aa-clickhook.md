aa-clickhook:(1)                                                    March 2014                                                    aa-clickhook:(1)

NAME
       aa-clickhook - click system hook for AppArmor

DESCRIPTION
       When  a  click package is installed, click will run system and user hooks. The click AppArmor system hook converts the security manifest in
       the click package into an AppArmor profile, then loads the profile into the kernel. On Ubuntu, the click AppArmor hook  maps  click  frame‐
       works to appropriate policy versions to ensure correct AppArmor policy is generated.

       By  default, symlinks to the click security manifests are stored in /var/lib/apparmor/clicks. The generated AppArmor profiles are stored in
       /var/lib/apparmor/profiles with the corresponding profile caches stored in /var/cache/apparmor/apparmor.

       When aa-clickhook is run without arguments, it will generate missing AppArmor profiles for the security manifests. In  addition,  aa-click‐
       hook  will check the mtime of the symlink of the security manifest and regenerate any AppArmor profiles with an mtime older than the corre‐
       sponding security manifest.

USAGE
       aa-clickhook [OPTIONS]

OPTIONS
       -h     show program's help

       -f | --force | --force-regenerate
              Force regeneration of all click profiles

       --include=PATH
              Add '#include "PATH"' to generated profiles

OVERRIDES AND ADDITIONAL ACCESS
       click-apparmor supports overriding the policy specified in the click security manifest. Overrides are optional and  are  specified  in  the
       same  directory  as the click security manifest, but with ".override" appended. They use the same json format and structure as their corre‐
       sponding click security manifests, but use only the manifest keys related to AppArmor policy. Overrides may be specified for  abstractions,
       policy_groups, read_path and write_path. Overrides only subtract from policy and cannot be used to provide additional access.

       Similarly,  click-apparmor  supports adding access to the policy specified in the click security manifest. This additional access is speci‐
       fied in the same directory as the click security manifest, but with ".additional" appended. This uses the same json format and structure as
       their  corresponding click security manifests, but uses only the manifest keys related to AppArmor policy.  Additional access may be speci‐
       fied for abstractions, policy_groups, read_path and write_path. Specifying additional access in this manner must be done  with  care  since
       the additional access could allow escaping confinement.

       After  creating or updating an override or additional access, you must run aa-clickhook to put the changes into effect. To unapply an over‐
       ride or additional access, remove the file, update the timestamp on the security manifest (see below), then run aa-clickhook.

NOTES
       aa-clickhook will skip generating AppArmor policy if the framework is missing, if the specified policy version doesn't match  the  expected
       version for the framework, or otherwise improperly formatted click packages.

       When reinstalling a click with the same version, it may be useful to regenerate the AppArmor profile like so:

         # touch -h /var/lib/apparmor/clicks/<click security>.json
         # aa-clickhook

       or if need to regenerate with an include file (eg, for autopilot):

         # touch -h /var/lib/apparmor/clicks/<click security>.json
         # aa-clickhook \
           --include=/usr/share/autopilot-touch/apparmor/click.rules

SEE ALSO
       apparmor(7) click(1)

March 2014                                                                                                                        aa-clickhook:(1)
