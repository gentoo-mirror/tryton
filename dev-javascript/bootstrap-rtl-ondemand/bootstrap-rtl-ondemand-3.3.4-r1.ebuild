# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Bootstrap 3 with on-demand RTL support"
HOMEPAGE="https://github.com/bright/bootstrap-rtl"
SRC_URI="https://github.com/bright/bootstrap-rtl/archive/v${PV}-ondemand.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-javascript/bootstrap-3.3.0"

S=${WORKDIR}/bootstrap-rtl-${PV}-ondemand

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/dist/"
	cd "${S}"/dist
	doins -r css
}
