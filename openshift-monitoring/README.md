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

# 自定义Dashboard
## 安装自定义dashboard
* 通过operatorHub安装grafana
* my-grafana是自定义的dashbaord，区别于平台提供的,OCP4平台提供的grafana是只读的,目录里面还包含自定义的dashboard CR文件和raw json文件
```bash
helm upgrade --install my-grafana my-grafana/ -n my-grafana
```

## 通过Helm安装serviceMonitor
* prmetheus-external-service 是一个chart 用来安装external-service的代理服务 从而可以被Prometheus监控
```bash
helm upgrade --install external-service external-service -n external-service 
```




