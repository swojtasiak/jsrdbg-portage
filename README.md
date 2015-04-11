JavaScript Remote Debugger Overlay
----------------------------------

Overlay for JSRDBG for Gentoo/Funtoo systems.

Binary packages are available [here](https://github.com/swojtasiak/jsrdbg-archive).

## Layman

Make sure you have layman installed witch git support enabled.

You can install it like following:

Enable the git USE flag for layman:

    $ echo "app-portage/layman git" >> /etc/portage/package.use

Install layman:

    $ emerge -va "app-portage/layman"

Add following line to the /etc/portage/make.conf if it's not already available there.

    echo "source /var/lib/layman/make.conf" >> /etc/portage/make.conf

Finally, we can make layman aware of our overlay:

    wget "https://raw.githubusercontent.com/swojtasiak/jsrdbg-portage/master/layman.xml" -O /etc/layman/overlays/jsrdbg.xml
    layman -f -a jsrdbg
