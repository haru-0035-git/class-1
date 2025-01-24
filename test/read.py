# read
import time
from mfrc522 import SimpleMFRC522
import RPi.GPIO as GPIO
import json
 
reader = SimpleMFRC522()
 
def main():
    json_data = json.load(open('data.json'))
    print("Json data loaded.")
    while True:
        print("""
 
  _____  ______ _____ _____    _____               _           
|  __ \|  ____|_   _|  __ \  |  __ \             | |          
| |__) | |__    | | | |  | | | |__) |___  ___  __| | ___ _ __
|  _  /|  __|   | | | |  | | |  _  // _ \/ _ \/ _` |/ _ \ '__|
| | \ \| |     _| |_| |__| | | | \ \  __/  __/ (_| |  __/ |   
|_|  \_\_|    |_____|_____/  |_|  \_\___|\___|\__,_|\___|_|   
                                                               
                                                               
 
""")
        print("Reading...Please place the card...")
        card_id, text = reader.read()
        if str(card_id) in json_data:
            print("Card ID: ", card_id)
            print("Name: ", json_data[str(card_id)]['name'])
            print("Age: ", json_data[str(card_id)]['age'])
        else:
            print("This card is not registered.")
        time.sleep(3)
 
def destroy():
    GPIO.cleanup()
 
if __name__ == '__main__':
    try:
        print("Press 'Ctrl+C' to exit.")
        main()
    # When 'Ctrl+C' is pressed, the program destroy() will be  executed.
    except KeyboardInterrupt:
        destroy()
