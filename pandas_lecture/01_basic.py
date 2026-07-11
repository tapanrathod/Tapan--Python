import pandas as pd

d = {"name": ["abc", "xyz", "pqr"], "age": [10, 40, None]}

df = pd.DataFrame(d)
print(df)