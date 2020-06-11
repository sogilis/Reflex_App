#!/bin/sh
#
# XReq Tool binary distribution installation script
# Copyright (c) 2017, Sogilis
#

####################
# Global variables #
####################
xreq="XReq Tool"
prefix=''
has_gnatpro=n

ggd_prefix=''
if [ "x$ggd_prefix" = "x" ]; then
    ggd_prog="gnatmake"
else
    ggd_prog="$ggd_prefix-gnatmake"
fi
if type $ggd_prog > /dev/null 2>&1 &&
   $ggd_prog -v 2>&1 | grep GNATMAKE | grep -q Pro;
then
    has_gnatpro=y
    saved_IFS="$IFS"
    IFS=:
    for d in $PATH; do
      if [ -x "$d/$ggd_prog" ]; then
        prefix=$d
        break
      fi
    done
    IFS="$saved_IFS"
    machine=`$prefix/gcc -dumpmachine || true`
fi

# remove last 'bin' from prefix as it's not expected
prefix=`echo $prefix | sed 's/\/bin$//'`


# --------------------- Welcom screen -----------------------------------------
clear
cat << EOF


   This script is provided to simplify the installation of the binary
   distribution of $xreq.
   For information on commercial support, please contact sales@sogilis.com.

   This script will ask a few questions regarding the $xreq installation.
   Confirmation is required before any write action is taken.

   Please press RETURN to continue.

EOF

read x

# --------------------- Select installation option ----------------------------
clear
cat << EOF


  There are 2 options for installation:
EOF

if [ "$has_gnatpro" = "y" ]; then
cat <<EOF

  1) Install $xreq in the standard GNAT Pro location.
     ($prefix)

EOF
else
cat <<EOF

  1) Install $xreq in /usr/local directory (must be root)

EOF
fi

cat <<EOF

  2) Install $xreq in non-standard locations that you will specify.

EOF

if [ "$has_gnatpro" = "y" ]; then
cat <<EOF

  Option 1 provides simplest use of $xreq.

EOF
fi

while [ true ]; do
  echo "Type 1, or 2 (then RETURN) to choose an option: "
  read answer
  case $answer in

  # ------------------ Custom  installation ---------------------------
  2)
    clear
    cat << EOF


    To install $xreq in a non-standard location you need to
    specify a base directory. All the files will be installed in
    subdirectories that are created under this directory.

    Important Note: You should not use ~ or ~username wildcards
    when specifying this directory name.

    Specify the base directory you want to use for installation:

EOF
    read basedir
    while [ true ]; do
      if [ "X" = "X`echo $basedir|sed -n -e 's%^/.*%/%p'`" ]; then
          basedir=`pwd`/$basedir
      fi
      echo "    " The base directory is $basedir
      echo "    " To accept this choice enter RETURN.
      echo "    " Otherwise type a new name.
      read answer
      if [ "X$answer" = "X" ]; then
          break
      fi
      basedir=$answer
    done
    clear
    installdir=$basedir
    break
    ;;

  # ------------------ Regular installation ---------------------------
  1)
    if [ "$has_gnatpro" = "y" ]; then
       installdir=$prefix
    else
       installdir="/usr/local"
    fi
    break
    ;;

  *)
    echo "Incorrect choice"
    ;;
 esac
done


# --------------------- Actual Installation of XReq Tool ----------------------

if [ ! -d $installdir ]; then
    mkdir -p $installdir
fi

if tar cf - bin include lib share | (cd $installdir && tar xf -) ; then

   # Automatic GPS integration
   PREFIX_GPS=`which gps 2>/dev/null | sed -e's/\/bin\/[^/]*//'`
   if [ ! "x$PREFIX_GPS" = "x" ]; then
      GPSDATADIR=$PREFIX_GPS/share/gps
      mkdir -p ${DESTDIR}${GPSDATADIR}/plug-ins
      mkdir -p ${DESTDIR}${GPSDATADIR}/icons/24px/
      install -m644 $installdir/share/gps/icons/24px/xreq.png      ${DESTDIR}${GPSDATADIR}/icons/24px/xreq.png
      install -m644 $installdir/share/gps/plugins/feature-lang.xml ${DESTDIR}${GPSDATADIR}/plug-ins/feature-lang.xml
      install -m644 $installdir/share/gps/plugins/xreq-plugin.xml  ${DESTDIR}${GPSDATADIR}/plug-ins/xreq-plugin.xml
      install -m644 $installdir/share/gps/plugins/xreq.py          ${DESTDIR}${GPSDATADIR}/plug-ins/xreq.py
      sed -i "s#%GPSDATADIR%#${GPSDATADIR}#"                       ${DESTDIR}${GPSDATADIR}/plug-ins/xreq-plugin.xml
   fi

   # --------------------------- End of the script -----------------------
   clear
   echo " "
   echo "$xreq has been installed in $installdir"
   echo "To launch it, you must put"
   echo "    $installdir/bin"
   echo "in front of your PATH environment variable. The following"
   echo "commands enable you to do this:"
   echo "   (Bourne shell) PATH=$installdir/bin:\$PATH; export PATH"
   echo "   (C shell)      setenv PATH $installdir/bin:\$PATH"
   echo " "
   echo "You will also need to update your GPR_PROJECT_PATH environment"
   echo "variable, with one of the following commands:"
   echo "   (Bourne shell) GPR_PROJECT_PATH=$installdir/lib/gnat:\$GPR_PROJECT_PATH; export GPR_PROJECT_PATH"
   echo "   (C shell)      setenv GPR_PROJECT_PATH $installdir/lib/gnat:\$GPR_PROJECT_PATH"
   echo " "
   echo "You will also need to update your LD_LIBRARY_PATH environment"
   echo "variable, with one of the following commands:"
   echo "   (Bourne shell) LD_LIBRARY_PATH=$installdir/lib:\$LD_LIBRARY_PATH; export LD_LIBRARY_PATH"
   echo "   (C shell)      setenv LD_LIBRARY_PATH $installdir/lib:\$LD_LIBRARY_PATH"
   echo " "
   if [ ! "x$PREFIX_GPS" = "x" ]; then
      echo "Note that $xreq GPS plugin has also been installed in directory:"
      echo "${DESTDIR}${GPSDATADIR}/plug-ins"
   fi
   echo " "
   echo "Thank you for installing $xreq!"
   echo " "

else
   echo
   echo "$xreq failed to be installed. Please check error messages"
   echo " "
fi

