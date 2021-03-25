# 建立htpasswd用户密码
htpasswd -cBb htpasswd admin admin
继续添加developer:developer
htpasswd -Bb htpasswd developer developer
创建的文件放在./htpasswd 文件中;

oc create secret generic htpass-secret --from-file htpasswd=./htpasswd -n openshift-config

如果没有OAuth CR 资源
oc apply -f htpassword-cr.yaml
