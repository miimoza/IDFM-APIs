for i in $(seq 0 75); do
	url=$(cat plans-de-secteur.json | jq -r .[$i].fields.url)
	filename=$(cat plans-de-secteur.json | jq -r .[$i].fields.nom_secteur)
	filename="$(echo $filename | tr ' ' '_' | tr "'" "_").pdf"
	departement=$(cat plans-de-secteur.json | jq -r .[$i].fields.departement | tr '/' '.')
	mkdir "$departement"	
	echo "$filename ($url) $departement"

	wget -O "$filename" "$url"
	mv "$filename" "$departement"
done
