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

ggplot(student_data, aes(x = writing.score, y = math.score)) +
  geom_point(aes(color = gender)) +
  labs(x = "Writing Score", y = "Math Score", color = "Gender") +
  ggtitle("Writing Score vs Math Score by Gender")
ggsave("C:\\Users\\sasik\\OneDrive\\Desktop\\project1pds\\results\\graph1.png")

ggplot(student_data, aes(x = parental.level.of.education, y = reading.score)) +
  geom_boxplot(aes(fill = parental.level.of.education)) +
  labs(x = "parental level of education", y = "Reading Score", fill = "parental.level.of.education") +
  ggtitle("Reading Score by parental level of education")
ggsave("C:\\Users\\sasik\\OneDrive\\Desktop\\project1pds\\results\\graph2.png")
ggplot(student_data, aes(x = race.ethnicity, fill = test.preparation.course)) +
  geom_bar(position = "dodge") +
  labs(x = " Race_Ethnicity", y = "Count", fill = "Test Preparation Course") +
  ggtitle("Test Preparation Course by  Race_Ethnicity")
ggsave("C:\\Users\\sasik\\OneDrive\\Desktop\\project1pds\\results\\graph3.png")
ggplot(student_data, aes(x = reading.score)) +
  geom_density(aes(color = gender)) +
  labs(x = "reading Score", y = "Density", color = "Gender") +
  ggtitle("Density of reading Scores by Gender")
ggsave("C:\\Users\\sasik\\OneDrive\\Desktop\\project1pds\\results\\graph4.png")
ggplot(student_data, aes(x = parental.level.of.education, fill = factor(lunch))) +
  geom_bar() +
  labs(x = "parental.level.of.education", y = "Count", fill = "Lunch") +
  ggtitle("Lunch by parental.level.of.education")
ggsave("C:\\Users\\sasik\\OneDrive\\Desktop\\project1pds\\results\\graph5.png")