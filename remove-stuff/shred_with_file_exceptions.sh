#!/bin/bash

#this should be the directory in scope
ourDir=""

# 1 - 5, 1:mild 5:harsh
USEOFFORCE=3

sev=0

case $USEOFFORCE in
1)
sev=3 ;;
2)
sev=6 ;;
3)
sev=7 ;;
4)
sev=20 ;;
5)
sev=50 ;;
*)
sev=10 ;;
esac

#put the files to exlude here
exepshuns=(
""
"")
eSize=2

files=()
while IFS= read -r file; do #i dont fully understand this yet
 files+=("$(realpath "$file")")
done < <(find "$ourDir" -type f)
fSize=${#files[@]}

#removal
i=0

while [ $i -lt $fSize  ]
do
if [[ "${files[i]}" != "${exepshuns[0]}" && "${files[i]}" != "${exepshuns[1]}" ]]; then
pluh="${files[i]}"
echo "Shredding:$pluh"
shred -zun "$sev" "$pluh"
fi
((i++))
done

#TODO: remove empty directories if present
