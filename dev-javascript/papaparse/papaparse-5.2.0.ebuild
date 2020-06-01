# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Powerful, in-browser CSV parser for big boys and girls"
HOMEPAGE="http://papaparse.com/"
SRC_URI="https://github.com/mholt/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="5"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/PapaParse-${PV}

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	doins  papaparse.js papaparse.min.js
	doins -r player
}
