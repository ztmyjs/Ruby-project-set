# CSE 3901 Project 3
## Group4-webscraping

Gets sourse data from CSE Class Schedule website: https://cse.osu.edu/courses
The project will output CSE course information such as description, prereqs, and units from course search list file.

### Gem:

There is one gems used in this project: Mechanize


To install Mechanize:

`~$ gem install Mechanize`

To create a file with a course list (XXX is name of Searching file):

`~$ gedit XXX`


Open the XXX file and type CSE Course numbers you want to search (i.e. CSE 2431)


Run the main file in ruby:

`~$ ruby main.rb`


Each course information in the course list such as description, prereqs, and units would be printed. Total units would be calculated. The output will also be saved to a text file.


### Method Directory:

WebScraper.rb 
 - getCourseNumbers: scrapes the tags containing the course numbers and parses them into an array of strings
 - getCourseTitles: scrapes the tags containing the course titles and parses them into an array of strings
 - getCourseInfo: scrapes the tags containing the description, prereqs, and units
 - getCourseDescriptions: parses the course description from each info element into a string array
 - getCoursePrereqs: parses prereqs from each info element into a string array
 - getCourseUnits: parses units from each info element into a string array
 - courseIndex: gets the index of a course from its course number
 - units:index is used to get the corresponding title, description, prereqs, and units from their respective arrays
 - printInfo: prints all the found information for a given course number



