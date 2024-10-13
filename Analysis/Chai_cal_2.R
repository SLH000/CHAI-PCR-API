library(dplyr)
setwd('/Users/Ashley/Library/CloudStorage/OneDrive-Flinders/Math\ 9710A/Variance\ analysis/2nd\ cali')
#Import data Channel 1
df1c1 <- read.csv("attempt_1C1.csv")
df2c1 <- read.csv("attempt_2C1.csv")
df3c1 <- read.csv("attempt_3C1.csv")
df4c1 <- read.csv("attempt_4C1.csv")
df5c1 <- read.csv("attempt_5C1.csv")
# Data for Channel 2
df1c2 <- read.csv("attempt_1C2.csv")
df2c2 <- read.csv("attempt_2C2.csv")
df3c2 <- read.csv("attempt_3C2.csv")
df4c2 <- read.csv("attempt_4C2.csv")
df5c2 <- read.csv("attempt_5C2.csv")
# Convert 'Well' variable into a factor
df1c1$Well <- factor(df1c1$Well)
df2c1$Well <- factor(df2c1$Well)
df3c1$Well <- factor(df3c1$Well)
df4c1$Well <- factor(df4c1$Well)
df5c1$Well <- factor(df5c1$Well)
# Check if there are any non-factor variables present
str(df1c1)
str(df2c1)
str(df3c1)
str(df4c1)
str(df5c1)

summary.data.frame(df1c1)
summary.data.frame(df2c1)
summary.data.frame(df3c1)
summary.data.frame(df4c1)
summary.data.frame(df5c1)

labels <- c("Baseline", "Water","FAM", "HEX")

# Calculate mean, var, sd and cv for channel 1
means_df1c1 <- c(mean(df1c1$Baseline), mean(df1c1$Water), mean(df1c1$FAM), mean(df1c1$HEX))
vars_df1c1 <- c(var(df1c1$Baseline), var(df1c1$Water), var(df1c1$FAM), var(df1c1$HEX))
sds_df1c1 <- c(sd(df1c1$Baseline), sd(df1c1$Water), sd(df1c1$FAM), sd(df1c1$HEX))
cv_df1c1 <- (sds_df1c1/means_df1c1)
data_sum_df1c1  <-tibble(labels, means_df1c1, vars_df1c1, sds_df1c1, cv_df1c1)

means_df2c1 <- c(mean(df2c1$Baseline), mean(df2c1$Water), mean(df2c1$FAM), mean(df2c1$HEX))
vars_df2c1 <- c(var(df2c1$Baseline), var(df2c1$Water), var(df2c1$FAM), var(df2c1$HEX))
sds_df2c1 <- c(sd(df2c1$Baseline), sd(df2c1$Water), sd(df2c1$FAM), sd(df2c1$HEX))
cv_df2c1 <- (sds_df2c1/means_df2c1)
data_sum_df2c1<-tibble(labels, means_df2c1, vars_df2c1, sds_df2c1, cv_df2c1)

means_df3c1 <- c(mean(df3c1$Baseline), mean(df3c1$Water), mean(df3c1$FAM), mean(df3c1$HEX))
vars_df3c1 <- c(var(df3c1$Baseline), var(df3c1$Water), var(df3c1$FAM), var(df3c1$HEX))
sds_df3c1 <- c(sd(df3c1$Baseline), sd(df3c1$Water), sd(df3c1$FAM), sd(df3c1$HEX))
cv_df3c1 <- (sds_df3c1/means_df3c1)
data_sum_df3c1  <-tibble(labels, means_df3c1, vars_df3c1, sds_df3c1, cv_df3c1)

means_df4c1 <- c(mean(df4c1$Baseline), mean(df4c1$Water), mean(df4c1$FAM), mean(df4c1$HEX))
vars_df4c1 <- c(var(df4c1$Baseline), var(df4c1$Water), var(df4c1$FAM), var(df4c1$HEX))
sds_df4c1 <- c(sd(df4c1$Baseline), sd(df4c1$Water), sd(df4c1$FAM), sd(df4c1$HEX))
cv_df4c1 <- (sds_df4c1/means_df4c1)
data_sum_df4c1  <-tibble(labels, means_df4c1, vars_df4c1, sds_df4c1, cv_df4c1)

means_df5c1 <- c(mean(df5c1$Baseline), mean(df5c1$Water), mean(df5c1$FAM), mean(df5c1$HEX))
vars_df5c1 <- c(var(df5c1$Baseline), var(df5c1$Water), var(df5c1$FAM), var(df5c1$HEX))
sds_df5c1 <- c(sd(df5c1$Baseline), sd(df5c1$Water), sd(df5c1$FAM), sd(df5c1$HEX))
cv_df5c1 <- (sds_df5c1/means_df5c1)
data_sum_df5c1  <-tibble(labels, means_df5c1, vars_df5c1, sds_df5c1, cv_df5c1)

# Calculate mean, var, sd and cv for channel 2
means_df1c2 <- c(mean(df1c2$Baseline), mean(df1c2$Water), mean(df1c2$FAM), mean(df1c2$HEX))
vars_df1c2 <- c(var(df1c2$Baseline), var(df1c2$Water), var(df1c2$FAM), var(df1c2$HEX))
sds_df1c2 <- c(sd(df1c2$Baseline), sd(df1c2$Water), sd(df1c2$FAM), sd(df1c2$HEX))
cv_df1c2 <- (sds_df1c2/means_df1c2)
data_sum_df1c2  <-tibble(labels, means_df1c2, vars_df1c2, sds_df1c2, cv_df1c2)

means_df2c2 <- c(mean(df2c2$Baseline), mean(df2c2$Water), mean(df2c2$FAM), mean(df2c2$HEX))
vars_df2c2 <- c(var(df2c2$Baseline), var(df2c2$Water), var(df2c2$FAM), var(df2c2$HEX))
sds_df2c2 <- c(sd(df2c2$Baseline), sd(df2c2$Water), sd(df2c2$FAM), sd(df2c2$HEX))
cv_df2c2 <- (sds_df2c2/means_df2c2)
data_sum_df2c2<-tibble(labels, means_df2c2, vars_df2c2, sds_df2c2, cv_df2c2)

means_df3c2 <- c(mean(df3c2$Baseline), mean(df3c2$Water), mean(df3c2$FAM), mean(df3c2$HEX))
vars_df3c2 <- c(var(df3c2$Baseline), var(df3c2$Water), var(df3c2$FAM), var(df3c2$HEX))
sds_df3c2 <- c(sd(df3c2$Baseline), sd(df3c2$Water), sd(df3c2$FAM), sd(df3c2$HEX))
cv_df3c2 <- (sds_df3c2/means_df3c2)
data_sum_df3c2  <-tibble(labels, means_df3c2, vars_df3c2, sds_df3c2, cv_df3c2)

means_df4c2 <- c(mean(df4c2$Baseline), mean(df4c2$Water), mean(df4c2$FAM), mean(df4c2$HEX))
vars_df4c2 <- c(var(df4c2$Baseline), var(df4c2$Water), var(df4c2$FAM), var(df4c2$HEX))
sds_df4c2 <- c(sd(df4c2$Baseline), sd(df4c2$Water), sd(df4c2$FAM), sd(df4c2$HEX))
cv_df4c2 <- (sds_df4c2/means_df4c2)
data_sum_df4c2  <-tibble(labels, means_df4c2, vars_df4c2, sds_df4c2, cv_df4c2)

means_df5c2 <- c(mean(df5c2$Baseline), mean(df5c2$Water), mean(df5c2$FAM), mean(df5c2$HEX))
vars_df5c2 <- c(var(df5c2$Baseline), var(df5c2$Water), var(df5c2$FAM), var(df5c2$HEX))
sds_df5c2 <- c(sd(df5c2$Baseline), sd(df5c2$Water), sd(df5c2$FAM), sd(df5c2$HEX))
cv_df5c2 <- (sds_df5c2/means_df5c2)
data_sum_df5c2  <-tibble(labels, means_df5c2, vars_df5c2, sds_df5c2, cv_df5c2)

# Box plot for channel 1 (average of 5 trials)
channel_1<- read.csv("channel_1.csv")
bpb <- boxplot(channel_1[, 'Baseline'], 
               main = 'Distribution of the wells',
               xlab = 'Baseline',
               ylab = 'F.I.')

bpw <- boxplot(channel_1[, 'Water'], 
               main = 'Distribution of the wells',
               xlab = 'Water',
               ylab = 'F.I.')

bpf <- boxplot(channel_1[, 'FAM'], 
               main = 'Distribution of the wells',
               xlab = 'FAM',
               ylab = 'F.I.')

bph <- boxplot(channel_1[, 'HEX'], 
               main = 'Distribution of the wells',
               xlab = 'HEX',
               ylab = 'F.I.')

# boxplot for channel 2 (average of 5 trials)
channel_2<- read.csv("channel_2.csv")

bpb2 <- boxplot(channel_2[, 'Baseline'], 
               main = 'Distribution of the wells',
               xlab = 'Baseline',
               ylab = 'F.I.')

bpw2 <- boxplot(channel_2[, 'Water'], 
               main = 'Distribution of the wells',
               xlab = 'Water',
               ylab = 'F.I.')

bpf2 <- boxplot(channel_2[, 'FAM'], 
               main = 'Distribution of the wells',
               xlab = 'FAM',
               ylab = 'F.I.')

bph2 <- boxplot(channel_2[, 'HEX'], 
               main = 'Distribution of the wells',
               xlab = 'HEX',
               ylab = 'F.I.')

anova_result <- aov(Baseline ~ Well, data = channel_1)
print(summary(anova_result))
TukeyHSD(anova_result)

anova_result_w <- aov(Water~ Well, data = channel_1)
print(summary(anova_result_w))

anova_result_f <- aov(FAM ~ Well, data = channel_1)
print(summary(anova_result_f))

anova_result_h <- aov(HEX ~ Well, data = channel_1)
print(summary(anova_result_h))

anova_result2_b <- aov(Baseline ~ Well, data = channel_2)
print(summary(anova_result2_b))

anova_result2_w <- aov(Water~ Well, data = channel_2)
print(summary(anova_result2_w))

anova_result2_f <- aov(FAM ~ Well, data = channel_2)
print(summary(anova_result2_f))

anova_result2_h <- aov(HEX ~ Well, data = channel_2)
print(summary(anova_result2_h))

# Eliminate well 4 (max) and 5 (min) for all dataset 
df1c1_d <-df1c1[-c(4,5), ]
means_df1c1_d <- c(mean(df1c1_d$Baseline), mean(df1c1_d$Water), mean(df1c1_d$FAM), mean(df1c1_d$HEX))
vars_df1c1_d <- c(var(df1c1_d$Baseline), var(df1c1_d$Water), var(df1c1_d$FAM), var(df1c1_d$HEX))
sds_df1c1_d <- c(sd(df1c1_d$Baseline), sd(df1c1_d$Water), sd(df1c1_d$FAM), sd(df1c1_d$HEX))
cv_df1c1_d <- (sds_df1c1_d/means_df1c1_d)
data_sum_df1c1_d  <-tibble(labels, means_df1c1_d, vars_df1c1_d, sds_df1c1_d, cv_df1c1_d)

df2c1_d <-df2c1[-c(4,5), ]
means_df2c1_d <- c(mean(df2c1_d$Baseline), mean(df2c1_d$Water), mean(df2c1_d$FAM), mean(df2c1_d$HEX))
vars_df2c1_d <- c(var(df2c1_d$Baseline), var(df2c1_d$Water), var(df2c1_d$FAM), var(df2c1_d$HEX))
sds_df2c1_d <- c(sd(df2c1_d$Baseline), sd(df2c1_d$Water), sd(df2c1_d$FAM), sd(df2c1_d$HEX))
cv_df2c1_d <- (sds_df2c1_d/means_df2c1_d)
data_sum_df2c1_d  <-tibble(labels, means_df2c1_d, vars_df2c1_d, sds_df2c1_d, cv_df2c1_d)

df3c1_d <-df3c1[-c(4,5), ]
means_df3c1_d <- c(mean(df3c1_d$Baseline), mean(df3c1_d$Water), mean(df3c1_d$FAM), mean(df3c1_d$HEX))
vars_df3c1_d <- c(var(df3c1_d$Baseline), var(df3c1_d$Water), var(df3c1_d$FAM), var(df3c1_d$HEX))
sds_df3c1_d <- c(sd(df3c1_d$Baseline), sd(df3c1_d$Water), sd(df3c1_d$FAM), sd(df3c1_d$HEX))
cv_df3c1_d <- (sds_df3c1_d/means_df3c1_d)
data_sum_df3c1_d  <-tibble(labels, means_df3c1_d, vars_df3c1_d, sds_df3c1_d, cv_df3c1_d)

df4c1_d <-df4c1[-c(4,5), ]
means_df4c1_d <- c(mean(df4c1_d$Baseline), mean(df4c1_d$Water), mean(df4c1_d$FAM), mean(df4c1_d$HEX))
vars_df4c1_d <- c(var(df4c1_d$Baseline), var(df4c1_d$Water), var(df4c1_d$FAM), var(df4c1_d$HEX))
sds_df4c1_d <- c(sd(df4c1_d$Baseline), sd(df4c1_d$Water), sd(df4c1_d$FAM), sd(df4c1_d$HEX))
cv_df4c1_d <- (sds_df4c1_d/means_df4c1_d)
data_sum_df4c1_d  <-tibble(labels, means_df4c1_d, vars_df4c1_d, sds_df4c1_d, cv_df4c1_d)

df5c1_d <-df5c1[-c(4,5), ]
means_df5c1_d <- c(mean(df5c1_d$Baseline), mean(df5c1_d$Water), mean(df5c1_d$FAM), mean(df5c1_d$HEX))
vars_df5c1_d <- c(var(df5c1_d$Baseline), var(df5c1_d$Water), var(df5c1_d$FAM), var(df5c1_d$HEX))
sds_df5c1_d <- c(sd(df5c1_d$Baseline), sd(df5c1_d$Water), sd(df5c1_d$FAM), sd(df5c1_d$HEX))
cv_df5c1_d <- (sds_df5c1_d/means_df5c1_d)
data_sum_df5c1_d  <-tibble(labels, means_df5c1_d, vars_df5c1_d, sds_df5c1_d, cv_df5c1_d)

df1c2_d <-df1c2[-c(4,5), ]
means_df1c2_d <- c(mean(df1c2_d$Baseline), mean(df1c2_d$Water), mean(df1c2_d$FAM), mean(df1c2_d$HEX))
vars_df1c2_d <- c(var(df1c2_d$Baseline), var(df1c2_d$Water), var(df1c2_d$FAM), var(df1c2_d$HEX))
sds_df1c2_d <- c(sd(df1c2_d$Baseline), sd(df1c2_d$Water), sd(df1c2_d$FAM), sd(df1c2_d$HEX))
cv_df1c2_d <- (sds_df1c2_d/means_df1c2_d)
data_sum_df1c2_d  <-tibble(labels, means_df1c2_d, vars_df1c2_d, sds_df1c2_d, cv_df1c2_d)

df2c2_d <-df2c2[-c(4,5), ]
means_df2c2_d <- c(mean(df2c2_d$Baseline), mean(df2c2_d$Water), mean(df2c2_d$FAM), mean(df2c2_d$HEX))
vars_df2c2_d <- c(var(df2c2_d$Baseline), var(df2c2_d$Water), var(df2c2_d$FAM), var(df2c2_d$HEX))
sds_df2c2_d <- c(sd(df2c2_d$Baseline), sd(df2c2_d$Water), sd(df2c2_d$FAM), sd(df2c2_d$HEX))
cv_df2c2_d <- (sds_df2c2_d/means_df2c2_d)
data_sum_df2c2_d  <-tibble(labels, means_df2c2_d, vars_df2c2_d, sds_df2c2_d, cv_df2c2_d)

df3c2_d <-df3c2[-c(4,5), ]
means_df3c2_d <- c(mean(df3c2_d$Baseline), mean(df3c2_d$Water), mean(df3c2_d$FAM), mean(df3c2_d$HEX))
vars_df3c2_d <- c(var(df3c2_d$Baseline), var(df3c2_d$Water), var(df3c2_d$FAM), var(df3c2_d$HEX))
sds_df3c2_d <- c(sd(df3c2_d$Baseline), sd(df3c2_d$Water), sd(df3c2_d$FAM), sd(df3c2_d$HEX))
cv_df3c2_d <- (sds_df3c2_d/means_df3c2_d)
data_sum_df3c2_d  <-tibble(labels, means_df3c2_d, vars_df3c2_d, sds_df3c2_d, cv_df3c2_d)

df4c2_d <-df4c2[-c(4,5), ]
means_df4c2_d <- c(mean(df4c2_d$Baseline), mean(df4c2_d$Water), mean(df4c2_d$FAM), mean(df4c2_d$HEX))
vars_df4c2_d <- c(var(df4c2_d$Baseline), var(df4c2_d$Water), var(df4c2_d$FAM), var(df4c2_d$HEX))
sds_df4c2_d <- c(sd(df4c2_d$Baseline), sd(df4c2_d$Water), sd(df4c2_d$FAM), sd(df4c2_d$HEX))
cv_df4c2_d <- (sds_df4c2_d/means_df4c2_d)
data_sum_df4c2_d  <-tibble(labels, means_df4c2_d, vars_df4c2_d, sds_df4c2_d, cv_df4c2_d)

df5c2_d <-df5c2[-c(4,5), ]
means_df5c2_d <- c(mean(df5c2_d$Baseline), mean(df5c2_d$Water), mean(df5c2_d$FAM), mean(df5c2_d$HEX))
vars_df5c2_d <- c(var(df5c2_d$Baseline), var(df5c2_d$Water), var(df5c2_d$FAM), var(df5c2_d$HEX))
sds_df5c2_d <- c(sd(df5c2_d$Baseline), sd(df5c2_d$Water), sd(df5c2_d$FAM), sd(df5c2_d$HEX))
cv_df5c2_d <- (sds_df5c2_d/means_df5c2_d)
data_sum_df5c2_d  <-tibble(labels, means_df5c2_d, vars_df5c2_d, sds_df5c2_d, cv_df5c2_d)

summary.data.frame(channel_1)
summary.data.frame(channel_2)

# Eliminate well 4 (max) and 5 (min) for channel 1 and channel 2 dataset
means_channel_1 <- c(mean(channel_1$Baseline), mean(channel_1$Water), mean(channel_1$FAM), mean(channel_1$HEX))
vars_channel_1 <- c(var(channel_1$Baseline), var(channel_1$Water), var(channel_1$FAM), var(channel_1$HEX))
sds_channel_1 <- c(sd(channel_1$Baseline), sd(channel_1$Water), sd(channel_1$FAM), sd(channel_1$HEX))
cv_channel_1 <- (sds_channel_1/means_channel_1)
data_sum_channel_1  <-tibble(labels, means_channel_1, vars_channel_1, sds_channel_1, cv_channel_1)

channel_1_d <- channel_1[-c(4,5),]
means_channel_1_d <- c(mean(channel_1_d$Baseline), mean(channel_1_d$Water), mean(channel_1_d$FAM), mean(channel_1_d$HEX))
vars_channel_1_d <- c(var(channel_1_d$Baseline), var(channel_1_d$Water), var(channel_1_d$FAM), var(channel_1_d$HEX))
sds_channel_1_d <- c(sd(channel_1_d$Baseline), sd(channel_1_d$Water), sd(channel_1_d$FAM), sd(channel_1_d$HEX))
cv_channel_1_d <- (sds_channel_1_d/means_channel_1_d)
data_sum_channel_1_d  <-tibble(labels, means_channel_1_d, vars_channel_1_d, sds_channel_1_d, cv_channel_1_d)

means_channel_2 <- c(mean(channel_2$Baseline), mean(channel_2$Water), mean(channel_2$FAM), mean(channel_2$HEX))
vars_channel_2 <- c(var(channel_2$Baseline), var(channel_2$Water), var(channel_2$FAM), var(channel_2$HEX))
sds_channel_2 <- c(sd(channel_2$Baseline), sd(channel_2$Water), sd(channel_2$FAM), sd(channel_2$HEX))
cv_channel_2 <- (sds_channel_2/means_channel_2)
data_sum_channel_2<-tibble(labels, means_channel_2, vars_channel_2, sds_channel_2, cv_channel_2)

channel_2_d <- channel_2[-c(4,5),]
means_channel_2_d <- c(mean(channel_2_d$Baseline), mean(channel_2_d$Water), mean(channel_2_d$FAM), mean(channel_2_d$HEX))
vars_channel_2_d <- c(var(channel_2_d$Baseline), var(channel_2_d$Water), var(channel_2_d$FAM), var(channel_2_d$HEX))
sds_channel_2_d <- c(sd(channel_2_d$Baseline), sd(channel_2_d$Water), sd(channel_2_d$FAM), sd(channel_2_d$HEX))
cv_channel_2_d <- (sds_channel_2_d/means_channel_2_d)
data_sum_channel_2_d  <-tibble(labels, means_channel_2_d, vars_channel_2_d, sds_channel_2_d, cv_channel_2_d)

# Print out the data summary and export as csv
df_sum <- tibble(labels,means_df1c1,sds_df1c1,cv_df1c1,
                 means_df2c1,sds_df2c1,cv_df2c1,
                 means_df3c1,sds_df3c1,cv_df3c1,
                 means_df4c1,sds_df4c1,cv_df4c1,
                 means_df5c1,data_sds_df5c1,cv_df5c1)
write.csv(df_sum, '/Users/Ashley/Library/CloudStorage/OneDrive-Flinders/Math\ 9710A/Variance\ analysis/2nd\ cali/CV.csv', row.names = FALSE)

df_sum_d <- tibble(labels,means_df1c1_d,sds_df1c1_d,cv_df1c1_d,
                 means_df2c1_d,sds_df2c1_d,cv_df2c1_d,
                 means_df3c1_d,sds_df3c1_d,cv_df3c1_d,
                 means_df4c1_d,sds_df4c1_d,cv_df4c1_d,
                 means_df5c1_d,sds_df5c1_d,cv_df5c1_d)
write.csv(df_sum_d, '/Users/Ashley/Library/CloudStorage/OneDrive-Flinders/Math\ 9710A/Variance\ analysis/2nd\ cali/CV_d.csv', row.names = FALSE)

df_sum_c2<- tibble(labels,means_df1c2,sds_df1c2,cv_df1c2,
                 means_df2c2,sds_df2c2,cv_df2c2,
                 means_df3c2,sds_df3c2,cv_df3c2,
                 means_df4c2,sds_df4c2,cv_df4c2,
                 means_df5c2,sds_df5c2,cv_df5c2)
write.csv(df_sum_c2, '/Users/Ashley/Library/CloudStorage/OneDrive-Flinders/Math\ 9710A/Variance\ analysis/2nd\ cali/CV_C2.csv', row.names = FALSE)

df_sum_2d <- tibble(labels,means_df1c2_d,sds_df1c2_d,cv_df1c2_d,
                   means_df2c2_d,sds_df2c2_d,cv_df2c2_d,
                   means_df3c2_d,sds_df3c2_d,cv_df3c2_d,
                   means_df4c2_d,sds_df4c2_d,cv_df4c2_d,
                   means_df5c2_d,sds_df5c2_d,cv_df5c2_d)
write.csv(df_sum_2d, '/Users/Ashley/Library/CloudStorage/OneDrive-Flinders/Math\ 9710A/Variance\ analysis/2nd\ cali/CV_2d.csv', row.names = FALSE)


df_chanel1 <- tibble(labels,cv_channel_1,cv_channel_1_d)
write.csv(df_chanel1,'/Users/Ashley/Library/CloudStorage/OneDrive-Flinders/Math\ 9710A/Variance\ analysis/2nd\ cali/CV_channel1.csv', row.names = FALSE)

df_chanel2 <- tibble(labels,cv_channel_2,cv_channel_2_d)
write.csv(df_chanel2,'/Users/Ashley/Library/CloudStorage/OneDrive-Flinders/Math\ 9710A/Variance\ analysis/2nd\ cali/CV_channel2.csv', row.names = FALSE)

# Define the data
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
y1 <- c(148894, 163652, 170280, 187071, 95406, 165525, 159053, 137415, 127539, 123002, 138863, 134759, 142435, 128255, 146491, 163541)
y2 <- c(148032, 160748, 168940, 185202, 94021, 165096, 158596, 138097, 126632, 120325, 138111, 135433, 141760, 126020, 145392, 161714)
y3 <- c(147562, 160500, 169367, 185361, 92909, 163430, 157760, 135317, 127115, 119636, 138191, 134653, 140659, 124326, 144329, 160647)
y4 <- c(147827, 160673, 169043, 185479, 92834, 162154, 155904, 135260, 127692, 120278, 138192, 134204, 139886, 122708, 143468, 159158)
y5 <- c(147667, 160683, 168069, 183965, 93790, 163384, 158359, 136198, 127456, 119160, 137268, 134199, 139458, 123951, 144901, 161800)

# Create a scatter plot
plot(x, y1, type = "p", pch = 19, col = "blue", xlab = "well", ylab = "Fluorescence signal", xlim = c(1, 16), cex.axis = 0.8)
points(x, y2, type = "p", pch = 19, col = "red")
points(x, y3, type = "p", pch = 19, col = "green")
points(x, y4, type = "p", pch = 19, col = "purple")
points(x, y5, type = "p", pch = 19, col = "orange")
axis(1, at = x, labels = x, cex.axis = 0.8)