# 学习曲线
tekton 概念比较多, 相当于要替换掉 jenkins的众多功能，学习应该循序渐进；

## hello world
理解 tekton task, parmeter, pipeline 脚本概念，以及运行顺序，以及并行
同时 理解每一个task都是一个独立的容器任务 taskrun

hello-world里面的例子来源于下面:

```
04:37:24 rzhang@razorcrest demo ±|master|→ tkn task start --showlog hello
TaskRun started: hello-run-9kf4m
Waiting for logs to be available...
[say-hello] Hello World
...
04:43:57 rzhang@razorcrest demo ±|master|→ oc get po
NAME                                               READY   STATUS      RESTARTS   AGE
hello-run-9kf4m-pod-jxx7c                          0/1     Completed   0          6m7s
hello-run-dsfqp-pod-pzvw4                          0/1     Completed   0          4m48s
say-something-run-qp9bf-pod-b8s5d                  0/1     Error       0          2m18s
say-something-run-swbvn-pod-wnqb8                  0/1     Completed   0          111s
say-things-run-7v288-first-task-xdp8t-pod-6zm5f    0/1     Completed   0          58s
say-things-run-7v288-second-task-99w4d-pod-fvz9z   0/1     Completed   0          58s
04:44:15 rzhang@razorcrest demo ±|master|→ oc apply -f 06bash: _filedir: command not found
-pipeline-order.yaml
pipeline.tekton.dev/say-things-in-order created
04:44:40 rzhang@razorcrest demo ±|master|→ tkn pipeline start say-things-in-order --showlog
PipelineRun started: say-things-in-order-run-2h2xb
Waiting for logs to be available...
[first-task : say-it] Hello, this is the first task

[second-task : say-it] Happening after task 1, in parallel with task 3
[third-task : say-it] Happening after task 1, in parallel with task 2


[fourth-task : say-it] Happening after task 2 and 3

04:45:53 rzhang@razorcrest demo ±|master|→ oc get po
NAME                                                        READY   STATUS      RESTARTS   AGE
hello-run-9kf4m-pod-jxx7c                                   0/1     Completed   0          7m48s
hello-run-dsfqp-pod-pzvw4                                   0/1     Completed   0          6m29s
say-something-run-qp9bf-pod-b8s5d                           0/1     Error       0          3m59s
say-something-run-swbvn-pod-wnqb8                           0/1     Completed   0          3m32s
say-things-in-order-run-2h2xb-first-task-fdgsz-pod-g2pnm    0/1     Completed   0          44s
say-things-in-order-run-2h2xb-fourth-task-5ltdt-pod-sm6bt   0/1     Completed   0          21s
say-things-in-order-run-2h2xb-second-task-c4mwp-pod-wmfkt   0/1     Completed   0          36s
say-things-in-order-run-2h2xb-third-task-8mgqf-pod-2mmrp    0/1     Completed   0          36s
say-things-run-7v288-first-task-xdp8t-pod-6zm5f             0/1     Completed   0          2m39s
say-things-run-7v288-second-task-99w4d-pod-fvz9z            0/1     Completed   0          2m39s

04:55:28 rzhang@razorcrest helloworld ±|master ✗|→ oc apply -f 07bash: _filedir: command not found
-pipelineresource.yaml
task.tekton.dev/count-files created
pipeline.tekton.dev/count created
pipelineresource.tekton.dev/git-repo created

04:57:25 rzhang@razorcrest helloworld ±|master ✗|→ tkn pipeline start count --showlog
? Choose the git resource to use for git-repo: git-repo (https://github.com/joellord/handson-tekton.git)
PipelineRun started: count-run-kps8w
Waiting for logs to be available...
[count-task : git-source-repo-848z4] {"level":"info","ts":1620550671.3577144,"caller":"git/git.go:169","msg":"Successfully cloned https://github.com/joellord/handson-tekton.git @ 0f1518c2b6b21024b956572bcb20a7e01bded1a4 (grafted, HEAD) in path /workspace/code"}
[count-task : git-source-repo-848z4] {"level":"info","ts":1620550671.3991024,"caller":"git/git.go:207","msg":"Successfully initialized and updated submodules in path /workspace/code"}

[count-task : count] 60 files in repo
```


https://developers.redhat.com/blog/2021/01/13/getting-started-with-tekton-and-pipelines/

https://github.com/joellord/handson-tekton 

## build-tekton
常见的语言项目构建模版


# 默认Openshift pipeline 安装了那些东西
## 基本组建都有了 包括 trigger, eventlistner

## 自带的tasks
```
03:55:02 rzhang@razorcrest ~ → oc get clustertasks
NAME                       AGE
buildah                    3h45m
buildah-v0-22-0            3h45m
git-cli                    3h45m
git-clone                  3h45m
git-clone-v0-22-0          3h45m
helm-upgrade-from-repo     3h45m
helm-upgrade-from-source   3h45m
jib-maven                  3h45m
kn                         3h45m
kn-apply                   3h45m
kn-apply-v0-22-0           3h45m
kn-v0-22-0                 3h45m
kubeconfig-creator         3h45m
maven                      3h45m
openshift-client           3h45m
openshift-client-v0-22-0   3h45m
pull-request               3h45m
s2i-dotnet                 3h45m
s2i-dotnet-v0-22-0         3h45m
s2i-go                     3h45m
s2i-go-v0-22-0             3h45m
s2i-java                   3h45m
s2i-java-v0-22-0           3h45m
s2i-nodejs                 3h45m
s2i-nodejs-v0-22-0         3h45m
s2i-perl                   3h45m
s2i-perl-v0-22-0           3h45m
s2i-php                    3h45m
s2i-php-v0-22-0            3h45m
s2i-python                 3h45m
s2i-python-v0-22-0         3h45m
s2i-ruby                   3h45m
s2i-ruby-v0-22-0           3h45m
skopeo-copy                3h45m
skopeo-copy-v0-22-0        3h45m
tkn                        3h45m
trigger-jenkins-job        3h45m
```
## 没有的东西包括


## 构建一个java 应用


