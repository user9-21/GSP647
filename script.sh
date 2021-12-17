gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-a
gcloud auth list
gcloud config list project
gcloud config get-value compute/zone
gcloud config get-value compute/region
export PROJECT_ID=$GOOGLE_CLOUD_PROJECT
export ZONE=$(gcloud config get-value compute/zone)
echo $PROJECT_ID
echo $ZONE
gcloud compute instances create gcelab2 --machine-type n1-standard-2 --zone $ZONE
sudo apt-get install google-cloud-sdk
rm $HOME/./.bash_history.swp
rm $HOME/./.bash_history
