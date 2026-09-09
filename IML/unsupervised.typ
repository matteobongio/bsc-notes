= Unsupervised Learning
*Unlabeled Data*
Groups by similarity

== Dimensionality reduction
*Why dimensionality reduction?*
- Reduce the complexity of the models
- Avoid curse of dimensionality
- Data visualization
- Data compression (reduce redundant, time and storage space)
*Curse of dimensionality*
- Statistical methods fail in high dimensions
- As the dimensionality grows, there are fewer samples per region

*Feature Selection*: choosing $d$ dimensions with the most information, and discarding the rest
*Feature Extraction*: finding a set of $d$ new dimensions that are combinations of the original $n$ dimensions.

Map data points from a high-dim space $RR^n$ to a low-dim space $RR^d$ while minimizing information loss (mean squared error).
$ f:RR^n -> RR^d, n >> d $
How to pick $f$?

=== Principal Component Analysis (PCA)
- *Feature Extraction*
- Drawbacks
   - linear projection, may not work well with non-linear patterns (use *kernel-PCA*)

$ f(x) = w^T x $
$w$ is a $n times d$ matrix.
- minimize information loss
- maximize variance of projected data

*take the first $d$ eigenvectors sorted by largest associated eigenvalue.*
the ith eigenvector sorted by largest associated eigenvalue represents the ith maximum variance direction, and so forth.

*Algorithm*
1. *Standardize the dataset*, compute the mean $overline(x)$ and the variance $sigma^2$ 
$ bold(Z)_i = frac(x_i - overline(x), sigma) $
2. Compute the principal components:
	- Compute the co-variance matrix $C  frac(1, M - 1) sum^M_(i=1) bold(Z)_i bold(Z)_i^T$
	- Compute the eigenvalues and eigenvectors
3. Choose the dimensionality $d$:
	- Compute the fraction of total variance (sum of $d$ largest eigenvalues)/(sum of all eigenvalues)
	- pick the smallest $d$ with a fractional variance that satisfies your threshold
4. pick the first $d$ eigenvectors

#align(center,image("img/dimensionality.png", width: 80%))

=== t-Distributed Stochastic Neighbor Embedding (t-SNE)
- *Feature Extraction*
- Drawbacks
   - PCA gives an explicit formula, t-SNE does not, so not easy to appy to data not in the sample. (use *UMAP*)
   - Does not work well for output dimension $d > 3$.

*Stochastic*: some randomness

*Neighbor*: given $k$ and the data point $x$, 
the $k$ closest datapoints to $x$ are $x$'s neighbors.

*Embedding*: from high dim space to low dim space

Uses gradient descent to find the best locations for data in the low dim space.

*Non-linear model*

*Usage*: PCA is used as a *pre-processing* step for many ML algorithms, t-SNE can be used for *exploratory analysis*

== Clustering, outlier detection, density estimation

*Clustering analysis* is to partition a set of data points into groups
such that points within the same group (a cluster) are more similar
than to those in other groups (different clusters).

*Clustering algorithms*: #align(center, image("img/clusteringAlgorithms.png", width: 80%, ))

=== Hierarchical clustering

*dendrogram*

==== linkage measure
defines cluster dissimilarity
- *single linkage*: by the nearest two objects in the clusters
- *complete linkage*: by the two farthest objects in the clusters
- *average linkage*: by the average distance
- *ward's linkage*: combining clusters when the increase in within cluster variance is the minimum
*Choosing*
- *Single linkage*: is fast, and can perform well on non-globular data, but it performs poorly in the presence of noise.
- *Average and complete linkage*: perform well on cleanly separated globular clusters, but have mixed results otherwise.
- *Ward's linkage*: is the most effective method for noisy data.


==== Agglomerative (bottom-up) clustering

The dendrogram is built from the bottom level by
merging similar pair of samples/clusters. It stops
when all the data samples are merged into one single
cluster/ the root cluster.

*Algorithm*
+ Start with singletons
+ Compute dissimilarity matrix
+ while more than 1 cluser:
   4. Merge 2 closest clusters, in case there are multiple "closest", merge all of them in 1 step
   + Update dissimilarity matrix

==== Divisive (top-down) clustering

Starts with all data points in one cluster, the root,
then continues splitting into subsets until clusters
with a single sample remain.

==== Limitations of distance-based clustering
*Different linkage measures have the following problems:*
- Difficult to handle clusters of different sizes and non-globular shapes
- Breaking large clusters
- Sensitive to noise

=== Cluster Validity
- Determine the 'correct' number of clusters
- Compare different clustering algorithms
- Evaluate how well the results of a cluster analysis fit the data without
reference to external information

- *Internal Index*: measure the goodness of a clustering structure without external information.
   - *Cohesion*: how closely related are samples in a cluster
   - *Separation*: how well separated is one cluster from other clusters
   - *Silhouette score*
- *External Index*: measure the extent to which cluster labels match externally supplied class labels.
   - confusion matrix TP, TN, FP, FN 
      #align(center,image("img/confusionMatrix.png", width: 80%))
   - *F-score*
   $
      "Precision" = frac(T P, T P + F P) \
      "Recall" = frac(T P, T P + F N) \
      F_"score" = 2 frac("Precision" times "Recall","Precision" + "Recall")
   $
   - Receiver Operating Characteristics (ROC), Area Under the ROC Curve (AUC)
      #align(center,image("img/ROC.png", width: 80%))



=== Desnsity-Based Spactial Clustering of Applications with Noise (DBSCAN)
- Resistant to noise
- Can handle clusters of different sizes and shapes
- Effective when we don’t know the distribution of data
- Intuitive method and easy to understand
- Drawbacks
   - Sensitive to the setting of the parameters. It is not easy to find optimal set.
   - Cannot handle varying densities
   - Computational complexity $O(n^2)$
is a *density-based* clustering algorithm. Given a set of data points,
it *groups together points that are closely packed*, marking as *outlier
points* that lie in low-density regions.

- No need to specify the number of clusters
- Can handle clusters of arbitrary sizes and shapes
- Resistant to noise

*measuring density*

$ N_epsilon (x) = { y | ||x - y || <= epsilon} $

where $x$ and $y$ are datapoints and $epsilon$ is the radius of the neighbourhood.

For any point $x$, it is a 
- *Core point* if $N_epsilon (x) >= "MinPts"$
- *Border point* if $N_epsilon (x) < "MinPts"$ and it is a neighbor of a *core point*
- *Noise or outlier* if it is *not a core or border point*.

==== Properties of clusters

*Direct reachability* (asymmetric): a core point forms a
cluster with all points in its $epsilon$-neighbor (core or border) that are reachable from it.

*Indirect reachability* (asymmetric): A point $q$ is
reachable from $p$ if there is a path $p_1, ..., p_n$  with
$p_1 = q$ and $p_n = p$ where
each $p_i+1$ is directly reachable from $p_i$. Note that this implies
that the initial point $p$ and all points on the path must be core
points, with the possible exception of q.

*Connectivity* (symmetric): Two points $p$ and $q$ are density-connected
if there is a point $o$ such that both $p$ and $q$ are reachable from $o$.

*Cluster*:
- All points within the cluster are mutually density-connected.
- If a point is density-reachable from some point of the cluster, it is part of the cluster as well.

*Noise*:
Data points which are not density-reachable from at least one core point are known as noise points.

==== How to determine the Parameters

*MinPts* (rules of thumb)
- The larger the data set, the larger the value of *MinPts* should be
- If the data set is noisier, choose a larger value of *MinPts*
- For 2-dimensional data, use *DBSCAN*’s default value of $"MinPts" = 4$ (Ester et al., 1996).
- If your data has more than 2 dimensions, choose $"MinPts" = 2 times "dim"$, where dim is the dimension of your data set (Sander et al., 1998).

_Note_: If $"MinPts"=2$, the result will be similar to hierarchical clustering
with the single linkage, where the dendrogram is cut at height eps.

*Eps*
- k-nearest neighbour graph/search (k=MinPts-1)
- find the "knee" (point where the distance starts going exponential)
#align(center, image("img/knn.png", width: 80%))


=== Hierarchical Density-Based Spatial Clustering of Applications with Noise (HDBSCAN)
*HDBSCAN* does not select clusters based on a global eps, but creates a
hierarchy for all possible _eps_ values with respect to _minPts_ as minimum cluster size.

#set enum(numbering: "A.")
+ *Mutual Reachability Distance*
   For a datapont $x$, compute the core distance $d_"core" (x)$, which is the distance to its
   $k$-th nearest neighbor.
   #set enum(numbering: "1.")
   + Define the mutual reachability distance between any two points $x$ and $y$ as:
      $ d_"reach" (x, y) = max{d_"core" (x), d_"core" (y), d(x, y)} $
      where $d(x, y)$ is the normal distance (i.e. euclidean)
   + The dataset can then be represented as a graph with data objects as vertices, connected by weighted edges with mutual reachability distances $d_"reach" (x, y)$ sa weights.
   + Construct a minimum spanning tree and sorting its edges by mutual reachability distance results in a hierarchical tree structure (dendrogram).

   By choosing an eps as a global horizontal cut value and selecting all
   clusters with at least minPts (e.g. 5) points at this density level, we could
   retrieve the DBSCAN clusters for this epsilon from the hierarchy.
#set enum(numbering: "A.")
2. *Condensation and Cluster Stability*
   *HDBSCAN* "condenses" the dendrogram based on a minimum cluster size
   _minPts_. It then assesses the stability of each cluster.
   e.g. how long a cluster persists over a range of distance thresholds. Clusters that persist
   over a larger range are considered more "stable" and are selected as final clusters.
+ *Extracting the Final Clusters*
   Finally, extract the clusters based on stability. Points that do not belong to
   any stable cluster are marked as noise.
#set enum(numbering: "1.")

=== Z-score
choosing a cut off point in a Gaussian distribution

pros:
- easy
cons:
- only works on low dimension paremetric data

=== Local Outlier Factor

Local outlier factor assigns to each object a degree of being an outlier.

1. Identify the k-nearest neighbours for each point.
+ Compute the k0distance of each point $d_"core"$
+ Calculate the reachability distances
   $ d_"reach" (x, y) = max { d_"core" (y), d(x, y)} $
+ Compute the local reachability density (LRD) for any point $x$
+ Compute the LOF score by comparing the LRD of a point $x$ to the LRD of its neighbours. if much lower, it is an outlier

== Vector Quantization, data representation by prototypes
- VQ is related to clustering, but it is not the same thing

==== Vector Quantization
- Updates onlt the winner, random sequential presentation of single examples, learning rate controls he step size of updates

- Initialize K prototype vectors
- loop:
   - present a single example
   - Identify the closest prototype (winner)
   - move the winner even closer towards the example

_competitive VQ and K-means aim at optimizing a *cost function*_

*quantization error*: sum over all data points quantifies the quality of the representation

==== Lloyd's algorithm (K-means)
- updates all prototypes, considers all data at a time

0. Initialization
   place K vectors $w^k$, (choose random data points)
- loop:
   + assign data to centers
      assign every datapoint to nearest center
   + re-compute centers
      compute the means of the K current clusters


