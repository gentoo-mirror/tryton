#!/sbin/openrc-run

DAEMON=/usr/bin/trytond-worker
PIDFILE=/var/run/trytond/trytond-worker.pid
LOGFILE=/var/log/trytond/trytond-worker.log

depend() {
	use net logger
	after postgresql
}

start() {
	local OPTIONS
	if [ -n "${CONFIG}" ]; then
		OPTIONS="${OPTIONS} --config ${CONFIG}"
	fi
	if [ -n "${LOGCONF}" ]; then
		OPTIONS="${OPTIONS} --logconf ${LOGCONF}"
	fi
	if [ -n "${DATABASES}" ]; then
		OPTIONS="${OPTIONS} --database ${DATABASES}"
	fi
	ebegin "Starting trytond-worker"
	checkpath -d -m 0755 -o trytond:trytond `dirname ${PIDFILE}`
	start-stop-daemon --start --quiet --background -u trytond:trytond \
		--exec ${DAEMON} --pidfile ${PIDFILE} --stderr ${LOGFILE} \
		-- --pidfile=${PIDFILE} ${OPTIONS}
	eend $?
}

stop() {
	ebegin "Stopping trytond"
	start-stop-daemon --stop --quiet --pidfile=${PIDFILE}
	eend $?
}
