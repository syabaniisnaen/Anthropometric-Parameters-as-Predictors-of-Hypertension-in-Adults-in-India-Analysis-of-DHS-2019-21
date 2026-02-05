setwd("~/Documents")

# Load package
library(haven)

# Impor file ke dalam variabel bernama 'my_data'
my_data <- read_sav("Gabungan Female dan Male  49.sav")

# Melihat 6 baris pertama data
head(my_data)

View(my_data)

# Melihat struktur data dan tipe variabel
str(my_data)

# ATAU jika ingin lebih rapi (menampilkan label SPSS)
library(labelled) # instal dulu jika belum: install.packages("labelled")
look_for(my_data)

# Simpan hasil pencarian variabel ke objek 'daftar_var'
daftar_var <- look_for(my_data)

# Tampilkan di tab baru (seperti Excel)
View(daftar_var)


# Mengambil variabel pada posisi 6, 63, 65, 66, 67, dan 70
look_for(my_data) %>%
  dplyr::filter(pos %in% c(6, 63, 65, 66, 67, 70))




library(pROC)
library(dplyr)

# Memisahkan data Laki-laki
data_male <- my_data %>% filter(HV104 == 1)

# Memisahkan data Perempuan
data_female <- my_data %>% filter(HV104 == 2)


#LAKI-LAKI
# Hitung objek ROC untuk tiap parameter (Male)
roc_imt_m  <- roc(data_male$KATEGORI_TEKANAN_DARAH, data_male$IMT)
roc_lp_m   <- roc(data_male$KATEGORI_TEKANAN_DARAH, data_male$LINGKAR_PINGGANG)
roc_rlpp_m <- roc(data_male$KATEGORI_TEKANAN_DARAH, data_male$RLPP)
roc_rlptb_m<- roc(data_male$KATEGORI_TEKANAN_DARAH, data_male$RLPTb)

# Plot Grafik Laki-Laki
plot(roc_imt_m, col="blue", lwd=2, main="Male")
plot(roc_lp_m, col="red", lwd=2, add=TRUE)
plot(roc_rlpp_m, col="green", lwd=2, add=TRUE)
plot(roc_rlptb_m, col="orange", lwd=2, add=TRUE)

# Tambahkan Legend
legend("bottomright", 
       legend=c(paste("BMI (AUC:", round(auc(roc_imt_m), 3), ")"),
                paste("WC (AUC:", round(auc(roc_lp_m), 3), ")"),
                paste("WHR (AUC:", round(auc(roc_rlpp_m), 3), ")"),
                paste("WHtR (AUC:", round(auc(roc_rlptb_m), 3), ")")),
       col=c("blue", "red", "green", "orange"), lwd=2, cex=0.8)

# 1. Buka device PNG (Tentukan nama file, ukuran, dan resolusi)
png(filename = "ROC_Antropometri_Male.png", width = 800, height = 800, res = 120)

# 2. Jalankan kode plot Anda
plot(roc_imt_m, col="blue", lwd=2, main="ROC Antropometri vs Hipertensi (Laki-laki)")
plot(roc_lp_m, col="red", lwd=2, add=TRUE)
plot(roc_rlpp_m, col="green", lwd=2, add=TRUE)
plot(roc_rlptb_m, col="orange", lwd=2, add=TRUE)

# Tambahkan Legend
legend("bottomright", 
       legend=c(paste("BMI (AUC:", round(auc(roc_imt_m), 3), ")"),
                paste("WC (AUC:", round(auc(roc_lp_m), 3), ")"),
                paste("WHR (AUC:", round(auc(roc_rlpp_m), 3), ")"),
                paste("WHtR (AUC:", round(auc(roc_rlptb_m), 3), ")")),
       col=c("blue", "red", "green", "orange"), lwd=2, cex=0.8)

# 3. WAJIB: Tutup device agar file tersimpan
dev.off()


#PEREMPUAN
# Hitung objek ROC untuk tiap parameter (Female)
roc_imt_f  <- roc(data_female$KATEGORI_TEKANAN_DARAH, data_female$IMT)
roc_lp_f   <- roc(data_female$KATEGORI_TEKANAN_DARAH, data_female$LINGKAR_PINGGANG)
roc_rlpp_f <- roc(data_female$KATEGORI_TEKANAN_DARAH, data_female$RLPP)
roc_rlptb_f<- roc(data_female$KATEGORI_TEKANAN_DARAH, data_female$RLPTb)

# Plot Grafik Perempuan
plot(roc_imt_f, col="blue", lwd=2, main="Female")
plot(roc_lp_f, col="red", lwd=2, add=TRUE)
plot(roc_rlpp_f, col="green", lwd=2, add=TRUE)
plot(roc_rlptb_f, col="orange", lwd=2, add=TRUE)

# Tambahkan Legend
legend("bottomright", 
       legend=c(paste("BMI (AUC:", round(auc(roc_imt_f), 3), ")"),
                paste("WC (AUC:", round(auc(roc_lp_f), 3), ")"),
                paste("WHR (AUC:", round(auc(roc_rlpp_f), 3), ")"),
                paste("WHtR (AUC:", round(auc(roc_rlptb_f), 3), ")")),
       col=c("blue", "red", "green", "orange"), lwd=2, cex=0.8)

# 1. Buka device PNG
png(filename = "ROC_Antropometri_Female.png", width = 800, height = 800, res = 120)

# 2. Jalankan kode plot
plot(roc_imt_f, col="blue", lwd=2, main="Female")
plot(roc_lp_f, col="red", lwd=2, add=TRUE)
plot(roc_rlpp_f, col="green", lwd=2, add=TRUE)
plot(roc_rlptb_f, col="orange", lwd=2, add=TRUE)

# Tambahkan Legend
legend("bottomright", 
       legend=c(paste("BMI (AUC:", round(auc(roc_imt_f), 3), ")"),
                paste("WC (AUC:", round(auc(roc_lp_f), 3), ")"),
                paste("WHR (AUC:", round(auc(roc_rlpp_f), 3), ")"),
                paste("WHtR (AUC:", round(auc(roc_rlptb_f), 3), ")")),
       col=c("blue", "red", "green", "orange"), lwd=2, cex=0.8)

# 3. Tutup device
dev.off()
