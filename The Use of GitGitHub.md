# The Use of Git/GitHub

## 1.version

​	查看当前git状态

## 2.git init

​	初始化空的储存仓库。

​	即在一个大的文件中创建一个叫做“.git”的文件价，其作用为将文件价中的所有文件保存到“.git”目录中，因此我们可以将“.git”理解为本地的代码仓库。

#### 以我自己使用的方式为例

​	在使用之前我事先在桌面创建一个文件夹 my-project

​	使用windows+R快捷键，输入cmd并确定打开管理命令界面，使用 cd desktop\my-project切换文件夹至my-project

​	对my-project使用git init，既创建成功

## 3.git status

​	(git status -s为状态的简化版)

​	查看当前文件夹的状态。

​	注意到on branch master，意思是我们目前处于一条叫“master”的分枝上

​	同时，文件夹中的文件会以红名的形式显示出来，表明这些文件并没有被commit至暂存区

## 4.git add --all（或者git add 文件名）

​	将文件夹中的文件commit至暂存区

## 5.git commit -m "消息"

​	m表示message

​	windows下 m后面的消息用 双引号包围

​	消息是指代提示自己这次commit的内容有哪些。

#### 注意：

​	在这条使用之前，需要登陆自己的账户和邮箱

​	操作为：

​		git config --global user.name "自己的名字"

​		git config --global user.name "邮箱"

## 6.git rm --cached 需要移除的文件名

​	将不需要的文件移除暂存区，并不是删除，只是不在暂存区

## 7.git log

​	打印出所有提交的信息，这一步并不是特别必要，自己想查看提交的步骤到时候可以查看，方便后续返回

## 8.git revert 版本区的前六位

​	版本区的信息（前六位）可以通过git log查看

## 9.git remote add 服务端名字 仓库地址

​	名字默认为origin，可以随便取名，助于以后操作

​	仓库地址：https://github.com/HFanfan/Fan.git

## 10.git remote -v

​	看remote详细信息

​	可以得到一条fetch和一条push的信息

## 11.git push 服务端名字 分枝的名字

​	服务端名字就是之前的，默认为origin

​	分枝的名字之前默认为master（见上文）

​	将本地文件上传至GitHub服务端，同时第二次使用push的时候不用写远端的名字。

## 12.git pull 服务端名字 分枝的名字