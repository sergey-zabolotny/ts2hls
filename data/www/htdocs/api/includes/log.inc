# usage: log "message" "filename"

prepare_logdir ()
{
    log_dir="$DOCUMENT_ROOT/../logs/$(date "+%Y%m%d-%H%M%S")-$(basename ${DOCUMENT_URI}-${RANDOM})"
    [ ! -d ${log_dir} ] && mkdir -p ${log_dir}
    return
}

prepare_logdir

exec 2>>${log_dir}/error.log
#env >>${log_dir}/error.log
set -x