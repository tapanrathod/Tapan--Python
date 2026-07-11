# important : never name your files the same a package
# here the package is "datetime"

from datetime import datetime as dt  # renamed as "dt"
from zoneinfo import ZoneInfo

date = dt.now()

# print(date)
# print(date.day)
# print(date.month)
# print(date.year)
# print(date.time())
# print(date.timestamp())

print(date.strftime("%d/%m/%y"))
print(date.strftime("%d/%m/%Y"))
print(date.strftime("%d %b %Y"))

date = dt.now(ZoneInfo("US/Alaska"))
date2 = ZoneInfo("Asia/Calcutta")

print(date)
print(date2)


from datetime import datetime as dt
from zoneinfo import ZoneInfo

# Current local time

date = dt.now()

# --- DATETIME FORMAT CODES REFERENCE ---
# Used with .strftime() (string from time) or .strptime() (string parse time)

print("--- DATE FORMATS ---")
print(date.strftime("%d"))  # Day of month: 01-31
print(date.strftime("%m"))  # Month as number: 01-12
print(date.strftime("%y"))  # Year (short): 26
print(date.strftime("%Y"))  # Year (full): 2026
print(date.strftime("%b"))  # Month (abbrev): May
print(date.strftime("%B"))  # Month (full): May
print(date.strftime("%a"))  # Weekday (abbrev): Thu
print(date.strftime("%A"))  # Weekday (full): Thursday
print(date.strftime("%w"))  # Weekday (0=Sunday, 6=Saturday): 4
print(date.strftime("%j"))  # Day of year (001-366): 134

print("--- TIME FORMATS ---")
print(date.strftime("%H"))  # Hour (24-hour): 00-23
print(date.strftime("%I"))  # Hour (12-hour): 01-12
print(date.strftime("%p"))  # AM/PM
print(date.strftime("%M"))  # Minute: 00-59
print(date.strftime("%S"))  # Second: 00-59
print(date.strftime("%f"))  # Microseconds: 000000-999999

print("--- COMBINATIONS & LOCALE ---")
print(date.strftime("%c"))  # Local version of date and time
print(date.strftime("%x"))  # Local version of date
print(date.strftime("%X"))  # Local version of time
print(date.strftime("%%"))  # A literal % character

# --- TIMEZONE HANDLING ---
# Requires Python 3.9+ for zoneinfo

date_alaska = dt.now(ZoneInfo("US/Alaska"))

print(f"\nAlaska Time: {date_alaska}")
print(f"Timezone Name: {date_alaska.strftime('%Z')}")  # UTC offset name
print(f"UTC Offset: {date_alaska.strftime('%z')}")  # +HHMM or -HHMM


# Import the datetime module and display the current date:

import datetime

x = datetime.datetime.now()
print(x)


# Return the year and name of weekday:

import datetime

x = datetime.datetime.now()

print(x.year)
print(x.strftime("%A"))


# Create a date object:

import datetime

x = datetime.datetime(2020, 5, 17)

print(x)


# Display the name of the month:

import datetime

x = datetime.datetime(2018, 6, 1)

print(x.strftime("%B"))


# A reference of all the legal format codes:

import datetime

x = datetime.datetime.now()

print(x.strftime("%a"))  # Weekday, short version
print(x.strftime("%A"))  # Weekday, full version
print(x.strftime("%w"))  # Weekday as a number 0-6, 0 is Sunday
print(x.strftime("%d"))  # Day of month 01-31
print(x.strftime("%b"))  # Month, short version
print(x.strftime("%B"))  # Month, full version
print(x.strftime("%m"))  # Month as a number 01-12
print(x.strftime("%y"))  # Year, short version
print(x.strftime("%Y"))  # Year, full version
print(x.strftime("%H"))  # Hour 00-23
print(x.strftime("%I"))  # Hour 00-12
print(x.strftime("%p"))  # AM/PM
print(x.strftime("%M"))  # Minute 00-59
print(x.strftime("%S"))  # Second 00-59
print(x.strftime("%f"))  # Microsecond 000000-999999
print(x.strftime("%z"))  # UTC offset
print(x.strftime("%Z"))  # Timezone name
print(x.strftime("%j"))  # Day of year 001-366
print(x.strftime("%U"))  # Week number of the year, Sunday as the first day of the week
print(x.strftime("%W"))  # Week number of the year, Monday as the first day of the week
print(x.strftime("%c"))  # Local version of date and time
print(x.strftime("%C"))  # Century number (the year divided by 100, truncated to an integer)
print(x.strftime("%x"))  # Local version of date
print(x.strftime("%X"))  # Local version of time
print(x.strftime("%%"))  # A literal '%' character
print(x.strftime("%G"))  # ISO 8601 year with century representing the year that contains the greater part of the ISO week (%V)
print(x.strftime("%u"))  # ISO 8601 weekday as a number where Monday is 1 and Sunday is 7
print(x.strftime("%V"))  # ISO 8601 week number of the year (Monday as the first day of the week) as a decimal number, where 01 is the first week of the year


# Display Indian Standard Time (IST) in all formats:

import datetime
from zoneinfo import ZoneInfo

x = datetime.datetime.now(ZoneInfo("Asia/Calcutta"))

print(x.strftime("%a"))  # Weekday, short version
print(x.strftime("%A"))  # Weekday, full version
print(x.strftime("%w"))  # Weekday as a number 0-6, 0 is Sunday
print(x.strftime("%d"))  # Day of month 01-31
print(x.strftime("%b"))  # Month, short version
print(x.strftime("%B"))  # Month, full version
print(x.strftime("%m"))  # Month as a number 01-12
print(x.strftime("%y"))  # Year, short version
print(x.strftime("%Y"))  # Year, full version
print(x.strftime("%H"))  # Hour 00-23
print(x.strftime("%I"))  # Hour 00-12
print(x.strftime("%p"))  # AM/PM
print(x.strftime("%M"))  # Minute 00-59
print(x.strftime("%S"))  # Second 00-59
print(x.strftime("%f"))  # Microsecond 000000-999999
print(x.strftime("%z"))  # UTC offset
print(x.strftime("%Z"))  # Timezone name
print(x.strftime("%j"))  # Day of year 001-366
print(x.strftime("%U"))  # Week number of the year, Sunday as the first day of the week
print(x.strftime("%W"))  # Week number of the year, Monday as the first day of the week
print(x.strftime("%c"))  # Local version of date and time
print(
    x.strftime("%C")
)  # Century number (the year divided by 100, truncated to an integer)
print(x.strftime("%x"))  # Local version of date
print(x.strftime("%X"))  # Local version of time
print(x.strftime("%%"))  # A literal '%' character
print(
    x.strftime("%G")
)  # ISO 8601 year with century representing the year that contains the greater part of the ISO week (%V)
print(
    x.strftime("%u")
)  # ISO 8601 weekday as a number where Monday is 1 and Sunday is 7
print(
    x.strftime("%V")
)  # ISO 8601 week number of the year (Monday as the first day of the week) as a decimal number, where 01 is the first week of the year

# time stamp [seconds count from 1970] :
