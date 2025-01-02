# Online Retail Analysis Project

## Project Overview
This project analyzes and visualizes an online retail dataset using R programming. The analysis includes:
- Cleaning missing data.
- Categorizing unit prices into "Low," "Medium," and "High."
- Creating various visualizations, such as revenue trends, top-performing countries, and scatter plots of sales metrics.
- Deriving insights into customer behavior and product performance.

---

## Key Steps in the Project
1. **Data Cleaning**:
   - Identified and handled missing values in the `Customer ID` and `Description` columns.
   - Replaced missing `Customer ID` values with the column mean or mode.
   - Replaced missing `Description` values with "Unknown."
   
2. **Feature Engineering**:
   - Created a `Revenue` column by multiplying `Quantity` and `Unit Price`.
   - Added a `Unit_Price_Category` column to classify products into "Low," "Medium," and "High" price categories.
   - Combined `InvoiceDate` and `Country` into a new column for detailed analysis.

3. **Analysis and Insights**:
   - Summarized revenue by month and visualized trends.
   - Identified top-performing countries based on total revenue.
   - Highlighted top products based on sales quantity.

4. **Visualizations**:
   - Line plots for monthly revenue trends.
   - Bar charts for top 10 countries by revenue.
   - Scatter plots for `Quantity` vs. `Unit Price`.

---

## Tools Used
- **R Libraries**:
  - `readxl`: For importing Excel files.
  - `dplyr`: For data manipulation and summarization.
  - `ggplot2`: For data visualization.
  - `lubridate`: For handling date-time operations.

---

## How to Run the Script
1. **Prerequisites**:
   - Install R and RStudio.
   - Install required R packages using the following commands:
     ```R
     install.packages(c("readxl", "dplyr", "ggplot2", "lubridate"))
     ```

2. **Dataset**:
   - Download the dataset (`online_retail_II.xlsx`) from [Kaggle](https://www.kaggle.com/), or use your own dataset with a similar structure.

3. **Running the Script**:
   - Open the `Online_Retail_Analysis.R` file in RStudio.
   - Modify the file path for the dataset if needed:
     ```R
     online <- read_excel("path_to_your_dataset/online_retail_II.xlsx")
     ```
   - Run the script line by line to observe the outputs and visualizations.

4. **Outputs**:
   - Visualizations will be displayed in the RStudio `Plots` pane.
   - Summarized metrics and tables will appear in the RStudio console.

---

## Dataset
- **Dataset Name**: Online Retail II
- **Description**: This dataset contains transactional data from an online retail store.
- **Source**: [Kaggle - Online Retail II Dataset](https://www.kaggle.com/).

---

## Key Visualizations
### 1. Monthly Revenue Trends
[![Monthly Revenue Trends](path/to/image/monthly_revenue.png)](https://github.com/Sujoy-Saha-1986/Online_Retail_Analysis.R/blob/main/Images/Total_Revenue_ByMonth.png)

### 2. Top 10 Countries by Revenue
https://github.com/Sujoy-Saha-1986/Online_Retail_Analysis.R/blob/main/Images/Top%2010%20Countries%20by%20Revenue.png

### 3. Scatter Plot: Quantity vs. Unit Price
https://github.com/Sujoy-Saha-1986/Online_Retail_Analysis.R/blob/main/Images/Scatter%20Plot%3AQuantity%20Vs.Unit%20Price.png

---

## Contributions
If you have suggestions or feedback, feel free to create an issue or pull request in this repository.

---

## License
This project is for educational purposes. Feel free to use the code and analysis with proper attribution.
