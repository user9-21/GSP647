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


rm $HOME/./.bash_history.swp
rm $HOME/./.bash_history
