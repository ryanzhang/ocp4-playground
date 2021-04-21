# 控制用户能不能 自己创建命名空间
它并不会把原来的用户的项目管理权限去掉。 

下面这个字段表示的是是否保留之前创建用户的自服务权限。
```yaml
  annotations:
    rbac.authorization.kubernetes.io/autoupdate: "true"
```
## 注意事项 
发现的一个问题，当客户端oc不匹配的时候，会出现oc login 会有问题
