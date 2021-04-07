arr=(student01-261019 student01-262421 student03-262421 student04-262421 student06-262421 student07-262421 student08-262421 student09-262421 student10-262421 student11-262421 student12-262421 student13-262421 student14 student15-262421 student17-262508 student18-262508 student19 student20 student21 student22 student23 student24 student25 student26 tough-victor-262421)

for item in ${arr[*]}
do
  echo $item
  gcloud config set project $item

  clusters=($(awk -v col=1 '{if (NR!=1) {print $col}}' <(gcloud container clusters list)))

  for cluster in ${clusters[*]}
  do
    echo $cluster
    gcloud container clusters delete $cluster --region=europe-west3
  done
done
