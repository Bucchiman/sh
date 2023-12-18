#!/usr/bin/zsh

export 8BIN=$HOME/bin/8ucchiman

function deploy4users () {
    #
    # @Description  gulliver code (gogu)
    # @params       
    # @Example      
    # @Reference    gulliver
    #
    
    mkdir -p $HOME/bin/8ucchiman4users
    rsync -rav --delete jp:/tmp/8ucchiman4users/bin/8ucchiman/ $HOME/bin/8ucchiman
    source $HOME/bin/8ucchiman/.zshrc
    echo 'export GBIN=$HOME/bin/gulliver; if [ -e $GBIN/dot.bashrc ]; then source $GBIN/dot.bashrc; fi' >> $HOME/.bashrc
}
