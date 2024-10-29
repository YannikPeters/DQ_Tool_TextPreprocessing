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


rm(auth_key)

textrpp_install()

# Initialize the installed conda environment.
# save_profile = TRUE saves the settings so that you don't have to run textrpp_initialize() after restarting R. 
textrpp_initialize(save_profile = TRUE)

translations_de_en <- text::textTranslate(
  text = olympics_data_de$tweet_text,
  model = "Helsinki-NLP/opus-mt-de-en"
)

library(text)
library(reticulate)

# Install text required python packages in a conda environment (with defaults).
text::textrpp_install()

# Show available conda environments.
reticulate::conda_list()

# Initialize the installed conda environment.
# save_profile = TRUE saves the settings so that you don't have to run textrpp_initialize() after restarting R. 
text::textrpp_initialize(save_profile = TRUE)

# Test so that the text package work.
textEmbed("hello")


# Beispiel-Daten
example <- data.frame(text = c(
  "RT @user: Check this out! https://example.com",
  "Just a tweet with @mention and some amp text.",
  "This is a clean tweet without links.",
  "RT via @anotherUser: Visit http://example.org for more info!",
  "Text with ampersand & some punctuation!!!"
))

# Bereinigung des Textes in einem Befehl 
example$text <- example$text %>%
gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", .) %>%
  gsub("https?://\\S+", "", .) %>%
  gsub("@\\w+", "", .) %>%
  gsub("[\r\n]", " ", .) %>%
  gsub("[[:punct:]]+", " ", .) %>%
  gsub("\\s+", " ", .) %>%
  trimws(.)

example
