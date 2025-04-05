# Excel Data Visualiser

An interactive **R Shiny GUI application** that allows users to upload Excel sheets and view the data in various visual formats (bar charts, pie charts, histograms, line plots, etc.) without writing a single line of code.

---

## 📊 Features

- Upload `.xlsx` or `.xls` files
- Preview tabular data from Excel
- Select columns dynamically for X and Y axes
- Choose from multiple plot types:
  - Bar Chart
  - Line Chart
  - Pie Chart
  - Histogram
  - Boxplot
- Interactive plots using `plotly`
- Clean and responsive UI using Shiny

---

## 🚀 How to Run

### Requirements:
- R (version 4.0 or later)
- R packages:
  - `shiny`
  - `readxl`
  - `ggplot2`
  - `plotly`
  - `dplyr`

### Steps:
1. Clone the repo:

```bash
git clone https://github.com/prajwal-rk/Excel_Data_Visualiser.git
cd Excel_Data_Visualiser
