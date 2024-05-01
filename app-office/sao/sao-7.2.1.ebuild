# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Tryton web client"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="https://downloads.tryton.org/$(ver_cut 1-2)/tryton-${P}.tgz"
S=${WORKDIR}/package

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-javascript/jquery:3
	>=dev-javascript/bootstrap-3.3.7:3
	>=dev-javascript/moment-2.10:2
	>=dev-javascript/gettext-0.7:0
	>=dev-javascript/c3-0.7:0
	>=dev-javascript/papaparse-5.0:5
	>=dev-javascript/fullcalendar-3.10.2:3
	>=dev-javascript/mousetrap-1.6:1
	>=dev-javascript/bootstrap-rtl-ondemand-3.3.4:3
	>=dev-javascript/sortable-1.8.4:1"
RDEPEND="${DEPEND}
	=app-office/trytond-$(ver_cut 1-2)*"

src_install() {
	insinto "/usr/share/${PN}/"
	doins index.html
	doins -r dist/ locale/ images/

	keepdir "/usr/share/${PN}/bower_components/jquery"
	keepdir "/usr/share/${PN}/bower_components/bootstrap"
	keepdir "/usr/share/${PN}/bower_components/gettext.js"
	keepdir "/usr/share/${PN}/bower_components/fullcalendar"

	dodoc CHANGELOG COPYRIGHT README.md
}

pkg_postinst() {
	ln -sf "${EROOT}"/usr/share/jquery-3 "${EROOT}"/usr/share/${PN}/bower_components/jquery/dist
	ln -sf "${EROOT}"/usr/share/bootstrap-3 "${EROOT}"/usr/share/${PN}/bower_components/bootstrap/dist
	ln -sf "${EROOT}"/usr/share/moment-2 "${EROOT}"/usr/share/${PN}/bower_components/moment
	ln -sf "${EROOT}"/usr/share/gettext.js-0 "${EROOT}"/usr/share/${PN}/bower_components/gettext.js/dist
	ln -sf "${EROOT}"/usr/share/d3-5 "${EROOT}"/usr/share/${PN}/bower_components/d3
	ln -sf "${EROOT}"/usr/share/c3-0 "${EROOT}"/usr/share/${PN}/bower_components/c3
	ln -sf "${EROOT}"/usr/share/papaparse-5 "${EROOT}"/usr/share/${PN}/bower_components/papaparse
	ln -sf "${EROOT}"/usr/share/fullcalendar-3 "${EROOT}"/usr/share/${PN}/bower_components/fullcalendar/dist
	ln -sf "${EROOT}"/usr/share/mousetrap-1 "${EROOT}"/usr/share/${PN}/bower_components/mousetrap
	ln -sf "${EROOT}"/usr/share/bootstrap-rtl-ondemand-3 \
		"${EROOT}"/usr/share/${PN}/bower_components/bootstrap-rtl-ondemand
	ln -sf "${EROOT}"/usr/share/sortable-1 "${EROOT}"/usr/share/${PN}/bower_components/Sortable

	elog "In order to use sao, add to trytond configuration:"
	elog "    [web]"
	elog "    root=${EROOT}/usr/share/${PN}"
}

pkg_prerm() {
	rm -f "${EROOT}"/usr/share/${PN}/bower_components/jquery/dist
	rm -f "${EROOT}"/usr/share/${PN}/bower_components/bootstrap/dist
	rm -f "${EROOT}"/usr/share/${PN}/bower_components/moment
	rm -f "${EROOT}"/usr/share/${PN}/bower_components/gettext.js/dist
	rm -f "${EROOT}"/usr/share/${PN}/bower_components/d3
	rm -f "${EROOT}"/usr/share/${PN}/bower_components/c3
	rm -f "${EROOT}"/usr/share/${PN}/bower_components/papaparse
	rm -f "${EROOT}"/usr/share/${PN}/bower_components/fullcalendar
	rm -f "${EROOT}"/usr/share/${PN}/bower_components/mousetrap
	rm -f "${EROOT}"/usr/share/${PN}/bower_components/bootstrap-rtl-ondemand
	rm -f "${EROOT}"/usr/share/${PN}/bower_components/Sortable
}
