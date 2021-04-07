<img src="../../../img/logo.png" alt="Chmurowisko logo" width="200" align="right">
<br><br>
<br><br>
<br><br>

# Traffic Mirroring

## LAB Overview

#### In this lab you will traffic mirroring of your application



1. Deploy sample applications
```
kubectl apply -f 1_services.yaml
```

2. Deploy Virtual Service and Destination Rules:
```
kubectl apply -f 2_virtual_services.yaml
```

5. Run kiali:
```
istioctl dashboard kiali
```

4. Open another terminal window and enter on an existing pod in srv namespace:
```
kubectl exec -it <POD_ID> -- bash
```
5. Install curl:
```
apt update
apt install curl
```
6. Make some http calls and observe them in kiali:
```
curl service.srv.svc.cluster.local:5000
```
7. Apply mirroring to you service:
```
kubectl apply -f 3_mirroring.yaml
```
8. Make some hhtp calls again and observe changes in kiali:
```
curl service.srv.svc.cluster.local:5000
```
## END LAB
<br><br>
<center><p>&copy; 2019 Chmurowisko Sp. z o.o.<p></center>
