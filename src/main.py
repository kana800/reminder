"""
send reminders to people about specific
messages through whatsapp

messaging format:
    summary: remind <name>
    description: 
        following up on socks; is the
        order still in progress
"""

import caldav as cal
from datetime import datetime, timedelta
from env import CALURL, CALPASSWORD, CALUSERNAME 
import json
import re 

def getCalDavData(data):
    """
    summary: decoding 'vCal representation of 
    the object as normal string' and return
    useful data.
    args: 
        data -> vCal represention in string format
    return:
        [<name>,<startdate>,<description>]
    """
    dataarr = list(map(lambda x: x.split(':'), re.split('\n', data)))
    summary=""
    description=""
    for command in dataarr:
        if command[0] == "SUMMARY":
            summary = command[1]
        elif command[0] == "DESCRIPTION":
            description = command[1] 
    return [summary, description]


if __name__ == "__main__":
    
    """
    grabbing all the events/reminders
    listed for today from the caldav
    server
    """
    startdate = datetime.today()
    enddate = datetime.today() + timedelta(1) 

    with cal.DAVClient(url=CALURL, username=CALUSERNAME, 
                       password=CALPASSWORD) as client:

        reminder_cal = client.calendar(url=CALURL)
        events_today = reminder_cal.search(
            start=startdate, 
            end=enddate,
            event=True, expand=True
        )
    reminder_dict = {}
    for events in events_today:
        [ t_name, summary ] = getCalDavData(events.data)
        name = t_name.split("remind")[-1].lstrip().rstrip()
        if name in reminder_dict:
            reminder_dict[name].append(summary)
        else:
            reminder_dict[name] = [summary]
    startdt = datetime.today().strftime("%d-%m-%Y")

    with open(f'remind_on_{startdt}.json', 'w') as f:
        json.dump(reminder_dict, f)