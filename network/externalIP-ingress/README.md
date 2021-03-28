# OpenShift Service
容器内服务绑定 externalIP 创建的svc时候需要管理员权限

同时也可以 在Network  CR 设置对外绑定IP的白名单和黑名单;
``` yaml
oc edit Network cluster
apiVersion: config.openshift.io/v1
kind: Network
metadata:
    name: cluster
spec:
  clusterNetwork:
  - cidr: 10.217.0.0/22
    hostPrefix: 23
  externalIP:
    policy:
      allowedCIDRs:
      - 192.168.130.0/24
```
这些IP是必须能够陆游道集群节点的IP; 它比node port方式要好的地方在于可控；

绑定externalIP 包含两种方式
* 自动分配池子IP
* 手动指定IP

# 例子
* A
在容器里面启一个externalip service 绑定worker节点ip地址 端口指向postgre数据库
* B
在VM里面启一个进程 消费 worker节点ip 的5432接口

