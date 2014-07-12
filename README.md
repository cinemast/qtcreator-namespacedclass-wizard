qtcreator-namespacedclass-wizard
================================

A wizard for the Qt Creator that creates classes organized in namespaces.

![qtcreator logo](http://3.bp.blogspot.com/_YyvI2G2G1X8/TG4U2bhrDWI/AAAAAAAAAPA/I9uyGRiv6II/s1600/Nokia-QtCreator-128.png "Qt Creator logo")

http://upload.wikimedia.org/wikipedia/fr/3/32/Qt_Creator_Icon_Web.png

Install
----------
```sh
sudo apt-get install perl
git clone https://github.com/cinemast/qtcreator-namespacedclass-wizard.git
cd qtcreator-namespacedclass-wizard
./INSTALL.sh
```

Usage
----------

File -> New File or Project -> Namespaced Class -> Namespaced Class

Adaptation
------------
All code is generated using a perl script: [createnamespacedclass.pl](https://github.com/cinemast/qtcreator-namespacedclass-wizard/blob/master/createnamespacedclass.pl)
Just modify the generation process according to your coding guidelines and needs. 

Screenshots
------------

![Screenshot1](https://raw.githubusercontent.com/cinemast/qtcreator-namespacedclass-wizard/master/screens/screen1.png)

![Screenshot2](https://raw.githubusercontent.com/cinemast/qtcreator-namespacedclass-wizard/master/screens/screen2.png)
