LIB_NAVE="/usr/local/lib/nave.sh"
BIN_NAVE="/usr/local/bin/nave"
GIT_NAVE="https://raw.github.com/isaacs/nave/master/nave.sh"

echo "##########################################################################"
echo "Installing nave..."
echo "See http://github.com/isaacs/nave for more information"
echo ""
if [ -f "$BIN_NAVE" ]; then
  echo "$BIN_NAVE already exists."
  echo "Stopping installation."
else
  echo "Installing nave like a boss"
  echo -e "#!/bin/bash\n
           USER=\`whoami\`;
           if [[ \"\$1\" == \"update\" ]]; then
             echo 'Downloading latest nave.sh from github.com';
             curl -o $LIB_NAVE $GIT_NAVE 2>&1;
             chmod +x $LIB_NAVE;
           else
             if [[ \"\$USER\" == \"root\" ]]; then
               sudo $LIB_NAVE \$*;
             else
               $LIB_NAVE \$*;
             fi;
           fi; " > "$BIN_NAVE";
  chmod +x "$BIN_NAVE"
  nave update
  echo ""
  echo "To update nave, just run \`nave update\`"
  echo ""
  echo "ALL DONE!"
fi
