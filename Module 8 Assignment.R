
library(plyr)

peeps <- read.table("Assignment 6 Dataset.txt", header = TRUE, sep = ",")

head(peeps)
str(peeps)

# Step 1
# Run a mean using Sex as the category
avgGrade <- ddply(peeps, "Sex", transform, Mean = mean(Grade))

sex = peeps$Sex
mean(sex) # Returns NA
# Warning message:
# In mean.default(sex) : argument is not numeric or logical: returning NA

write.table(avgGrade, "Avg Grade by Sex", sep = ",", row.names = FALSE)


# Step 2
# Create a dataframe for names containing the letter 'i' and create a csv file.
# A
iPeeps <- subset(peeps, grepl("i", peeps$Name, ignore.case = T))
iPeeps

# B
# Writing the new dataframe to a file
write.table(iPeeps, "Names with letter I", sep = ",")

# Step 3
# Read the same as step 2. Therefore, creating a new dataset based on step 1
# A
SexAvgGrade <- ddply(avgGrade, "Sex", summarize, 
                     Count = length(Sex),
                     Mean = mean(round(Mean, 2)))
SexAvgGrade

# B
write.table(SexAvgGrade, "MFAvgGrade.csv", sep = ",", row.names = FALSE)
