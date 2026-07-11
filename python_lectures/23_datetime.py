from datetime import datetime as dt
from zoneinfo import ZoneInfo

date = dt.now()

# print(date)
# print(date.day)
# print(date.month)
# print(date.year)
# print(date.time())
# print(date.timestamp())

print(date.strftime("%d/%m/%Y"))
print(date.strftime("%d %b %Y"))

date = dt.now(ZoneInfo("US/Alaska"))
date2 = ZoneInfo("Asia/Calcutta")
print(date)
print(date2)
