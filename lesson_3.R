df <-
  read.csv("C:\Users\Пк\Desktop\superstore_data.csv")
head(df)
print(nrow(df))

df <- df %>%
  filter(Income > 30000)
print(nrow(df))

df <- df %>%
  select(Id, Year_Birth, Education, Marital_Status, Income, Response)
print(head(df))

df <- df %>%
  mutate(Rich_flag = Income > 80000)
sub_df <- df %>%
  group_by(Age) %>%
  summarise(
    Rich_flag.avg = round(mean(Rich_flag, na.rm = TRUE), 0)
  )
head(sub_df)

final_df <- left_join(df, sub_df, by = "Education")
print(head(final_df))