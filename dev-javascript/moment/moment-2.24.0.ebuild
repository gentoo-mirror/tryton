# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Parse, validate, manipulate, and display dates in JavaScript"
HOMEPAGE="http://momentjs.com/"
SRC_URI="https://github.com/moment/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	doins -r moment.js min
}
