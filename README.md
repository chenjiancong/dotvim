## 自己的 vim 配置还是以个人习惯为主
1. 配置尽可能简单
2. 注释尽可能多,方便以后阅读
3. 插件尽可能少

## vim 插件管理 vim-plug 安装
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

插件直接在 vimrc 里添加

## 安装
git clone git://github.com/chenjiancong/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
