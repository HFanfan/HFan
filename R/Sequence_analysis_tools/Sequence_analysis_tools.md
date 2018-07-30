# Sequence analysis tools

Sequence analysis tools will provide base and advance sequence ( DNA and protein) manipulation in R environment, reference the features implementation in [SMS](http://www.detaibio.com/sms2/group_dna.html), [SeqTools](http://www.biossc.de/seqool/index.html). The features include:

1. basic Statistic 
   - sequence length composition: N50, N90 et.
   - codon statistic: codon usage, codon preference
   - nucleotide composition statistic: GC%, base%(A,T,C,G,R,....), oligo composition, and restriction site, over- or under-presented oligo
2. Search
   - search by sequence name, or partial of the name: AB10
   - search by sub sequence, this usually need tools such as blast and 
3. Extraction
   - Extraction sequences from fasta file by providing sequence names
   - Extraction sequences by providing of **start, end, strand and complement** information
4. manipulation
   - translation: from DNA to mRNA to Protein
   - Enzyme digestion simulation 



**代码输入内容均为**：所需要查询密码子的DNA序列，格式要求为FASTA格式。

**代码输出内容如下：**

##### 	关于DNA的基本信息获取

​	输出：碱基以及总碱基含量，GC含量和N10-N90.输出文件为两个*excel*格式文件，*basic statistics*文件包含碱基以及总碱基含量和GC含量，genoJudge包含N10-N90的相关信息。

​	代码内容：使用**stringr扩展包**，构建*for循环*，利用R内置函数*strslit函数*筛选出每一条scaffold，利用**stringr扩展包**中的*str_count函数*计算个碱基的含量和该scaffold的总碱基含量。使用*sort函数*对所有的scaffold进行由小到大的排序，构建*for循环*对scaffold进行逐步累加，计算出N10-N90。

##### 	关于密码子选择和密码子偏好

​	输出：输出内容为六个*ORF*所包含的所有的密码子的**密码子频数**和**密码子频率**，并**由小到大**排列。输出文件为*excel*格式

​	代码内容：使用***stringr扩展包***以及*根据有义链求无义链的函数*，使用***stringr扩展包***中的*str_c函数*得到无间断的整条DNA序列，用*substring函数*计算序列的密码子，*table函数*归类，*sort函数*排序，最终输出相关信息。

