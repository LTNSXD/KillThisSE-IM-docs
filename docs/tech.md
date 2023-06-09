# 技术选型与部署

## 技术选型

### 前端

前端代码的整体框架为 React，测试框架为 Jest，UI 设计采用了 SweetAlert2 库对提示信息进行了优化，代码风格上则是采用 ESLint 作为代码检测工具，以规范和统一组内成员的代码风格。

网络协议方面，我们在实时通讯模块采用了 Websocket 协议，将 Websocket 链接的构造、析构以及各种回调封装为 Socket 类从而方便地实现客户端与服务端的双向通信。

### 后端

后端基于django与django rest framework进行编写。测试框架采用pytest。生产环境中，我们使用uWSGI部署WSGI，daphne部署Websocket相关的ASGI。

django rest framework具有方便的鉴权功能，在IM中，由于我们需要频繁的验证用户身份，这为开发带来了便利

### 数据库

数据库使用MySQL 5.7。

### 文档

技术文档基于MkDocs进行编写。

## 部署

本项目基于 SECoder 的 deployer 工具进行容器的构建和部署。

关于数据库部署，由于 SECoder 直接拉取官方镜像无法挂载密码环境变量，这会导致数据库不可登录。于是我们基于官方镜像自行定制了挂载了 root 密码环境变量和初始化 sql 文件的 MySQL 5.7 镜像，将其部署到了 SECoder 容器中。

关于Redis部署，我们直接拉取了官方镜像redis:5，并将其部署到了SECoder容器中。
