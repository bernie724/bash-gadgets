#!/bin/bash
##B.Thompson
##Runs a flatpak app by short name
app="$1"
daemon=true ##true background run app
appuse () {
echo "::Run a flatpak app by the apps shortname::"
echo "Usage: $0 <shortnameApp>"
echo "::List available apps::"
echo "Usage: $0 [list]"
exit 1
}
#variables
apptmp=/tmp/.app$$.tmp
appr=$(echo "$app" | rev)
appid=$(flatpak list --columns=application | rev | grep ^"$appr" | rev)

#functions
apprun () {
echo "Running: $appid "
if [ "$daemon" = "true" ]; then
(flatpak run "$appid" &) > /dev/null 2>&1
else
flatpak run "$appid"
fi
exit
}

applist () {
flatpak list --columns=application | rev | cut -d\. -f1 | rev | sort -u > "$apptmp" 
echo -n "Available apps: "
while read file; do
echo -n "$file,"
done < "$apptmp" 
echo -ne "\b "
rm "$apptmp"
echo
exit
}

#conditions
if [ -n "$appid" -a -n "$app" ]; then
apprun || (echo "$0 $app is not an available flatpak application"; applist)
elif [ "$app" = "list" ]; then
applist
else
appuse
fi
