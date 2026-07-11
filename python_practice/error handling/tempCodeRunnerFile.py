try:
    import non_existent_module  # ModuleNotFoundError
except ModuleNotFoundError as e:
    print("Module not found:", e)