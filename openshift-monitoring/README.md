# 指定义监控
文档: https://docs.openshift.com/container-platform/4.7/monitoring/configuring-the-monitoring-stack.html 

步骤
## enable openshift-user-workload-monitoring
oc apply -f cluster-monitoring-config.yaml

## 打开权限
在被监测项目中 用rolebinding 绑定 项目用户
monitor-edit权限， 请查看 AppMonitoring-User-RoleBinding.yaml


同时也可以在 openshift-user-workload-monitoring项目赋予

**user-workload-monitoring-config-edit**

角色权限

查看: **user-workload-monitoring-admin-rolebindings.yaml**

## 部署自己的应用
注意一定需要是/metrics rest endpoint

oc apply -f prometheus-example-app.yaml
## 部署 servicemonitor
```yaml
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  labels:
    k8s-app: prometheus-example-monitor
  name: prometheus-example-monitor
  namespace: sandbox
spec:
  endpoints:
  - interval: 30s
    port: web <-注意这里是service 的port的名字，不是端口号
    scheme: http
  selector:
    matchLabels:
      app: prometheus-example-app <-注意这里是service的label 而不是Pod的label

```
它就是通过service进行Label match来查找metrics;


