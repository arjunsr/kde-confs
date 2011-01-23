# .bash_profile
 
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
 
# User specific environment and startup programs
 
### Optional
PATH=$HOME/bin:$PATH
export PATH
 
# Set konsole colors
### This will let you set up a color scheme just for your KDE build environment;
### helpful to tell instantly what a konsole tab is for
# echo -ne "\033]50;ColorScheme=Linux KDE\a"
 
#BEGIN KDE build environment setup
    prepend() { [ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" ; } # unbreak vim's syntax HL --> "
 
    # KDE
    ### Change to taste
    export KDEDIR=/usr/local/kde-trunk-svn
    export KDEHOME=$HOME/.kde-trunk
    export KDETMP=/tmp/$USER-kde-trunk
    mkdir -p $KDETMP
    export KDEVARTMP=/var/tmp/$USER-kde-trunk
    export KDEDIRS=$KDEDIR
 
    ### Replace 'lib64' with 'lib' if that matches your system
    prepend PKG_CONFIG_PATH $KDEDIR/lib64/pkgconfig
    prepend LD_LIBRARY_PATH $KDEDIR/lib64
    prepend PATH $KDEDIR/bin
 
    # Qt
    ### Change to taste, or omit this section if using your distro's Qt
    export QTDIR=/usr/local/qt4-kde
 
    prepend QT_PLUGIN_PATH $KDEDIR/lib64/kde4/plugins
    prepend PKG_CONFIG_PATH $QTDIR/lib64/pkgconfig
    prepend LD_LIBRARY_PATH $QTDIR/lib64
    prepend PATH $QTDIR/bin
 
    # Java
    ### This works for Fedora 10; change to match your system
    export JAVA_HOME=/usr/lib/jvm/java
 
    # Export anything that may have been empty
    export LD_LIBRARY_PATH PKG_CONFIG_PATH QT_PLUGIN_PATH PATH
 
    # XDG
    unset XDG_DATA_DIRS
    unset XDG_CONFIG_DIRS
 
    # Build and source folders
    ### Change these to taste
    export KDE_BUILD=/var/local/build/kde/svn/trunk
    export KDE_SRC=/usr/local/src/kde/svn/trunk
 
    [ -d $KDE_SRC ] || mkdir -p $KDE_SRC
    [ -d $KDE_BUILD ] || mkdir -p $KDE_BUILD
 
    unset -f prepend
#END KDE build environment setup
 
. ~/.k4funcs