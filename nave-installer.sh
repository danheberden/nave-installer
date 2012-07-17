lib_nave="/usr/local/lib/nave.sh"
bin_nave="/usr/local/bin/nave"
git_nave="https://raw.github.com/isaacs/nave/master/nave.sh"

echo
tput setaf 4
echo "                  ⬢  Nave Installer"
tput sgr0

echo "See http://github.com/isaacs/nave for more information"
echo
if [ -f "$bin_nave" ]; then
  echo "$bin_nave already exists."
  echo "Stopping installation."
else
  echo "Installing nave like a boss"
  cat > "$bin_nave" <<BASH
#!/bin/bash
user=$(whoami)
if [[ "\$1" == "update" ]]; then
 echo 'Downloading latest nave.sh from github.com'
 curl -#fSL -o "$lib_nave" $git_nave
 chmod +x $lib_nave
else
 if [[ "\$user" == "root" ]]; then
   sudo $lib_nave \$*
 else
   $lib_nave \$*
 fi;
fi;
BASH
  chmod +x $bin_nave
  nave update
  echo
  echo "To update nave, just run $(tput setaf 2)nave update$(tput sgr0)"
  echo
  echo "ALL DONE!"
fi
