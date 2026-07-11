a = "Hello, World!"
frequency = {}
for char in a:
    if char.isalpha():
        if char in frequency:
            frequency[char] += 1
        else:
            frequency[char] = 1
most_occurring_char = max(frequency, key=frequency.get)
print(
    f"The most occurring character is: '{most_occurring_char}' with {frequency[most_occurring_char]} occurrences."
)
