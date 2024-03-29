setwd("C:\Users\Пк\Desktop\lesson_3")
df <- read.csv("3_superstore_data.csv")
cat("\nПервые строки:")
head(df)
library(dplyr)
cat("\nIncome больше 30 000:")
df <- filter(df, Income > 30000)
print(df)

cat("\nТолько следующие столбцы: Id, Year_Birth, Education, Marital_Status, Income, Response:")
df <- select(df, Id, Year_Birth, Education, Marital_Status, Income, Response)
print(df)

cat("\nСоздайте новые столбцы: Age (возраст на момент 2023 года) и Rich_flag (который принимает True, если Income больше 80 000):")
df <- mutate(df, Age = 2023 - Year_Birth, Rich_flag = Income > 80000)
print(df)

cat("\nВ отдельный датасет запишите средние значения по Income по каждому типу Education — используйте group_by и summarize.")
summary_data <- df %>%
  group_by(Education) %>%
  summarize(Average_Income = mean(Income))
print(summary_data)

cat("\nПрисоедините созданный датасет к основному по полю Education — используйте join.")
df <- df %>%
  left_join(summary_data, by = "Education")
print(df)


#1
library(tidyverse)
df <- df %>%
  unite(Education_Marital_Status, Education, Marital_Status, sep = "_")


#2
df$Rich_flag <- as.numeric(df$Rich_flag)


#3
for (col in names(df)) {
  df[is.nan(df[, col])] <- 0
}

#4
library(ggplot2)
ggplot(df, aes(x = factor(Response), y = Age)) +
  geom_boxplot() +
  labs(
    title = "Ящик с усами: Взаимосвязь между Response и Age",
    x = "Response",
    y = "Age"
  )


#5
library(stringr)
rows_with_9 <- str_which(df$Age, pattern = "9")
df[rows_with_9, ]