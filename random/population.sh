
temp_file=$(mktemp)



curl -k -o $temp_file https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv
#print countries
# cut -d , -f 1 $temp_file | tail -n +2 | tr -d "\"" | sort  | uniq

# #prompt for country
# echo "Enter a country:"
# read country
country=$1
prev_pop=$((0))
for entry in $(grep -i $country $temp_file  | cut -d , -f 2,3)
do
    IFS=","
    read year pop <<< $entry
    if [ "$prev_pop" -eq 0 ]
    then
        prev_pop=$pop
    fi
    growth=$(($pop-$prev_pop))
    echo $year,$pop,$growth
    prev_pop=$pop
done
# head -n 1 $temp_file

# #print data for country
# grep -i "$country" $temp_file


rm $temp_file