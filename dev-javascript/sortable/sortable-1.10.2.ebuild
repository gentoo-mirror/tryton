# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="a JavaScript library for reorderable drag-and-drop lists"
HOMEPAGE="https://sortablejs.github.io/Sortable/"
SRC_URI="https://github.com/SortableJS/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/Sortable-${PV}

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	doins Sortable.js Sortable.min.js
	doins -r plugins
}
