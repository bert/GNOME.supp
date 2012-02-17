This is a repository of [Valgrind suppression files](http://valgrind.org/docs/manual/manual-core.html#manual-core.suppress) intended to be used to detect memory leaks in GNOME software using Valgrind.

## Getting started

You will need Valgrind, GNU Make, and `sed`.

 1. Clone the git repository:

    <pre>
    git clone https://github.com/dtrebbien/GNOME.supp.git
    </pre>
    
    Alternatively, check out the latest code using Subversion:
    
    <pre>
    svn checkout https://github.com/dtrebbien/GNOME.supp/trunk/ GNOME.supp
    </pre>
 2. Open a terminal and `cd` into `GNOME.supp`.
 3. `make`

GNU Make will generate suppression (SUPP) files in the project root. To use them with Valgrind, pass a [`--suppressions=<filename>`](http://valgrind.org/docs/manual/manual-core.html#opt.suppressions) option for each suppression file that you would like to use. For example, to use the suppressions in `glib.supp`, you would pass `--suppressions=/path/to/GNOME.supp/glib.supp` to Valgrind.

See the [Valgrind page on GNOME Live!](http://live.gnome.org/Valgrind) for tips on using Valgrind to detect memory leaks in GNOME software.