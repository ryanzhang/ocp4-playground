# for nfs-storage to proceed
it needs hostmount-anyuid priviledged

```
oc adm policy add-scc-to-user hostmount-anyuid -z nfs-client-ocp1-galaxy-nfs-subdir-external-provisioner -n nfs-storage
```
