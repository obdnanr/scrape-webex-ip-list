$url = "https://help.webex.com/en-us/WBX264/How-Do-I-Allow-Webex-Meetings-Traffic-on-My-Network"

$response = invoke-webrequest $url
#$response | gm

# search on HTML div tag | select "body refbody" pulled from Google Developer tools | Select uniqueNumber 7 and assign to $check
$check = $response.ParsedHtml.getElementsByTagName("div") | Where-Object { $_.classname -eq "body refbody"} | Where-Object { $_.uniqueNumber -eq 7 }

# $check.innerText #shows what was pullged from $check 
foreach($ip in $check.innerText){
    # Foreach line in the $check var, remove everything after "space(*" 
    #             "space(*" 
    # 62.109.192.0/18 (CIDR) or 62.109.192.0 - 62.109.255.255 (net range) # actual output
    $hold = $ip -replace '\s\(.*',''
    # Export to CSV and compare future check line by line for addition/removal
    $hold
    # Email ServiceNow API for ticket creation or make me automatically update an EDL
        # Can also count EDL lines and throw an email alert if it's getting too large
    # Email NOC during after hours +- DES 
    # Email DES if classname changes or output is not as expected
        # Can also compare the previous link's text with new link's text for more error checking 
        # If this response changes from last run, send an email and manually review link ASAP for changes:
            # $response.AllElements | where innerText -eq 'List of IP address ranges used by Cisco Webex Meeting Services'
}
