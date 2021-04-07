#arr=(student01-261019 student01-262421 student13-262421 student04-262421 tough-victor-262421 student06-262421 student07-262421 student08-262421 student09-262421 student10-262421 student11-262421 student12-262421)
arr=(student13-262421)

for item in ${arr[*]}
do
  echo $item
  gcloud config set project $item

  PROJECT_ID=`gcloud config get-value project`
  M_TYPE=n1-standard-1
  REGION=europe-west3
  CLUSTER_NAME=${PROJECT_ID}-${RANDOM}
  
  gcloud services enable container.googleapis.com

  gcloud container clusters create $CLUSTER_NAME --cluster-version latest --machine-type=$M_TYPE --num-nodes 1 --region $REGION --project $PROJECT_ID
done
