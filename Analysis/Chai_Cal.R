library(dplyr)
setwd('/Users/Ashley/Library/CloudStorage/OneDrive-Flinders/Math\ 9710A/Variance\ analysis/1st\ cali/')
df1c1 <- read.csv("attempt_1C1.csv")
df1c2 <- read.csv("attempt_1C2.csv")
df2c1 <- read.csv("attempt_2C1.csv")
df2c2 <- read.csv("attempt_2C2.csv")

# Convert 'Well' variable into a factor
df1c1$Well <- factor(df1c1$Well)
df2c1$Well <- factor(df2c1$Well)
df1c2$Well <- factor(df1c2$Well)
df2c2$Well <- factor(df2c2$Well)
# Check if there are any non-factor variables present
str(df1c1)
str(df1c2)
str(df2c1)
str(df2c2)

lables_df1c1 <- c("Baseline", "Water","FAM", "HEX")
means_df1c1 <- c(mean(df1c1$Baseline), mean(df1c1$Water), mean(df1c1$FAM), mean(df1c1$HEX))
vars_df1c1 <- c(var(df1c1$Baseline), var(df1c1$Water), var(df1c1$FAM), var(df1c1$HEX))
sds_df1c1 <- c(sd(df1c1$Baseline), sd(df1c1$Water), sd(df1c1$FAM), sd(df1c1$HEX))
cv_df1c1 <- (sds_df1c1/means_df1c1)
data_sum_df1c1  <-tibble(lables_df1c1, means_df1c1, vars_df1c1, sds_df1c1, cv_df1c1)

lables_df1c2 <- c("Baseline", "Water","FAM", "HEX")
means_df1c2 <- c(mean(df1c2$Baseline), mean(df1c2$Water), mean(df1c2$FAM), mean(df1c2$HEX))
vars_df1c2 <- c(var(df1c2$Baseline), var(df1c2$Water), var(df1c2$FAM), var(df1c2$HEX))
sds_df1c2 <- c(sd(df1c2$Baseline), sd(df1c2$Water), sd(df1c2$FAM), sd(df1c2$HEX))
cv_df1c2 <- (sds_df1c2/means_df1c2)
data_sum_df1c2 <-tibble(lables_df1c2, means_df1c2, vars_df1c2, sds_df1c2, cv_df1c2)

lables_df2c1 <- c("Baseline", "Water","FAM", "HEX")
means_df2c1 <- c(mean(df2c1$Baseline), mean(df2c1$Water), mean(df2c1$FAM), mean(df2c1$HEX))
vars_df2c1 <- c(var(df2c1$Baseline), var(df2c1$Water), var(df2c1$FAM), var(df2c1$HEX))
sds_df2c1 <- c(sd(df2c1$Baseline), sd(df2c1$Water), sd(df2c1$FAM), sd(df2c1$HEX))
cv_df2c1 <- (sds_df2c1/means_df2c1)
data_sum_df2c1 <-tibble(lables_df2c1, means_df2c1, vars_df2c1, sds_df2c1, cv_df2c1)

lables_df2c2 <- c("Baseline", "Water","FAM", "HEX")
means_df2c2 <- c(mean(df2c2$Baseline), mean(df2c2$Water), mean(df2c2$FAM), mean(df2c2$HEX))
vars_df2c2 <- c(var(df2c2$Baseline), var(df2c2$Water), var(df2c2$FAM), var(df2c2$HEX))
sds_df2c2 <- c(sd(df2c2$Baseline), sd(df2c2$Water), sd(df2c2$FAM), sd(df2c2$HEX))
cv_df2c2 <- (sds_df2c2/means_df2c2)
data_sum_df2c2 <-tibble(lables_df2c2, means_df2c2, vars_df2c2, sds_df2c2, cv_df2c2)


summary.data.frame(df1c1)
summary.data.frame(df1c2)
summary.data.frame(df2c1)
summary.data.frame(df2c2)

#Histogram for df1c1
his1 <- hist(df1c1$Baseline,
             xlab = 'F.I.',
             ylab = 'Frequency')
his2 <- hist(df1c1$Water,
             xlab = 'F.I.',
             ylab = 'Frequency')
his3 <- hist(df1c1$FAM,
             xlab = 'F.I.',
             ylab = 'Frequency')
his4 <- hist(df1c1$HEX,
             xlab = 'F.I.',
             ylab = 'Frequency')
#Histogram for df2c1
his1 <- hist(df2c1$Baseline,
             xlab = 'F.I.',
             ylab = 'Frequency')
his2 <- hist(df2c1$Water,
             xlab = 'F.I.',
             ylab = 'Frequency')
his3 <- hist(df2c1$FAM,
             xlab = 'F.I.',
             ylab = 'Frequency')
his4 <- hist(df2c1$HEX,
             xlab = 'F.I.',
             ylab = 'Frequency')


# Boxplot for df1c1
bp1 <- boxplot(df1c1[, 'Baseline'], 
        main = 'Distribution of the wells',
        xlab = 'Baseline',
        ylab = 'F.I.')
bp2 <- boxplot(df1c1[, 'Water'], 
               main = 'Distribution of the wells',
               xlab = 'Water',
               ylab = 'F.I.')
bp3 <- boxplot(df1c1[, 'FAM'], 
               main = 'Distribution of the wells',
               xlab = 'FAM',
               ylab = 'F.I.')
bp4 <- boxplot(df1c1[, 'HEX'], 
               main = 'Distribution of the wells',
               xlab = 'HEX',
               ylab = 'F.I.')
# Boxplot for df2c1
bp5 <- boxplot(df2c1[, 'Baseline'], 
               main = 'Distribution of the wells',
               xlab = 'Baseline',
               ylab = 'F.I.')
bp6 <- boxplot(df2c1[, 'Water'], 
               main = 'Distribution of the wells',
               xlab = 'Water',
               ylab = 'F.I.')
bp7 <- boxplot(df2c1[, 'FAM'], 
               main = 'Distribution of the wells',
               xlab = 'FAM',
               ylab = 'F.I.')
bp8 <- boxplot(df2c1[, 'HEX'], 
               main = 'Distribution of the wells',
               xlab = 'HEX',
               ylab = 'F.I.')
# Boxplot for df1c2
bp9 <- boxplot(df1c2[, 'Baseline'], 
               main = 'Distribution of the wells',
               xlab = 'Baseline',
               ylab = 'F.I.')
bp10 <- boxplot(df1c2[, 'Water'], 
               main = 'Distribution of the wells',
               xlab = 'Water',
               ylab = 'F.I.')
bp11 <- boxplot(df1c2[, 'FAM'], 
               main = 'Distribution of the wells',
               xlab = 'FAM',
               ylab = 'F.I.')
bp12 <- boxplot(df1c2[, 'HEX'], 
               main = 'Distribution of the wells',
               xlab = 'HEX',
               ylab = 'F.I.')
# Boxplot for df2c2
bp13 <- boxplot(df2c2[, 'Baseline'], 
               main = 'Distribution of the wells',
               xlab = 'Baseline',
               ylab = 'F.I.')
bp14 <- boxplot(df2c2[, 'Water'], 
               main = 'Distribution of the wells',
               xlab = 'Water',
               ylab = 'F.I.')
bp15 <- boxplot(df2c2[, 'FAM'], 
               main = 'Distribution of the wells',
               xlab = 'FAM',
               ylab = 'F.I.')
bp16 <- boxplot(df2c2[, 'HEX'], 
               main = 'Distribution of the wells',
               xlab = 'HEX',
               ylab = 'F.I.')

cv_sum <- tibble(lables_df1c1,
                 means_df1c1,sds_df1c1,cv_df1c1,
                 means_df2c1,sds_df2c1,cv_df2c1)
write.csv(cv_sum,'/Users/Ashley/Library/CloudStorage/OneDrive-Flinders/Math\ 9710A/Variance\ analysis/1st\ cali/CV_1.csv', row.names = FALSE)

cv_sum_c2 <- tibble(lables_df1c2,
                 means_df1c2,sds_df1c2,cv_df1c2,
                 means_df2c2,sds_df2c2,cv_df2c2)
write.csv(cv_sum_c2,'/Users/Ashley/Library/CloudStorage/OneDrive-Flinders/Math\ 9710A/Variance\ analysis/1st\ cali/CV_2.csv', row.names = FALSE)
