#!/sbin/openrc-run

DAEMON=/usr/bin/trytond
PIDFILE=/var/run/trytond/trytond.pid
LOGFILE=/var/log/trytond/trytond.log

depend() {
	use net logger
	after postgresql
}

start() {
	ebegin "Starting trytond"
	checkpath -d -m 0755 -o trytond:trytond `dirname ${PIDFILE}`
	start-stop-daemon --start --quiet --background -u trytond:trytond \
		--exec ${DAEMON} --pidfile=${PIDFILE} \
		-- --pidfile=${PIDFILE} --logfile=${LOGFILE}
	eend $?
}

stop() {
	ebegin "Stopping trytond"
	start-stop-daemon --stop --quiet --pidfile=${PIDFILE}
	eend $?
}
