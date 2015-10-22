mkdir -p nanobox-bundle/opt/nanobox/share
VAGRANT_VERS="1.7.4"
VIRTUALBOX_VERS="5.0.8"

# Fetch installers
# nanobox
cp nanobox.deb nanobox-bundle/opt/nanobox/share/nanobox.deb

# virtualbox
if ! [ -a nanobox-bundle/opt/nanobox/share/virtualbox.deb ]; then
  wget -O nanobox-bundle/opt/nanobox/share/virtualbox.deb http://download.virtualbox.org/virtualbox/5.0.8/virtualbox-5.0_5.0.8-103449~Ubuntu~trusty_amd64.deb
fi
# vagrant
if ! [ -a nanobox-bundle/opt/nanobox/share/vagrant.deb ]; then
  wget -O nanobox-bundle/opt/nanobox/share/vagrant.deb https://dl.bintray.com/mitchellh/vagrant/vagrant_${VAGRANT_VERS}_x86_64.deb
fi

chmod 644 nanobox-bundle/opt/nanobox/share/virtualbox.deb
chmod 644 nanobox-bundle/opt/nanobox/share/vagrant.deb

find nanobox-bundle -type d | xargs chmod 755

# build package
fakeroot dpkg-deb --build nanobox-bundle
