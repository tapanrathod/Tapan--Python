try : 
    f = open(f"./practice/file_handling/bio.txt", "r") # here "r" to read a file # file path is must if already created

    print(f.read().upper())
 
    f.close()

except FileNotFoundError as e :
    print("File not found")