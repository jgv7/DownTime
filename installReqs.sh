# Install pandamonium 
install_pandamon() {
  git clone https://github.com/dguest/pandamonium.git
  newPATH="export PATH=\"$PWD/pandamonium:\$PATH\""
  echo "Adding following line to your .bashrc"
  echo $newPATH
  echo "" >> ~/.bashrc
  echo $newPATH >> ~/.bashrc
  echo ""
}

# Create downloads folder
#  --> needed to source xAODMerge
create_download() {
  mkdir pbslogs download
  cd download
  ln -s ../SafeMerge.sh .
  setupATLAS
  rcSetup Base,2.4.22
  rc find_packages
  rc compile
  cd ../          #return to initial dir
}

# Check which steps are still needed...
echo ""
if ! command -v pandamon &> /dev/null; then
  echo "\nRequires pandamonium, will now install..."
  install_pandamon
else
  echo "Already installed pandamon. Skipping this step"
fi

if [ ! -d download ]; then
  echo "Requires directory with analysis base for merging. Will create now..."
  create_download
else
  echo "Directory for downloads already created. Skipping this step"
fi
echo ""
