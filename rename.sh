#!/bin/bash

# Ensure exiftool is installed
if ! command -v exiftool &> /dev/null; then
    echo "exiftool is not installed. Please install it and try again."
    exit 1
fi

dir="$(pwd)/articles"
cd $dir

uploader_name='Vasquez'
quarter=2

for file in *.pdf; do

    # Extract metadata
    rm tmp.txt
    exiftool -d "%Y" -CreateDate -UTC -Title -Creator "$file" > tmp.txt

    # Read metadata
    author=$(grep "Creator                         :" tmp.txt | awk -F ': ' '{print $2}' | cut -d ',' -f 1 | awk '{print $NF}')
    title=$(grep "Title                           :" tmp.txt | awk -F ': ' '{print $2}' | awk '{for(i=1;i<=7;i++) printf $i (i==7 ? "" : " "); print ""}')
    publication_date=$(grep "Create Date                     :" tmp.txt | awk -F ': ' '{print $2}')


    # TODO Create an error-handler


    new_filename="${author}_${publication_date}_${title}_${uploader_name}_Q${quarter}.pdf"


    # rename the PDF file
    mv "$file" "$new_filename"
    echo "Renamed: $file to $new_filename"
done

echo "All PDF files processed and renamed."



# TODO 
    # isbn
    # determine publisher
    # chatgpt api
    # issn api (crossref)
        # overwrite existing metadata with issn metadata

# TODO 
    # 