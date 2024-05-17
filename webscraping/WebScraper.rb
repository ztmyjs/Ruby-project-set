require 'mechanize'

class WebScraper

  # regular expressions used to find intended text data
  @@numRegex = /CSE \d{4}\.?\d{0,2}H?/
  @@infoRegex = /\s*[A-Z]\w+:\s*/

  # scrapes the needed text data from the course website
  def initialize
    @@page = Mechanize.new.get('https://cse.osu.edu/courses')
    @@cNumbers = getCourseNumbers(@@page)
    @@cTitles = getCourseTitles(@@page)
    @@cInfo = getCourseInfo(@@page)
    @@cDescriptions = getCourseDescriptions(@@cInfo)
    @@cPrereqs = getCoursePrereqs(@@cInfo)
    @@cUnits = getCourseUnits(@@cInfo)
  end

  # scrapes the tags containing the course numbers and parses them into an array
  # of strings
  def getCourseNumbers(page)
    stringNumbers = Array.new
    numbers = page.search('div div h3 button span.accordion-title')
    numbers.each {|uN| stringNumbers.push(uN.text.strip)}
    return stringNumbers
  end

  # scrapes the tags containing the course titles and parses them into an array
  # of strings
  def getCourseTitles(page)
    stringTitles = Array.new
    titles = page.search('div div div h4 span.title')
    titles.each {|uT| stringTitles.push(uT.text.strip)}
    return stringTitles
  end

  # scrapes the tags containing the description, prereqs, and units
  def getCourseInfo(page)
    courseInfo = page.search('div div p.description')
  end

  # parses the course description from each info element into a string array
  def getCourseDescriptions(info)
    stringDescriptions = Array.new
    info.each {|uI|
      spInfo = uI.text.split(@@infoRegex)
      stringDescriptions.push(spInfo[1])
      
    }
    return stringDescriptions
  end

  # parses prereqs from each info element into a string array
  def getCoursePrereqs(info)
    stringPrereqs = Array.new
    info.each {|uI|
      spInfo = uI.text.split(@@infoRegex)
      stringPrereqs.push(spInfo[2])
    }
    return stringPrereqs
  end

  # parses units from each info element into a string array
  def getCourseUnits(info)
    stringUnits = Array.new
    info.each {|uI|
      spInfo = uI.text.split(@@infoRegex)
      stringUnits.push(spInfo[3])
    }
    return stringUnits
  end

  # gets the index of a course from its course number; index is used to get
  # the corresponding title, description, prereqs, and units from their
  # respective arrays
  def courseIndex(course)
    @@cNumbers.index(course)
  end

  def units(course)
    units = 0;
    if courseIndex(course) != nil then
      units = @@cUnits[courseIndex(course)].to_i
    end
    return units
  end

  # prints all the found information for a given course number
  def printInfo(course, outFile)
    i = courseIndex(course)
    if i != nil then
      puts "\n\n\t" + @@cTitles[i] + "\n"
      puts "Description: " + @@cDescriptions[i] + "\n"
      puts "Prereqs: " + @@cPrereqs[i] + "\n"
      puts "Units: " + @@cUnits[i] + "\n\n"

      outFile.write("\n\n\t" + @@cTitles[i] + "\n")
      outFile.write("Description: " + @@cDescriptions[i] + "\n")
      outFile.write("Prereqs: " + @@cPrereqs[i] + "\n")
      outFile.write("Units: " + @@cUnits[i] + "\n\n")
    else 
      puts "\n\nCourse not found: #{course}.\n\n"
      outFile.write("\n\nCourse not found: #{course}.\n\n")
    end
  end
end
