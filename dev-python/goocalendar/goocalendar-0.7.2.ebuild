# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{4..9} )

inherit distutils-r1

MY_P="GooCalendar"
DESCRIPTION="A calendar widget for GTK using Goocanvas "
HOMEPAGE="https://pypi.org/project/GooCalendar/"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_P}/${MY_P}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="|| (
		>=x11-libs/gtk+-3
		>=dev-python/pygobject-3.20[${PYTHON_USEDEP}]
		>=x11-libs/goocanvas-2[introspection] )"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-0.3 )"

S=${WORKDIR}/${MY_P}-${PV}

src_compile() {
	distutils-r1_src_compile

	if use doc; then
		pushd doc > /dev/null
		emake html || die "Generation of HTML documentation failed"
		popd > /dev/null
	fi
}

src_install() {
	distutils-r1_src_install
	dodoc README CHANGELOG COPYRIGHT
	if use doc; then
		dohtml -r doc/_build/html/*
	fi
}
