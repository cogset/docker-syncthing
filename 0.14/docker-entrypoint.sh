#!/bin/bash

# Uses syncthing as default.
if [ "${1#-}" != "$1" ]; then
	set -- syncthing "$@"
fi

function print_usage {
  echo
  echo "Usage:"
  echo "  syncthing [OPTIONS]"
  echo
  echo "Options:"
  echo "  -h, --home string               Set configuration directory"
  echo "  -g, --generate string           Generate key and config in specified dir"
  echo "  -v, --verbose                   Print verbose log output"
  echo "  --browser-only                  Open GUI in browser"
  echo "  --no-browser                    Do not start browser"
  echo "  --gui-address string            Override GUI address"
  echo "  --logfile string                Log file name"
  echo "  --logflags int                  Select information in log line prefix. 1: Date, 2: Time,"
  echo "                                  4: Microsecond time, 8: Long filename, 16: Short filename"
  echo "  --version                       Show version"
  echo
  echo "  --help                          Print this message"
  echo
}

if [ "$1" != "syncthing" ]; then
  exec "$@"
fi

shift
OPTIONS=`getopt -o h:g:v --long home:,generate:,browser-only,no-browser,gui-address:,logfile:,logflags:,version,help -n syncthing -- "$@"`
if [ $? -ne 0 ]; then
  print_usage
  exit 1
fi

SYNC_HOME="-home /etc/syncthing"

eval set -- "$OPTIONS"
while true; do
  case "$1" in
    -h|--home)          SYNC_HOME="-home $2";                 shift 2;;
    -v|--verbose)       SYNC_VERBOSE="-verbose";              shift;;
    --browser-only)     SYNC_BROWSER="-browser-only";         shift;;
    --no-browser)       SYNC_BROWSER="-no-browser";           shift;;
    --gui-address)      SYNC_GUI_ADDRESS="-gui-address $2";   shift 2;;
    --logfile)          SYNC_LOGFILE="-logfile $2";           shift 2;;
    --logflags)         SYNC_LOGFLAGS="-logflags $2";         shift 2;;
    --)                                                       shift; break;;

    -g|--generate)      syncthing -generate "$2";             exit 0;;
    --version)          syncthing -version;                   exit 0;;

    --help)             print_usage;                          exit 0;;

    *)    echo "Unexpected argument: $1";    print_usage;     exit 1;;
  esac
done

syncthing $SYNC_HOME $SYNC_VERBOSE $SYNC_BROWSER $SYNC_GUI_ADDRESS $SYNC_LOGFILE $SYNC_LOGFLAGS
