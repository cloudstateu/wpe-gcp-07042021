<img src="../../../img/logo.png" alt="Chmurowisko logo" width="200" align="right">
<br><br>
<br><br>
<br><br>

# HTTP Authorization

## LAB Overview

#### In this lab you will add a HTTP authorization for your services

![application](img/app_components.png)

## Task 1: Enforcing mTLS for the namespace

1. Open any browser of your choice and open following urls:
* ``<YOUR-INGRESS-IP>/app1``
* ``<YOUR-INGRESS-IP>/srv1``
* ``<YOUR-INGRESS-IP>/srv2``
All services should still be accessible.

2. Create new namespace without a sidecar:
```
kubectl create ns debug
```
3. Create debug container:
```
kubectl run curl --image=radial/busyboxplus:curl -i --tty --rm -n debug
```
4. Verify that you can connect from debug container to srv1:
```
curl srv1-svc.crv:5000
```
5. Open another terminal window and enter on app1 running container (replace app1-XXX with the name of your app1 pod):
```
kubectl exec -it -n srv app1-XXX -- bash
```
6. Install curl:
```
apt update
apt install curl
```
7. Verify that you can connect from app1 pod to srv1:
```
curl srv1-svc.crv:5000
```
8. Download [a manifest file](files/1_strict_mTLS.yaml) and apply it:
```
kubectl apply -f 1_strict_mTLS.yaml
```
This rule enforces mTLS on your srv namespace. HTTP traffic is not allowed.

9. Verify again that you can still connect from app1 pod to srv1:
```
curl srv1-svc.crv:5000
```
10. Go back to your previous terminal window.
11. Verify that you cannot connect from debug container to srv1:
```
curl srv1-svc.crv:5000
```

## Task2: Securing all services
1. Download [deny all traffic manifest file](files/2_deny_all.yaml) and applu it to the cluster by executing
```
kubectl apply -f 2_deny_all.yaml
```
2. Try refreshing the web page in the browser. After a while, you should get a **RBAC: access denied** error.

## Task 3: Opening *app1* to the world
1. Doanload [a manifest file](files/3_app1_view.yaml) and apply it to the cluster by executing:
```
kubectl apply -f 3_app1_view.yaml
```
2. Try refreshing the web page. *app1* should be accessible, but both *srv1* and *srv2* not.

## Task 4: Opening *srv1* and *srv2* for the *app1* service.

1. Download [a manifest file](files/4_service1.yaml) and apply it by executing:
```
kubectl apply -f 4_service1.yaml
```
Now, when you refresh the web page ``<YOUR-INGRESS-IP>/app1`` there should be the answer from *srv1* included in the response.

2. For *srv2* download [this manifest file](files/5_service2.yaml) and apply it by executing:
```
kubectl apply -f 5_service2.yaml
```
Now, there should be both *sr1* and *srv2* responses included.

Try opening ``<YOUR-INGRESS-IP>/srv1`` and ``<YOUR-INGRESS-IP>/srv2``. You should get the **RBAC: access denied** error.

## Task 5: Cleaning up.
1. Remove all authorization policies by executing following commands:
* kubectl delete -f 1_strict_mTLS.yaml
* kubectl delete -f 2_deny_all.yaml
* kubectl delete -f 3_app1_view.yaml
* kubectl delete -f 4_service1.yaml
* kubectl delete -f 5_service2.yaml
## END LAB

<br><br>
<center><p>&copy; 2019 Chmurowisko Sp. z o.o.<p></center>
