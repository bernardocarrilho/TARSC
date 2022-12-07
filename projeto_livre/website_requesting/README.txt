$ ./run.sh N
Description: Downloads N website's index.html to the local machine running the script.
Dependencies:
  - clean.sh removes all downloaded websites
  - retreive_websites.sh downloads websites to local machine
    - import_websites.py returns a list of the top websites from Alexa1M

$ host_requests.sh N
Description: Requests N websites from local webserver

top-1m.csv
Description: CSV file containing the Alexa1M websites
