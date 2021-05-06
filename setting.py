import os
from dotenv import load_dotenv
load_dotenv()
TIMEOUT = os.getenv("TIMEOUT", "300")

# Host
API_HOST = os.getenv('API_HOST','https://data.weather.gov.hk/weatherAPI/opendata/weather.php')