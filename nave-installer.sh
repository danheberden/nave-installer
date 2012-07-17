lib_nave="/usr/local/lib/nave.sh"
bin_nave="/usr/local/bin/nave"
git_nave="https://raw.github.com/isaacs/nave/master/nave.sh"

echo "Installing nave..."
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
 echo 'Downloading latest nave.sh from github.com';
 curl -# -o $lib_nave $git_nave;
 chmod +x $lib_nave;
else
 if [[ "\$USER" == "root" ]]; then
   sudo $lib_nave \$*;
 else
   $lib_nave \$*;
 fi;
fi;
BASH
  chmod +x "$bin_nave"
  nave update
  echo ""
  echo -ne "To update nave, just run \033[1;32mnave update\033[0m"
  echo ""
  echo "ALL DONE!"
fi
