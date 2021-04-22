# 除了运行argcd/nfs-storage-ocp1.galaxy.yaml 还要运行 
```
oc adm policy add-scc-to-user hostmount-anyuid -z nfs-client-ocp1-galaxy-nfs-subdir-external-provisioner -n nfs-storage
```
