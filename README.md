qtcreator-namespacedclass-wizard
================================

A wizard for the Qt Creator that creates classes organized in namespaces.

Features
-----------
- Creates folder structure according to package name
- Creates .h and .cpp according to class name
- Wraps class inside full qualified package name

![alt logo](https://raw.githubusercontent.com/cinemast/qtcreator-namespacedclass-wizard/master/icon.png "Logo")

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
