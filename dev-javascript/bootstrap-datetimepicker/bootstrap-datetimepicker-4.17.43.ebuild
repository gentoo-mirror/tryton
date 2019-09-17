# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Bootstrap 3 Date/Time Picker"
HOMEPAGE="https://eonasdan.github.io/bootstrap-datetimepicker/"
SRC_URI="https://github.com/Eonasdan/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-javascript/jquery-1.8.3
	>=dev-javascript/moment-2.10.5
	dev-javascript/bootstrap:3"

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	cd "${S}"/build
	doins -r js css
	cd "${S}"/src
	doins -r js
}
