### Comparing Genes, Proteins, and Genomes

##### Changing Money by Dynamic Programming

what is the minimum number of coins needed to change 9 cents for denominations 6, 5 and 1?

| money       | 0    | 1    | 2    | 3    | 4    | 5    | 6    | 7    | 8    | 9    | 10   | 11   |
| ----------- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| MinNumCoins | 0    | 1    | 2    | 3    | 4    | 1    | 1    | 2    | 3    | 4    | 2    | 3    |

​	From zero  to the highest, we may have different ways to change them, by referencing the predecessors, we may get the minimum number of coins to changes the money that we need.

​	For example, we may want to change 9 cents for denomination 6 ,5 and 1. Assuming that we have a coin whose denomination is zero. First, we should consider how to change it into 1 cent, the only way to do it is to add a coins valuing 1 cent. Then we may use the same way to get 2 cents , 3 cents and 4 cents. However, when we consider how to get 5 cents, we may have the other way to change it as we have a kind of coin with the denomination 5. So the minimum number of coins needed to change 5 cents is 1. So do 6 cents. And then when we consider about 7 cents ,we can start with 5 and 6 cents directly, until we get 9 cents.

![1537406474578](C:\Users\lenovo\AppData\Local\Temp\1537406474578.png)

![1537406496505](C:\Users\lenovo\AppData\Local\Temp\1537406496505.png)

​	So let's look on a sightseeing tour of Manhattan(picture 1),  how can we walk from the source to the sink(only in the South下 or East右 to directions) and visit the maximum number of attractions.

​	By using dynamic programming, we can get the route map( picture 2) without recursive ways.

##### Space-Efficient Sequence Alignment

​	However, the memory consumption can often be the bottleneck for our algorithm. Here, we get a dived and conquer approach to sequence alignment.

1. Alignment Path (source, path)
2. find Middle Node
3. Alignment Path (Alignment, Middle Node)
4. Alignment Path (Middle Node, sink)
5. iterate steps 3 and 4 until we get the whole path.



The question is How we can get the middle node and avoid quadratic memory.

​	we now may look at our Manhattan grid and we know Aurelius in the first column, after that, we can

compute all scores in the second column using the first column variables only. And that's the same as we previously discussed when describing alignment algorithm. But for third column, we don't need to know values of the first column, and we can simply forget them, that means we can discard the first column now to reuse the memory.

##### Multiple Sequence Alignment

​	Greedy Multiple Alignment Algorithms: 

​	Choose the most similar sequences and combine them into a profile, thereby reducing k-way alignment to (k-1)-way alignment of (k-2) sequences and 1 profile 

​	iterate……



#### The Second Part:Are there fragile Regions in the human genome ?

##### Breakpoint Theorem:

​	Reversal distance ≥ breakpoints(P)/2

​	The distance means the number of times needed to eliminate all the breakpoints. Usually, we may only eliminate 2 breakpoints at one time. However, sometimes we can not eliminate any of them, so we may get the breakpoint theorem.

##### 2-break:

​	a rearrangement that replaces two red edges with two new red edges on the same 4 nodes.

##### 2-break distance:

​	minimum number of 2-breaks transforming genome P into genome Q.

##### 2-Break Distance Theorem:

1. A 2-break increases #cycles by at most 1.

2. There exists by 2-breaks increases #cycles by 1.

3. Every sorting by 2-breaks must increase #cycles by blocks(P, Q) - cycle(P, Q).

4. 2-break distance between genomes P and Q:

    	d(P, Q)= blocks(P, Q) - cycle(P, Q)

Among all of the theorems, we may conclude different results, so what is happening in them. Clam ourselves down, we may find that the outdated theorem ignored too many situations and they can not pass the test we have defined today. For example, Random Breakage Model ignored the reusing of blocks and etc.

