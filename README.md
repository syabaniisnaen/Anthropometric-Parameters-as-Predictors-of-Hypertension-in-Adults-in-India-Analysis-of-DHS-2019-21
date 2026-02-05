# Anthropometric Parameters as Predictors of Hypertension in Adults in India: Analysis of DHS 2019-21

This repository contains R scripts for analyzing anthropometric parameters as predictors of hypertension using the India Demographic and Health Surveys (DHS) 2019-21 dataset. This project was part of the research titled: **"Anthropometric Parameters as Predictors of Hypertension in Adults in India"**.

## 📌 Project Overview
The goal of this study was to identify which obesity-related anthropometric measurements best predict hypertension and to establish optimal cut-off points for the Indian adult population (aged 20-49 years).

### Key Findings:
* **Male:** Waist Circumference (WC) is the best predictor (AUC = 0.632) with an optimal cut-off of 83.5 cm.
* **Female:** Body Mass Index (BMI) is the best predictor (AUC = 0.626) with an optimal cut-off of 22.9 kg/m².

## 🛠️ Technologies & Libraries
The analysis was performed using **R Programming Language**. Key libraries used include:
* `haven`: For importing SPSS (.sav) datasets.
* `dplyr`: For data manipulation and filtering.
* `pROC`: For Receiver Operating Characteristic (ROC) analysis and AUC calculation.
* `labelled`: For handling and viewing SPSS variable labels.

## 📂 Repository Structure
* **analysis_script.R**: The main R script containing data cleaning, sex-stratified filtering, and ROC curve generation.
* **ROC_Antropometri_Male.png**: Generated ROC curve for the male cohort.
* **ROC_Antropometri_Female.png**: Generated ROC curve for the female cohort.

## 📊 Results Visualization
The script generates ROC plots to compare the performance of four parameters:
* BMI (Body Mass Index)
* WC (Waist Circumference)
* WHR (Waist-to-Hip Ratio)
* WHtR (Waist-to-Height Ratio)

**Example of legend output:**
`BMI (AUC: 0.632) | WC (AUC: 0.628) | ...`

## 📄 License
This project is for academic and research purposes. Please cite the original article when using this code.

---
## Contact
**Sya'bani Isnaen Khikmaturrohman**
* **Email:** syaisnaenrohman@gmail.com
* **LinkedIn:** [linkedin.com/in/syabaniisnaen](https://linkedin.com/in/syabaniisnaen)
* **GitHub:** [github.com/syabaniisnaen](https://github.com/syabaniisnaen)
