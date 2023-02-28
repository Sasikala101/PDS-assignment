# Load the required library
library(dplyr)

# Read the dataset
student_data <- read.csv("C:\\Users\\sasik\\OneDrive\\Desktop\\project1pds\\data_raw\\StudentsPerformance.csv")
# Remove any missing values
student_data <- na.omit(student_data)

# Rename the columns to make them more readable
colnames(student_data) <- c("Gender", "Race_Ethnicity", "Parent_Education", "Lunch", "Test_Preparation", "Math_Score", "Reading_Score", "Writing_Score")

# Remove any white spaces from the columns
student_data$Gender <- trimws(student_data$Gender)
student_data$Race_Ethnicity <- trimws(student_data$Race_Ethnicity)
student_data$Parent_Education <- trimws(student_data$Parent_Education)
student_data$Lunch <- trimws(student_data$Lunch)
student_data$Test_Preparation <- trimws(student_data$Test_Preparation)

# Convert the Race/Ethnicity column to factor variable
student_data$Race_Ethnicity <- as.factor(student_data$Race_Ethnicity)

# Save the clean data to a CSV file
write.csv(student_data, "C:\\Users\\sasik\\OneDrive\\Desktop\\project1pds\\clean_data\\clean_data.csv", row.names = FALSE)

library(ggplot2)
student_data <- read.csv("C:\\Users\\sasik\\OneDrive\\Desktop\\project1pds\\data_raw\\StudentsPerformance.csv")
head(student_data)

ggplot(student_data, aes(x = math.score, y = reading.score)) +
  geom_point(aes(color = gender)) +
  labs(x = "Math Score", y = "Reading Score", color = "Gender") +
  ggtitle("Math Score vs Reading Score by Gender")

ggplot(student_data, aes(x = race.ethnicity, y = math.score)) +
  geom_boxplot(aes(fill = race.ethnicity)) +
  labs(x = "Race/Ethnicity", y = "Math Score", fill = "Race/Ethnicity") +
  ggtitle("Math Score by Race/Ethnicity")

ggplot(student_data, aes(x = parental.level.of.education, fill = test.preparation.course)) +
  geom_bar(position = "dodge") +
  labs(x = "Parental Level of Education", y = "Count", fill = "Test Preparation Course") +
  ggtitle("Test Preparation Course by Parental Level of Education")

ggplot(student_data, aes(x = writing.score)) +
  geom_density(aes(color = gender)) +
  labs(x = "Writing Score", y = "Density", color = "Gender") +
  ggtitle("Density of Writing Scores by Gender")

ggplot(student_data, aes(x = race.ethnicity, fill = factor(lunch))) +
  geom_bar() +
  labs(x = "Race/Ethnicity", y = "Count", fill = "Lunch") +
  ggtitle("Lunch by Race/Ethnicity")