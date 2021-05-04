# 调试大法
增加root权限
```
oc adm policy add-scc-to-user previleged -z default
clusterrole.rbac.authorization.k8s.io/system:openshift:scc:previleged added: "default"
```

# oc 调试命令
```
oc debug $POD_NAME --as-root
```
