# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit versionator

DESCRIPTION="Tryton webclient"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="http://downloads.tryton.org/$(get_version_component_range 1-2)/tryton-${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	=app-office/trytond-$(get_version_component_range 1-2)*
	dev-javascript/jquery:3
	>=dev-javascript/bootstrap-3.3.7:3
	>=dev-javascript/moment-2.10:2
	>=dev-javascript/bootstrap-datetimepicker-4.17:4
	>=dev-javascript/gettext-0.5:0
	>=dev-javascript/d3-3.5:3
	>=dev-javascript/c3-0.4:0
	>=dev-javascript/papaparse-4.1:4
	>=dev-javascript/fullcalendar-3.0:3
	>=dev-javascript/mousetrap-1.6:1"

S=${WORKDIR}/package

src_install() {
	insinto "/usr/share/${PN}/"
	doins index.html offcanvas.css
	doins -r dist/ locale/ images/

	dodir "/usr/share/${PN}/bower_components/jquery"
	dodir "/usr/share/${PN}/bower_components/bootstrap"
	dodir "/usr/share/${PN}/bower_components/eonasdan-bootstrap-datetimepicker"
	dodir "/usr/share/${PN}/bower_components/gettext.js"
	dodir "/usr/share/${PN}/bower_components/fullcalendar"

	dodoc CHANGELOG COPYRIGHT README
}

pkg_postinst() {
	ln -sf "${EROOT}"usr/share/jquery-2 "${EROOT}"usr/share/${PN}/bower_components/jquery/dist
	ln -sf "${EROOT}"usr/share/bootstrap-3 "${EROOT}"usr/share/${PN}/bower_components/bootstrap/dist
	ln -sf "${EROOT}"usr/share/moment-2 "${EROOT}"usr/share/${PN}/bower_components/moment
	ln -sf "${EROOT}"usr/share/bootstrap-datetimepicker-4 "${EROOT}"usr/share/${PN}/bower_components/eonasdan-bootstrap-datetimepicker/build
	ln -sf "${EROOT}"usr/share/gettext.js-0 "${EROOT}"usr/share/${PN}/bower_components/gettext.js/dist
	ln -sf "${EROOT}"usr/share/d3-3 "${EROOT}"usr/share/${PN}/bower_components/d3
	ln -sf "${EROOT}"usr/share/c3-0 "${EROOT}"usr/share/${PN}/bower_components/c3
	ln -sf "${EROOT}"usr/share/papaparse-4 "${EROOT}"usr/share/${PN}/bower_components/papaparse
	ln -sf "${EROOT}"usr/share/fullcalendar-3 "${EROOT}"usr/share/${PN}/bower_components/fullcalendar/dist
	ln -sf "${EROOT}"usr/share/mousetrap-1 "${EROOT}"usr/share/${PN}/bower_components/mousetrap

	elog "In order to use sao, add to trytond configuration:"
	elog "    [web]"
	elog "    root=${EROOT}usr/share/${PN}"
}

pkg_prerm() {
	rm -f "${EROOT}"usr/share/${PN}/bower_components/jquery/dist
	rm -f "${EROOT}"usr/share/${PN}/bower_components/bootstrap/dist
	rm -f "${EROOT}"usr/share/${PN}/bower_components/moment
	rm -f "${EROOT}"usr/share/${PN}/bower_components/eonasdan-bootstrap-datetimepicker/build
	rm -f "${EROOT}"usr/share/${PN}/bower_components/gettext.js/dist
	rm -f "${EROOT}"usr/share/${PN}/bower_components/d3
	rm -f "${EROOT}"usr/share/${PN}/bower_components/c3
	rm -f "${EROOT}"usr/share/${PN}/bower_components/papaparse
	rm -f "${EROOT}"usr/share/${PN}/bower_components/fullcalendar
	rm -f "${EROOT}"usr/share/${PN}/bower_components/mousetrap
}
