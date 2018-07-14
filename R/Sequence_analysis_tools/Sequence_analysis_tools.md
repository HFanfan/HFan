# Sequence analysis tools

Sequence analysis tools will provide base and advance sequence ( DNA and protein) manipulation in R environment, reference the features implementation in [SMS](http://www.detaibio.com/sms2/group_dna.html), [SeqTools](http://www.biossc.de/seqool/index.html). The features include:

1. basic Statistic 
   - sequence length composition: N50, N90 et.核苷酸成分，寡核苷酸成分，以及N50，N90等
   - codon statistic: codon usage, codon preferenceGC含量，密码子选择，密码子偏好
   - nucleotide composition statistic: GC%, base%(A,T,C,G,R,....), oligo composition, and restriction site, over- or under-presented oligo高于或低于适当比例的寡核苷酸的计算，在Windows下计算给出的序列大小或者计算序列全长，可以根据要求提取出对应的序列（比如：GC含量低于0.41）
2. Search
   * 精准的利用IUPAC进行文本搜索，搜索的内容包括：重复片段，起始和终止密码子，以及限制位点
   * 扼要描述（权重矩阵/位置特异性得分矩阵）
   * 扼要描述隐马尔可夫模型
   * Maximum dependence decomposition 
   * 简单重复频数模型/序列成分模型
   * RNA结合基序搜索
3. Extraction
4. manipulation

``` R
genes<-readLines("C:/Users/lenovo/Desktop/GCA_000715565.1_RSA_r1.0_genomic.fna")
Genes<-toupper(genes)
Genes[length(genes)+1]<-">"
library(stringr)
N.S<-0
n.s<-0
sca<-1
A<-0
G<-0
C<-0
T<-0
N<-0
n<-0
GC<-0
K<-0
sca_name<-0
NAME<-unlist(strsplit(Genes[1],split=" "))
sca_name[1]<-NAME[1]
K[1]<-1
for( k in 2:length(Genes))
{
    Gene<-unlist(strsplit(Genes[k],split=""))
    if(Gene[1]==">") 
    {
        N.S=N.S+1
    name<-unlist(strsplit(Genes[k],split=" "))
    sca_name[N.S+1]<-name[1]
    A[N.S]<-sum(str_count(Genes[(sca+1):(k-1)],c("A")))
    G[N.S]<-sum(str_count(Genes[(sca+1):(k-1)],c("G")))
    C[N.S]<-sum(str_count(Genes[(sca+1):(k-1)],c("C")))
    T[N.S]<-sum(str_count(Genes[(sca+1):(k-1)],c("T")))
    N[N.S]<-sum(str_count(Genes[(sca+1):(k-1)],c("N")))
    n[N.S]<-A[N.S]+G[N.S]+C[N.S]+T[N.S]+N[N.S]
    GC[N.S]<-(G[N.S]+C[N.S])/n[N.S]
        sca<-k
        K[N.S+1]<-k
    }
}
sca_name<- sca_name[1:(length(sca_name)-1)]
n.s[1:length(sca_name)]<-c(1:length(sca_name))
d<-data.frame(sca_name,A,G,C,T,N,n,GC,stringsAsFactors = F) 
write.csv(d,file="D:/basic statistics.csv")
## 以上代码可以精准的返回一个文件，该文件的内容包含碱基基本数据，GC含量.代码的思路主要是：利用for循环对每一条scaffold进行碱基汇总，然后将所有的scaffold的数据汇聚在一起，输出文件。
```

```R
sort(n)
total_num<-sum(n)
total_sca<-0
N10<-0
N20<-0
N30<-0
N40<-0
N50<-0
N60<-0
N70<-0
N80<-0
N90<-0
for(i in 1:length(sca_name))
{
    total_sca<-(total_sca+n[i])
    if((total_sca/total_num>=0.1)&&(total_sca/total_num<=0.2)) N10<-c(N10,c(sca_name[i],n[i]))
    else if((total_sca/total_num>=0.2)&&(total_sca/total_num<=0.3)) N20<-c(N20,c(sca_name[i],n[i]))
    else if((total_sca/total_num>=0.3)&&(total_sca/total_num<=0.4)) N30<-c(N30,c(sca_name[i],n[i]))
    else if((total_sca/total_num>=0.4)&&(total_sca/total_num<=0.5)) N40<-c(N40,c(sca_name[i],n[i]))  
    else if((total_sca/total_num>=0.5)&&(total_sca/total_num<=0.6)) N50<-c(N50,c(sca_name[i],n[i]))
    else if((total_sca/total_num>=0.6)&&(total_sca/total_num<=0.7)) N60<-c(N60,c(sca_name[i],n[i])) 
    else if((total_sca/total_num>=0.7)&&(total_sca/total_num<=0.8)) N70<-c(N70,c(sca_name[i],n[i]))
    else if((total_sca/total_num>=0.8)&&(total_sca/total_num<=0.9)) N80<-c(N80,c(sca_name[i],n[i]))
    else if((total_sca/total_num>=0.9)&&(total_sca/total_num<=1)) N90<-c(N90,c(sca_name[i],n[i]))
}
name<-c(N10[2],N20[2],N30[2],N40[2],N50[2],N60[2],N70[2],N80[2],N90[2])
length<-c(N10[3],N20[3],N30[3],N40[3],N50[3],N60[3],N70[3],N80[3],N90[3])
Number<-c("N10","N20","N30","N40","N50","N60","N70","N80","N90")
e<-data.frame(Number,name,length)
write.csv(e,file="D:/N10 to N90.csv")
## 以上代码可以精准的返回一个文件，该文件的内容包括N10-N90的scaffold的序号，名称以及长度.代码的思路主要是：首先将之前得到的scaffold依据长度排序，然后利用for循环相加，并与总长度比较，得到N10-N90
```

```R
change<-function(m)
{
m<-gsub("g","C",m)
m<-gsub("t","A",m)
m<-gsub("a","T",m)
m<-gsub("c","G",m)
}
sca<-1
protein<-0
codGe<-vector(length=length(Genes))
count<-0
for( k in 2:length(Genes))
{
    Gene<-unlist(strsplit(Genes[k],split=""))
    if(Gene[1]==">") 
    {
        codGe[(sca+1):(k-1)]<-Genes[(sca+1):(k-1)]
        sca<-k
    }
}
mm<-which(codGe==FALSE)
codGe<-codGe[-mm]
for(k in 1:(length(codGe)-1))
{
	if(nchar(codGe[k])%%3!=0)
	codGe[k+1]<-str_c(c(str_sub(codGe[k],-(nchar(codGe[k])%%3)),codGe[k+1]),collapse='')
}
Codon1<-sapply(codGe, function(x)substring(x,seq(1,nchar(x),3),seq(3,nchar(x),3)))
Codon1<-unlist(Codon1)
names(Codon1)<-NULL
Codon2<-sapply(codGe, function(x)substring(x,seq(1,nchar(x),3),seq(3,nchar(x),3)))
Codon2<-unlist(Codon2)
names(Codon2)<-NULL
Codon3<-sapply(codGe, function(x)substring(x,seq(1,nchar(x),3),seq(3,nchar(x),3)))
Codon3<-unlist(Codon3)
names(Codon3)<-NULL
codGe<-tolower(codGe)
codGe<-change(codGe)
Codon4<-sapply(codGe, function(x)substring(x,seq(1,nchar(x),3),seq(3,nchar(x),3)))
Codon4<-unlist(Codon4)
names(Codon4)<-NULL
Codon5<-sapply(codGe, function(x)substring(x,seq(1,nchar(x),3),seq(3,nchar(x),3)))
Codon5<-unlist(Codon5)
names(Codon5)<-NULL
Codon6<-sapply(codGe, function(x)substring(x,seq(1,nchar(x),3),seq(3,nchar(x),3)))
Codon6<-unlist(Codon6)
names(Codon6)<-NULL
Codon<-c(Codon1,Codon2,Codon3,Codon4,Codon5,Codon6)
mmm<-which(nchar(Codon)!=3)
c<-Codon[-mmm]
secret<-table(c)
secret<-sort(secret)
write.csv(secret,file="D:/Codon.csv")
## 可以得出密码子选择以及密码子偏好
```

```R
## 首先预测重复序列，之后该代码以之为标准，在全基因组中查找重复的序列，输出的信息包含scaffold的编号，scaffold所包含的该重复序列所在的起始位置，以及重复的次数统计

```

