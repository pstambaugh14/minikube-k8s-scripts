#!/bin/bash

#****************************************************************************
#PLEASE UNCOMMENT AND CONFIGURE THIS LINE: It is the deployment/pod YAML used:
#yaml=
#****************************************************************************

while true; do
if [ -n "${yaml+set}" ]; then
  echo "$yaml was set"
  break
else
  echo "Please configure the 'yaml' line!  Aborting." 1>&2
  exit 1
fi
done

echo "Grabbing the name of the namespace from the provided YAML file... "
nsvar=`cat $yaml | grep -i namespace: | awk '{ print $2 }'`
echo "$nsvar"
echo "Grabbing the type of deployment/pod...: "
appvar=`cat $yaml | grep -i kind: | awk '{ print $2 }'`
appvar=${appvar,,}
echo $appvar
echo "Grabbing the name of the deployment/pod...: "
namevar=`cat $yaml | grep -i name: | head -n 01 | awk '{ print $2 }'`
echo "namevar"
echo "Done. Moving onto the next steps...: "

deploy () {
  while true; do
    exists=`kubectl get $2 -n $1 | grep -i $3 | awk '{ print $1 }'`
    if [[ $exists == $3 ]]; then
      echo "$3 Already Exists, Deleting Previous $2 & Creating a New One..."
      kubectl delete $2 -n $1 $3 && kubectl create -f $4
      break
    else [[ $exists != $3 ]];
      echo "$3 does not Exist, Will Create $2..."
      kubectl create -f $2 $4
      break
   fi
 done
}

deploy $nsvar $appvar $namevar $yaml
