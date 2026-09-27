import requests

print("Azərbaycan dilində asistan hazırdır! Çıxmaq üçün 'çıxış' yazın.")

while True:
    sual = input("\nSualınızı daxil edin: ")
    
    if sual.lower() == "çıxış":
        print("Görüşənədək!")
        break
        
    # Sualın əvvəlinə Azərbaycan dilində cavab verməsi üçün təlimat əlavə edirik
    tam_sual = f"Bütün cavabları səlis Azərbaycan dilində ver: {sual}"
    url = f"https://text.pollinations.ai/{tam_sual}"
    
    response = requests.get(url)
    print("Asistan:", response.text)
