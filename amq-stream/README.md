# 安装AMQ Streams 7.2
其中strimiz 版本为1.6.x

需要cluster-admin权限, 下面操作需要特殊权限:
1) 创建PodMonitor (为了收集Prometheus metrics)
2) 创建cluster-monitor-view的clusterrolebinding(为了给grafanaserviceaccount绑定cluster 角色的 时候用到)
