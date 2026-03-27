echo all log
sudo cat /var/log/nginx/camera-proxy.access.log | awk '{print $1}' | sort | uniq -c | \
while read count ip; do
    [[ $ip =~ ^[0-9] ]] || continue
    sleep 0.25
    geo=$(curl -s "http://ip-api.com/json/$ip?fields=country,city")
    country=$(echo "$geo" | jq -r '.country // "Unknown"')
    city=$(echo "$geo" | jq -r '.city // "Unknown"')
    printf "%6d  %-15s  %-20s  %s\n" "$count" "$ip" "$city" "$country"
done

echo just audio
sudo cat /var/log/nginx/camera-proxy.access.log | grep -i audio | awk '{print $1}' | sort | uniq -c | \
while read count ip; do
    [[ $ip =~ ^[0-9] ]] || continue
    sleep 0.25
    geo=$(curl -s "http://ip-api.com/json/$ip?fields=country,city")
    country=$(echo "$geo" | jq -r '.country // "Unknown"')
    city=$(echo "$geo" | jq -r '.city // "Unknown"')
    printf "%6d  %-15s  %-20s  %s\n" "$count" "$ip" "$city" "$country"
done

