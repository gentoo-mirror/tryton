# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 versionator

DESCRIPTION="Calendar Module"
HOMEPAGE="http://www.tryton.org/"
SRC_URI="mirror://pypi/t/trytond_${PN}/trytond_${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=app-office/trytond-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	=app-tryton/webdav-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	>=dev-python/vobject-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/pywebdav-0.9.8[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/python-sql-0.4[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-lang/python[sqlite] )"

S=${WORKDIR}/trytond_${P}

DOCS="CHANGELOG COPYRIGHT README"

python_test() {
	DB_NAME=":memory:" esetup.py test || die
}
