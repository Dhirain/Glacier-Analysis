#Read complete data
glacier <- read.csv("/home/dhirain/Documents/HSRW/environment/wgi_feb2012.csv", header = TRUE)
str(glacier)

#Divide data according to Continent 
table(glacier$political_unit)

#Check only Asia and Europe data
glacier.europe.asia <- glacier[which(glacier$continent_code == 4 | glacier$continent_code ==5),]
table(glacier.europe.asia$continent_code)
table(glacier.europe.asia$political_unit)
summary(glacier.europe.asia$mean_elev)

#reomving NA of mean_elev
glacier.europe.asia <- glacier.europe.asia[!is.na(glacier.europe.asia$mean_elev),]
summary(glacier.europe.asia$mean_elev)

#only europe
glacier.europe <- glacier.europe.asia[which(glacier.europe.asia$continent_code == 4 ),]
table(glacier.europe$continent_code)
table(glacier.europe$political_unit)

#Reduce number of cloumn for App
keep.column <- c("wgi_glacier_id","glacier_name","political_unit","lat","lon","mean_elev")
glacier.europe.asia.trim <- glacier.europe.asia[, keep.column]
glacier.europe.trim <- glacier.europe[,keep.column]
str(glacier.europe.trim)

#Storing data as CSV
write.csv(glacier.europe.asia.trim , file = "/home/dhirain/Documents/HSRW/environment/EuropeAsiaGlacier.csv")

#Storing data as CSV
write.csv(glacier.europe.trim , file = "/home/dhirain/Documents/HSRW/environment/EuropeGlacier.csv")

#Only German data
glacier.europe.trim.de <- glacier.europe.trim[which(glacier.europe.trim$political_unit == "DE"),]
glacier.europe.trim.de <- glacier.europe.trim.de[,keep.column]
write.csv(glacier.europe.trim.de, file = "/home/dhirain/Documents/HSRW/environment/GermanGlacier.csv")

#only asia
glacier.asia <- glacier.europe.asia[which(glacier.europe.asia$continent_code == 5 ),]
table(glacier.asia$continent_code)
table(glacier.asia$political_unit)

#Reduce number of cloumn for App
glacier.asia.trim <- glacier.asia[,keep.column]
str(glacier.asia.trim)
