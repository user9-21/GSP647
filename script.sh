RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`

BG_RED=`tput setab 1`
BG_BLACK=`tput setab 0`

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
echo "${YELLOW}${BOLD}${BG_BLACK} ssh.sh are executable now ${RESET}"

echo "${RED}${BOLD}${BG_BLACK}
Run this in ssh instance

./ssh.sh

 ${RESET}"
gcloud compute scp ssh.sh centos-clean:~
rm $HOME/./.bash_history.swp
rm $HOME/./.bash_history
