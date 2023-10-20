setwd("C:/Users/user/PycharmProjects/untitled")

df = read.csv("df.csv")

print("С помощью функции View отобразите весь датасет в виде плоской таблицы. ")
View(df)

# install.packages("pivottabler")
print("с помощью библиотеки pivottabler создайте сводную таблицу")
library(pivottabler)
pt <- PivotTable$new()
pt$addData(df)
pt$addColumnDataGroups("Marital_Status")
pt$addRowDataGroups("Education")
pt$defineCalculation(calculationName="Total count", summariseExpression="n()")
pt$evaluatePivot()
pt

# install.packages("ggplot2")
library(ggplot2)
print("Создайте столбчатую диаграмму по количеству наблюдений в датасете в разрезе столбца Education")
ggplot(df, aes(x = Education, fill = Income)) +
  geom_bar(position = "dodge") +
  labs(x = "Education", y = "Count", fill = "Income") +
  theme_minimal()

print("Создайте линейную диаграмму,")
df$Count <- 1
df_grouped <- aggregate(Count ~ Year_Birth, data = df, FUN = sum)
ggplot(df_grouped, aes(x = Year_Birth, y = Count)) +
  geom_line() +
  labs(x = "Year of Birth", y = "Count") +
  theme_minimal()
