# Kubernetes Controller Names - YAML vs HTML Commands

## YAML File Names (Correct):
- **Deployment**: `webapp-deployment`
- **ReplicaSet**: `webapp-replicaset` 
- **DaemonSet**: `log-collector`
- **StatefulSet**: `postgres-statefulset`
- **Job**: `data-migration-job`
- **CronJob**: `backup-cronjob`
- **HPA**: `webapp-hpa` (targets `webapp-deployment`)

## HTML Commands Should Use:
```bash
# Deployment
kubectl get deployment webapp-deployment
kubectl scale deployment webapp-deployment --replicas=5
kubectl set image deployment/webapp-deployment webapp=ivykiera/maven-web-app:v2

# ReplicaSet  
kubectl get rs webapp-replicaset
kubectl scale replicaset webapp-replicaset --replicas=5

# DaemonSet
kubectl get ds log-collector
kubectl describe daemonset log-collector

# StatefulSet
kubectl get sts postgres-statefulset
kubectl scale statefulset postgres-statefulset --replicas=5

# Job
kubectl get job data-migration-job
kubectl logs -l app=data-migration

# CronJob
kubectl get cj backup-cronjob
kubectl create job manual-backup --from=cronjob/backup-cronjob

# HPA
kubectl get hpa webapp-hpa
kubectl describe hpa webapp-hpa
```

## Label Selectors:
- **webapp**: `app=webapp`
- **postgres**: `app=postgres`  
- **log-collector**: `app=log-collector`
- **data-migration**: `app=data-migration`
- **backup**: `app=backup`