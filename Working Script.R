oj <- read.csv("oj.csv")
reg <- glm(log(sales) ~ brand + log(price), data=oj)
names(reg)
coef(reg)
# check out the model matrix for a peek behind the scenes:
x <- model.matrix(~ log(price) + brand, data=oj)
x[c(100,200,300),]
#compare to the same rows in the original dataset:
oj[c(100,200,300),]
#regression with interaction terms:
reg_interact <- glm(log(sales) ~ log(price)*brand, data=oj)
coef(reg_interact)
#triple interaction!
ojreg <- glm(log(sales)~ log(price)*brand*feat, data=oj)
coef(ojreg)
