#import "lib.typ" : Examplebox
= Supervised Learning
==  Classification

=== Distance Based Classification 

#Examplebox([
- store a set of labeled examples
- classify a query according to the lavel of the nearest neighbor (or a majority of K NN)
- local decision boundry (e.g. Euclidean distance)
- piece-wise linear class borders parameterized be all examples

Pros:
- simple, no training requred, one parameter
Cons:
- expensive storage and computation, sensitive to outliers, can result in overly complex decision boundaries
])

=== Prototype Based Supervised Learning

#Examplebox([
- represent the data by one or more *prototypes* per class
- classify a query according to the label of the nearest prototype
- local decision boundry (e.g. Euclidean distance)
- piece-wise linear class borders parameterized by prototypes

Pros:
- less sensitive to outliers, less complex decision boundries
- less computation and storage
Cons:
- training phase required in order to place prototypes + model selection problem
])

==== Nearest Prototype Classifier (NPC)

- set of prototypes with labels
- given point $x$, assign x to the class of the nearest prototype

== Learning Vector Quantization
- Initialize prototype vectors for different classes
- Present a single example
- Find the closest prototype
- If same class:
  - move the prototype closer
- Else:
  - move the prototype further away

==== LVQ1

*iterative training procedure*:
- randomize initial prototype vectors ${w^k}$
- choose labeled examples ${x^m, sigma^m}, m = 1, 2, ...$
- _Winner takes it all_: choose prototype closest to example $w^* = min {d[w^j,x^m]}$
- *update step*:
  - $w^* <- w^* + eta_omega Psi (S^*, sigma^m) (x^m - w^*)$

    where $Psi (S, omega) = cases(
      +1 "if" S=omega,
      -1 "else"
    )$

    $eta_omega$: Learning rate

==== Generalized LVQ (GLVQ)
(this may be partially incorrect)

- randomly initialize prototypes
- For each training sample:
  - Find the closest correct and incorrect prototypes
  - Compute the cost function: $e^m = (d_c - d_i)/(d_c + d_i)$
  - Update the prototypes
    - Closest correct prototype: $w_c <- w_c - eta 1/2 (delta e^m)/(delta w_c)$
    - Closest incorrect prototype : $w_i <- w_i - eta 1/2 (delta e^m)/(delta w_i)$
    Where $eta$ is the learning rate


=== prototype/distance based classifiers

*Pros*:
- intuitive interpretation
- flexible
- easy to implement
- natural for multi-class problems

*Cons*:
- usually based on heuristic arguments, or cost functions with unclear relation to classifivation error
- model/parameter selection

=== Distance Measures
*fixed distance measures*:
- select distance measures according to prior knowledge
- data driven choice in a preprocessing step
- determine prototypes for a given distance
- compare performance of various measures

*adaptive distances / relevance learning*:
- fix only the parametric form of the distance measure
- optimize its parameters in the training process

*Relevance Matrix LVQ*

*heuristic interpretation*


== Regression
-*Purpose*: Find function to predict values for data not present in the learning set

_Note_ : For example getting the weight of a person based on their height

=== Linear Regression
Find a fit to the data by minimizing the sum of squares of the differences of the data from the average, which minimizes the distance of the real data from the model

- Boils down to:
  - Arrive to linear function: $g(x) = alpha x_i + beta$
  - Go through all points in the dataset, and find the error (compare the distance of the point to the line): $sum_(i=0)^n (alpha x_i + beta - y_i)^2$
  - Find the $alpha$ and $beta$ which make this sum the smallest, by setting the gradient of the sum to 0 and solving for $alpha$ and $beta$ by doing derivations
  - In practice: use sklearn in python to do it for you in 2 lines

=== Non-linear Regression
Same as before but we're no longer dealing with a linear function, making everything more difficult and promoting the use of python even more

=== Statistical modeling
-Emphasis: *Inference*
- explain/understand data in terms of explicit models
- verify assumptions/hypotheses, significance/confidance
- can be used for prediction

=== Machine Learning
-Emphasis: *Prediction*
- discover patterns in the data with no/few explicit assumptions
- achieve good performance
- may also aim at understanding


== Validation

- Split the dataset into a _Training_ set and a _Test_ set
- Compare the training results with the test set
- *Problems*:
  - *lack of data*: can we afford to "waste" example data "only" for validation?
  - *representative results* : lucky/unlucky set composition can give a misleading outcome
  - *variation of results* : how safe is the prediction? error bars of the estimates? (idk what this means)

=== N-Fold cross-validation

- Basic idea:
  - Split data randomly into *n* disjoint sets
  - Repeat training n times
  - Calculate average training / test errors and variances
  - Repeat cross-validation for different models, parameter settings etc.
  - Select the best system with respect to test errors
- *remarks*: 
  - larger n:
    - larger fraction of the Dataset used in each training run
    - more estimates of E_test / smaller test sets
    - higher computational effort
  - extreme case: n = P
    - use all but one example for training, test on single example
    - repeat P times: *leave-one-out estimate*

=== Over-fitting
Regression is so overly-trained on the test data set that it fails to correctly predict new data (*low training, high test error*)

=== Bias / Variance dilemma

-Low *bias*: small *systematic deviation* from the "true solution" on average over all possible data sets of the same size
-Low *variance*: weak dependence on the actual training set, *robustness* of the hypothesis

-Dilemma:
  - small variance: simple model, _under-fitting_ $->$ large bias
  - small bias: complex model, _over-fitting_ $->$ large variance

#align(center, image("img/curveFitting.png", width: 80%))
