import random
import time
import os
def rain():
    while True:
        os.system('cls' if os.name == 'nt' else 'clear')
        for i in range(20):
            line = ''.join(random.choice('0123456789') for _ in range(40))
            print(line)
        time.sleep(0.1)
rain()