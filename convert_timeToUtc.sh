#!/bin/bash

############################################
# SYNOPSIS
# - Takes a given local timestamp and converts it to UTC.
#
###########
# NOTES
# - Name:  convert_timeToUtc.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - ref:  https://stackoverflow.com/questions/2043453/executing-multi-line-statements-in-the-one-line-command-line/29565580#29565580
#   - specific ref:  https://stackoverflow.com/a/29565580
#   - useful replacement for pytz - use .astimezone(tz=dt.timezone.utc) - https://docs.python.org/3/library/datetime.html#examples-of-usage-datetime
#
###########
# EXAMPLE
<< '#example'

convert_timeToUtc "2023-06-20 14:44:59.057841"

# output
2023-06-20 21:44:59.057841+00:00

#example


###########
# EXAMPLE
<< '#example'

datetimestamp='2023-06-20 14:44:59.057841'
convert_timeToUtc "$datetimestamp"

# output
2023-06-20 21:44:59.057841+00:00

#example
############################################


function convert_timeToUtc () {
    python3 -c "import sys
import datetime as dt
mystdin = sys.argv[1]
results = dt.datetime.strptime(mystdin, '%Y-%m-%d %H:%M:%S.%f').astimezone(tz=dt.timezone.utc)
print(results.__str__())
" "$1"
}

