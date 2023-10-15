import requests
from bs4 import BeautifulSoup

# Function to extract address from a local HTML file
def extract_address_from_html(html_file):
    with open(html_file, 'r') as file:
        html_content = file.read()
    soup = BeautifulSoup(html_content, 'html.parser')
    address_element = soup.find('p')
    if address_element:
        return address_element.text.strip()
    else:
        return None

# Function to geocode an address and retrieve the "tract" number
def get_tract_number(address):
    base_url = "https://geocoding.geo.census.gov/geocoder/locations/address"
    parameters = {
        "street": address,
        "benchmark": "Public_AR_Current",
        "format": "json",
    }

    response = requests.get(base_url, params=parameters)
    if response.status_code == 200:
        data = response.json()
        if data.get('result', {}).get('addressMatches'):
            tract = data['result']['addressMatches'][0].get('geographies', {}).get('Census Tracts', [{}])[0].get('TRACT', '')
            return tract
    return None

# Main script
if __name__ == '__main__':
    html_file = "C:\\Users\\cmk13\\Desktop\\HousingDatakind\\Web\\form.html"  # Replace with the path to your HTML file
    address = extract_address_from_html(html_file)

    if address:
        tract = get_tract_number(address)
        if tract:
            print("Address:", address)
            print("Tract:", tract)
        else:
            print("Tract number not found for the address.")
    else:
        print("Address not found in the HTML file.")
