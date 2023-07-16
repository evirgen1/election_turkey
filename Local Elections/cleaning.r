rm(list=ls())

setwd("./")


library(readxl)
library(dplyr)
library(purrr)

# List Excel files
file.list <- list.files(pattern='*.xlsx')

# Function to read each Excel file into a data frame and add a column with the file name
read_excel_df <- function(file) {
  df <- read_excel(file)
  df$file_name <- file
  return(df)
}

# Map the function to the list of file names
df.list <- map(file.list, read_excel_df)

# Bind all data frames together
df <- bind_rows(df.list)


## put _ for column names for easy coding

colnames(df) = gsub(" ", "_", colnames(df))

# Create a new data frame with the party names as columns and the percentage of total valid votes

parties <- c("SAADET", "BTP", "TKP", "VATAN_PARTİSİ", "BBP", "CHP", "AK_PARTİ", 
             "DP", "MHP", "İYİ_PARTİ", "HDP", "DSP", "BAĞIMSIZ_TOPLAM_OY")

df <- df %>%
  mutate(across(parties, ~ round(. / Toplam_Geçerli_Oy * 100, 2), .names = "{.col}_pc"))

write.csv(df, "./")


### code for 2014

rm(list=ls())

setwd("C:/Users/yusuf/OneDrive/Desktop/Projects/[13]Pre-Electoral Coalition in Turkey/Data/Dependent Variable/All_Cities_2014")


library(readxl)
library(dplyr)
library(purrr)

# List Excel files
file.list <- list.files(pattern='*.xlsx')

# Function to read each Excel file into a data frame and add a column with the file name
read_excel_df <- function(file) {
  df <- read_excel(file)
  df$file_name <- file
  return(df)
}

# Map the function to the list of file names
df.list <- map(file.list, read_excel_df)

# Bind all data frames together
df <- bind_rows(df.list)


## put _ for column names for easy coding

colnames(df) = gsub(" ", "_", colnames(df))

# Create a new data frame with the party names as columns and the percentage of total valid votes

parties <- c("DSP", "TURK_PARTİ","BBP","AK_PARTİ","DP","MİLLET","SAADET","LDP","BTP",
             "İP","HDP","CHP","MHP","BAĞIMSIZ_TOPLAM_OY","HÜDA_PAR","DYP","BDP","EMEP",
             "HAK-PAR","YURT-P","HEPAR","TKP","ÖDP","HKP")

df <- df %>%
  mutate(across(parties, ~ round(. / Toplam_Geçerli_Oy * 100, 2), .names = "{.col}_pc"))

write.csv(df, "C:/Users/yusuf/OneDrive/Desktop/Projects/[13]Pre-Electoral Coalition in Turkey/Data/Dependent Variable/local_2014.csv")


