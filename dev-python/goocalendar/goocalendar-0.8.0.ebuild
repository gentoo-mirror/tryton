# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{4..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

MY_P="GooCalendar"
DESCRIPTION="A calendar widget for GTK using Goocanvas "
HOMEPAGE="https://pypi.org/project/GooCalendar/"
SRC_URI="$(pypi_sdist_url --no-normalize ${MY_P})"
S=${WORKDIR}/${MY_P}-${PV}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="|| (
		>=x11-libs/gtk+-3
		>=dev-python/pygobject-3.20[${PYTHON_USEDEP}]
		x11-libs/goocanvas:2.0[introspection] )"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-0.3 )"

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
		dodoc -r doc/_build/html/*
	fi
}
