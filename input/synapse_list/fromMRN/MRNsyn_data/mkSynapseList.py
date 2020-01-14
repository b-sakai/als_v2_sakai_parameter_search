import os
import glob
import random
import numpy as np


with open("302_excluded.txt", "w") as f:
    for i in xrange(22219):
        f.write(str(i)+"\n")


