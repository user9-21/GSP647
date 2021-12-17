BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`

BG_BLACK=`tput setab 0`
BG_RED=`tput setab 1`
BG_GREEN=`tput setab 2`
BG_YELLOW=`tput setab 3`
BG_BLUE=`tput setab 4`
BG_MAGENTA=`tput setab 5`
BG_CYAN=`tput setab 6`
BG_WHITE=`tput setab 7`

BOLD=`tput bold`
RESET=`tput sgr0`

gcloud auth list
gcloud config list project
gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-a
export PROJECT_ID=$GOOGLE_CLOUD_PROJECT
export REGION=$(gcloud config get-value compute/region)
export ZONE=$(gcloud config get-value compute/zone)
echo $PROJECT_ID
echo $REGION
echo $ZONE

chmod +x ssh.sh
echo "${YELLOW}${BOLD} ssh.sh are executable now ${RESET}"

echo "${WHITE}${BOLD}${BG_RED}
Run this in ssh instance

./ssh.sh

 ${RESET}"
gcloud compute scp ssh.sh centos-clean:~
gcloud compute instances list
gcloud compute ssh centos-clean --quiet
rm $HOME/./.bash_history.swp
# rm $HOME/./.bash_history
nano $HOME/./.bash_history
