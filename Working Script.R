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


#working with emails and spam, for logistic regression practice:
email <- read.csv("spam.csv")
email[c(1,4000), c(16,56,58)]
spammy <- glm(spam ~., data=email,family='binomial')
coef(spammy)["word_free"]
exp(1.542)
# so we see that if an email contains the word "free"
# it is nearly 5x more likely to be spam
coef(spammy)["word_george"]
1/exp(-5.779)
# on the other hand, emails which contain the word "george"
# are over 300x less likely to be spam

# let's use the model to predict!
predict(spammy,newdata=email[c(1,4000),])
# to transform to probabilities:
predict(spammy, newdata=email[c(1,4000),], type='response')
