# Created to parse info from web files to automate the process
#
# Grab address from html form and use it for the
# geocoder site which will then return a tract code
#
# Use the tract code with a csv (use map<>) code to get
# the boolean of being in a distressed area

# test address
txtaddress = "1001 N Orange Ave, Orlando, FL 32801"



import requests
from bs4 import BeautifulSoup
from flask import Flask, render_template, request


# Function to extract address components from a local HTML file

def splitAddress(address):
    parts = txtaddress.split('')

    # Separate and clean each part
    formatted_parts = [part.strip().replace(' ', '%20').replace(',', '$2C') for part in parts]

    # Join the formatted parts back together with commas
    address = ', '.join(formatted_parts)
    address = str(address)

    return address


# Function to geocode an address and retrieve the "tract" number
def get_tract_number(address):
    address = splitAddress(address)
    base_url = ("https://geocoding.geo.census.gov/geocoder/locations/"
                "address?street=" + address + "&benchmark=Public_AR_Census2020&format=json")
    parameters = {
        "street": address,
        "benchmark": "Public_AR_Current",
        "format": "json",
    }
    print("Address = " + address + "\n  ")
    response = requests.get(base_url, params=parameters)
    if response.status_code == 200:
        data = response.json()
        if data.get('result', {}).get('addressMatches'):
            tract = data['result']['addressMatches'][0].get('geographies', {}).get('Census Tracts', [{}])[0].get \
                ('TRACT', '')
            return tract
    return None


# Main script
# if __name__ == '__main__':
#
#    # tract = get_tract_number(address)
#
#     if tract:
#         print("Tract:", tract)
#     else:
#         print("Tract number not found for the address.")
# else:
#     print("Address components not found in the HTML file.")
