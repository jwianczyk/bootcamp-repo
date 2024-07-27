#!/bin/bash

enumerator=$1
for num in $(seq 1 "$enumerator"); do
  if [ -d "Project$num" ]; then
    echo "Directory already exist"
  else
    mkdir "Project$num"
    touch "Project$num/Project$num-overview.MD"
    echo "Created Project$num/Project$num-overview.MD"
  fi
done
