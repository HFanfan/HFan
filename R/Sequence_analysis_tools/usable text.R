##inputΪfasta��ʽ���ݿ����ƣ�������Ϊ���������Ϣ���ļ����������ݡ�Ϊ���������
##�ļ���N10-90��Ϊscaffold������Ϣ��������������D��
bas_genome<-function(input){
Genes<-readLines(input)
Genes<-toupper(Genes)
Genes[length(Genes)+1]<-">"
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
write.csv(e,file="D:/genoJudge.csv")
}
##�ú���Ϊ��ѯscaffold���������С�fastfileҪ��Ϊfasta��ʽ�ļ���numΪ��Ҫ�����
##�ڼ���scaffold��xΪ�ӵڼ��������ʼ��yΪ�ӵڼ������������c1-c4Ϊ�߼�ֵ����
##c1Ϊ��T����ʱ�����scaffold�����ƣ�c2��c3�ֱ��Ӧ��ʼ�ͽ��������Ϊ��T����ʱ��
##�����ʼ�ͽ��������c4Ϊ��T��ʱ�����������Ϊ��F��ʱ�����������
geneInf<-function(fastfile,num,x,y,c1,c2,c3,c4)
{
  genes<-readLines(fastfile)
  Genes<-genes
  Genes[length(genes)+1]<-">"
  N.S<-0
  n.s<-0
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
      K[N.S+1]<-k
    }
  }
  sca_name<- sca_name[1:(length(sca_name)-1)]
  name<-sca_name[num]
  sca<-Genes[(K[num]+1):(K[num+1]-1)]
  sca<-unlist(strsplit(sca,split=""))
  s<-toupper(sca[x])
  e<-toupper(sca[y])
  change<-function(m)
  {
    m<-gsub("g","C",m)
    m<-gsub("t","A",m)
    m<-gsub("a","T",m)
    m<-gsub("c","G",m)
  }
  sca[x:y]<-tolower(sca[x:y])
  PSeq<-sca[x:y]
  POutputSeq<-toupper(paste(PSeq,collapse=""))
  NSeq<-change(PSeq)
  NOutputSeq<-paste(NSeq,collapse="")
  if(c1=="T")  cat(name)
  if(c4=="T")  cat("+",POutputSeq)
  if(c4=="F")  cat("-",NOutputSeq)
  if(c2=="T")  cat(" ",s)
  if(c3=="T")  cat(" ",e)
}
##�ú���Ϊ��ѯscaffold���У�Ҫ������Ϊfasta��ʽ�ļ��Լ���Ҫ��ѯ��scaffold������
output_seq<-function(fastfile,name)
{
  genes<-readLines(fastfile)
  Genes<-genes
  Genes[length(genes)+1]<-">"
  N.S<-0
  n.s<-0
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
      K[N.S+1]<-k
    }
  }
  sca_name<- sca_name[1:(length(sca_name)-1)]
  for(i in 1:length(sca_name))
  {
    if(name==sca_name[i])
      {cat(Genes[(K[i]+1):(K[i+1]-1)])
      break}
    i=i+1
  }
}
##�ú���Ϊ��ѯscaffold����������ƫ���ԣ�Ҫ������Ϊfasta��ʽ�ļ��Լ���Ҫ��ѯ��
##scaffold������
output_codon_pre<-function(fastfile,name)
{
  library(stringr)
  genes<-readLines(fastfile)
  change<-function(m)
  {
    m<-tolower(m)
    m<-gsub("g","C",m)
    m<-gsub("t","A",m)
    m<-gsub("a","T",m)
    m<-gsub("c","G",m)
  }
  Genes<-genes
  Genes[length(genes)+1]<-">"
  N.S<-0
  n.s<-0
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
      K[N.S+1]<-k
    }
  }
  sca_name<- sca_name[1:(length(sca_name)-1)]
  for(i in 1:length(sca_name))
  {
    if(name==sca_name[i])
    {
      codGe<-str_c(Genes[(K[i]+1):(K[i+1]-1)],collapse='')
      break
    }
    i=i+1
  }
  Codon1<-sapply(codGe, function(x)substring(x,seq(1,nchar(x)-2,1),seq(3,nchar(x),1)))
  codGe<-change(codGe)
  Codon1<-toupper(Codon1)
  Codon2<-sapply(codGe, function(x)substring(x,seq(1,nchar(x)-2,1),seq(3,nchar(x),1)))
  Codon2<-toupper(Codon2)
  a<-table(c(Codon1,Codon2))
}
##ת¼������fasta�ļ���ʽ�ļ�������fasta�ļ�
trans<-function(input)
{
  genes<-readLines(input)
  change<-function(m)
  {
    m<-tolower(m)
    m<-gsub("g","C",m)
    m<-gsub("t","A",m)
    m<-gsub("a","T",m)
    m<-gsub("c","G",m)
  }
  mRNA<-sapply(genes,change)
  write.table(d,file="D:/mRNA.fna")
}
##ģ��ø�У�����scaffold���ƣ�inputΪø��ʶ��λ�㣬��ע�и�λ��,input1Ϊ�и��
##��벿�֣�input2Ϊ�и��ǰ�벿�֣�ע��inputΪ��д��ĸ��input1���������и�㡣
##��Ҫע����ǣ����ø��λ���м��ԣ�������[AGCTN]�滻��Ӧλ��ļ��������ĳ
##ĳø��λ��Ϊ��ATNGNG"����N���и������inputΪ��AT[ATCGN]G[ATCGN]G����3���ɡ�
enzyme<-function(fastfile,scaffold_name,input,input1)
{
library(stringr)
genes<-readLines(fastfile)
Genes<-genes
Genes[length(genes)+1]<-">"
N.S<-0
n.s<-0
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
    K[N.S+1]<-k
  }
}
sca_name<- sca_name[1:(length(sca_name)-1)]
for(i in 1:length(sca_name))
{
  if(scaffold_name==sca_name[i])
  {
    codGe<-str_c(Genes[(K[i]+1):(K[i+1]-1)],collapse='')
    break
  }
  i=i+1
}
codGe<-toupper(codGe)
b<-unlist(str_locate_all(codGe,input))
start<-1
end<-2
for(i in 1:(length(b)/2))
{
  end<-b[i]+input1-1
  c[i]<-str_sub(codGe,start,end)
  start<-b[i]+input1
}
fina<-str_sub(codGe,(b[length(b)/2]+input1),nchar(codGe))
c<-c(c,fina)
for(i in 1:length(c))
{
  cat(i,c[i],nchar(c[i]),"\n")
}
}