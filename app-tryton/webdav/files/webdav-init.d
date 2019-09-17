#!/sbin/openrc-run

DAEMON=/usr/bin/trytond-webdav
PIDFILE=/var/run/trytond/webdav.pid
LOGFILE=/var/log/trytond/webdav.log

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
	ebegin "Starting trytond-webdav"
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
