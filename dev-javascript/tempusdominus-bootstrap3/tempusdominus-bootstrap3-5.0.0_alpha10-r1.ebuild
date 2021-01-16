# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Tempus Dominus Bootstrap 3"
HOMEPAGE="https://github.com/tempusdominus/bootstrap-3"
SRC_URI="https://github.com/tempusdominus/bootstrap-3/archive/${PV//_/-}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="5"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-javascript/jquery-1.8.3
	>=dev-javascript/moment-2.10.5"

S=${WORKDIR}/bootstrap-3-${PV//_/-}

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	cd "${S}"/build
	doins -r js css
}
