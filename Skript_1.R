install.packages("skimr")

data()
rm(Olympic_data)
install.packages("devtools")
install.packages("readr")
install.packages("spelling")
install.packages("polyglotr")
install.packages("deeplr")
install.packages("stringdist")
install.packages("textTinyR")
install.packages("text")
install.packages("stopwords")
install.packages("RCurl")
library(RCurl)
 
save()

x <- getURL(https://raw.github.com/YannikPeters/DQ_Tool_TextPreprocessing/blob/main/Olympics_Summer_2024.csv) 
read_csv(x, locale = locale(encoding = "Latin1"))

write.csv(olympics_data_en_deepl_full, "olympics_data_en_deepl_full.csv", row.names = FALSE)
write.csv(olympics_data_fr_deepl, "olympics_data_fr_deepl.csv", row.names = FALSE)

tokens <- str_split((olympics_data_en_full$tweet_text), "\\W+") 
all_tokens <- unlist(tokens)

# Einzigartige Tokens extrahieren
unique_tokens <- unique(all_tokens)

# Ausgabe der einzigartigen Tokens und der Anzahl
print(unique_tokens)
print(length(unique_tokens))  



