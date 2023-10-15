import requests
from bs4 import BeautifulSoup

# Function to extract address components from a local HTML file
def extract_address_components_from_html(html_file):
    with open(html_file, 'r') as file:
        html_content = file.read()
    soup = BeautifulSoup(html_content, 'html.parser')
    street_address = soup.find('input', {'id': 'streetAddress'}).get('value', '')
    city = soup.find('input', {'id': 'city'}).get('value', '')
    state = soup.find('input', {'id': 'state'}).get('value', '')
    zip_code = soup.find('input', {'id': 'zipCode'}).get('value', '')
    return street_address, city, state, zip_code

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
    street_address, city, state, zip_code = extract_address_components_from_html(html_file)

    if street_address and city and state and zip_code:
        print("Street Address:", street_address)
        print("City:", city)
        print("State:", state)
        print("ZIP Code:", zip_code)

        # Combine the components to form the complete address
        complete_address = f"{street_address}, {city}, {state} {zip_code}"
        tract = get_tract_number(complete_address)

        if tract:
            print("Tract:", tract)
        else:
            print("Tract number not found for the address.")
    else:
        print("Address components not found in the HTML file.")
