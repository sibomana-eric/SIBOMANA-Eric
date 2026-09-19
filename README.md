# Career Connections 5.6: Getting What you want



**APIs exist to give you want you need.** Your job is to understand 1) How to ask and 2) Utilize the data that is returned. The purpose of this lab is to give you instruction and practice in doing both.
 

## Background Knowledge 

### The Structure of JSON Objects
The best place to start when learning about JavaScript Object Notation (JSON) is with the structure of the object.

Recall that Python Dictionaries are nearly identical to JSON Objects. Where we use the term JSON Object we could have used the term Python Dictionary. That will be important later.
JSON is an acronym that stands for JavaScript Object Notation. Like Python Dictionaries, a JSON Object starts with a left-facing curly brace ( { ) and ends with a right-facing curly brace ( } ). Inside of those border characters are found zero or more key:value pairs. Multiple key:value pairs are separated with commas. 

The key is the name of the data held in the object. 

For instance, _{'eyes' : 'blue'}_ is JSON object holding a key:value pair representing a person's eye color. In this case, the eyes are blue. 

This is a very simple JSON object. A more complex JSON object could have lists or dictionaries as values. Some  JSON objects even have lists of JSON objects as their vaues. Crazy!

For instance, the JSON object _class = { students:["Jim","Jane","Pat","Kim"] }_ is a JSON object whose 'students' key has a value that is a list.
To access the student named Pat, one would have to use the reference _class['students'][2]_. Do you see why? 

'class' is the name of the JSON object and 'students' is the key that references the list of students. 'Pat' is the third student in the list. It has an index of 2 because the count starts with zero.

The JSON object _city = { 'location': { longitude: 39.4521, latitude: -104.9331 } }_ is a JSON object whose 'location' key has a value that is a JSON object! To access the longitude, one would have to use the reference _city['location']['longitude']_. Do you see why?

### Retrieving Data From an API

You have seen import statements like import math or import random. You also understand that these instructions bring in code that others have written to make your life easier. In this lab we use a module called requests to help us retrieve data from the internet. 

The code _response = requests.get(url)_ is used to retrieve data from an **Application Programming Interface (API)** being served from the URL pointed to by the variable _url_. The returned data, in JSON format, will be stored in the variable response. This activity will provide you with a URL that will access an API and return the 39th chapter from the book of Alma. 

You will have to understand how the URL will have to be modified in order to build a URL that will retrieve any chapter of The Book of Mormon a user of the program wants.  

Because the retrieved data is a raw JSON format, and includes information you do not need, you will have to use your Python skills to extract and present only the information your user wants, in this case a summary. 

## Look at the Sample Code _demo.py_

The file _demo.py_ in CodeSPaces contains code that access the Book of Mormon API and retrieves the 39th chapter of Alma. It then reveals the structure of the returned JSON Object in eight small sections of code. These sections are designed to illustrate how the data is structured and, consequently, accessed through code.

It is important that you understand how each section of code works so that you will be able to write code that prints the summary of any chapter from the Book of Mormon. 
You will also have to examine the API's URL and understand how it instructs the API to return a particular book and chapter. 

After you understand how these things are done, you will be able to customize the given URL to retrieve and print out a summary for any chapter of the Book of Mormon. That is the goal of this activity: To allow the user to enter the name of any book and chapter found in the Book of Mormon and print out its summary.

## Task and Submission

Using the code stub _accessAPI.py_ and, using _demo.py_ as your guide, write Python code that asks the user what book and chapter they are interested in. Your code will then retrieve a summary of that book and chapter. reading the summary of. To do this, your code will have to create the proper URL for the API call using the base URL _https://openscriptureapi.org/api/scriptures/v1/lds/en/volume/bookofmormon/._   Refer to _demo.py_ for the mechanics. After completing the task, which includes running it and checking for errors, download the finished .py file and include it in your submission. It is easy to download files in CodeSpaces: simply right-click on the name of the file in the explorer pane (left side of the main window) and select download. This is the file you will upload to the assignment.








