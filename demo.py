import requests
import json

url = 'https://openscriptureapi.org/api/scriptures/v1/lds/en/volume/bookofmormon/alma/39'

response = requests.get(url)  # Use the url string to ask for the content
data = response.json()  #We want the data returned as json

print("*** Raw JSON Returned: ***\n")
print(data)  # This is the data we received

print("\n*** The keys in this Python Dictionary (JSON Object) Are: ***\n")
print(data.keys())  # See if you can spot these keys in the raw json returned

print("\n","*** Access the 'chapter' value: ***\n")
print(data['chapter'],"\n")  # This is how we extract the chapter from the raw json returned: we use the 'chapter' key

print("\n*** The 'chapter' value is itself a dictionary. Here are its keys: ***\n")
print(data['chapter'].keys(),"\n") 

print("\n*** Note the key with the biggest value is the 'verses' key: ***\n")
print(data['chapter']['verses'],"\n") 

print("\n*** Note 'verses' is a list of dictionaries. Here we access the first element of that list by using an index of 0 ([0]): ***\n")
print(data['chapter']['verses'][0])  # We have to use [0] here to access the first element of a list

print("\n*** Each verse is a dictionary. Here are its keys: ***\n")
print(data['chapter']['verses'][0].keys(),"\n") # Notice we have to get the chapter, then verses, then a single verse

print("\n*** We access the 'summary' value within the 'chapter' by using data['chapter']['summary'] : ***\n")
print(data['chapter']['summary'],"\n")  # Within the 'chapter' value we have additional keys
