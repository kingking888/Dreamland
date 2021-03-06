#!/system/bin/sh

MODDIR=${0%/*}

now=$(date "+%Y%m%d%H%M%S")
logcat > "/data/local/tmp/log_$now.log" &

[[ -f ${MODDIR}/sepolicy.rule ]] && exit 0

magiskpolicy --live "allow zygote zygote process { execmem }" \
    "allow system_server system_server process { execmem }"
