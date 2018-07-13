## 画图的基本方法：

### 基本内容

***plot(x , y, main="标题", xlab="x轴标签"，ylab="y轴标签", xlim="x轴范围"，ylim="y轴范围",)***

### 对于散点图：

1. 添加pch=x   (x为0:25中的任意一个数字，每一个数字对应一种点的样式，默认为原形)

2. 而在plot语句下面，额外添加points语句，可以在同一个x轴上绘制两个数据集中的点，

   使用如下：***points(x,z, pch=数字)***

   这里需要注意的是：由于plot中确定了y轴的范围，而points无法延长y轴的范围，故而可能限制z轴的范围，因此在plot中对于x与y的范围可以做出如下修改，***xlim=range(x),ylim=range(y,z)***

3. 添加col="颜色"，可以用不同的点来进行标记，这里可以使用ifelse函数，

   例如 ***col=ifelse(y>=mean(y),"red","green")***

### 对于折线图：

1. 只需要在调用plot的时候设置***type="l"***即可,注意使“L”的小写，不是阿拉伯数字1

2. lty用于指定折线图中线的类型

3. ***axes=FALSE***表示暂时禁止坐标轴的生成，一般默认为TRUE，

   ***ann=FALSE***表示高水平绘图函数，会调用函数plot.default，使对坐标轴整体图像名称不做任何注释，即坐标轴上不会有xlab和ylab以及整体图像的注释，默认为TRUE。

   ***lwd=数字***，通常为2，表示线宽

4. abline长用来添加辅助线

   通常使用方法为：***abline(h/v=自己想要的高度或位置，lty=数字，col="颜色"，lwd=数字)***

   h代表与x轴平行的线，v代表与y轴平行的线，如果不添加后三项，则默认为初始值，有限默认为plot中设定的

5. mtext可以用于在画布边缘添加文本。

   通常使用方法为：***mtext(text, side = 3, line = 0, outer = FALSE, at = NA,       adj = NA, padj = NA, cex = NA, col = NA, font = NA, ...)*** 

   text指代一个字符或向量表达式制定的输出文本。

   side表示在哪边输出文本（1=下面，2=左边，3=上边，4=右边）

   line表示在哪边线，从0开始向外计数

   outer表示如果允许使用外边缘

   at表示给定坐标轴上每个字符串的位置。如果相应于特别的文本项的组件不是有限的值(错误），位置将由adj参数决定。 

   

   ***需要注意的使abline与mtext的参数都是向量化的，因此自身带有for循环的属性，不需要再刻意添加for循环***

6. 折线图也可以与散点图一样，绘制多段折线图

   使用lines()即可，使用方法与points()类似

   讲散点图与折线图混合有两种方法，

   * ***plot(pch=...) lines(y,.....)***
   * ***plot(type=...)points(y,......)***

7. legend与第六点混合，绘制带图例的多序列图

   假设图中y,z共享y轴

   则

   ***legend=("topleft",legend=c("y","z"),col=c("black","blue"),lty=c(1,2),pch=c(15,16),cex=0.8,x.intersp=0.5,y.intersp=0.8)***

   cex用于设置图例的字体大小，x/y.intersp用途图例的微调

8. 当我们讲type="s"的时候，可以船舰阶梯形折线图

### 创建柱状图

1. 这里不再使用plot，而是使用barplot

   barplot(H, xlab, ylab, main, names.arg, col)

   - **H**是包含在条形图中使用的数值的向量或矩阵。
   - **xlab**是x轴的标签。
   - **ylab**是y轴的标签。
   - **main**是条形图的标题。
   - **names.arg**是在每个条下出现的名称的向量。
   - **col**用于向图中的条形提供颜色。

### 创建饼状图

1. 使用pie()，细节与barplot相似，末尾加 ***radius=1***，表示总值为1

   即pie(..., ..., radius=1)

### 创建直方图和密度图

#### 直方图使用hist()创建，

break : 该参数的指定格式有很多种

​	第一种： 指定一个向量，给出不同的断点

​	第二种：指定分隔好的区间的个数，会根据区间个数自动去计算区间的大小 

probability=T为频率，

frequency=T为频数，

labels = c("A", "B", "C")，labels为每条柱子的标签

axes : 逻辑值，是否显示轴线 

col : 柱子的填充色 

border : 柱子的边框的颜色，默认为black, 当border = NA 时， 代表没有边框 

density 和 angle , 用线条填充柱子 density=1或者2或者3.……，angel=角度，如45，60……

#### 画图直方图，添加密度曲线

（注意保证y轴为频率分布）

***curve(dnorm,add=T,lwd=2,col="red")***

### 创建箱线图

使用boxplot()



[用stringr包处理字符串](https://blog.csdn.net/qq_34941023/article/details/51550158)

[使用正则表达式](https://www.jb51.net/tools/zhengze.html)

[apply家族的使用](http://blog.fens.me/r-apply/)



