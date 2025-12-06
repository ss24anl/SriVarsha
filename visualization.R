df<- read.csv("flight_data_DEL_HYD.csv")

head(df)
colnames(df)

arrivingCity <- df["ArrivingCity"]
df$Price <- as.numeric(gsub(",", "", df$Price))
price <- df["Price"]

pdf("visualisation.pdf")

boxplot(Price ~ ArrivingCity, data = df, main = "Boxplot - Flight Ticket Prices by Arriving City", xlab = "Arriving City", ylab = "Ticket Price (INR)")

h <- hist(
  df$Price,
  breaks = 45,
  xlab = "Flight Ticket Price (INR)",
  ylab = "Frequency",
  main = "Distribution of Flight Ticket Prices for Delhi and Hyderabad Arrivals"
)

x <- seq(min(df$Price), max(df$Price), length = 100) 
y <- dnorm(x, mean = mean(df$Price), sd = sd(df$Price))* length(df$Price)
box.size <- diff(h$mid[1:2])
y <- y * box.size
lines(x, y, col = "blue")

dev.off()
