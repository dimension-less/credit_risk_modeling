# Credit Risk modelling
loan_data<-read.csv("C://Users/himanshu arora/Documents/Data Science/Case Study/Microsoft Credit Risk Modeling/LoansTrainingSetV2.csv",stringsAsFactors = FALSE)

# Remove Duplicate Rows
loan_unique<-loan_data[row.names(as.data.frame(unique(loan_data$Loan.ID))),]

# Converting the data 

sapply(loan_unique,is.numeric)


loan_unique$Loan.Status<-as.factor(loan_unique$Loan.Status)
loan_unique$Term<-as.factor(loan_unique$Term)

loan_unique$Home.Ownership<-as.factor(loan_unique$Home.Ownership)
loan_unique$Purpose<-as.factor(loan_unique$Purpose)
#loan_unique$Bankruptcies<-as.factor(loan_unique$Bankruptcies)
#loan_unique$Tax.Liens<-as.factor(loan_unique$Tax.Liens)

# Final class of each column

sapply(loan_unique,class)
# Monthly Debt and Maximum.Open.Credit needs to be cleaned, before converting to numric
# Replacing "$" sign with ""
loan_unique$Monthly.Debt<- str_replace_all(loan_unique$Monthly.Debt, fixed("$"), "")
#Replacing "," with ""
loan_unique$Monthly.Debt<- str_replace_all(loan_unique$Monthly.Debt, fixed(","), "")
loan_unique$Maximum.Open.Credit<- str_replace_all(loan_unique$Maximum.Open.Credit, fixed("#VALUE!"),NA)
#Converting these two columns to numeric
loan_unique$Monthly.Debt<-as.numeric(loan_unique$Monthly.Debt)
loan_unique$Maximum.Open.Credit<-as.numeric(loan_unique$Maximum.Open.Credit)
# Cleaning years in current job
loan_unique$Years.in.current.job<- str_replace_all(loan_unique$Years.in.current.job, fixed("n/a"),NA)
loan_unique$Years.in.current.job<-as.factor(loan_unique$Years.in.current.job)
loan_unique$Home.Ownership<- str_replace_all(loan_unique$Home.Ownership, fixed("HaveMortgage"),"Home Mortgage")
summary(loan_unique)
sapply(loan_unique,summary)

sapply(loan_unique, class)



