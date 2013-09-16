# Gstar
当我在github上star过的项目超过600个时，我觉得有必要写个工具来帮助我管理这些项目了。
原因很简单github提供的搜索功能过于鸡肋，大部分的时候我都搜索不到我想要找的项目，比如我想
搜索ruby的markdown库，通过markdown这个单词我只能搜索到一个叫miclle/Markdown-Editor
的项目，原因是github只允许通过项目名搜索。使用Gstar，我们可以通过项目名，项目描述搜索代码，
并且可以根据自己对项目的的理解修改项目描述，这样可以帮助我们更加快速地找到自己需要的代码。

## 从github拉项目

## angularJS对搜索的支持，类似google搜索的那种页面渲染的效果
用户在搜索框输入要搜索的关键字，然后点击搜索，页面不需要刷新就能显示出搜索结果
### 算法
1.参考资料
- [ngSubmit](http://docs.angularjs.org/api/ng.directive:ngSubmit)
- [AngulaJS search](https://github.com/daha/angularJS-github-contributors)
## 将项目以列表的方式在页面上展示
1. 显示项目名
2. 项目名是一个链接，指向项目在github上的代码库
3. 显示项目描述

