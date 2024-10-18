# docker-nginx-hfproxy

nginx 镜像脚本，部署为 Azure 的 webapp 应用，免费中转 huggingface 的接口



## 步骤：

- 创建自定义 nginx 镜像，增加代理规则，见 Dockerfile
- 创建镜像 docker build -t xxx/hgproxy .
- 上传镜像到 docker hub
- 在 Azure 创建 Web 应用（容器类型的）
  - 填入镜像的名称
  - 使用 azure 分配的域名访问



### 创建 web 应用

<img src="img\1.png" alt="创建web应用" style="zoom:50%;" />



### 选择“容器”型

注意用免费的定义计划  

<img src="img\2.png" alt="1" style="zoom:50%;" />



### 填入镜像地址

<img src="img\3.png" alt="1" style="zoom:50%;" />

### 访问

使用 azure 给 web 应用自动分配的默认域访问  

形似 xxx .azurewebsites.net
