library(readxl)
online <- read_excel("online_retail_II.xlsx")
View(online)

dim(online)

names(online)

str(online)


summary(online)


colSums(is.na(online))


online$`Customer ID`[is.na(online$`Customer ID`)]<-mean(online$`Customer ID`,na.rm = TRUE)



sum(is.na(online$`Customer ID`))

colSums(is.na(online))


mode_Customer_ID<-names(sort(table(online$`Customer ID`),Decrease=TRUE))[1]

mode_Customer_ID


online$`Customer ID`[is.na(online$`Customer ID`)]<-mode_Customer_ID



sum(is.na(online$`Customer ID`))


sum(is.na(online$Description))



online$Description[is.na(online$Description)]<-"Unknown"

sum(is.na(online$Description))


sum(online$Description=="Unknown")

sum(is.na(online$Description))


sum(online$Description== "CHRYSANTHEMUM NOTEBOOK",na.rm=TRUE)

# find the stock from 3 to 5

online[3:5,"StockCode"]

# find the description of the product in the cell 25.

online[25,"Description"]

# Create a new column that combines InvoiceDate and Country and separate by a space.

online<-online %>% mutate(InvoiceDate_Column=paste(InvoiceDate,Country,sep = ","))

# alternative => trying with another column name online$Invoice_Date_Country_1

online$InvoiceDate_Country<-paste(online$InvoiceDate,online$Country,sep = ",")

# Filter rows where the Country is "United Kingdom" and Quantity > 0.

filter(online,Country=="United Kingdom" & Quantity >0)


# # Filter rows where the Country is "United Kingdom" and Quantity > 0 and show only these two column

filter(online,Country=="United Kingdom" & Quantity >0)

select(online,Country,Quantity)

#Create a column Revenue by multiplying Quantity and UnitPrice.

online$Revenue<-online$Quantity*online$Price

sum(is.na(online$Revenue))

# Group the data by Country and calculate total Revenue per country name it Total_Revenue

group_by(online,Country) %>% summarise(Total_Revenue=sum(Revenue,na.rm = TRUE))


# find the max revenue per country and name it Max_Revenue

group_by(online,Country) %>% summarise(Max_Revenue=max(Revenue,na.rm = TRUE))


# find the min revenue per country and name it Min_Revenue

group_by(online,Country) %>% summarise(Min_Revenue=min(online$Revenue,na.rm = TRUE))

online %>% filter(Revenue<0)


# find the average revenue per country name it Average_Revenue

group_by(online,Country) %>% summarise(Average_Revenue=mean(Revenue))


# Identify the top 5 products by total Quantity sold.

# Summarize total Quantity by StockCode (or Product Description if available)

group_by(online,StockCode) %>% summarise(Total_Quantity=sum(Quantity)) %>% 
arrange(desc(Total_Quantity)) %>% 
slice_head(n=5)

# #Create a new column to classify UnitPrice into categories like Low, Medium, and High using conditional statements.


online <- online %>% mutate(Unit_Price_Category=case_when(Price<10~"Low",Price>=10 & Price<50~"Medium",Price>=50~"High",TRUE~"Unknown"))

# now check how many Low,Medium and high price product are there in the dataset 
sum(online$Unit_Price_Category=="Low")
sum(online$Unit_Price_Category=="Medium")
sum(online$Unit_Price_Category=="High")

# Create a summary of total sales (Revenue) by month.

library(lubridate)

# Ensure InvoiceDate is in proper date format
online <- online %>%
  mutate(InvoiceDate = as.Date(InvoiceDate, format = "%Y-%m-%d"))

# Calculate Revenue (Quantity * UnitPrice)
online <- online %>%
  mutate(Revenue = Quantity * UnitPrice)

# Summarize Revenue by Month
monthly_revenue <- online %>%
  mutate(Month = floor_date(InvoiceDate, "month")) %>%
  group_by(Month) %>%
  summarise(Total_Revenue = sum(Revenue, na.rm = TRUE))

monthly_revenue

library(ggplot2)
library(dplyr)

# Calculate total Revenue by Month
monthly_revenue <- online %>%
  mutate(Month = format(as.Date(InvoiceDate), "%Y-%m")) %>%
  group_by(Month) %>%
  summarise(Total_Revenue = sum(Quantity * Price, na.rm = TRUE))

# Plot Total Revenue by Month
ggplot(data = monthly_revenue, aes(x = Month, y = Total_Revenue)) +
  geom_line(group = 1, color = "blue") +
  geom_point(color = "red") +
  labs(title = "Total Revenue by Month", x = "Month", y = "Total Revenue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#Create a bar chart to show the top 10 countries by total Revenue.

# Calculate total Revenue by Country
top_countries <- online %>%
  group_by(Country) %>%
  summarise(Total_Revenue = sum(Quantity * Price, na.rm = TRUE)) %>%
  arrange(desc(Total_Revenue)) %>%
  slice_head(n = 10)

# Plot Top 10 Countries by Total Revenue
ggplot(data = top_countries, aes(x = reorder(Country, -Total_Revenue), y = Total_Revenue)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Top 10 Countries by Total Revenue", x = "Country", y = "Total Revenue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



#Create a scatter plot of Quantity vs. UnitPrice.

# Scatter Plot of Quantity vs. UnitPrice
ggplot(data = online, aes(x = Quantity, y = Price)) +
  geom_point(alpha = 0.5, color = "darkgreen") +
  labs(title = "Scatter Plot: Quantity vs. UnitPrice", x = "Quantity", y = "UnitPrice") +
  theme_minimal()














