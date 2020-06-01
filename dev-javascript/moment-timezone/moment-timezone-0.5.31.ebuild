# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Timezone support for moment.js"
HOMEPAGE="http://momentjs.com/timezone"
SRC_URI="https://github.com/moment/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-javascript/moment-2.9.0"

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	doins moment-timezone.js moment-timezone-utils.js
	cd "${S}"/builds
	doins *.js
}
