#!/bin/bash
# Kubernetes Controllers Demo Commands

echo "=== Kubernetes Controllers Teaching Demo ==="

# 1. DEPLOYMENT CONTROLLER
echo "1. Deployment Controller Demo"
kubectl apply -f 01-deployment-controller.yaml
kubectl get deployments
kubectl get replicasets
kubectl get pods -l app=webapp
kubectl describe deployment webapp-deployment

# Scale deployment
kubectl scale deployment webapp-deployment --replicas=5
kubectl get pods -l app=webapp

# Rolling update
kubectl set image deployment/webapp-deployment webapp=ivykiera/maven-web-app:v2
kubectl rollout status deployment/webapp-deployment
kubectl rollout history deployment/webapp-deployment

# Rollback
kubectl rollout undo deployment/webapp-deployment
kubectl rollout status deployment/webapp-deployment

echo "Press Enter to continue to ReplicaSet demo..."
read

# 2. REPLICASET CONTROLLER
echo "2. ReplicaSet Controller Demo"
kubectl apply -f 02-replicaset-controller.yaml
kubectl get replicasets
kubectl get pods -l app=webapp,version=v1

# Delete a pod to see ReplicaSet recreate it
POD_NAME=$(kubectl get pods -l app=webapp,version=v1 -o jsonpath='{.items[0].metadata.name}')
kubectl delete pod $POD_NAME
kubectl get pods -l app=webapp,version=v1

echo "Press Enter to continue to DaemonSet demo..."
read

# 3. DAEMONSET CONTROLLER
echo "3. DaemonSet Controller Demo"
kubectl apply -f 03-daemonset-controller.yaml
kubectl get daemonsets
kubectl get pods -l app=log-collector -o wide
kubectl describe daemonset log-collector

echo "Press Enter to continue to StatefulSet demo..."
read

# 4. STATEFULSET CONTROLLER
echo "4. StatefulSet Controller Demo"
kubectl apply -f 04-statefulset-controller.yaml
kubectl get statefulsets
kubectl get pods -l app=postgres
kubectl get pvc

# Show ordered creation and stable network identities
kubectl describe statefulset postgres-statefulset

echo "Press Enter to continue to Job demo..."
read

# 5. JOB CONTROLLER
echo "5. Job Controller Demo"
kubectl apply -f 05-job-controller.yaml
kubectl get jobs
kubectl get pods -l app=data-migration
kubectl logs -l app=data-migration

echo "Press Enter to continue to CronJob demo..."
read

# 6. CRONJOB CONTROLLER
echo "6. CronJob Controller Demo"
kubectl apply -f 06-cronjob-controller.yaml
kubectl get cronjobs
kubectl describe cronjob backup-cronjob

echo "Press Enter to continue to HPA demo..."
read

# 7. HORIZONTAL POD AUTOSCALER
echo "7. HPA Controller Demo"
kubectl apply -f 07-hpa-controller.yaml
kubectl get hpa
kubectl describe hpa webapp-hpa

# Generate load to trigger scaling
kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://webapp-deployment:8080/; done"

echo "=== Cleanup ==="
kubectl delete -f .
kubectl delete pvc --all

echo "Demo completed!"