RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`

BG_RED=`tput setab 1`
BG_BLACK=`tput setab 0`

BOLD=`tput bold`
RESET=`tput sgr0`

echo "${YELLOW}${BOLD}${BG_BLACK}
                                                                                                                                                      
                                                                                                                                                       
# For You must log in to continue. and Do you want to continue (Y/n)?, press Enter.  
# Click on the link under the prompt Go to the following link in your browser:.
# The link will open a Sign in with Google web page. Click on the account provided for this lab (if you are unsure, please look to the top left on this page).

# Click Allow. 
# Click on the copy button, go back to the SSH session, and paste the code into the prompt Enter verification code:.
# On Pick cloud project to use:. locate your current project  in the list, then type the number for your project to select it from the list of options.
                                                                                                                                                            
                                                                                                                                                            
                                                    
  ${RESET}"

gcloud
curl https://sdk.cloud.google.com | bash
exec -l $SHELL

sleep 5
gcloud init
gcloud components list
gcloud components install beta --quiet
gcloud config set compute/zone us-central1-a
export ZONE=$(gcloud config get-value compute/zone)
gcloud compute instances create lab-1 --zone $ZONE
gcloud config list
cat ~/.config/gcloud/configurations/config_default
echo "${YELLOW}${BOLD}${BG_BLACK}
                                        
  ${RESET}"

echo "${YELLOW}${BOLD}${BG_BLACK}


# Select option 2, Create a new configuration.
# configuration name: Type user2.
# Log in with a new account: select option 2 - you're logging in with the other provided user name.
# Press Enter when you see the prompt Do you want to continue (Y/n)?
# Click on the link displayed.
# Click Use another account.
# Copy the second user account from this page (left side), and paste into the email or phone prompt.
# Copy the same password that you started the lab with, and paste into the enter your password prompt.
# Click Accept.
# Click Allow.
# Click on the copy button, go back to the SSH session, and paste the code into the prompt Enter verification code:.
# On Pick cloud project to use:. locate your current project  in the list, then type the number for your project to select it from the list of options.

                                        
${RESET}"
sleep 5
gcloud init
gcloud compute instances list
gcloud compute instances create lab-2
read -p "Enter Second Proect ID:" P2
echo "export PROJECTID2=$P2" >> ~/.bashrc
. ~/.bashrc
gcloud config set project $PROJECTID2
gcloud config configurations activate default
sudo yum -y install epel-release
sudo yum -y install jq
export LASTUSER=$(sed -E 's/MEMBERS: //gm;t;d' <<< $(gcloud projects get-iam-policy $PROJECT_ID --flatten="bindings[].members" --format='table(bindings.members)' --filter="bindings.members:user:student*" |& tail -1))
echo $LASTUSER 
echo "export USERID2=$LASTUSER" >> ~/.bashrc
. ~/.bashrc
gcloud projects add-iam-policy-binding $PROJECTID2 --member user:$USERID2 --role=roles/viewer
gcloud config configurations activate user2
gcloud config set project $PROJECTID2
gcloud compute instances list
gcloud compute instances create lab-2
gcloud config configurations activate default
gcloud iam roles create devops --project $PROJECTID2 --permissions "compute.instances.create,compute.instances.delete,compute.instances.start,compute.instances.stop,compute.instances.update,compute.disks.create,compute.subnetworks.use,compute.subnetworks.useExternalIp,compute.instances.setMetadata,compute.instances.setServiceAccount"
gcloud projects add-iam-policy-binding $PROJECTID2 --member user:$USERID2 --role=roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding $PROJECTID2 --member user:$USERID2 --role=projects/$PROJECTID2/roles/devops
gcloud config configurations activate user2
gcloud compute instances create lab-2
gcloud compute instances list
gcloud config configurations activate default
gcloud config set project $PROJECTID2
gcloud iam service-accounts create devops --display-name devops
gcloud iam service-accounts list  --filter "displayName=devops"
SA=$(gcloud iam service-accounts list --format="value(email)" --filter "displayName=devops")
read -p "Continue? " NA

sleep 10000
gcloud projects add-iam-policy-binding $PROJECTID2 --member serviceAccount:$SA --role=roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding $PROJECTID2 --member serviceAccount:$SA --role=roles/compute.instanceAdmin
gcloud compute instances create lab-3 --service-account $SA --scopes "https://www.googleapis.com/auth/compute"
gcloud compute ssh lab-3
gcloud config list
gcloud compute instances create lab-4
gcloud compute instances list
