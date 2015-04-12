JavaScript Remote Debugger Overlay
----------------------------------

Overlay for JSRDbg for Gentoo/Funtoo systems.

Source packages are available [here](https://github.com/swojtasiak/jsrdbg-archive).

## Layman

Make sure you have layman installed witch git support enabled.

You can install it like the following:

Enable the git USE flag for layman:

    $ echo "app-portage/layman git" >> /etc/portage/package.use

Install layman:

    $ emerge -va "app-portage/layman"

Add following line to the /etc/portage/make.conf if it's not already available there.

    echo "source /var/lib/layman/make.conf" >> /etc/portage/make.conf

Finally, we can make layman aware of our overlay:

    wget "https://raw.githubusercontent.com/swojtasiak/jsrdbg-portage/master/layman.xml" -O /etc/layman/overlays/jsrdbg.xml
    layman -f -a jsrdbg

##  Contents

This overlay consists of the following packages:

 * **dev-libs/jsrdbg** - JavaScript remote debugger library for SpiderMonkey engine.
 * **dev-libs/gjs** - Gnome3/GJS integrated with JSRDbg.
 * **gnome-base/gnome-shell** - Gnome3 Shell integrated with JSRDbg.

Remember that there are dependencies between these packages, therefore it is fairly impossible to install gnome-shell without for instance GJS library. Mostly because it is GJS that exposes higher level debugger abstraction for gnome-shell, so there is only transitive dependency between JSRDbg and gnome-shell. Similarly the GJS depends on JSRDbg directly in order to provide implementation of the abstraction.

Notice that all the ebuilds use original unmodified source packages and necessary modifications are made using patches provided witch the ebuilds.

Integration patches are quite simple and non-invasive, so it should be relative easy to apply them to newer versions of the applications.

They can be also found dirrectly on the GitHub:

* [gjs - 1.42.0](https://github.com/swojtasiak/gjs/commit/03b6d5e1198237bdd0b1aa0a77ef458819b3cc13) - Integration for GJS 1.42.0. This patch has been well tested and is currently used by the GJS overlay.
* [gjs - master](https://github.com/swojtasiak/gjs/commit/12a8ea776a808793cb48d36cc725bc7c37c8157d) - Current GJS version (master) patched using the same code. It should work, but I haven't tested it yet.
* [gnome-shell - 3.14.3](https://github.com/swojtasiak/gnome-shell/commit/ca4412d20a9975211bc4cc51609f2325cda8f132) - Integration for gnome-shell 3.14.3. This patch has been well tested and is currently used by the gnome-shell overlay.
* [gnome-shell - master](https://github.com/swojtasiak/gnome-shell/commit/154244e0c4c463d006214f404bc4026ef20fbe67) - Current gnome-shell version (master) patched using the same code. It should work, but I haven't tested it yet.

## Post-installation

Gnome-Shell integrated with JSRDbg uses environent variables in order to configure the debugger. The easiest way to set them globally is to provide dedicated profile script:

	sudo vim /etc/profile.d/gnome-shell-dbg.sh

Then fill it with the following content:

```sh
export GNOME_SHELL_DBG=1
export GNOME_SHELL_DBG_HOST=localhost
export GNOME_SHELL_DBG_PORT=8090
export GNOME_SHELL_DBG_SUSPEND=0
export GNOME_SHELL_DBG_CONTINUE=0
```

Just omit given variable to choose the default value for it. See brackets below.

* **GNOME_SHELL_DBG** (0) - Set to 1 in order to enable debugger at all.
* **GNOME_SHELL_DBG_HOST** (All interfaces) - Host or IP address you would like to listen at.
* **GNOME_SHELL_DBG_PORT** (8089) - Port you would like to listen at.
* **GNOME_SHELL_DBG_SUSPEND** (0) - Set to 1 if you would like to start gnome-shell suspended, having the possibility to debug it from the first piece of JavaScript code.
* **GNOME_SHELL_DBG_CONTINUE** (0) - Set to 1 if you would like to continue execution as soon as all remote clients have disconnected.

OK, that's pretty much everything. The last thing you have to do is to restart the system or close the gnome-shell, execute the profiler script prepared earlier in the context of your current shell and start gnome-shell again.

Do not hesitate to contact me in case of any problems with the library itself as well as with this short introduction.

Full documentation of the JSRDbg is available [here](https://github.com/swojtasiak/jsrdbg).

Have fun!


