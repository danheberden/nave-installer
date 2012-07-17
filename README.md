# Nave Installer

Installs [nave](http://github.com/isaacs/nave) easily and makes it globally accesible. Also adds `nave
update` to get the latest nave.sh from github.com

# To use

Enter this into your terminal:

```
sh -c "$(curl -s 'https://raw.github.com/danheberden/nave-installer/master/nave-installer.sh')"
```

if you don't have curl, you can try `wget`:

```
sh -c "$(wget -q -O - 'https://raw.github.com/danheberden/nave-installer/master/nave-installer.sh')"
```

That's it! You have have [nave](http://github.com/isaacs/nave) installed. To get node installed right away, run 

```
sudo nave usemain stable
```

## License
Copyright (c) 2012 Dan Heberden 
Licensed under the MIT license.

