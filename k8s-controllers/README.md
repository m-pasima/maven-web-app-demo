# Kubernetes Controllers Learning Guide

## Overview
This directory contains practical examples of all major Kubernetes controllers with hands-on demonstrations.

## Controllers Included

### 1. **Deployment Controller** (`01-deployment-controller.yaml`)
- **Purpose**: Manages ReplicaSets and provides declarative updates
- **Use Case**: Stateless applications, rolling updates, rollbacks
- **Key Features**: Rolling updates, rollback capability, replica management

### 2. **ReplicaSet Controller** (`02-replicaset-controller.yaml`)
- **Purpose**: Maintains desired number of pod replicas
- **Use Case**: Usually managed by Deployments, direct use rare
- **Key Features**: Pod replica management, label selectors

### 3. **DaemonSet Controller** (`03-daemonset-controller.yaml`)
- **Purpose**: Ensures one pod runs on each node
- **Use Case**: Log collectors, monitoring agents, storage daemons
- **Key Features**: Node-level deployment, automatic scheduling

### 4. **StatefulSet Controller** (`04-statefulset-controller.yaml`)
- **Purpose**: Manages stateful applications
- **Use Case**: Databases, distributed systems requiring stable identities
- **Key Features**: Ordered deployment, stable network identities, persistent storage

### 5. **Job Controller** (`05-job-controller.yaml`)
- **Purpose**: Runs pods to completion
- **Use Case**: Batch processing, data migration, one-time tasks
- **Key Features**: Completion tracking, retry logic, parallel execution

### 6. **CronJob Controller** (`06-cronjob-controller.yaml`)
- **Purpose**: Runs jobs on schedule
- **Use Case**: Backups, reports, periodic maintenance
- **Key Features**: Cron-based scheduling, job history management

### 7. **HPA Controller** (`07-hpa-controller.yaml`)
- **Purpose**: Automatically scales pods based on metrics
- **Use Case**: Auto-scaling based on CPU/memory/custom metrics
- **Key Features**: Metric-based scaling, min/max replicas

## Quick Demo Commands

```bash
# Apply all controllers
kubectl apply -f k8s-controllers/

# Watch controllers in action
kubectl get all -w

# Check controller status
kubectl get deployments,replicasets,daemonsets,statefulsets,jobs,cronjobs,hpa

# Cleanup
kubectl delete -f k8s-controllers/
```

## Teaching Scenarios

### Scenario 1: Controller Hierarchy
```bash
# Show how Deployment creates ReplicaSet
kubectl apply -f 01-deployment-controller.yaml
kubectl get deployments,replicasets,pods
```

### Scenario 2: Self-Healing
```bash
# Delete a pod and watch it recreate
kubectl delete pod <pod-name>
kubectl get pods -w
```

### Scenario 3: Scaling
```bash
# Manual scaling
kubectl scale deployment webapp-deployment --replicas=5

# Auto-scaling with HPA
kubectl apply -f 07-hpa-controller.yaml
```

### Scenario 4: Updates
```bash
# Rolling update
kubectl set image deployment/webapp-deployment webapp=nginx:1.21
kubectl rollout status deployment/webapp-deployment

# Rollback
kubectl rollout undo deployment/webapp-deployment
```

## Controller Decision Matrix

| Use Case | Controller | Why |
|----------|------------|-----|
| Web Application | Deployment | Stateless, needs updates |
| Database | StatefulSet | Needs persistent storage, stable identity |
| Log Agent | DaemonSet | Must run on every node |
| Backup Task | CronJob | Scheduled execution |
| Data Migration | Job | One-time completion |
| Auto-scaling | HPA | Dynamic resource adjustment |

## Monitoring Commands

```bash
# Watch all resources
kubectl get all -w

# Describe controllers
kubectl describe deployment <name>
kubectl describe replicaset <name>
kubectl describe daemonset <name>

# Check events
kubectl get events --sort-by=.metadata.creationTimestamp

# Resource usage
kubectl top pods
kubectl top nodes
```
