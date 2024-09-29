import random
import string


name = ''.join(random.choices(string.ascii_letters+string.digits+string.punctuation, k=8))
print(name)