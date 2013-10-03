# Gstar
gstar, 帮助我们搜索在github上star过的项目

## 安装

1. git clone https://github.com/baya/Gstar.git

2. cd Gstar/ground

3. bundle install

4. cp config/github.example.yml config/github.yml

在config/github.yml里有三个配置，其中access_token可以不填写，login和password是你用来登录github的用户名和密码，填好login和password后，运行下面的任务:

# 将你star过的项目从github拉到本地数据库
5. rake maintain:pull_stars_from_github

# 启动定时任务，每分钟检查一次你是否有新的star项目
6. whenever --update

7. rackup -p 9292

8. 使用你喜爱的浏览器访问 http://localhost:9292

注意操作3到7都是在Gstar/ground目录下进行的。

## 功能特点

### 准确快速的搜索

github自带的搜星功能不是特别好用，比如说我想找出我收藏的(github的标星功能对我来说就是收藏)和markdown有关的项目，使用github自带的搜星功能只能找到一个叫miclle/Markdown-Editor的项目，因为github是通过项目的名字进行搜索，这导致很多与markdwon有关的项目被忽略了，使用Gstar搜索markdwon能找到11个与markdown有关的项目，因为Gstar对项目名和项目描述进行搜索，这样比github更准确些。

github的搜星:

![](/Users/jim/Desktop/Snip20131003_1.png)

### 可以修改项目的描述(description)，实现类似于打标签的功能

比如说我给karmi/tire这个项目的描述加上"搜索"，那么我就可以通过搜索"搜索"找到tire这个项目了。






