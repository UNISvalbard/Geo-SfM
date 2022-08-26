# Downloading base station dGNSS data

For post processing of the acquired dGNSS data in the field we require additional data from a base station.
At UNIS we have access to the Longyearbyen base station data ("LYRS") through kartverket.

## Accessing LYRS base station data

This data can be downloaded through the following domain:

```yaml
etpos.kartverket.no
```

Credentials can either be privately acquired from kartverket, or are available to UNIS students and staff (ask Peter Betlem or Sara Mollie Cohen).
The webportal provides an ftp-like interface, in which files are sorted based on the following syntax:

```yaml
/rnx3/<duration>/<rate>/<year>/<doy>/<name>
```

der <duration> er filens varighet, <rate> er tidsoppløsningen på observasjonene i filen, <year> er årstall og <doy> er dagnummer i året (1-366).
In general, it is best to download the 24 hour interval, with 1 second data rate.
{numref}`etpos_kartverket` shows how to download all required data for a single day.
This will need to be done for all days on which location data was acquired in the field.

```{figure} assets/etpos_kartverket.gif
:name: etpos_kartverket

Downloading all required rnx3 data for day 90 of the year 2022.
```

### The Python way of downloading data

The script below provides an alternative way of downloading the data.
In the script, make sure to specify the usernanem, password, data_storage_path and dates.

````{admonition} Required packages
:class: warning

The script requires some additional packages.
These can be easily downloaded through the conda package manager:

```yaml
conda install paramiko -c conda-forge
```

````

```python3
import paramiko
import datetime as dt
from pathlib import Path
import math
import sys

hostname = "etpos.kartverket.no"
username = "" # fill this out
password = "" # fill this out

start_date = "" # fill this out in YYYYMMDD format, e.g. 19th April 2022 = 20220419
end_date = "" # fill this out in YYYYMMDD format, e.g. 19th April 2022 = 20220419
station_short = "LYRS" # 4-letter station name

data_storage_path = "data" # path to where to store the data.

def convert_start_end_dates_to_year_day_of(start_date,end_date):
    start_date = dt.datetime.strptime(start_date, "%Y%m%d")
    end_date = dt.datetime.strptime(end_date, "%Y%m%d")
    return start_date.year, start_date.timetuple().tm_yday, end_date.timetuple().tm_yday

def progressbar(x, y, filename):
    ''' progressbar for the paramiko
    '''
    bar_len = 60
    filled_len = math.ceil(bar_len * x / float(y))
    percents = math.ceil(100.0 * x / float(y))
    bar = '=' * filled_len + '-' * (bar_len - filled_len)
    filesize = f'{math.ceil(y/(1024*1024)):,} MB' if y > 1024 else f'{math.ceil(y/1024):,} KB'
    sys.stdout.write(f'[{bar}] {percents}% {filesize} - {filename}\r')
    sys.stdout.flush()

year, start_day, end_day =  convert_start_end_dates_to_year_day_of(start_date,end_date)

data_storage_path = Path(data_storage_path)
data_storage_path.mkdir(parents=True, exist_ok=True)

with paramiko.Transport((hostname,22)) as transport:
    # SFTP FIXES
    transport.default_window_size=paramiko.common.MAX_WINDOW_SIZE
    transport.packetizer.REKEY_BYTES = pow(2, 40)  # 1TB max, this is a security degradation!
    transport.packetizer.REKEY_PACKETS = pow(2, 40)  # 1TB max, this is a security degradation!
    # / SFTP FIXES
    transport.connect(None,username,password)
    with paramiko.SFTPClient.from_transport(transport) as sftp:

        print("Connection successfully established ... ")
        try:
            for day in range(start_day, end_day, 1):
                sftp.chdir(f'/rnx3/24hour/1sec/{year}/{str(day).zfill(3)}')

                directory_structure = sftp.listdir_attr()
                lyrs = [attr for attr in directory_structure if "LYRS" in attr.filename]

                for attr in lyrs:
                    sftp.get(attr.filename, Path(data_storage_path,attr.filename), callback=lambda x,y: progressbar(x,y, attr.filename))
                    print(f"Downloaded {attr.filename}")
        except Exception as e:
            print("Unable to download selected dates. Check dates or contact Kartverket...")
            print(f"Error: {e}")
            pass

```
