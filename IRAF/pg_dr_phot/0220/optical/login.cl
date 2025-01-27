	# LOGIN.CL -- User login file for the IRAF command language.

# Identify login.cl version (checked in images.cl).
if (defpar ("logver"))
    logver = "IRAF V2.12.2 January 2004"

set	home		= "/Users/ams/iraf/"
set	imdir		= "/iraf/imdirs/ams/"
set	uparm		= "home$uparm/"
set	userid		= "ams"

# Set the terminal type.
if (envget("TERM") == "xterm") {
    if (!access (".hushiraf"))
	print "setting terminal type to xgterm..."
    stty xgterm
} else {
    if (!access (".hushiraf"))
	print "setting terminal type to xgterm..."
    stty xgterm
}

# Uncomment and edit to change the defaults.
#set	editor		= vi
#set	printer		= lp
#set	pspage		= "letter"
set	stdimage	= imt800
set	stdimcur	= stdimage
#set	stdplot		= lw
#set	clobber		= no
#set	filewait	= yes
#set	cmbuflen	= 512000
#set	min_lenuserarea	= 64000
set	imtype		= "fits"
#set	imextn		= "oif:imh fxf:fits,fit plf:pl qpf:qp stf:hhh,??h"


# XIMTOOL/DISPLAY stuff.  Set node to the name of your workstation to
# enable remote image display.  The trailing "!" is required.
#set	node		= "my_workstation!"

# CL parameters you mighth want to change.
#ehinit   = "nostandout eol noverify"
#epinit   = "standout showall"
showtype = yes

# Load the default CL package.  Doing so here allows us to override package
# paths and load personalized packages from our loginuser.cl. 
clpackage


# Default USER package; extend or modify as you wish.  Note that this can
# be used to call FORTRAN programs from IRAF.

package user

task	$adb $bc $cal $cat $comm $cp $csh $date $dbx $df $diff	= "$foreign"
task	$du $find $finger $ftp $grep $lpq $lprm $ls $mail $make	= "$foreign"
task	$man $mon $mv $nm $od $ps $rcp $rlogin $rsh $ruptime	= "$foreign"
task	$rwho $sh $spell $sps $strings $su $telnet $tip $top	= "$foreign"
task	$vi $emacs $w $wc $less $rusers $sync $pwd $gdb		= "$foreign"

task	$xc $mkpkg $generic $rtar $wtar $buglog			= "$foreign"
#task	$fc = "$xc -h $* -limfort -lsys -lvops -los"
task	$fc = ("$" // envget("iraf") // "unix/hlib/fc.csh" //
	    " -h $* -limfort -lsys -lvops -los")
task	$nbugs = ("$(setenv EDITOR 'buglog -e';" //
	    "less -Cqm +G " // envget ("iraf") // "local/bugs.*)")
task	$cls = "$clear;ls"
task	$clw = "$clear;w"
task	$pg = ("$(less -Cqm $*)")

if (access ("home$loginuser.cl"))
    cl < "home$loginuser.cl"
;

keep


prcache directory
cache   directory page type help

# Print the message of the day.
if (access (".hushiraf"))
    menus = no
else {
    clear; type hlib$motd
}

# Delete any old MTIO lock (magtape position) files.
if (deftask ("mtclean"))
    mtclean
else
    delete uparm$mt?.lok,uparm$*.wcs verify-

# List any packages you want loaded at login time, ONE PER LINE.
images          # general image operators
plot            # graphics tasks
dataio          # data conversions, import export
lists           # list processing

# The if(deftask...) is needed for V2.9 compatibility.
if (deftask ("proto"))
    proto       # prototype or ad hoc tasks

tv              # image display
utilities       # miscellaneous utilities
noao            # optical astronomy packages

reset wmkonspec = /Users/ams/iraf/NIRSPEC/
task wmkonspec.pkg = $wmkonspec$wmkonspec.cl
reset helpdb = (envget("helpdb") //",wmkonsoec$helpdb.mip")

task wfpc2_mosaic.pkg = /Users/ams/iraf/wfpc2_mosaic.cl
task mygstransform.pkg = /Users/ams/iraf/mygstransform.cl

task makemask.pkg = /Users/ams/iraf/makemask.cl
task minv.pkg = /Users/ams/iraf/minv.cl

task xzap.pkg = /Users/ams/iraf/xzap.cl
task doszap.pkg = /Users/ams/iraf/doszap.cl
task szap.pkg = /Users/ams/iraf/szap.cl
task fileroot.pkg = /Users/ams/iraf/fileroot.cl

task deep2iraf = home$deep2iraf.cl

#noao
#imred
#generic
#stsda
#hst_cal
#nicmos


keep
