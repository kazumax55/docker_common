#!/bin/sh

versions=$@

cd /root
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' > ~/.rbenv/rbenv.sh
echo 'eval "$(rbenv init -)"' >> ~/.rbenv/rbenv.sh
source ~/.rbenv/rbenv.sh
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

for ver in $versions
do
  rbenv install "$ver"
  rbenv rehash
  rbenv global "$ver"
  gem install bundler --no-rdoc --no-ri
done
