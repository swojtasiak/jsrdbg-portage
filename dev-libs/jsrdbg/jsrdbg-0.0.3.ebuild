# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="JavaScript remote debugger for SpiderMonkey engine."
HOMEPAGE="https://github.com/swojtasiak/jsrdbg"
SRC_URI="http://github.com/swojtasiak/jsrdbg-archive/raw/master/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~mips ~sparc ~x86 amd64"
IUSE="debug"

RDEPEND=">=dev-lang/spidermonkey-24.0.0
    sys-libs/readline
"
DEPEND="virtual/pkgconfig"

src_configure() {
    econf $(use_enable debug)
}

src_install() {
    emake DESTDIR="${D}" install
    dodoc NEWS README
}
