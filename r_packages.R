package_names <- as.character(available.packages()[,1])
lowerCamelCase <- grep('^[a-z]*[a-z,0-9,.]*[A-Z][a-z,0-9,.]*', package_names)
UpperCamelCase <- grep('^[A-Z][a-z,0-9,.]*[A-Z][a-z,0-9,.]*', package_names)
print(length(lowerCamelCase) / length(UpperCamelCase))

