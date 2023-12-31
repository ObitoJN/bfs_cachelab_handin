# Description
图分析算法在社交网络分析、人工智能和计算机辅助设计等多个领域均具有重要应用价值,随着图数据量的增大,如何提高图分析算法的性能已成为研究热点。广度优先搜索(BFS)算法是一种重要的图搜索算法,它具有访存数据量大、访存模式不规则和访存局部性差的特点,很好地刻画了一类数据密集型应用的特征。作为一种典型的访存模式不规则程序,BFS算法在运行过程中会产生大量的随机访存请求,Cache和数据预取技术很难发挥较好的效果,访存速度是限制其性能的瓶颈。

对于稀疏的图，常常以邻接表的形式存储。所以当对稀疏图进行bfs搜索时，邻接表的存储顺序会对cache的命中率产生一定的影响。显然，bfs搜索时，如果一个点的后继节点的存储位置和它尽量的靠拢，那么cache的命中率就会相对地变高；如果距离较远，则可能会发生cache缺失，降低命中率。你所要做的就是重排图结点，使得bfs算法的cache命中率尽可能高。

图的存储格式如下,第一列是出发的顶点，第二列是到达的顶点。

```
0	1
0	2
0	15
0	17
0	32
0	33
0	43
0	49
0	60
0	65
0	89
1	50
1	108
1	110
1	116
2	0
2	11
... ...
```


# Evaluation
## Goal
编写一段程序来生成一个重排映射文件，系统会根据这个映射文件来重排图节点并且测试对应的cache命中率。bfs会从0号节点开始搜索。

## Test
系统会使用你提交的映射文件来重排图的节点，然后使用valgrind来跟踪bfs函数所对应那部分代码的cache使用情况,生成trace文件。过滤好对应的.trace文件后，再交给./csim-ref来评测缓存命中情况。

## Submission File Format
编写程序生成一个图中点的编号到新编号的映射文件.map，第一列是点的原编号，第二个是这个点的新编号。生成的文件格式示例如下：
```
0 0
1 7
2 11
3 26
4 5
5 17
6 33
7 53
8 3
9 25
10 2
11 10
12 52
13 16
14 24
15 23
16 1
... ...
```