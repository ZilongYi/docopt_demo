# author: Tiffany Timbers
# date: 2020-01-15

"""This script prints out docopt args.
Usage: demo.py <arg1> <arg_new>--arg2=<arg2> [--arg3=<arg3>] 

Options:
<arg1>            Takes any value (this is a required positional argument)
<arg_new>         Takes any value (this is a required positional argument)
--arg2=<arg2>     Takes any value (this is a required option)
[--arg3=<arg3>]   Takes any value (this is an optional option)
""" 

import os
import pandas as pd
from docopt import docopt

opt = docopt(__doc__)

def main(url, out_file):
    data = pd.read_csv(url, header=None)
    try:
        data.to_csv(out_file, index=False)
    except:
        os.makedirs(os.path.dirname(out_file))
        data.to_csv(out_file, index=False)


if __name__ == "__main__":
    main(opt["--url"], opt["--out_file"])

