import speech_recognition as sr
import pyttsx3
import wikipedia
import pywhatkit
import webbrowser
import datetime

# ----------------------------
# Initialize Text-to-Speech
# ----------------------------

engine = pyttsx3.init()

voices = engine.getProperty('voices')

# Male Voice
engine.setProperty('voice', voices[0].id)

engine.setProperty('rate', 175)


def speak(text):
    print("Jarvis:", text)
    engine.say(text)
    engine.runAndWait()


# ----------------------------
# Listen from Microphone
# ----------------------------

def take_command():
    recognizer = sr.Recognizer()

    with sr.Microphone() as source:
        print("Listening...")
        recognizer.adjust_for_ambient_noise(source, duration=1)

        try:
            audio = recognizer.listen(source)

            command = recognizer.recognize_google(audio)
            command = command.lower()

            print("You:", command)

            return command

        except:
            return ""


# ----------------------------
# Main Assistant
# ----------------------------

def run_jarvis():

    speak("Hello Sir. I am Jarvis. How can I help you?")

    while True:

        command = take_command()

        if command == "":
            continue

        # --------------------
        # Wikipedia Search
        # --------------------
        elif "who is" in command or "what is" in command:

            try:
                result = wikipedia.summary(command, sentences=2)

                speak(result)

            except:
                speak("Sorry, I couldn't find anything.")

        # --------------------
        # Time
        # --------------------
        elif "time" in command:

            current = datetime.datetime.now().strftime("%I:%M %p")

            speak(f"The time is {current}")

        # --------------------
        # Date
        # --------------------
        elif "date" in command:

            today = datetime.datetime.now().strftime("%d %B %Y")

            speak(f"Today's date is {today}")

        # --------------------
        # Open Websites
        # --------------------
        elif "open youtube" in command:

            webbrowser.open("https://youtube.com")

            speak("Opening YouTube")

        elif "open google" in command:

            webbrowser.open("https://google.com")

            speak("Opening Google")

        elif "open github" in command:

            webbrowser.open("https://github.com")

            speak("Opening GitHub")

        # --------------------
        # Play Song on YouTube
        # --------------------
        elif "play" in command:

            song = command.replace("play", "")

            speak(f"Playing {song}")

            pywhatkit.playonyt(song)

        # --------------------
        # Search Google
        # --------------------
        elif "search" in command:

            search = command.replace("search", "")

            webbrowser.open(f"https://www.google.com/search?q={search}")

            speak(f"Searching {search}")

        # --------------------
        # Exit
        # --------------------
        elif "exit" in command or "stop" in command or "goodbye" in command:

            speak("Goodbye Sir. Have a nice day.")

            break

        else:

            speak("Sorry Sir, I don't understand that command.")


# ----------------------------
# Run Program
# ----------------------------

if __name__ == "__main__":
    run_jarvis()