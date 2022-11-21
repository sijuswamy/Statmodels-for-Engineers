library(ggplot2)
df=read.csv("starletdata.csv",sep=",")
colnames(df)<-c("Tempo","Average_syllable_duration","Maximum_syllable_energy","Maximum_syllable_energy_position","Average_pause_duration","Maximum_pause_duration","Maximum_pause_position","Amplitude_tilt","Duration_tilt","F0_maximum","f0_maximum_position","Delta_pitch","Delta_energy","Jitter","Shimmer","class")
library(psych)
df$class=as.integer(df$class)
df$Emotion[df$class == 0] = "Anger"
df$Emotion[df$class == 1] = "Happy"
df$Emotion[df$class == 2] = "Neutral"
df$Emotion[df$class == 3] = "Sad"
df=df[c(1:15,17)]
df$Emotion = factor(df$Emotion,
                    levels=c("Anger","Happy","Neutral", "Sad"))
library(plyr)
p<- ggplot(df, aes(x=Jitter, colour=Emotion ,linetype=Emotion)) + geom_density(alpha = 0.4) + scale_color_manual(values=c("#0033FF", "red", "black","blue4")) + scale_linetype_manual(values=c(1,5,4,1))+scale_size_manual(values=c(1,30,55,1))+theme_classic()+ylab("Density")
p 
