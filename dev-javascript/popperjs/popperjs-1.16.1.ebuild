# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Tooltip & Popover Positioning Engine"
HOMEPAGE="https://popper.js.org/"
SRC_URI="https://github.com/popperjs/popper-core/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/popper-core-${PV}

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	cd "${S}"/dist
	doins -r *.js
}
