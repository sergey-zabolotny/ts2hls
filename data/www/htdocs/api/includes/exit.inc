
exit_proc ()
{
    exit_code=$?

    if [[ "${exit_code}" != "0" ]]
    then
        err_line=$(tail -n+$1 $0 | head -n1)
	echo "Exitcode: ${exit_code}" >>${log_dir}/error.log
	echo "Errorline: ${err_line}" >>${log_dir}/error.log
    else
	if [ "${save_logs}" == "0" ]
	then
	    [ -d ${log_dir} ] && rm -rf ${log_dir}
	fi
    fi
    find /tmp/cache/status/ -type f -not -newermt '-15 seconds' -delete
}

trap 'exit_proc $LINENO ${PIPESTATUS[@]}' EXIT ERR
