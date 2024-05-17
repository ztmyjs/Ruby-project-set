require_relative 'WebScraper.rb'

# initialize instance of WebScraper; all page info can be accessed by instance
# methods
scraper = WebScraper.new

# requests the name of an input file containing a list of CSE course numbers
puts "Enter the name of a text file with a list of CSE course numbers (i.e. CSE 2431): "
fileName = gets

# open given file for reading
file = File.open(fileName.chomp, 'r')

# parse the lines into an array
lines = file.readlines

# open file to write output to
outFile = File.new(Time.now.strftime('%Y-%m-%d_%H:%M:%S-project3output.txt'), 'w')

# print out the info for each valid course number given
lines.each {|line|
  puts "\n#{line}"
  outFile.write("\n#{line}")
  scraper.printInfo(line.chomp, outFile)
}

units = 0

# sum up the total number of units for the list of courses given
lines.each {|line| units += scraper.units(line.chomp)}

#print total units
puts "\n\nTotal units: #{units}\n\n"
outFile.write("\n\nTotal units: #{units}\n\n")

file.close
outFile.close
