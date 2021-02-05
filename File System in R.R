#Temporarily disable warnings
defaultW <- getOption("warn") 
options(warn = -1) 
options(warn = defaultW)

# File management in R

#Getting the working directory in R
getwd() # Gets the current working directory

#Setting the working directory (Make)
#Make sure you enter the correct filepath according to the os you are using
#Notice that the separator between folders is forward slash (/), 
#as it is on Linux and Mac systems. 
#If you use the Windows operating system, the forward slash will look odd, 
#because you're familiar with the backslash () of Windows folders.
#When working in Windows, you need to either use the forward slash or escape your backslashes using a double backslash (\).

setwd("C:\\Users\\joshua.oluoch\\Documents\\Personal\\School\\Huru\\Assignment\\27th Jan 2021\\")

#or

setwd("C:/Users/joshua.oluoch/Documents/Personal/School/Huru/Assignment/27th Jan 2021/")

#List all files within a folder

list.files() # This list all files within the working directory
#You can also specify the path you want to list its contents eg
list.files("C:/Users/joshua.oluoch/Documents/Personal/School/Huru/Class/January/Lab4/")
#List all the folders within the directory
#Current directory
list.dirs() #List all the folders of the current directory
#Parent folder
list.dirs("../") #Lists all the folders of the parent folder

#To choose a file dynamically in R, use the command file.choose() as illustrated in the 

#To read a file from the current working directory
#R can read different file types eg csv, text (.txt), excel (.xlsx), spss data, stata data etc
#Direct file extensions (.csv, .txt, .xls, .xlsx, .ods, .dta, .sav, .R, .py etc)
#Reding CSV file
csv_data = read.csv("3 Yr Audience Trend.csv") #read in the csv using relative path
csv_data = read.csv("C:/Users/joshua.oluoch/Documents/Personal/School/Huru/Assignment/27th Jan 2021/3 Yr Audience Trend.csv") #read in the csv using the absolute path
head(csv_data)

#Reading Excel file
library(openxlsx)
xlsx_data = read.xlsx("3 Yr Audience Trend.xlsx")
head(xlsx_data)

#Reading spss, stata & SAS data using foreign package.
#1. SPSS
library(foreign)
spss_data = read.spss("sleep.sav", use.value.label=TRUE, to.data.frame=TRUE)
head(spss_data)

#2.Stata
stata_data = read.dta("http://www.stata-press.com/data/r12/census2.dta")
head(stata_data)

################################################################################
########## Writing Files to Disk################################################
#1. outout to csv
#Save to current directory
write.csv(csv_data, "csv_data_output.csv", row.names = FALSE) #write the dataframe to the current directory

#2. output to xlsx (use openxlsx package)
write.xlsx(xlsx_data, "xlsx_data_output.xlsx", row.names = FALSE)

#############################################################################
########## Data types in R ############################################
str(stata_data)
xlist <- list(a = "Karthik Ram", b = 1:10, data = head(mtcars))
str(xlist)
##############################################################################
#### Base R file manipulation functions ######################################

#1. To check if a file exists 
file.access("rscfp2019.dta") # 0 for success, 1 for failure

#2. append two files from R
file.append("3 Yr Audience Trend - Copy.csv","3 Yr Audience Trend.csv")

#3. Choose a file interactively
file.choose()

#4. Copy a file from one directory to another using file.copy() function
dir.create("tmp")
file.copy("sleep.sav", "tmp")
list.files("tmp")
unlink("tmp", recursive = TRUE)

#5. Creating and Removing a file
file.create(c("a.txt","b.txt"))
file.remove("a.txt", "b.txt")

#6. Renaming a file
file.create("a")
file.rename("a","a_1")
file.remove("a_1")
