git clone --bare https://github.com/kcjulio/dotfiles.git $HOME/.cfg

function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

mkdir -p $HOME/.config-backup

err=$(config checkout 2>&1)

if [ -n "$err" ]
then
    echo "Backing up pre-existing dot files."

    echo -e $err | grep -Eo "\.\w+" | xargs -I{} mv $HOME/{} $HOME/.config-backup/{}

    config checkout
fi

echo "Checked out config."

config config status.showUntrackedFiles no

git clone https://github.com/dracula/gnome-terminal.git ../gnome-terminal
/bin/bash ../gnome-terminal/install.sh
