deploy () {
  read -p "If it is a '<DEPLOYMENT>' press '[1]' for a '<POD>' press '[2]'" $1
  while [[ "$1" -eq "1" ]]; do
  read -p "What is the name of the Deployment? " $2
  exists=`kubectl get pods -n $nsvar | grep -i $1 | awk '{ print $1 }'`
  file=`source "$PWD"/"$3"`
  if [[ $exists =~ '^'$2'*' ]]; then
    echo "Pod does not Exist, Will Create Pod..."
    kubectl create -f deployment $file -n $nsvar
  else
    echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
    kubectl delete deployment <DEPLOYMENT> -n <NAMESPACE>
    kubectl delete pod $exists -n $nsvar && kubectl create -f $file -n $nsvar
  fi
  done
}

deploy
