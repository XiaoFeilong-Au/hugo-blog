---
title: "Git简易指南"
date: 2024-09-06T15:53:13+08:00
draft: false
---

##### 全局配置
```shell
git config --global user.name weilongfei
git config --global user.email 2101667816@qq.com
```

##### 常用操作
```shell
git clone <url> #克隆远程仓库
git init    #初始化本地仓库

git diff <branch1> <branch2>    #对比版本差异
git add . #加入缓存区
git commit -m "commit message"

git reset --hard HEAD   #撤销修改
git checkout <branch>   #切换分支
git revert <commit> #撤销指定提交

git branch -a   #显示所有分支，包括远程origin
git branch <new-branc>  #从当前分支创建新分支
git branch -d   #删除分支

git checkout -b dev origin/dev  #新建本地分支并关联到指定远程分支

git push -u <origin-branch>   #推送
git push -f origin main #推送，强制覆盖
git pull <origin-branch>   #拉取

git stash   #暂存修改，压栈
git stash pop   #暂存修改，出栈

git remote rm origin
git remote add origin <origin-branch>
```