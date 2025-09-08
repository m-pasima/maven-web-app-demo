#!/bin/bash
# Interactive Kubernetes Controllers Demo

clear
echo "🚀 Kubernetes Controllers Interactive Demo"
echo "=========================================="

show_menu() {
    echo ""
    echo "Select a controller to demonstrate:"
    echo "1) Deployment Controller"
    echo "2) ReplicaSet Controller" 
    echo "3) DaemonSet Controller"
    echo "4) StatefulSet Controller"
    echo "5) Job Controller"
    echo "6) CronJob Controller"
    echo "7) HPA Controller"
    echo "8) Compare All Controllers"
    echo "9) Cleanup All"
    echo "0) Exit"
    echo ""
}

deployment_demo() {
    echo "📦 Deployment Controller Demo"
    echo "Creating deployment with 3 replicas..."
    kubectl apply -f 01-deployment-controller.yaml
    
    echo "Watching deployment creation..."
    kubectl get deployments,replicasets,pods -l app=webapp
    
    echo "Scaling to 5 replicas..."
    kubectl scale deployment webapp-deployment --replicas=5
    kubectl get pods -l app=webapp
    
    echo "Rolling update to maven-web-app:v2..."
    kubectl set image deployment/webapp-deployment webapp=ivykiera/maven-web-app:v2
    kubectl rollout status deployment/webapp-deployment
    
    echo "Deployment demo complete!"
}

replicaset_demo() {
    echo "🔄 ReplicaSet Controller Demo"
    kubectl apply -f 02-replicaset-controller.yaml
    kubectl get replicasets,pods -l app=webapp,version=v1
    
    echo "Deleting one pod to show self-healing..."
    POD=$(kubectl get pods -l app=webapp,version=v1 -o jsonpath='{.items[0].metadata.name}')
    kubectl delete pod $POD
    echo "Watching pod recreation..."
    kubectl get pods -l app=webapp,version=v1 -w --timeout=30s
}

daemonset_demo() {
    echo "🌐 DaemonSet Controller Demo"
    kubectl apply -f 03-daemonset-controller.yaml
    echo "DaemonSet ensures one pod per node:"
    kubectl get daemonsets,pods -l app=log-collector -o wide
}

statefulset_demo() {
    echo "🗄️ StatefulSet Controller Demo"
    kubectl apply -f 04-statefulset-controller.yaml
    echo "StatefulSet creates ordered, stable pods:"
    kubectl get statefulsets,pods -l app=postgres
    echo "Persistent volumes:"
    kubectl get pvc
}

job_demo() {
    echo "⚡ Job Controller Demo"
    kubectl apply -f 05-job-controller.yaml
    echo "Job runs to completion:"
    kubectl get jobs,pods -l app=data-migration
    kubectl wait --for=condition=complete job/data-migration-job --timeout=60s
    kubectl logs -l app=data-migration
}

cronjob_demo() {
    echo "⏰ CronJob Controller Demo"
    kubectl apply -f 06-cronjob-controller.yaml
    echo "CronJob scheduled for daily execution:"
    kubectl get cronjobs
    kubectl describe cronjob backup-cronjob
}

hpa_demo() {
    echo "📈 HPA Controller Demo"
    kubectl apply -f 01-deployment-controller.yaml
    kubectl apply -f 07-hpa-controller.yaml
    echo "HPA will scale based on CPU/Memory:"
    kubectl get hpa
    kubectl describe hpa webapp-hpa
}

compare_all() {
    echo "🔍 Comparing All Controllers"
    kubectl apply -f controller-comparison.yaml
    echo "Same app managed by different controllers:"
    kubectl get deployments,replicasets,daemonsets -l app=webapp
    kubectl get pods -l app=webapp -o wide
}

cleanup_all() {
    echo "🧹 Cleaning up all resources..."
    kubectl delete -f . 2>/dev/null || true
    kubectl delete pvc --all 2>/dev/null || true
    echo "Cleanup complete!"
}

# Main loop
while true; do
    show_menu
    read -p "Enter your choice [0-9]: " choice
    
    case $choice in
        1) deployment_demo ;;
        2) replicaset_demo ;;
        3) daemonset_demo ;;
        4) statefulset_demo ;;
        5) job_demo ;;
        6) cronjob_demo ;;
        7) hpa_demo ;;
        8) compare_all ;;
        9) cleanup_all ;;
        0) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    
    echo ""
    read -p "Press Enter to continue..."
done