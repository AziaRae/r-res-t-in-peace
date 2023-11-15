# http://dx.doi.org/10.3390/bios12040194
# curl -LH "Accept: text/bibliography; style=bibtex"

fetch_command='curl -LH --verbose "Accept: text/bibliography; style=bibtex"'  
base_url="http://dx.doi.org/"

# read -p "Enter DOI: " doi
doi="10.3390/bios12040194"

url="${base_url}${doi}"

echo $url
echo "Fetching ${url}"

command="${fetch_command} ${url}"
echo $command

# $fetch_command $base_url$doi > "$(pwd)/doi.txt"
# $fetch_command $url > "$(pwd)/doi.txt"
$command > "$(pwd)/doi.txt"