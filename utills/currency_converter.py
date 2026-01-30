import os
import requests
from dotenv import load_dotenv

class CurrencyConverter:
    def __init__(self, api_key: str):
        # Allow checking env var directly if api_key passed is None or empty, 
        # though the tool wrapper might pass it. 
        # But we'll trust the checked-in tool wrapper passes the right env var value 
        # OR we check the specific FIXER key here if the wrapper sent the old variable.
        self.api_key = api_key
        # Fixer.io base endpoint
        self.base_url = f"http://data.fixer.io/api/latest?access_key={self.api_key}"
    
    def convert(self, amount:float, from_currency:str, to_currency:str):
        """
        Convert the amount from one currency to another using Fixer.io.
        Note: Fixer.io free plan usually restricts base to EUR.
        Formula: Target = (Amount / Rate_From_EUR) * Rate_To_EUR
        """
        response = requests.get(self.base_url)
        if response.status_code != 200:
            raise Exception(f"API call failed: {response.text}")
            
        data = response.json()
        if not data.get("success"):
            raise Exception(f"Fixer API Error: {data.get('error', {}).get('info')}")

        rates = data.get("rates", {})
        
        # Validate currencies
        if from_currency not in rates:
            raise ValueError(f"Currency {from_currency} not found in exchange rates.")
        if to_currency not in rates:
            raise ValueError(f"Currency {to_currency} not found in exchange rates.")

        # Calculate conversion
        # 1. Convert 'from' currency to EUR (Base)
        #    Amount_in_EUR = Amount / Rate_of_From_Currency
        amount_in_eur = amount / rates[from_currency]
        
        # 2. Convert EUR to 'to' currency
        #    Final_Amount = Amount_in_EUR * Rate_of_To_Currency
        converted_amount = amount_in_eur * rates[to_currency]
        
        return converted_amount