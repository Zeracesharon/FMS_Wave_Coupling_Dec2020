#!/bin/csh
#

set version=REPRO
set platform="ncrc6.intel23"
set rootdir = `dirname $0`
source ${rootdir}/envs.${platform}

mkdir -p build/${platform}/fms/$version

(cd build/${platform}/fms/$version/; rm -f path_names; \
../../../../src/mkmf/bin/list_paths -l ../../../../src/FMS; \
../../../../src/mkmf/bin/mkmf -t ../../../../src/mkmf/templates/ncrc-intel.mk -p libfms.a -c "-Duse_libMPI -Duse_netCDF -DHAVE_GETTID" path_names)
(cd build/${platform}/fms/$version/; make NETCDF=3 $version=1 libfms.a -j)
