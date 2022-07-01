Create a configmap named config with values foo=lala,foo2=lolo

`k -n mynamespace create cm config --from-literal=foo=lala --from-literal=foo2=lolo`
get its value
`k -n mynamespace get cm config -o yaml`
Create a configMap called 'options' with the value var5=val5. Create a new nginx deployment that loads the value from variable 'var5' in an env variable called 'option'
`k -n mynamespace create cm options --from-literal=var5=value5`
`k -n mynamespace create deploy nginxdep --image=nginx --port=80 --dry-run=client -o yaml > nginxdep.yaml`
now edit nginxdep.yaml 
now check the env variable -> `k -n mynamespace exec -it nginxdep-68cdf95c4b-mlcl5 -- env`

Create a configMap 'anotherone' with values 'var6=val6', 'var7=val7'. Load this configMap as env variables into a new nginx pod
Using envFrom for configmap - > 
`k -n mynamespace create cm anotherone --from-literal=var6=val6 --from-literal=var7=val7`
`k -n mynamespace create deploy nginxdeploy2 --image=nginx --port=80 --dry-run=client -o yaml > nginxdeploy2.yaml`

Create a configMap 'cmvolume' with values 'var8=val8', 'var9=val9'. Load this as a volume inside an nginx pod on path '/etc/lala'. Create the pod and 'ls' into the '/etc/lala' directory.

```
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: nginx
spec:
  volumes: # add a volumes list
  - name: myvolume # just a name, you'll reference this in the pods
    configMap:
      name: cmvolume # name of your configmap
  containers:
  - image: nginx
    imagePullPolicy: IfNotPresent
    name: nginx
    resources: {}
    volumeMounts: # your volume mounts are listed here
    - name: myvolume # the name that you specified in pod.spec.volumes.name
      mountPath: /etc/lala # the path inside your container
  dnsPolicy: ClusterFirst
  restartPolicy: Never
status: {}
```

Create an nginx pod with requests cpu=100m,memory=256Mi and limits cpu=200m,memory=512Mi
```
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: nginx
spec:
  containers:
  - image: nginx
    name: nginx
    resources:
      requests:
        memory: "256Mi"
        cpu: 100m
      limits:    
        memory: "512Mi"
        cpu: 200m
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```
secret -> 
`kubectl create secret generic mysecret --from-literal=password=mypass`
`k -n mynamespace create secret generic dm --from-literal=name=dipesh --from-literal=ln=majumdar`

decode -> `echo -n YWRtaW4= | base64 -d`

mounting secret in pod -> 

```
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: nginx
spec:
  volumes: # specify the volumes
  - name: foo # this name will be used for reference inside the container
    secret: # we want a secret
      secretName: mysecret2 # name of the secret - this must already exist on pod creation
  containers:
  - image: nginx
    imagePullPolicy: IfNotPresent
    name: nginx
    resources: {}
    volumeMounts: # our volume mounts
    - name: foo # name on pod.spec.volumes
      mountPath: /etc/foo #our mount path
  dnsPolicy: ClusterFirst
  restartPolicy: Never
status: {}
```

sa -> 
```
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: nginx
spec:
  serviceAccount: myuser # we use pod.spec.serviceAccount
  containers:
  - image: nginx
    imagePullPolicy: IfNotPresent
    name: nginx
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Never
status: {}
```
