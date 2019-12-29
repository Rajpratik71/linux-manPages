aufs(5)                                Linux Aufs User's Manual                                aufs(5)

NAME
       aufs - advanced multi layered unification filesystem. version 4.15-20180219

DESCRIPTION
       Aufs  is  a stackable unification filesystem such as Unionfs, which unifies several directories
       and provides a merged single directory.  In the early days, aufs was entirely  re-designed  and
       re-implemented  Unionfs  Version 1.x series. After many original ideas, approaches and improve‐
       ments, it becomes totally different from Unionfs while keeping the basic features.  See Unionfs
       Version  1.x  series for the basic features.  Recently, Unionfs Version 2.x series begin taking
       some of same approaches to aufs's.

MOUNT OPTIONS
       At mount-time, the order of interpreting options is,

              •   simple flags, except xino/noxino and udba=notify

              •   branches

              •   xino/noxino

              •   udba=notify

       At remount-time, the options are interpreted in the given order, e.g. left to right.

              •   create or remove whiteout-base(.wh..wh.aufs) and whplink-dir(.wh..wh.plnk) if neces‐
                  sary

       br:BRANCH[:BRANCH ...] (dirs=BRANCH[:BRANCH ...])
              Adds new branches.  (cf. Branch Syntax).

              Aufs  rejects  the  branch which is an ancestor or a descendant of another branch. It is
              called overlapped. When the branch is loopback-mounted directory, aufs also  checks  the
              source  fs-image  file of loopback device. If the source file is a descendant of another
              branch, it will be rejected too.

              After mounting aufs or adding a branch, if you move a branch under  another  branch  and
              make  it  descendant  of another branch, aufs will not work correctly. By default (since
              linux-3.2 until linux-3.18-rc1), aufs prohibits such  operation  internally,  but  there
              left a way to do.  (cf. Branch Syntax).

       [ add | ins ]:index:BRANCH
              Adds  a  new branch.  The index begins with 0.  Aufs creates whiteout-base(.wh..wh.aufs)
              and whplink-dir(.wh..wh.plnk) if necessary.

              If there is the same named file on the lower branch (larger index), aufs will  hide  the
              lower  file.   You  can  only  see  the highest file.  You will be confused if the added
              branch has whiteouts (including diropq), they may or may not  hide  the  lower  entries.
              (cf. DIAGNOSTICS).

              Even  if a process have once mapped a file by mmap(2) with MAP_SHARED and the same named
              file exists on the lower branch, the process still refers the file on the  lower(hidden)
              branch after adding the branch.  If you want to update the contents of a process address
              space after adding, you need to restart your process or open/mmap the file again.   (cf.
              Branch Syntax).

       del:dir
              Removes   a   branch.    Aufs   does  not  remove  whiteout-base(.wh..wh.aufs)  and  wh‐
              plink-dir(.wh..wh.plnk) automatically.  For example, when you add a RO branch which  was
              unified as RW, you will see whiteout-base or whplink-dir on the added RO branch.

              If  a  process  is referencing the file/directory on the deleting branch (by open, mmap,
              current working directory, etc.), aufs will return an  error  EBUSY.  In  this  case,  a
              script  ‘aubusy’  (in  aufs-util.git  and  aufs2-util.git)  is  useful to identify which
              process (and which file) makes the branch busy.

       mod:BRANCH
              Modifies  the  permission  flags  of  the  branch.   Aufs  creates  or  removes   white‐
              out-base(.wh..wh.aufs) and/or whplink-dir(.wh..wh.plnk) if necessary.

              If  the branch permission is been changing ‘rw’ to ‘ro’, and a process is mapping a file
              by mmap(2) on the branch, the process may or may not be able to modify its mapped memory
              region after modifying branch permission flags.  Additionally when you enable CONFIG_IMA
              (in linux-2.6.30 and later), IMA may produce some wrong messages. But this is equivalent
              when the filesystem is changed ‘ro’ in emergency.  (cf. Branch Syntax).

       append:BRANCH
              equivalent to ‘add:(last index + 1):BRANCH’.  (cf. Branch Syntax).

       prepend:BRANCH
              equivalent to ‘add:0:BRANCH.’  (cf. Branch Syntax).

       xino=filename
              Use  external inode number bitmap and translation table.  When CONFIG_AUFS_EXPORT is en‐
              abled,  external  inode  generation  table  too.    It   is   set   to   <FirstWritable‐
              Branch>/.aufs.xino  by  default, or /tmp/.aufs.xino.  Comma character in filename is not
              allowed.

              The files are created per an aufs and per a branch filesystem, and unlinked. So you can‐
              not  find  this  file,  but  it exists and is read/written frequently by aufs.  When the
              specified file already exists, then mount(8) returns an error.  (cf. External Inode Num‐
              ber Bitmap, Translation Table and Generation Table).

              If  you  enable  CONFIG_SYSFS, the path of xino files are not shown in /proc/mounts (and
              /etc/mtab), instead it is shown in <sysfs>/fs/aufs/si_<id>/xi_path.   Otherwise,  it  is
              shown in /proc/mounts unless it is not the default path.

       noxino Stop using external inode number bitmap and translation table.

              If  you use this option, Some applications will not work correctly.  (cf. External Inode
              Number Bitmap, Translation Table and Generation Table).

       trunc_xib
              Truncate the external inode number bitmap file. The  truncation  is  done  automatically
              when  you delete a branch unless you do not specify ‘notrunc_xib’ option.  (cf. External
              Inode Number Bitmap, Translation Table and Generation Table).

       notrunc_xib
              Stop truncating the external inode number bitmap file when you delete  a  branch.   (cf.
              External Inode Number Bitmap, Translation Table and Generation Table).

       trunc_xino_path=BRANCH | itrunc_xino=INDEX
              Truncate the external inode number translation table per branch. The branch can be spec‐
              ified by path or index (its origin is 0).  Sometimes the size of a xino file  for  tmpfs
              branch   grows  very  big.  If  you  don't  like  such  situation,  try  "mount  -o  re‐
              mount,trunc_xino_path=BRANCH /your/aufs" (or itrunc_xino=INDEX). It will shrink the xino
              file  for BRANCH. These options are one time actions. So the size may grow again. In or‐
              der to make it work automatically when necessary, try trunc_xino option.  These  options
              are  already implemented, but its design is not fixed (cf. External Inode Number Bitmap,
              Translation Table and Generation Table).

       trunc_xino | notrunc_xino
              Enable (or disable) the automatic truncation of xino files.  The truncation is  done  by
              discarding the internal "hole" (unused blocks).  The default is notrunc_xino.  These op‐
              tions are already implemented, but its design is not fixed (cf.  External  Inode  Number
              Bitmap, Translation Table and Generation Table).

              TODO: customizable two values for upper limit

       acl
       noacl  Enable  or disable POSIX Access Control List. This feature is totally depending upon the
              branch fs. If your branch fs doesn't support POSIX ACL, these options  are  meaningless.
              CONFIG_FS_POSIX_ACL is required.

       create_policy | create=CREATE_POLICY
       copyup_policy | copyup | cpup=COPYUP_POLICY
              Policies  to  select  one among multiple writable branches. The default values are ‘cre‐
              ate=tdp’ and ‘cpup=tdp’.  link(2) and rename(2) systemcalls have an exception. In  aufs,
              they  try keeping their operations in the branch where the source exists.  (cf. Policies
              to Select One among Multiple Writable Branches).

       dio    Enable Direct I/O support (including Linux AIO), and always make open(2)  with  O_DIRECT
              success.  But if your branch filesystem doesn't support it, then the succeeding I/O will
              fail (cf, Direct I/O).

       nodio  Disable Direct I/O (including Linux AIO), and always make open(2)  with  O_DIRECT  fail.
              This is default value (cf, Direct I/O).

       verbose | v
              Print  some  information.   Currently,  it  is  only  busy file (or inode) at deleting a
              branch.

       noverbose | quiet | q | silent
              Disable ‘verbose’ option.  This is default value.

       sum    df(1)/statfs(2) returns the total number of blocks and inodes of all branches.  When the
              block  size  of  all branches are not equal, aufs chooses the smallest one and calculate
              the number of blocks (including bavail and bfree).  Note that there are cases that  sys‐
              temcalls  may  return  ENOSPC,  even  if  df(1)/statfs(2)  shows that aufs has some free
              space/inode.

       nosum  Disable ‘sum’ option.  This is default value.

       dirwh=N
              Watermark to remove a dir actually at rmdir(2) and rename(2).

              If the target dir which is being removed or renamed (destination dir) has a huge  number
              of  whiteouts, i.e. the dir is empty logically but physically, the cost to remove/rename
              the single dir may be very high.  It is required to unlink all of  whiteouts  internally
              before  issuing  rmdir/rename  to  the branch.  To reduce the cost of single systemcall,
              aufs renames the target dir to a whiteout-ed temporary name and  invokes  a  pre-created
              kernel  thread to remove whiteout-ed children and the target dir.  The rmdir/rename sys‐
              temcall returns just after kicking the thread.

              When the number of whiteout-ed children is less than the value  of  dirwh,  aufs  remove
              them  in  a  single systemcall instead of passing another thread.  This value is ignored
              when the branch is NFS.  The default value is 3.

       rdblk=N
              Specifies a size of internal VDIR block which is allocated at a time in byte.  The  VDIR
              block  will  be  allocated  several  times when necessary. If your directory has tens of
              thousands of files, you may want to expand this size.  The default value is  defined  as
              512.  The size has to be lager than NAME_MAX (usually 255) and kmalloc-able (the maximum
              limit depends on your system. at least 128KB is available for every system).  If you set
              it  to  zero,  then  the internal estimation for the directory size becomes ON, and aufs
              sets the value for the directory individually.  Sometimes the estimated value may be in‐
              appropriate  since  the estimation is not so clever. Setting zero is useful when you use
              RDU (cf. VDIR/readdir(3) in user-space (RDU).  Otherwise it may be a pressure for kernel
              memory space.  Anytime you can reset the value to default by specifying rdblk=def.  (cf.
              Virtual or Vertical Directory Block).

       rdhash=N
              Specifies a size of internal VDIR hash table which is used to compare the file names un‐
              der  the  same  named directory on multiple branches.  The VDIR hash table will be allo‐
              cated in readdir(3)/getdents(2), rmdir(2) and rename(2) for the existing  target  direc‐
              tory.  If  your  directory  has  tens of thousands of files, you may want to expand this
              size.  The default value is defined as 32.  The size has to be lager than zero,  and  it
              will be multiplied by 4 or 8 (for 32-bit and 64-bit respectively, currently). The result
              must be kmalloc-able (the maximum limit depends on your system. at least 128KB is avail‐
              able for every system).  If you set it to zero, then the internal estimation for the di‐
              rectory becomes ON, and aufs sets the value for the directory  individually.   Sometimes
              the  estimated value may be inappropriate since the estimation is not so clever. Setting
              zero is useful when you use RDU (cf. VDIR/readdir(3) in user-space (RDU).  Otherwise  it
              may  be  a pressure for kernel memory space.  Anytime you can reset the value to default
              by specifying rdhash=def.  (cf. Virtual or Vertical Directory Block).

       plink
       noplink
              Specifies to use ‘pseudo link’ feature or not.  The default is ‘plink’ which  means  use
              this feature.  (cf. Pseudo Link)

       clean_plink
              Removes  all  pseudo-links  in memory.  In order to make pseudo-link permanent, use ‘au‐
              plink’ utility just before one of these operations, unmounting aufs, using ‘ro’ or  ‘no‐
              plink’ mount option, deleting a branch from aufs, adding a branch into aufs, or changing
              your writable branch as  readonly.   If  you  installed  both  of  /sbin/mount.aufs  and
              /sbin/umount.aufs,  and your mount(8) and umount(8) support them, ‘auplink’ utility will
              be executed automatically and flush pseudo-links.  (cf. Pseudo Link)

       udba=none | reval | notify
              Specifies the level of UDBA (User's Direct Branch  Access)  test.   (cf.  User's  Direct
              Branch Access and Inotify Limitation).

       diropq=whiteouted | w | always | a
              Specifies whether mkdir(2) and rename(2) dir case make the created directory ‘opaque’ or
              not.  In other words, to create ‘.wh..wh..opq’ under the created or  renamed  directory,
              or  not to create.  When you specify diropq=w or diropq=whiteouted, aufs will not create
              it if the directory was not whiteout-ed or opaqued. If the directory was whiteout-ed  or
              opaqued,  the created or renamed directory will be opaque.  When you specify diropq=a or
              diropq==always, aufs will always  create  it  regardless  the  directory  was  whiteout-
              ed/opaqued or not.  The default value is diropq=w, it means not to create when it is un‐
              necessary.

       warn_perm
       nowarn_perm
              Adding a branch, aufs will issue a warning about uid/gid/permission of the adding branch
              directory,  when  they differ from the existing branch's. This difference may or may not
              impose a security risk.  If you are sure that there is no problem and want to  stop  the
              warning, use ‘nowarn_perm’ option.  The default is ‘warn_perm’ (cf. DIAGNOSTICS).

       shwh
       noshwh By  default  (noshwh), aufs doesn't show the whiteouts and they just hide the same named
              entries in the lower branches. The whiteout itself also never be appeared.  If  you  en‐
              able  CONFIG_AUFS_SHWH  and specify ‘shwh’ option, aufs will show you the name of white‐
              outs with keeping its feature to hide the lowers.  Honestly speaking, I am  rather  con‐
              fused  with  this ‘visible whiteouts.’  But a user who originally requested this feature
              wrote a nice how-to document about this feature. See Tips file in the aufs CVS tree.

       dirperm1
       nodirperm1
              By default (nodirperm1), aufs respects the directory permission  bits  on  all  branches
              equally,  which  means if the permission bits for a directory on a lower readonly branch
              prohibits you to read, then you cannot read even if  you  run  "chmod  a+rx"  (and  aufs
              copies  it  up).   With this option (dirperm1), the behavior changes and aufs checks the
              permission bits of the directory on the topmost branch and the permission  bits  on  all
              lower  branches  are  ignored.   In  other words, you read a directory even if the lower
              readonly branch fs prohibits it by its permission bits.

              This feature may invite a security risk similar to the world writable upper  branch.  As
              this case, dirperm1 option will produce a warning too.

       dirren
       nodirren
              Activates  or  disactivates  the special handling for renaming a directory (DIRREN) fea‐
              ture.  In order to use this feature, CONFIG_AUFS_DIRREN has to be enabled  and  ‘dirren’
              mount option has to be specified too.

              By  default (nodirren), aufs returns an error with EXDEV for the case of rename(2) a di‐
              rectory which exists on the multiple branches. Note that DIRREN is slow (I have not  yet
              measured  it  though)  since it loads and saves the list of the inode-numbers per branch
              and the detailed information per branch.

              Note that ‘udba=notify’ option may not work with DIRREN, since  it  is  based  upon  the
              name,  while  DIRREN  handles both of before- and after-renamed names. The internal name
              comparision may not work  correctly.  In  this  case,  aufs  behaves  like  the  default
              ‘udba=reval’ is specified.

Module Parameters
       brs=1 | 0
              Specifies to use the branch path data file under sysfs or not.

              If  the  number of your branches is large or their path is long and you meet the limita‐
              tion of mount(8) ro /etc/mtab, you need to enable CONFIG_SYSFS and set aufs  module  pa‐
              rameter brs=1.

              When  this  parameter  is  set  as  1,  aufs does not show ‘br:’ (or dirs=) mount option
              through /proc/mounts (and /etc/mtab). So you can keep yourself from the page  limitation
              of mount(8) or /etc/mtab.  Aufs shows branch paths through <sysfs>/fs/aufs/si_XXX/brNNN.
              Actually the file under sysfs has also a size limitation, but I don't think it is  harm‐
              ful.

              There  is  one  more  side  effect  in  setting 1 to this parameter.  If you rename your
              branch, the branch path written in /etc/mtab will be obsoleted and  the  future  remount
              will  meet  some  error due to the unmatched parameters (Remember that mount(8) may take
              the options from /etc/mtab and pass them to the systemcall).  If you  set  1,  /etc/mtab
              will not hold the branch path and you will not meet such trouble. On the other hand, the
              entries for the branch path under sysfs are generated dynamically. So it must not be ob‐
              soleted.  But I don't think users want to rename branches so often.

              If CONFIG_SYSFS is disable, this parameter is always set to 0.

       allow_userns= Y | N
              Allows  an unprivileged mount under user namespace.  Userns mount to put AUFS into a ch‐
              root environment can be useful while it as a security worry. This parameter sets an  in‐
              ternal flag FS_USERNS_MOUNT and allows userns unconditionally.

              See     the     discussion    in    http://www.mail-archive.com/aufs-users@lists.source‐
              forge.net/msg04266.html and its thread.

              The default is ‘N’.  If CONFIG_USER_NS is disabled, this parameter is meaningless.

       sysrq=key
              Specifies MagicSysRq  key  for  debugging  aufs.   You  need  to  enable  both  of  CON‐
              FIG_MAGIC_SYSRQ  and CONFIG_AUFS_DEBUG.  Currently this is for developers only.  The de‐
              fault is ‘a’.

       debug= 0 | 1
              Specifies disable(0) or enable(1) debug print in aufs.  This parameter  can  be  changed
              dynamically.   You  need  to enable CONFIG_AUFS_DEBUG.  Currently this is for developers
              only.  The default is ‘0’ (disable).

Entries under Sysfs and Debugfs
       See linux/Documentation/ABI/*/{sys,debug}fs-aufs.

Gain the performance in return for the features
       In order to gain a better performance, there are a few steps. They are essentially to drop  the
       features from aufs, and to gain a performance in return for them. You don't have to drop all of
       them. It may be too much. Try step by step with measuring the performance you want  using  your
       typical workload.

   Patch file
       As my recommendation, there is one patch file in aufs[34]-standalone.git tree, tmpfs-idr.patch.
       It introduces IDR for the tmpfs inode-number management, and has an effect to prevent the  size
       of  aufs's  XINO/XIB  files  to  grow rapidly. If you don't use TMPFS as your branch, the patch
       won't be necessary.

   Configuration
       Disable all unnecessary ones except CONFIG_AUFS_RDU (readdir in user-space).  RDU  requires  an
       external  user-space  library  libau.so,  but it is so effective particularly for the directory
       which has tens of thousands of files. To use RDU, users  have  to  set  LD_PRELOAD  environment
       variable.  If  he doesn't set, this configuration will do no harm. The size of aufs module will
       be larger a little, but the time-performance (speed) won't be damaged.

   Mount option
       As a first step, I'd recommend you to try ‘dirperm1’, ‘udba=none’ and ‘nodirren.’   The  former
       prohibits  aufs  to  dig down the lower branches in checking the directory permission bits, and
       the latter makes aufs not to watch the external modification, eg. by-passing aufs  (users'  di‐
       rect branch access).  These options are able to be changed and restored anytime.

       For  the  second step, try ‘notrunc_xino’ and ‘notrunc_xib.’  It is not always when they are so
       effective. Especially if you have applied tmpfs-idr.patch, then the effect is small  since  the
       most  of  effect  is done by the patch. But there surely exists their effect. In this case, the
       size of XINO and XIB will grow only, not truncated. In other word, it is a time-vs-space issue.

       For the third and last step, try ‘noplink’ and ‘noxino.’   With  these  options,  aufs  behaves
       un-POSIX-ly a little, which means lose the features maintaining the hard-link (pseudo-link) and
       the inode numbers. Some behaviours may surprise  users,  but  many  internal  process  will  be
       skipped and the result performance will be better.

       For your convenience, mount.aufs(8) provides ‘droplvl=N’ mount option. ‘N’ means the level (see
       above) and you can specify either 1, 2 or 3 (and  their  negative  values,  will  be  described
       soon).  It  is not a real mount option, which means it is not interpreted by kernel-space. When
       this option is given, mount.aufs(8) translates it into several other (real) mount options,  and
       passes them to kernel-space as if they were originally specified. Currently there are 3 levels.

              1   noatime,dirperm1,udba=none,nodirren

              2   notrunc_xino,notrunc_xib

              3   noplink,noxino
       For   example,   when   you   give   ‘droplvl=3’,   mount.aufs(8)   converts   it   to   ‘noat‐
       ime,dirperm1,udba=none,nodirren,notrunc_xino,notrunc_xib,noplink,noxino’.

       For your more convenience, mount.aufs(8) provides the negative values for each level. Note that
       there   is   no   level   0,   and   no   difference   between   2  and  -2.   The  options  in
       ‘notrunc_xino,notrunc_xib’ are already implemented, but their design is not fixed (cf. External
       Inode  Number Bitmap, Translation Table and Generation Table). And the current default value is
       ‘notrunc_xino,notrunc_xib’, so technically speaking ‘notrunc_xino,notrunc_xib’ is  less  impor‐
       tant.

              -1  relatime,nodirperm1,udba=reval

              -2  notrunc_xino,notrunc_xib

              -3  plink,xino=/tmp/.aufs.xino
       The  purpose  of  the  negative  values  are  to  revert  the  effect  of  the  positive values
       (counter-level). Note the XINO path in ‘-3’. In order to revert ‘noxino’  in  ‘droplvl=3’,  you
       need  to  specify  the actual XINO path, but it is totally depending upon your environment, and
       mount.aufs(8) doesn't know about it and does nothing but provides the default path.  So  gener‐
       ally it will be necessary to append ‘xino=<your XINO path>’ to ‘droplvl=-3’.

       Reverting ‘noatime’ to ‘relatime’ is rather tricky. It is due to the behaviours of mount(8) and
       mount(2). You need to run ‘remount,strictatime’ before ‘remount,droplvl=-1’.

       Also note that the order of the mount options. For example, if you want to drop  some  features
       but  keep  UDBA level as default, then you can specify ‘droplvl=1,udba=reval’. If you write the
       reverse order as ‘udba=reval,droplvl=1’, then ‘udba=none’ in ‘droplvl=1’ takes its  effect  and
       the udba level specified before droplvl will lose.

Git work-tree and aufs
       Git has a cache called ‘index’ file. In this cache there are the identity of the files individ‐
       ually. Here ‘identity’ means a pair of struct stat.st_{dev,ino}. (Git may consider  other  stat
       members too. But the essential part of the identity is still dev and ino.)

       Since  aufs  is  a virtual filesystem and manages the inode numbers, it provides its own st_dev
       and st_ino. They differ from the ‘index’ cache in git, and some git operations have to  refresh
       the ‘index’ cache, which may take long time.  For instance,

              •   /branch/ro has 0x0801 for its st_dev

              •   /branch/ro/proj.git/fileA has 100 for its st_ino

              •   /branch/ro/proj.git/.git/index contains {0x0801,100} as fileA's
                    identity

              •   mount /u as /branch/rw + /branch/ro, /u is aufs

              •   we can see the contents of /u/proj.git/.git/index is equivalent to
                    /branch/ro/proj.git/.git/index

       In this case, aufs provides {0x0802,110} (for example) for fileA's identity, which is different
       from /branch/ro/proj.git/fileA.  If you run git-diff or something, the behaviour of git differs
       a little.

              •   git issues stat(2) and gets st_{dev,ino} pair.

              •   git compares the gotten pair and the one in the index file.

              •   when they are different from each other, git opens the file, reads all
                    data, compares it with the cached data, and finds there is nothing
                    changed.

              •   if the gotten pair is equal to the one in the index file, then
                    open/read/compare steps will be skipped.

       This  issue can happen when you copy the git working tree to somewhere else. All files identity
       will be changed by the copy and the cached identity in index file will be obsoleted.  Once  you
       complete  git-status  or  something, the index file will be updated, and full open/read/compare
       steps will not happen anymore.  This behaviour of git can be controlled by git's  configuration
       core.checkstat.

Branch Syntax
       dir_path[ =permission [ + attribute ] ]
       permission := rw | ro | rr
       attribute := wh | nolwh | unpin | coo_reg | coo_all | moo | fhsm | icexsec | icexsys | icextr |
       icexusr | icexoth | icex
              dir_path is a directory path.  The keyword after ‘dir_path=’ is a permission  flags  for
              that  branch.   Comma, colon and the permission flags string (including ‘=’) in the path
              are not allowed.

              Any (ordinary) filesystem can be a branch, But some are not accepted  such  like  sysfs,
              procfs and unionfs.  If you specify such filesystems as an aufs branch, aufs will return
              an error saying it is unsupported.  Also aufs expects  the  writable  branch  filesystem
              supports  the maximum filename length as NAME_MAX. The readonly branch filesystem can be
              shorter.

              Cramfs in linux stable release has strange inodes and it makes aufs confused. For  exam‐
              ple,
              $ mkdir -p w/d1 w/d2
              $ > w/z1
              $ > w/z2
              $ mkcramfs w cramfs
              $ sudo mount -t cramfs -o ro,loop cramfs /mnt
              $ find /mnt -ls
                  76    1 drwxr-xr-x   1 jro      232            64 Jan  1  1970 /mnt
                   1    1 drwxr-xr-x   1 jro      232             0 Jan  1  1970 /mnt/d1
                   1    1 drwxr-xr-x   1 jro      232             0 Jan  1  1970 /mnt/d2
                   1    1 -rw-r--r--   1 jro      232             0 Jan  1  1970 /mnt/z1
                   1    1 -rw-r--r--   1 jro      232             0 Jan  1  1970 /mnt/z2

              All  these  two  directories  and  two  files have the same inode with one as their link
              count. Aufs cannot handle such inode correctly.  Currently, aufs involves a  tiny  work‐
              around  for  such  inodes. But some applications may not work correctly since aufs inode
              number for such inode will change silently.  If you do not have any empty  files,  empty
              directories or special files, inodes on cramfs will be all fine.

              A  branch  should not be shared as the writable branch between multiple aufs. A readonly
              branch can be shared.

              The maximum number of branches is configurable at compile time (127 by default).

              When an unknown permission or attribute is given, aufs sets ro to that branch silently.

   Permission
       rw     Readable and writable branch. Set as default  for  the  first  branch.   If  the  branch
              filesystem is mounted as readonly, you cannot set it ‘rw.’

       ro     Readonly  branch  and it has no whiteouts on it.  Set as default for all branches except
              the first one. Aufs never issue both of write operation and lookup operation for  white‐
              out to this branch.

       rr     Real  readonly  branch, special case of ‘ro’, for natively readonly branch. Assuming the
              branch is natively readonly, aufs can optimize some internal operation. For example,  if
              you  specify  ‘udba=notify’ option, aufs does not set fsnotify or inotify for the things
              on rr branch.  Set by default for a branch whose fs-type is either  ‘iso9660’,  ‘cramfs’
              or ‘romfs’ (and ‘squashfs’ for linux-2.6.29 and later).

              When your branch exists on slower device and you have some capacity on your hdd, you may
              want to try ulobdev tool in ULOOP sample.  It can cache the contents of the real devices
              on another faster device, so you will be able to get the better access performance.  The
              ulobdev tool is for a generic block device, and the ulohttp is for a filesystem image on
              http  server.   If you want to spin down your hdd to save the battery life or something,
              then you may want to use ulobdev to save the access to the hdd, too.  See  $AufsCVS/sam‐
              ple/uloop in detail.

   Attribute
       wh     Readonly branch and it has/might have whiteouts on it.  Aufs never issue write operation
              to this branch, but lookup for whiteout.  Use this as ‘<branch_dir>=ro+wh’.

       nolwh  Usually, aufs creates a whiteout as a hardlink on a  writable  branch.  This  attributes
              prohibits  aufs  to  create  the  hardlinked  whiteout, including the source file of all
              hardlinked whiteout (.wh..wh.aufs.)  If you do not like a  hardlink,  or  your  writable
              branch  does not support link(2), then use this attribute.  But I am afraid a filesystem
              which does not support link(2) natively will fail in other place such as  copy-up.   Use
              this as ‘<branch_dir>=rw+nolwh’.  Also you may want to try ‘noplink’ mount option, while
              it is not recommended.

       unpin  By default, aufs sets ‘pin’ to the branch dir, which means that users cannot remove  nor
              rename the branch top dir as if it were a mount-point.  In some cases and some users may
              need to rename the branch top dir. So this attribute is implemented. If you specify ‘un‐
              pin’  as  a  branch attribute, it stops behaving as a mount-point and you can rename the
              branch top dir.  Needless to say, if you remove the branch top  dir,  then  aufs  cannot
              work.

              Since  linux-3.18-rc1,  this  attribute became meaningless. It is simply ignored and all
              branch top dir behaves as this attribute is always specified.

       coo_reg | coo_all
              Copy-up on open.  By default the internal copy-up is executed when it is  really  neces‐
              sary.  It is not done when a file is opened for writing, but when any writing is done.

              These  attributes are for not only the readonly branches but also the writable branches.
              ‘coo_reg’ handles the regular files only and ‘coo_all’ handles the  regular  files  plus
              the directories. All special files and symlinks will not be copied-up.  Additionally NFS
              server may not issue open(2) when NFS client issues open(2). This  behavior  means  that
              the file may not be copied-up when NFS client issues open(2).

              The  internal  copy-up  operation by these attributes are unrelated to the COPYUP_POLICY
              (cf. Policies to Select One among Multiple Writable Branches), which means  ‘copy-up  on
              open’  always  choose  the  nearest  upper  writable branch.  Even if there are multiple
              writable branches set these attributes, the internal copy-up operation is done once, not
              recursively.

              Users  who  have many (over 100) branches want to know and analyze when and what file is
              copied-up. To insert a new upper branch which contains such files only may  improve  the
              performance of aufs.  The ‘copy-up on open’ itself may not be so attractive, but combin‐
              ing with a feature FHSM (File-based Hierarchy Storage Management) will be useful.

       moo    Move-up on open.  Very similar attribute to coo except moo unlinks  the  copy-up  source
              after the successful operation. This attribute handles the regular files only, and obvi‐
              ously cannot be specified to the readonly branch.

              Users can specify all these attributes for a single writable branch, but only  the  last
              specified one has its effect. Other coo/moo attributes are silently ignored.

              The ‘move-up on open’ itself may not be so attractive, but combining with a feature FHSM
              (File-based Hierarchy Storage Management) will be useful.

       fhsm   File-based Hierarchy Storage Management.  Specifies that this branch is a participant of
              aufs FHSM. Refer to aufs_fhsm(5) in detail.

       icexsec | icexsys | icextr | icexusr | icexoth | icex
              Ignore  the error on copying-up/down XATTR.  When an internal copy-up/down happens, aufs
              tries copying all XATTRs.  Here an error can happen because of the XATTR support on  the
              dst branch may different from the src branch. If you know how the branch supports or un‐
              supports XATTR, you can specify these attributes.  ‘icexsec’ means to ignore an error on
              copying-up/down XATTR categorized as "security" (for LSM and capability). And ‘icexsys,’
              ‘icextr,’ and ‘icexusr,’ are for "system" (for posix ACL), "trusted"  and  "user"  cate‐
              gories individually.  ‘icexoth’ is for any other category. To be convenient, `icex` sets
              them all.  See also linux/Documentation/filesystems/aufs/design/06xattr.txt.

              These  attributes  are  essentially  for  the  writable  branches.  But  when  you   use
              aufs_fhsm(5),  you  may  want  to specify them to the readonly branches too. So they are
              available for the readonly branches.

External Inode Number Bitmap, Translation Table and Generation Table (xino)
       Aufs uses one external bitmap file and one external inode number translation table files per an
       aufs  and per a branch filesystem by default.  Additionally when CONFIG_AUFS_EXPORT is enabled,
       one external inode generation table is added.  The bitmap (and the generation table) is for re‐
       cycling aufs inode number and the others are a table for converting an inode number on a branch
       to an aufs inode number. The default path is ‘first writable branch’/.aufs.xino.  If  there  is
       no writable branch, the default path will be /tmp/.aufs.xino.

       If  you  enable  CONFIG_SYSFS,  the  path  of  xino  files  are  not shown in /proc/mounts (and
       /etc/mtab), instead it is shown in <sysfs>/fs/aufs/si_<id>/xi_path.  Otherwise, it is shown  in
       /proc/mounts unless it is not the default path.

       Those files are always opened and read/write by aufs frequently.  If your writable branch is on
       flash memory device, it is recommended to put xino files on other than flash memory by specify‐
       ing ‘xino=’ mount option.

       The maximum file size of the bitmap is, basically, the amount of the number of all the files on
       all branches divided by 8 (the number of bits in a byte).  For example, on a 4KB page size sys‐
       tem,  if  you have 32,768 (or 2,599,968) files in aufs world, then the maximum file size of the
       bitmap is 4KB (or 320KB).

       The maximum file size of the table will be ‘max inode number on the branch x size of  an  inode
       number’.  For example in 32bit environment,

       $ df -i /branch_fs
       /dev/hda14           2599968  203127 2396841    8% /branch_fs

       and  /branch_fs is an branch of the aufs. When the inode number is assigned contiguously (with‐
       out ‘hole’), the maximum xino file size for /branch_fs will be 2,599,968 x 4 bytes =  about  10
       MB.  But  it might not be allocated all of disk blocks.  When the inode number is assigned dis‐
       continuously, the maximum size of xino file will be the largest inode number on a  branch  x  4
       bytes.   Additionally,  the file size is limited to LLONG_MAX or the s_maxbytes in filesystem's
       superblock (s_maxbytes may be smaller than LLONG_MAX). So the support-able largest inode number
       on  a  branch is less than 2305843009213693950 (LLONG_MAX/4-1).  This is the current limitation
       of aufs.  On 64bit environment, this limitation becomes more strict and the  supported  largest
       inode  number  is less than LLONG_MAX/8-1.  In order to estimate the size of the table for your
       readonly branch fs, try

       $ echo $((4 * $(sudo find /branch_fs -xdev -printf "%i\n" |
            sort -n | tail -n 1)))

       For 64bit environment, replace 4 by 8 in above equation.

       The xino files are always hidden, i.e. removed. So you cannot do ‘ls -l xino_file’.  If you en‐
       able     CONFIG_DEBUG_FS,     you     can     check     these    information    through    <de‐
       bugfs>/aufs/<si_id>/{xib,xi[0-9]*,xigen}. xib is for the bitmap file,  xi0  ix  for  the  first
       branch,  and  xi1 is for the next. xigen is for the generation table.  xib and xigen are in the
       format of,

       <blocks>x<block size> <file size>

       Note that a filesystem usually has a feature called pre-allocation, which  means  a  number  of
       blocks  are  allocated  automatically, and then deallocated silently when the filesystem thinks
       they are unnecessary.  You do not have to be surprised the sudden  changes  of  the  number  of
       blocks, when your filesystem which xino files are placed supports the pre-allocation feature.

       The rests are hidden xino file information in the format of,

       <file count>, <blocks>x<block size> <file size>

       If  the  file count is larger than 1, it means some of your branches are on the same filesystem
       and the xino file is shared by them.  Note that the file size may not be equal  to  the  actual
       consuming blocks since xino file is a sparse file, i.e. a hole in a file which does not consume
       any disk blocks.

       Once you unmount aufs, the xino files for that aufs are totally gone.  It means that the  inode
       number is not permanent across umount or shutdown.

       The  xino  files should be created on the filesystem except NFS.  If your first writable branch
       is NFS, you will need to specify xino file path other than NFS.  Also if you are going  to  re‐
       move the branch where xino files exist or change the branch permission to readonly, you need to
       use xino option before del/mod the branch.

       The bitmap file and the table can be truncated.  For example, if you delete a branch which  has
       huge  number  of files, many inode numbers will be recycled and the bitmap will be truncated to
       smaller size. Aufs does this automatically when a branch is deleted.  You can truncate it  any‐
       time  you  like if you specify ‘trunc_xib’ mount option. But when the accessed inode number was
       not deleted, nothing will be truncated.  The truncation is essentially equivalent to

       $ cp --sparse=always <current xino file> <new xino file> &&
            rm <current xino file>

       It means that you have two xino files during the copy, and you should pay attention to the free
       space  of the filesystem where the xino file is located.  If the free space is not large enough
       to hold two xino files temporary during the copy, then the truncation fails and the  xino  file
       will  go  on growing. For such case, you should move the xino file to another larger partition,
       and move it back to where it was (if you want). To do this, use ‘xino=’  mount  option.  During
       this move, the xino file is truncated automatically.

       If  you  do  not  want  to  truncate  it  (it  may  be  slow) when you delete a branch, specify
       ‘notrunc_xib’  after  ‘del’  mount  option.   For  the   table,   see   trunc_xino_path=BRANCH,
       itrunc_xino=INDEX, trunc_xino and notrunc_xino option.

       If  you  do not want to use xino, use noxino mount option. Use this option with care, since the
       inode number may be changed silently and unexpectedly anytime.  For example, rmdir failure, re‐
       cursive  chmod/chown/etc to a large and deep directory or anything else.  And some applications
       will not work correctly.  If you want to change the xino default path, use xino mount option.

       After you add branches, the persistence of inode number may  not  be  guaranteed.   At  remount
       time,  cached but unused inodes are discarded.  And the newly appeared inode may have different
       inode number at the next access time. The inodes in use have the persistent inode number.

       When aufs assigned an inode number to a file, and if you create the same named file on the  up‐
       per branch directly, then the next time you access the file, aufs may assign another inode num‐
       ber to the file even if you use xino option.  Some applications may treat the file whose  inode
       number has been changed as totally different file.

Pseudo Link (hardlink over branches)
       Aufs supports ‘pseudo link’ which is a logical hard-link over branches (cf. ln(1) and link(2)).
       In other words, a copied-up file by link(2) and a copied-up file which  was  hard-linked  on  a
       readonly branch filesystem.

       When  you  have  files  named fileA and fileB which are hardlinked on a readonly branch, if you
       write something into fileA, aufs copies-up fileA to a writable branch, and write(2) the  origi‐
       nally  requested thing to the copied-up fileA. On the writable branch, fileA is not hardlinked.
       But aufs remembers it was hardlinked, and handles fileB  as  if  it  existed  on  the  writable
       branch, by referencing  fileA's inode on the writable branch as fileB's inode.

       Once  you unmount aufs, the plink info for that aufs kept in memory are totally gone.  It means
       that the pseudo-link is not permanent.  If you want to  make  plink  permanent,  try  ‘auplink’
       utility  just  before  one  of  these operations, unmounting your aufs, using ‘ro’ or ‘noplink’
       mount option, deleting a branch from aufs, adding a branch into aufs, or changing your writable
       branch to readonly.

       This  utility  will reproduces all real hardlinks on a writable branch by linking them, and re‐
       moves pseudo-link info in memory and temporary link on the writable branch.  Since this utility
       access  your  branches  directly,  you cannot hide them by ‘mount --bind /tmp /branch’ or some‐
       thing.

       If you are willing to rebuild your aufs with the same branches later, you  should  use  auplink
       utility  before  you  umount  your  aufs.   If  you  installed  both  of  /sbin/mount.aufs  and
       /sbin/umount.aufs, and your mount(8) and umount(8) support them, ‘auplink’ utility will be exe‐
       cuted automatically and flush pseudo-links.

       During  this  utility  is  running, it puts aufs into the pseudo-link maintenance mode. In this
       mode, only the process which began the maintenance mode (and its child processes) is allowed to
       operate  in aufs. Some other processes which are not related to the pseudo-link will be allowed
       to run too, but the rest have to return an error or wait until the maintenance mode ends. If  a
       process already acquires an inode mutex (in VFS), it has to return an error.

       Due  to  the fact that the pseudo-link maintenance mode is operated via procfs, the pseudo-link
       feature itself (including the related mount options) depends upon CONFIG_PROC_FS too.

       # auplink /your/aufs/root flush
       # umount /your/aufs/root
       or
       # auplink /your/aufs/root flush
       # mount -o remount,mod:/your/writable/branch=ro /your/aufs/root
       or
       # auplink /your/aufs/root flush
       # mount -o remount,noplink /your/aufs/root
       or
       # auplink /your/aufs/root flush
       # mount -o remount,del:/your/aufs/branch /your/aufs/root
       or
       # auplink /your/aufs/root flush
       # mount -o remount,append:/your/aufs/branch /your/aufs/root

       The plinks are kept both in memory and on disk. When they consumes too much resources  on  your
       system,  you  can  use  the  ‘auplink’  utility  at  anytime  and  throw  away  the unnecessary
       pseudo-links in safe.

       Additionally, the ‘auplink’ utility is very useful for some  security  reasons.   For  example,
       when  you  have  a  directory whose permission flags are 0700, and a file who is 0644 under the
       0700 directory. Usually, all files under the 0700 directory are private and no one else can see
       the  file. But when the directory is 0711 and someone else knows the 0644 filename, he can read
       the file.

       Basically, aufs pseudo-link feature creates a temporary link under the directory whose owner is
       root and the permission flags are 0700.  But when the writable branch is NFS, aufs sets 0711 to
       the directory.  When the 0644 file is pseudo-linked, the temporary link, of course the contents
       of  the file is totally equivalent, will be created under the 0711 directory. The filename will
       be generated by its inode number.  While it is hard to know  the  generated  filename,  someone
       else  may  try  peeping the temporary pseudo-linked file by his software tool which may try the
       name from one to MAX_INT or something.  In this case, the 0644 file will be read  unexpectedly.
       I  am afraid that leaving the temporary pseudo-links can be a security hole.  It makes sense to
       execute ‘auplink /your/aufs/root flush’ periodically, when your writable branch is NFS.

       When your writable branch is not NFS, or all users are careful enough to set 0600 to their pri‐
       vate files, you do not have to worry about this issue.

       If you do not want this feature, use ‘noplink’ mount option.

   The behaviors of plink and noplink
       This sample shows that the ‘f_src_linked2’ with ‘noplink’ option cannot follow the link.

       none on /dev/shm/u type aufs (rw,xino=/dev/shm/rw/.aufs.xino,br:/dev/shm/rw=rw:/dev/shm/ro=ro)
       $ ls -li ../r?/f_src_linked* ./f_src_linked* ./copied
       ls: ./copied: No such file or directory
       15 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ../ro/f_src_linked
       15 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ../ro/f_src_linked2
       22 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ./f_src_linked
       22 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ./f_src_linked2
       $ echo FOO >> f_src_linked
       $ cp f_src_linked copied
       $ ls -li ../r?/f_src_linked* ./f_src_linked* ./copied
       15 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ../ro/f_src_linked
       15 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ../ro/f_src_linked2
       36 -rw-r--r--  2 jro jro 6 Dec 22 11:03 ../rw/f_src_linked
       53 -rw-r--r--  1 jro jro 6 Dec 22 11:03 ./copied
       22 -rw-r--r--  2 jro jro 6 Dec 22 11:03 ./f_src_linked
       22 -rw-r--r--  2 jro jro 6 Dec 22 11:03 ./f_src_linked2
       $ cmp copied f_src_linked2
       $

       none on /dev/shm/u type aufs (rw,xino=/dev/shm/rw/.aufs.xino,noplink,br:/dev/shm/rw=rw:/dev/shm/ro=ro)
       $ ls -li ../r?/f_src_linked* ./f_src_linked* ./copied
       ls: ./copied: No such file or directory
       17 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ../ro/f_src_linked
       17 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ../ro/f_src_linked2
       23 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ./f_src_linked
       23 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ./f_src_linked2
       $ echo FOO >> f_src_linked
       $ cp f_src_linked copied
       $ ls -li ../r?/f_src_linked* ./f_src_linked* ./copied
       17 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ../ro/f_src_linked
       17 -rw-r--r--  2 jro jro 2 Dec 22 11:03 ../ro/f_src_linked2
       36 -rw-r--r--  1 jro jro 6 Dec 22 11:03 ../rw/f_src_linked
       53 -rw-r--r--  1 jro jro 6 Dec 22 11:03 ./copied
       23 -rw-r--r--  2 jro jro 6 Dec 22 11:03 ./f_src_linked
       23 -rw-r--r--  2 jro jro 6 Dec 22 11:03 ./f_src_linked2
       $ cmp copied f_src_linked2
       cmp: EOF on f_src_linked2
       $

       If you add a branch which has fileA or fileB, aufs does not follow the pseudo link. The file on
       the added branch has no relation to the same named file(s) on the lower branch(es).  If you use
       noxino mount option, pseudo link will not work after the kernel shrinks the inode cache.

       This feature will not work for squashfs before version 3.2 since its inode is tricky.  When the
       inode is hardlinked, squashfs inodes has the same inode number and correct link count, but  the
       inode  memory  object  is different. Squashfs inodes (before v3.2) are generated for each, even
       they are hardlinked.

User's Direct Branch Access (UDBA)
       UDBA means a modification to a branch filesystem manually or  directly,  e.g.  bypassing  aufs.
       While  aufs  is  designed  and implemented to be safe after UDBA, it can make yourself and your
       aufs confused. And some information like aufs inode will be incorrect.  For example, if you re‐
       name a file on a branch directly, the file on aufs may or may not be accessible through both of
       old and new name.  Because aufs caches various information about the files on branches. And the
       cache still remains after UDBA.

       Aufs has a mount option named ‘udba’ which specifies the test level at access time whether UDBA
       was happened or not.

       udba=none
              Aufs trusts the dentry and the inode cache on the system, and  never  test  about  UDBA.
              With  this option, aufs runs fastest, but it may show you incorrect data.  Additionally,
              if you often modify a branch directly, aufs will not be able to trace the changes of in‐
              odes on the branch. It can be a cause of wrong behavior, deadlock or anything else.

              It is recommended to use this option only when you are sure that nobody access a file on
              a branch.  It might be difficult for you to achieve real ‘no UDBA’ world when you cannot
              stop  your  users  doing ‘find / -ls’ or something.  If you really want to forbid all of
              your users to UDBA, here is a trick for it.  With  this  trick,  users  cannot  see  the
              branches  directly  and aufs runs with no problem, except ‘auplink’ utility.  But if you
              are not familiar with aufs, this trick may make yourself confused.

              # d=/tmp/.aufs.hide
              # mkdir $d
              # for i in $branches_you_want_to_hide
              > do
              >    mount -n --bind $d $i
              > done

              When you unmount the aufs, delete/modify the branch by remount, or you want to show  the
              hidden branches again, unmount the bound /tmp/.aufs.hide.

              # umount -n $branches_you_want_to_unbound

              If you use FUSE filesystem as an aufs branch which supports hardlink, you should not set
              this  option,  since  FUSE  makes  inode  objects  for  each  hardlinks  (at  least   in
              linux-2.6.23). When your FUSE filesystem maintains them at link/unlinking, it is equiva‐
              lent to ‘direct branch access’ for aufs.

       udba=reval
              Aufs tests only the existence of the file which existed. If the existed file was removed
              on  the  branch directly, aufs discard the cache about the file and re-lookup it. So the
              data will be updated.  This test is at minimum level to keep the performance and  ensure
              the existence of a file.  This is default and aufs runs still fast.

              This  rule  leads to some unexpected situation, but I hope it is harmless. Those are to‐
              tally depends upon cache. Here are just a few examples.

              •   If the file is cached as negative or not-existed, aufs does not  test  it.  And  the
                  file  is  still  handled  as  negative after a user created the file on a branch di‐
                  rectly. If the file is not cached, aufs will lookup normally and find the file.

              •   When the file is cached as positive or existed, and a user created  the  same  named
                  file  directly  on  the  upper  branch. Aufs detects the cached inode of the file is
                  still existing and will show you the old (cached) file which is on the lower branch.

              •   When the file is cached as positive or existed, and a user renamed the file  by  re‐
                  name(2)  directly.  Aufs detects the inode of the file is still existing. You may or
                  may not see both of the old and new files.  TODO: If aufs also tests  the  name,  we
                  can detect this case.

       If  your  outer  modification (UDBA) is rare and you can ignore the temporary and minor differ‐
       ences between virtual aufs world and real branch filesystem, then try this mount option.

       udba=notify
              Aufs sets either ‘fsnotify’ or ‘inotify’ to all the accessed directories on its branches
              and  receives  the  event about the dir and its children. It consumes resources, cpu and
              memory. And I am afraid that the performance will be hurt, but it is  most  strict  test
              level.  There are some limitations of linux inotify, see also Inotify Limitation.  So it
              is recommended to leave udba default option usually, and set it  to  notify  by  remount
              when you need it.

              When  a user accesses the file which was notified UDBA before, the cached data about the
              file will be discarded and aufs re-lookup it. So the data will be updated.  When an  er‐
              ror condition occurs between UDBA and aufs operation, aufs will return an error, includ‐
              ing EIO.  To use this option, you need to enable  CONFIG_INOTIFY  and  CONFIG_AUFS_HINO‐
              TIFY.   In linux-2.6.31, CONFIG_FSNOTIFY was introduced and CONFIG_INOTIFY was listed in
              Documentation/feature-removal-schedule.txt. In aufs2-31 and later (until  CONFIG_INOTIFY
              is  removed  actually),  you can choose either ‘fsnotify’ or ‘inotify’ in configuration.
              Whichever you choose, specify ‘udba=notify’, and aufs interprets it as an abstract name.

              To rename/rmdir a directory on a branch directory may reveal the same named directory on
              the lower branch. Aufs tries re-looking up the renamed directory and the revealed direc‐
              tory and assigning different inode number to them. But the inode number including  their
              children can be a problem. The inode numbers will be changed silently, and aufs may pro‐
              duce a warning. If you rename a directory repeatedly and reveal/hide  the  lower  direc‐
              tory, then aufs may confuse their inode numbers too. It depends upon the system cache.

              When  you  make  a  directory in aufs and mount other filesystem on it, the directory in
              aufs cannot be removed expectedly because it is a mount point. But the same named direc‐
              tory on the writable branch can be removed, if someone wants. It is just an empty direc‐
              tory, instead of a mount point.  Aufs cannot stop such  direct  rmdir,  but  produces  a
              warning about it.

              If  the  pseudo-linked  file is hardlinked or unlinked on the branch directly, its inode
              link count in aufs may be incorrect. It is recommended to flush the pseudo-links by  au‐
              plink script.

              In  linux-4.2 (and later, probably), for the exported aufs, NFS doesn't show the changes
              at once and returns ESTALE even if you set udba=notify.  It is a  natural  behaviour  of
              linux NFS's and aufs can do nothing about it. Probably simple "sleep 1" will help.

Linux Inotify Limitation
       Unfortunately, current inotify (linux-2.6.18) has some limitations, and aufs must derive it.

   IN_DELETE, removing file on NFS
       When  a  file on a NFS branch is deleted directly, inotify may or may not fire IN_DELETE event.
       It depends upon the status of dentry (DCACHE_NFSFS_RENAMED flag).  In this case,  the  file  on
       aufs seems still exists. Aufs and any user can see the file.  Since linux-3.15-rc1, this behav‐
       ior has been changed and NFS fires the event from itself.

   IN_IGNORED, deleted rename target
       When a file/dir on a branch is unlinked by rename(2) directly, inotify fires  IN_IGNORED  which
       means  the  inode is deleted. Actually, in some cases, the inode survives. For example, the re‐
       name target is linked or opened. In this case, inotify watch set by aufs is removed by VFS  and
       inotify.  And aufs cannot receive the events anymore. So aufs may show you incorrect data about
       the file/dir.

Virtual or Vertical Directory Block (VDIR)
       In order to provide the merged view of file listing, aufs builds internal  directory  block  on
       memory.  For readdir, aufs performs readdir() internally for each dir on branches, merges their
       entries with eliminating the whiteout-ed ones, and sets it to the opened file (dir) object.  So
       the  file object has its entry list until it is closed. The entry list will be updated when the
       file position is zero (by rewinddir(3)) and becomes obsoleted.

       The merged result is cached in the corresponding inode object and maintained by a  customizable
       life-time  option.   Note:  the mount option ‘rdcache=<sec>’ is still under considering and its
       description is hidden from this manual.

       Some people may call it can be a security hole or invite DoS attack since the opened  and  once
       readdir-ed dir (file object) holds its entry list and becomes a pressure for system memory. But
       I would say it is similar to files under /proc or /sys. The virtual files in them also holds  a
       memory page (generally) while they are opened. When an idea to reduce memory for them is intro‐
       duced, it will be applied to aufs too.

       The dynamically allocated memory block for the name of entries has a unit of 512 bytes  by  de‐
       fault.   During  building  dir  blocks, aufs creates hash list (hashed and divided by 32 by de‐
       fault) and judging whether the entry is whiteout-ed by its upper branch or already listed.

       These values are suitable for normal environments. But you may have tens of thousands of  files
       or  very  long  filenames  under  a single directory. For such cases, you may need to customize
       these values by specifying rdblk= and rdhash= aufs mount options.

       For instance, there are 97 files under my /bin, and the total name length is 597 bytes.

       $ \ls -1 /bin | wc
            97      97     597

       Strictly speaking, 97 end-of-line codes are included. But it is OK since aufs VDIR also  stores
       the  name  length in 1 byte. In this case, you do not need to customize the default values. 597
       bytes filenames will be stored in 2 VDIR memory blocks (597 < 512 x 2).  And 97  filenames  are
       distributed  among  32  lists, so one list will point 4 names in average. To judge the names is
       whiteout-ed or not, the number of comparison will be 4. 2 memory allocations and  4  comparison
       costs low (even if the directory is opened for a long time). So you do not need to customize.

       If  your  directory has tens of thousands of files, the you will need to specify rdblk= and rd‐
       hash=.

       $ ls -U /mnt/rotating-rust | wc -l
       1382438

       In this case, assuming the average length of filenames is 6, in order to get better  time  per‐
       formance  I  would recommend to set $((128*1024)) or $((64*1024)) for rdblk, and $((8*1024)) or
       $((4*1024)) for rdhash.  You can change these values of the active aufs mount by "mount -o  re‐
       mount".

       This  customization  is not for reducing the memory space, but for reducing time for the number
       of memory allocation and the name comparison. The  larger  value  is  faster,  in  general.  Of
       course, you will need system memory. This is a generic "time-vs-space" problem.

Using libau.so
       There  is  a dynamic shared object library called libau.so in aufs-util or aufs2-util GIT tree.
       This library provides several useful functions which wrap the standard library  functions  such
       as,

              •   readdir, readdir_r, closedir

              •   pathconf, fpathconf

       To use libau.so,

              •   install by "make install_ulib" under aufs-util (or aufs2-util) GIT tree

              •   set the environment variable "LD_PRELOAD=libau.so", or configure /etc/ld.so.preload

              •   set the environment variable "LIBAU=all"

              •   and run your application.

       If you use pathconf(3)/fpathconf(3) with _PC_LINK_MAX for aufs, you need to use libau.so.

   VDIR/readdir(3) in user-space (RDU)
       If  you  have a directory which has tens of thousands of files, aufs VDIR consumes much memory.
       So the program which reads a huge directory may produce an "out of memory" or "page  allocation
       failure"  message  in  the syslog, due to the memory fragmentation or real starvation.  In this
       case, RDU (readdir(3) in user-space) may help you.  Because the kernel memory space  cannot  be
       swappable and consuming much can be pure memory pressure, while it is not true in user-space.

       If  you  enable  CONFIG_AUFS_RDU  at compiling aufs, install libau.so, and set some environment
       variables, then you can use RDU.  Just simply run your application.  The dynamic  link  library
       libau.so  implements another readdir routine, and all readdir(3) calls in your application will
       be handled by libau.so.  For setting environment variables, you may want to use a  shell  func‐
       tion or alias such like this.

       $ auls()
       > {
       >    LD_PRELOAD=/your/path/to/libau.so
       >    LIBAU=all
       >    #AUFS_RDU_BLK= set if you want
       >    ls $@
       > }

       $ alias auls="LD_PRELOAD=/your/path/to/libau.so LIBAU=all ls"

       When you call readdir(3), the dynamic linker calls readdir in libau.so.  If it finds the passed
       dir is NOT aufs, it calls the usual readdir(3).  It the dir is aufs,  then  libau.so  gets  all
       filenames  under  the dir by aufs specific ioctl(2)s, instead of regular readdir(3), and merges
       them by itself.  In other words, libau.so moves  the  memory  consumption  in  kernel-space  to
       user-space.

       While it is good to stop consuming much memory in kernel-space, sometimes the speed performance
       may be damaged a little as a side effect.  It is just a little, I hope. At  the  same  time,  I
       won't be surprised if readdir(3) runs faster.

       It is recommended to specify rdblk=0 when you use this library.

       If  your  directory is not so huge and you don't meet the out of memory situation, probably you
       don't need this library. The original VDIR in kernel-space is still alive,  and  you  can  live
       without libau.so.

   pathconf(_PC_LINK_MAX)
       Since some implementation of pathconf(3) (and fpathconf(3)) for _PC_LINK_MAX decides the target
       filesystem type and returns the pre-defined constant value, when aufs is  unknown  to  the  li‐
       brary,  it  will return the default value (127).  Actually the maximum number of the link count
       in aufs inherits the topmost writable branch filesystem's. But the  standard  pathconf(3)  will
       not return the correct value.

       To  support such case, libau.so provides a wrapper for pathconf(3) (and fpathconf(3)). When the
       parameter is _PC_LINK_MAX, the wrapper checks whether the given parameter refers aufs  or  not.
       If  it is aufs, then it will get the maximum link count from the topmost writable branch inter‐
       nally. Otherwise, it behaves as normal pathconf(3) transparently.

   Note
       Since this is a dynamically linked library, it is unavailable if your application is statically
       linked. And ld.so(8) ignores LD_PRELOAD when the application is setuid/setgid-ed unless the li‐
       brary is not setuid/setgid-ed. It is a generic rule of dynamically linked  library.   Addition‐
       ally the functions in libau.so are unavailable in these cases too.

              •   the application or library issues getdents(2) instead of readdir(3).

              •   the library which calls readdir(3) internally. e.g. scandir(3).

              •   the library which calls pathconf(3) internally.

Copy On Write, or aufs internal copyup and copydown
       Every stackable filesystem which implements copy-on-write supports the copyup feature. The fea‐
       ture is to copy a file/dir from the lower branch to the upper internally.  When  you  have  one
       readonly  branch  and one upper writable branch, and you append a string to a file which exists
       on the readonly branch, then aufs will copy the file from the readonly branch to  the  writable
       branch  with  its  directory hierarchy. It means one write(2) involves several logical/internal
       mkdir(2), creat(2), read(2), write(2) and  close(2)  systemcalls  before  the  actual  expected
       write(2)  is  performed.  Sometimes it may take a long time, particularly when the file is very
       large.  If CONFIG_AUFS_DEBUG is enabled, aufs produces a message saying `copying a large file.'

       You may see the message when you change the xino file path  or  truncate  the  xino/xib  files.
       Sometimes those files can be large and may take a long time to handle them.

Policies to Select One among Multiple Writable Branches
       Aufs  has  some  policies  to select one among multiple writable branches when you are going to
       write/modify something. There are two kinds of policies, one is for newly create something  and
       the other is for internal copy-up.  You can select them by specifying mount option ‘create=CRE‐
       ATE_POLICY’ or ‘cpup=COPYUP_POLICY.’  These policies have no meaning when  you  have  only  one
       writable branch. If there is some meaning, it must hurt the performance.

   Exceptions for Policies
       In  every  cases below, even if the policy says that the branch where a new file should be cre‐
       ated is /rw2, the file will be created on /rw1.

       •   If there is a readonly branch with ‘wh’ attribute above the policy-selected branch and  the
           parent  dir  is marked as opaque, or the target (creating) file is whiteout-ed on the ro+wh
           branch, then the policy will be ignored and the target file will be created on the  nearest
           upper writable branch than the ro+wh branch.
           /aufs = /rw1 + /ro+wh/diropq + /rw2
           /aufs = /rw1 + /ro+wh/wh.tgt + /rw2

       •   If there is a writable branch above the policy-selected branch and the parent dir is marked
           as opaque or the target file is whiteout-ed on the branch, then the policy will be  ignored
           and  the  target  file will be created on the highest one among the upper writable branches
           who has diropq or whiteout. In case of whiteout, aufs removes it as usual.
           /aufs = /rw1/diropq + /rw2
           /aufs = /rw1/wh.tgt + /rw2

       •   link(2) and rename(2) systemcalls are exceptions in every policy.  They try  selecting  the
           branch  where  the source exists as possible since copyup a large file will take long time.
           If it can't be, ie. the branch where the source exists is readonly, then they  will  follow
           the copyup policy.

       •   There  is  an exception for rename(2) when the target exists.  If the rename target exists,
           aufs compares the index of the branches where the source and the target  are  existing  and
           selects  the  higher  one. If the selected branch is readonly, then aufs follows the copyup
           policy.

   Policies for Creating
       create=tdp | top-down-parent
              Select the highest branch where the parent dir exists. If this branch is  not  writable,
              internal copyup will happen.  The policy for this copyup is always ‘bottom-up.’  This is
              the default policy.

       create=tdmfs:low[:second]
              Select the highest writable branch regardless the existence of the parent  dir.  If  the
              free  space  of  this  branch  is  less than ‘low’ bytes, then the next highest writable
              branch will be selected.  If the free space of all writable branches are less than ‘low’
              bytes,  then  create=mfs  policy is applied.  For the duration (‘second’) parameter, see
              create=mfs[:second] below.

              FHSM (File-based Hierarchy Storage Management) may bring you the  very  similar  result,
              and is more flexible than this policy.

       create=rr | round-robin
              Selects  a  writable branch in round robin. When you have two writable branches and cre‐
              ates 10 new files, 5 files will be created for each branch.  mkdir(2) systemcall  is  an
              exception. When you create 10 new directories, all are created on the same branch.

       create=mfs[:second] | most-free-space[:second]
              Selects  a  writable branch which has most free space. In order to keep the performance,
              you can specify the duration (‘second’) which makes aufs hold the index of last selected
              writable  branch until the specified seconds expires. The seconds is up to 3600 seconds.
              The first time you create something in aufs after the specified  seconds  expired,  aufs
              checks the amount of free space of all writable branches by internal statfs call and the
              held branch index will be updated.  The default value is 30 seconds.

       create=mfsrr:low[:second]
              Selects a writable branch in most-free-space mode first, and then round-robin  mode.  If
              the  selected  branch  has less free space than the specified value ‘low’ in bytes, then
              aufs re-tries in round-robin mode.  Try an arithmetic expansion of shell  which  is  de‐
              fined  by  POSIX.  For example, $((10 * 1024 * 1024)) for 10M.  You can also specify the
              duration (‘second’) which is equivalent to the ‘mfs’ mode.

       create=pmfs[:second]
              Selects a writable branch where the parent dir exists, such as tdp mode. When the parent
              dir  exists  on  multiple  writable  branches,  aufs selects the one which has most free
              space, such as mfs mode.

       create=pmfsrr:low[:second]
              Firstly selects a writable branch as the ‘pmfs mode.’  If  there  are  less  than  ‘low’
              bytes  available on all branches where the parent dir exists, aufs selects the one which
              has the most free space regardless the parent dir.

   Policies for Copy-Up
       cpup=tdp | top-down-parent
              Equivalent to the same named policy for create.  This is the default policy.

       cpup=bup | bottom-up-parent
              Selects the writable branch where the parent dir exists and the branch is nearest  upper
              one from the copyup-source.

       cpup=bu | bottom-up
              Selects  the  nearest upper writable branch from the copyup-source, regardless the exis‐
              tence of the parent dir.

Exporting Aufs via NFS
       Aufs is supporting NFS-exporting.  Since aufs has no actual block device, you need to  add  NFS
       ‘fsid’ option at exporting. Refer to the manual of NFS about the detail of this option.

       There are some limitations or requirements.

              •   The branch filesystem must support NFS-exporting.

              •   NFSv2  is  not supported. When you mount the exported aufs from your NFS client, you
                  will need to some NFS options like v3 or nfsvers=3, especially if it is nfsroot.

              •   If the size of the NFS file handle on your branch filesystem is large, aufs will not
                  be  able  to handle it. The maximum size of NFSv3 file handle for a filesystem is 64
                  bytes. Aufs uses 24 bytes for 32bit system, plus 12 bytes for 64bit system. The rest
                  is a room for a file handle of a branch filesystem.

              •   The  External  Inode Number Bitmap, Translation Table and Generation Table (xino) is
                  required since NFS file handle is based upon inode number. The mount  option  ‘xino’
                  is  enabled  by  default.  The external inode generation table and its debugfs entry
                  (<debugfs>/aufs/si_*/xigen) is created when CONFIG_AUFS_EXPORT is  enabled  even  if
                  you  don't  export  aufs  actually.  The size of the external inode generation table
                  grows only, never be truncated. You might need to pay attention to the free space of
                  the  filesystem  where  xino  files are placed. By default, it is the first writable
                  branch.

              •   The branch filesystems must be accessible, which means ‘not hidden.’  It  means  you
                  need to ‘mount --move’ when you use initramfs and switch_root(8), or chroot(8).

              •   Since  aufs  has  several filename prefixes reserved, the maximum filename length is
                  shorter than ordinary 255. Actually 242 (defined as ${AUFS_MAX_NAMELEN}). This value
                  should be specified as ‘namlen=’ when you mount NFS.  The name of the branch top di‐
                  rectory has another limit. When you set the module parameter ‘brs’ to  1  (default),
                  then  you  can  see  the  branch  pathname via /sys/fs/aufs/si_XXX/brNNN. Here it is
                  printed with its branch attributes such as ‘=rw’ or ‘=ro+wh’. Since  all  the  sysfs
                  entries  have  the  size  limit of 4096 bytes, the length of the branch path becomes
                  shorter than 4096. Actually you can specify any branch with much longer  names,  but
                  you  will meet some troubles when you remount later because remounting runs the aufs
                  mount helper internally and it tries reading /sys/fs/aufs/si_XXX/brNNN.

Direct I/O
       The Direct I/O (including Linux AIO) is a filesystem (and its backend  block  device)  specific
       feature.   And  there  is  a minor problem around the aufs internal copyup. Assume you have two
       branches, lower RO ext2 and upper RW tmpfs. As you know ext2 supports  Direct  I/O,  but  tmpfs
       doesn't. When a ‘fileA’ exists in the lower ext2, and you write something into after opening it
       with O_DIRECT, then aufs behaves like this if the mount option ‘dio’ is specified.

              •   The application issues open(O_DIRECT);

                  Aufs opens the file in the lower ext2 and succeeds.

              •   The application issues write("something");

                  Aufs copies-up the file from the lower ext2 to the upper  tmpfs,  and  re-opens  the
                  file in tmpfs with O_DIRECT. It fails and returns an error.

       This  behavior may be a problem since application expects the error should be returned from the
       first open(2) instead of the later write(2), when the filesystem doesn't  support  Direct  I/O.
       (But,  in  real world, I don't think there is an application which doesn't check the error from
       write(2). So it won't be a big problem actually).

       If the file exists in the upper tmpfs, the first open(2) will fail expectedly. So there  is  no
       problem  in  this case. But the problem may happen when the internal copyup happens and the be‐
       havior of the branch differs from each other. As long as the feature depends upon the  filesys‐
       tem,  this  problem will not be solved. So aufs sets `nodio` by default, which means all Direct
       I/O are disabled, and open(2) with O_DIRECT always fails. If you want to use Direct I/O AND all
       your writable branches support it, then specify ‘dio’ option to make it in effect.

       With the similar reason, fcntl(F_SETFL, O_DIRECT) will not work for aufs file descriptor.

Possible problem of the inode number in TMPFS
       Although  it is rare to happen, TMPFS has a problem about its inode number management. Actually
       TMPFS does not maintain the inode number at all. Linux kernel has a  global  32bit  number  for
       general  use   of inode number, and TMPFS uses it while most of (real) filesystem maintains its
       inode number by itself. The global number can wrap around regardless the inode number is  still
       in use. This MAY cause a problem.

       For instance, when /your/tmpfs/fileA has 10 as its inode number, the same value (10) may be as‐
       signed to a newly created file /your/tmpfs/fileB. Some applications do not care the  duplicated
       inode numbers, but others, including AUFS, will be really confused by this situation.

       If  your writable branch FS is TMPFS and the inode number wraps around, aufs will not work cor‐
       rectly. It is recommended to use one of  FS  on  HDD,  ramdisk+ext2  or  tmpfs+FSimage+loopback
       mount, as your writable branch FS.  Or apply a patch in aufs4-standalone.git. It addresses this
       tmpfs-inum-assignment problem by modifying the source file other than aufs.

Dentry and Inode Caches
       If you want to clear caches on your system, there are several tricks for that. If  your  system
       ram  is  low, try ‘find /large/dir -ls > /dev/null’.  It will read many inodes and dentries and
       cache them. Then old caches will be discarded.  But when you have large ram or you do not  have
       such large directory, it is not effective.

       If  you want to discard cache within a certain filesystem, try ‘mount -o remount /your/mntpnt’.
       Some filesystem may return an error of EINVAL or something, but VFS discards  the  unused  den‐
       try/inode caches on the specified filesystem.

Compatible/Incompatible with Unionfs Version 1.x Series
       Ignoring  ‘delete’  option, and to keep filesystem consistency, aufs tries writing something to
       only one branch in a single systemcall. It means aufs may copyup even if the copyup-src  branch
       is specified as writable.  For example, you have two writable branches and a large regular file
       on the lower writable branch. When you issue rename(2) to the file on aufs, aufs may copyup  it
       to the upper writable branch.  If this behavior is not what you want, then you should rename(2)
       it on the lower branch directly.

       And there is a simple shell script ‘unionctl’ under sample subdirectory,  which  is  compatible
       with  unionctl(8)  in  Unionfs Version 1.x series, except --query action.  This script executes
       mount(8) with ‘remount’ option and uses add/del/mod aufs mount options.  If  you  are  familiar
       with Unionfs Version 1.x series and want to use unionctl(8), you can try this script instead of
       using mount -o remount,... directly.  Aufs does not support ioctl(2) interface.  This script is
       highly  depending upon mount(8) in util-linux-2.12p package, and you need to mount /proc to use
       this script.  If your mount(8) version differs, you can try modifying this script. It  is  very
       easy.  The unionctl script is just for a sample usage of aufs remount interface.

       Aufs uses the external inode number bitmap and translation table by default.

       The default branch permission for the first branch is ‘rw’, and the rest is ‘ro.’

       The  whiteout  is  for hiding files on lower branches. Also it is applied to stop readdir going
       lower branches.  The latter case is called ‘opaque directory.’ Any whiteout is an  empty  file,
       it  means whiteout is just an mark.  In the case of hiding lower files, the name of whiteout is
       ‘.wh.<filename>.’  And in the case of stopping readdir, the name is ‘.wh..wh..opq’.  All white‐
       outs are hardlinked, including ‘<writable branch top dir>/.wh..wh.aufs.’

       The  hardlink on an ordinary (disk based) filesystem does not consume inode resource newly. But
       in linux tmpfs, the number of free inodes will be decremented by link(2). It is recommended  to
       specify  nr_inodes  option  to your tmpfs if you meet ENOSPC. Use this option after checking by
       ‘df -i.’

       When you rmdir or rename-to the dir who has a number of whiteouts, aufs rename the dir  to  the
       temporary  whiteout-ed  name  like ‘.wh..wh.<dir>.<4-digits hex>.’  Then remove it after actual
       operation.  cf. mount option ‘dirwh.’

Incompatible with an Ordinary Filesystem
       stat(2) returns the inode info from the first existence inode among the  branches,  except  the
       directory  link count.  Aufs computes the directory link count larger than the exact value usu‐
       ally, in order to keep UNIX filesystem semantics, or in order to shut find(1)  mouth  up.   The
       size  of  a directory may be wrong too, but it has to do no harm.  The timestamp of a directory
       will not be updated when a file is created or removed under it, and it  was  done  on  a  lower
       branch.

       The  test  for  permission  bits  has two cases. One is for a directory, and the other is for a
       non-directory. In the case of a directory, aufs checks the permission bits of all existing  di‐
       rectories.  It  means  you  need  the correct privilege for the directories including the lower
       branches.  The test for a non-directory is more simple. It checks only the topmost inode.

       statfs(2) returns the information of the first branch info except namelen when ‘nosum’ is spec‐
       ified  (the  default).  The  namelen  is decreased by the whiteout prefix length.  Although the
       whiteout prefix is essentially ‘.wh.’, to support rmdir(2) and rename(2) (when the  target  di‐
       rectory  already  existed),  the  namelen  is  decreased more since the name will be renamed to
       ‘.wh..wh.<dir>.<4-digits hex>’ as previously described.  And the block  size  may  differ  from
       st_blksize which is obtained by stat(2).

       The  whiteout  prefix  (.wh.) is reserved on all branches. Users should not handle the filename
       begins with this prefix.  In order to future whiteout, the maximum filename length  is  limited
       by the longest value - 4 * 2 - 1 - 4 = 242.  It means you cannot handle such long name in aufs,
       even if it surely exists on the underlying branch fs. The readdir(3)/getdents(2) call show  you
       such name, but the d_type is set to DT_UNKNOWN.  It may be a violation of POSIX.

       Remember,  seekdir(3) and telldir(3) are not defined in POSIX. They may not work as you expect.
       Try rewinddir(3) or re-open the dir.

       If you dislike the difference between the aufs entries in /etc/mtab and  /proc/mounts,  and  if
       you are using mount(8) in util-linux package, then try ./mount.aufs utility. Copy the script to
       /sbin/mount.aufs.  This simple utility tries updating /etc/mtab.  If  you  do  not  care  about
       /etc/mtab,  you  can  ignore  this  utility.   Remember  this  utility is highly depending upon
       mount(8) in util-linux-2.12p package, and you need to mount /proc.

       Since aufs uses its own inode and dentry, your system may cache huge number of inodes and  den‐
       tries.  It  can be as twice as all of the files in your union.  It means that unmounting or re‐
       mounting readonly at shutdown time may take a long time, since mount(2) in  VFS  tries  freeing
       all of the cache on the target filesystem.

       When  you  open  a  directory, aufs will open several directories internally.  It means you may
       reach the limit of the number of file descriptor.  And  when  the  lower  directory  cannot  be
       opened, aufs will close all the opened upper directories and return an error.

       The  sub-mount under the branch of local filesystem is ignored.  For example, if you have mount
       another filesystem on /branch/another/mntpnt, the files under ‘mntpnt’ will be ignored by aufs.
       It is recommended to mount the sub-mount under the mounted aufs.  For example,

       # sudo mount /dev/sdaXX /ro_branch
       # d=another/mntpnt
       # sudo mount /dev/sdbXX /ro_branch/$d
       # mkdir -p /rw_branch/$d
       # sudo mount -t aufs -o br:/rw_branch:/ro_branch none /aufs
       # sudo mount -t aufs -o br:/rw_branch/${d}:/ro_branch/${d} none /aufs/another/$d

       There  are  several characters which are not allowed to use in a branch directory path and xino
       filename. See detail in Branch Syntax and Mount Option.

       The file-lock which means fcntl(2) with F_SETLK, F_SETLKW or F_GETLK, flock(2) and lockf(3), is
       applied to virtual aufs file only, not to the file on a branch. It means you can break the lock
       by accessing a branch directly.  TODO: check ‘security’ to hook locks, as inotify does.

       Aufs respects all "security" hooks in kernel, so you can configure LSM for both of virtual aufs
       files  and  real  branch-fs files. But there is one exception, it is the kernel function "secu‐
       rity_mmap_file()." The function called inside aufs for a branch-fs file may cause  a  deadlock,
       so aufs stops calling it.  LSM settings for the virtual aufs files works as usual.

       The  I/O  to the named pipe or local socket are not handled by aufs, even if it exists in aufs.
       After the reader and the writer established their connection if the pipe/socket are  copied-up,
       they keep using the old one instead of the copied-up one.

       The  fsync(2) and fdatasync(2) systemcalls return 0 which means success, even if the given file
       descriptor is not opened for writing.  I am afraid this behavior may  violate  some  standards.
       Checking the behavior of fsync(2) on ext2, aufs decided to return success.

       If you want to use disk quota, you should set it up to your writable branch since aufs does not
       have its own block device.

       When your aufs is the root directory of your system, and your system  tells  you  some  of  the
       filesystem were not unmounted cleanly, try these procedure when you shutdown your system.
       # mount -no remount,ro /
       # for i in $writable_branches
       # do mount -no remount,ro $i
       # done
       If  your  xino  file  is  on  a  hard  drive,  you  also  need  to  specify  ‘noxino’ option or
       ‘xino=/your/tmpfs/xino’ at remounting root directory.

       To rename(2) directory may return EXDEV even if both of src and tgt are on the same aufs,  when
       ‘dirren’  is  not  specified. When the rename-src dir exists on multiple branches and the lower
       dir has child/children, aufs has to copyup all his children. It can be recursive  copyup.  Cur‐
       rent aufs does not support such huge copyup operation at one time in kernel space, instead pro‐
       duces a warning and returns EXDEV.  Generally, mv(1) detects this error and tries mkdir(2)  and
       rename(2) or copy/unlink recursively. So the result is harmless.  If your application which is‐
       sues rename(2) for a directory does not support EXDEV, it will not work  on  aufs.   Also  this
       specification is applied to the case when the src directory exists on the lower readonly branch
       and it has child/children.

       While it is rare, users can open a removed file with a little help from procfs.

              •   open a file and get its descriptor

              •   remove the file

              •   generate a string ‘/proc/PID/fd/N’

              •   open the same file using the generated string

              •

       This operation is a little difficult for aufs since aufs allows the direct access  to  branches
       (by-passing aufs), and it is hard to distinguish the case of this.

              •   remove a file on a branch directly (by-passing aufs)

              •   open the file via aufs

       For  the  latter case, aufs detects the unmatching status between aufs cached info and the real
       info from the branch, and tries refreshing by re-lookup. Finally aufs finds the file is removed
       and  let open(2) return an error.  For the former case, currently (linux-3.13-rc7), aufs simply
       follows the behavior of ext2 which supports for opening a non-directory but  returns  an  error
       for  a  directory.   Other  than open(2), users may chmod(2) and chown(2) similarly (remove the
       file and then operate it via procfs). Ext2 supports them too, but aufs doesn't. I  don't  think
       it a big disadvantage since users can fchmod(2) and fchown(2) instead.

       If  a  sudden accident such like a power failure happens during aufs is performing, and regular
       fsck for branch filesystems is completed after the disaster, you need to extra  fsck  for  aufs
       writable  branches.  It  is necessary to check whether the whiteout remains incorrectly or not,
       eg. the real filename and the whiteout for it under the same parent directory. If such whiteout
       remains,  aufs cannot handle the file correctly.  To check the consistency from the aufs' point
       of view, you can use a simple shell script called /sbin/auchk. Its purpose is a fsck  tool  for
       aufs,  and it checks the illegal whiteout, the remained pseudo-links and the remained aufs-temp
       files. If they are found, the utility reports you and asks whether to delete  or  not.   It  is
       recommended to execute /sbin/auchk for every writable branch filesystem before mounting aufs if
       the system experienced crash.

       In linux-v4.5, copy_file_range(2) is introduced and aufs supports it.  The systemcall  supports
       only when the given two files exist on the same filesystem. In aufs world, two files must exist
       on the same physical filesystem, not on the logical aufs. The case of two files existing on the
       logically  same aufs but physically different file system is not supported.  For example, fileA
       and fileB are given, and fileA exists on the lower readonly branch in aufs, and fileB exists on
       the  upper  writable  branch.   When these two branches exist on the same filesystem, then aufs
       copy_file_range(2) should work. Otherwise it will  return  an  error.   In  other  words,  aufs
       copy_file_range(2) doesn't incur the internal copyup since such behaviour doesn't fit the orig‐
       inal purpose of copy_file_range(2).

EXAMPLES
       The mount options are interpreted from left to right at remount-time.  These examples shows how
       the options are handled. (assuming /sbin/mount.aufs was installed)

       # mount -v -t aufs -o br:/day0:/base none /u
       none on /u type aufs (rw,xino=/day0/.aufs.xino,br:/day0=rw:/base=ro)
       # mount -v -o remount,\
            prepend:/day1,\
            xino=/day1/xino,\
            mod:/day0=ro,\
            del:/day0 \
            /u
       none on /u type aufs (rw,xino=/day1/xino,br:/day1=rw:/base=ro)

       # mount -t aufs -o br:/rw none /u
       # mount -o remount,append:/ro /u
       different uid/gid/permission, /ro
       # mount -o remount,del:/ro /u
       # mount -o remount,nowarn_perm,append:/ro /u
       #
       (there is no warning)

       When  you  use  aufs as root filesystem, it is recommended to consider to exclude some directo‐
       ries. For example, /tmp and /var/log are not need to stack in many cases. They do  not  usually
       need  to copyup or to whiteout.  Also the swapfile on aufs (a regular file, not a block device)
       is not supported.  In order to exclude the specific dir from aufs, try bind mounting.

       And there is a good sample which is for network booted diskless machines. See  sample/  in  de‐
       tail.

DIAGNOSTICS
       When  you  add a branch to your union, aufs may warn you about the privilege or security of the
       branch, which is the permission bits, owner and group of the top directory of the branch.   For
       example,  when  your upper writable branch has a world writable top directory, a malicious user
       can create any files on the writable branch directly, like copyup and  modify  manually.  I  am
       afraid it can be a security issue.

       When  you  mount  or  remount your union without -o ro common mount option and without writable
       branch, aufs will warn you that the first branch should be writable.

       When you set udba other than notify and change something on your  branch  filesystem  directly,
       later  aufs may detect some mismatches to its cache. If it is a critical mismatch, aufs returns
       EIO.

       When an error occurs in aufs, aufs prints the kernel message with ‘errno.’ The priority of  the
       message  (log  level) is ERR or WARNING which depends upon the message itself.  You can convert
       the ‘errno’ into the error message by perror(3), strerror(3) or something.   For  example,  the
       ‘errno’  in  the  message ‘I/O Error, write failed (-28)’ is 28 which means ENOSPC or ‘No space
       left on device.’

       When CONFIG_AUFS_BR_RAMFS is enabled, you can specify ramfs as an aufs branch. Since  ramfs  is
       simple,  it does not set the maximum link count originally. In aufs, it is very dangerous, par‐
       ticularly for whiteouts. Finally aufs sets the maximum link count for ramfs. The value is 32000
       which is borrowed from ext2.

       After  you  prepend  a branch which already has some entries, aufs may report an I/O Error with
       "brabra should be negative" or something. For instance, you are going to open(2) a regular file
       in aufs and write(2) something to it. If you prepend a branch between open(2) and write(2), and
       the added branch already has a same named entry other than a regular file, then you get a  con‐
       flict.

              •   a regular file FOO exists in aufs.

              •   open the file FOO.

              •   add  a  branch which has FOO but it is a directory, and change the permission of the
                  old branch to RO.

              •   write to the file FOO.

              •   aufs tries copying-up FOO to the upper writable branch which was recently added.

              •   aufs finds a directory FOO on the upper branch, and returns an error.
       In this situation, aufs keeps returning an error during FOO is cached in memory because it  re‐
       members  that FOO is a regular file instead of a directory.  When the system discards the cache
       about FOO, then you will see the directory FOO.  In other words, you will not be  able  to  see
       the  directory FOO on the newly added branch during the file FOO on the lower branch is in use.
       This situation may invite more complicated issue. If you unlink(2) the opened  file  FOO,  then
       aufs will create a whiteout on the upper writable branch. And you get another conflict which is
       coexisting a whiteout and a real entry on the same branch. In this case, aufs  also  keeps  re‐
       turning an error when you try using FOO.

COPYRIGHT
       Copyright © 2005-2017 Junjiro R. Okajima

AUTHOR
       Junjiro R. Okajima

Linux                                        4.15-20180219                                     aufs(5)
