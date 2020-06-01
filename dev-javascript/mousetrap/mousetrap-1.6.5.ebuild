# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A simple library for handling keyboard shortcuts in Javascript"
HOMEPAGE="https://craig.is/killing/mice"
SRC_URI="https://github.com/ccampbell/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	doins -r mousetrap.js mousetrap.min.js plugins
}
