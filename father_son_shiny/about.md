## About this explorer

This is a very simple explorer that allows the user to examine the dataset used by 
[Karl Pearson](https://en.wikipedia.org/wiki/Karl_Pearson) (statistician, and regrettably eugenicist). He examined the heights of 1078 fathers and sons, and coined the term 'regression to the mean'. 

The slider above lets the user pick a father height, and then see the predicted value of a simple linear model `lm(sheight ~ fheight)`, as well as the 95% confidence intervals. The large red dot notes the location of the predict height on the linear model.