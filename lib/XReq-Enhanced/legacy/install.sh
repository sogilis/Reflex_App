#!/bin/sh

set -e

: ${DESTDIR:=}
if [ -n "$DESTDIR" ] && [ / != "${DESTDIR:0:1}" ]; then
  echo "ERROR: DESTDIR is not an absolute path." >&2
  exit 1
fi

: ${PREFIX:=`./tools/whereis gprbuild`}
: ${PREFIX:=/usr/local}

: ${BINDIR:=$PREFIX/bin}
: ${INCLUDEDIR:=$PREFIX/include}
: ${LIBDIR:=$PREFIX/lib}
: ${GPRDIR:=$PREFIX/lib/gnat}
: ${DATADIR:=$PREFIX/share}
: ${DOCDIR:=$DATADIR/doc/XReq}

# install gpr config
mkdir -p ${DESTDIR}${DATADIR}/gprconfig
install -m644 data/gprconfig.xml ${DESTDIR}${DATADIR}/gprconfig/xreq.xml

# install binaries
mkdir -p ${DESTDIR}${BINDIR}
install -m755 bin/xreq.rel ${DESTDIR}${BINDIR}/xreq

# install xreqlib
mkdir -p ${DESTDIR}${GPRDIR}
cat <<EOF > ${DESTDIR}${GPRDIR}/xreqlib.gpr

-------------------------------------------------------------------------------
--  XReq  --  Behaviour Driven Developpement tool for compiled languages     --
--  Copyright (c) 2010, SOGILIS <http://sogilis.com>                         --
--                                                                           --
--  This program is free software: you can redistribute it and/or modify     --
--  it under the terms of the GNU Affero General Public License as           --
--  published by the Free Software Foundation, either version 3 of the       --
--  License, or (at your option) any later version.                          --
--                                                                           --
--  This program is distributed in the hope that it will be useful,          --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of           --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            --
--  GNU Affero General Public License for more details.                      --
--                                                                           --
--  You should have received a copy of the GNU Affero General Public License --
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.    --
--                                                                           --
-------------------------------------------------------------------------------

library project XReqLib is

   for Library_Name      use "xreqlib";
   for Source_Dirs       use ("$INCLUDEDIR/xreqlib");
   for Library_Dir       use "$LIBDIR/xreqlib";
   for Library_Kind      use "$LIBTYPE";
   for Externally_Built  use "true";

end XReqLib;

--  kate: hl Ada

EOF

rm -rf ${DESTDIR}${LIBDIR}/xreqlib
cp -R lib/xreqlib ${DESTDIR}${LIBDIR}

# install included sources
rm -rf ${DESTDIR}${INCLUDEDIR}/xreqlib
mkdir -p ${DESTDIR}${INCLUDEDIR}/xreqlib
cp src/lib/*.ad[bs] ${DESTDIR}${INCLUDEDIR}/xreqlib

# GPS integration
: ${PREFIX_GPS:=`./tools/whereis gps`}
if [ -n "$PREFIX_GPS" ]; then
  GPSDATADIR=$PREFIX_GPS/share/gps
  mkdir -p ${DESTDIR}${GPSDATADIR}/plug-ins ${DESTDIR}${GPSDATADIR}/icons/24px/
  install -m644 data/gps-plug-in/xreq-redo.png    ${DESTDIR}${GPSDATADIR}/icons/24px/xreq-redo.png
  install -m644 data/gps-plug-in/feature-lang.xml ${DESTDIR}${GPSDATADIR}/plug-ins/feature-lang.xml
  install -m644 data/gps-plug-in/xreq-redo.xml    ${DESTDIR}${GPSDATADIR}/plug-ins/xreq-redo.xml
  sed -i "s#%GPSDATADIR%#${GPSDATADIR}#"          ${DESTDIR}${GPSDATADIR}/plug-ins/xreq-redo.xml
fi

# final report
echo "--------------------------------------------------------------------------"
echo "--                        INSTALLATION  FINISHED                        --"
echo "--------------------------------------------------------------------------"
echo "-- XReq has now been installed in:                                      --"
echo "-- $DESTDIR$PREFIX"

if [ -n "$DESTDIR" ]; then
  echo "--                                                                      --"
  echo "-- Note: you set DESTDIR to a non empty value, the installation is not  --"
  echo "-- finished yet. You must make sure DESTDIR is packaged (using the fpm  --"
  echo "-- ruby gem for example) or chroot in DESTDIR before use.               --"
  echo "--                                                                      --"
  echo "-- DESTDIR=$DESTDIR"
fi

echo "--                                                                      --"
echo "-- To be able to use the xreq binary, you may need to update your PATH  --"
echo "-- to point to:                                                         --"
echo "-- BINDIR=$BINDIR"
echo "--                                                                      --"
echo "-- To be able to use the library for Ada, you may need to update your   --"
echo "-- ADA_PROJECT_PATH or GPR_PROJECT_PATH to point to:                    --"
echo "-- GPRDIR=$GPRDIR"
echo "--                                                                      --"
echo "-- To be able to use the library, you may need to update your           --"
echo "-- LD_LIBRARY_PATH to point to:                                         --"
echo "-- LIBDIR=$LIBDIR"
echo "--------------------------------------------------------------------------"
