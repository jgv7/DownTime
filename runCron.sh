# Setup Environment 
echo "Setting Up Environment..."
source  ~/.bashrc
setupATLAS -q
lsetup root -q 
lsetup rucio -q
echo ""
echo ""

# Run Scripts
#export GRID_USER_NAME="Jared Vasquez" # Use to ignore other users
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
python checkStatus.py
