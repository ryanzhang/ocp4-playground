# install nfs storageclass
Check https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner 

```bash
helm install stable/nfs-client-provisioner --set nfs.server=nfs.lmc --set nfs.path=/exported/ocp1.lmc.io
```
nfs-client is created

##设置为缺省的class
oc  patch storageclass nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

## Enable imageregistry
编辑imageregistry cluster 为managed状态
并且配置存储
