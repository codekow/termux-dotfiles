## Install
```sh
dpkg install git

git clone https://github.com/codekow/termux-dotfiles ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```

```sh
pkg install termux-services

sv-enable ssh-agent
sv-enable sshd
```
