# Solution Overview
The solution consists of the following components:
1. AWS EKS Cluster: Using Terraform to create an Amazon EKS cluster.
2. Prometheus Monitoring: Deploying Prometheus Operator in the EKS cluster using Helm.
3. Custom NGINX Deployment: Creating a custom NGINX Docker image that serves a static index.html page and deploying it to the EKS cluster.

Prerequisites
Ensure you have the following prerequisites:

1. Terraform: Installed and configured. (Ensure your AWS credentials are set up properly.)
2. AWS CLI: Installed and configured.
3. kubectl: Installed and configured to interact with the Kubernetes cluster.
4. Helm: Installed and configured.
5. Docker: Installed to build and push the Docker image.
6. IAM Permissions: Ensure the IAM user/role has sufficient permissions to create and manage EKS resources, including IAM roles, security groups, EC2 instances, etc.

Step 1: Setup AWS EKS Cluster Using Terraform
1. Clone the Github Repo:
   cd terraform

2. Initialize Terraform: Run the following commands to initialize Terraform:
   terraform init

3. Plan/Apply the Terraform Configuration: Run the following command to create the EKS cluster:
   terraform plan
   terraform apply

4. Configure kubectl: Once the EKS cluster is created, configure kubectl to interact with the cluster:
   aws eks --region us-west-2 update-kubeconfig --name my-eks-cluster

Step 2: Build and Push the Custom NGINX Docker Image
1. Build the Docker Image: In the directory where your Dockerfile and index.html are located, build the Docker image:
   docker build -t my-nginx-image .

2. Push the Docker Image to Docker Hub (or ECR):
   docker tag my-nginx-image my-dockerhub-username/my-nginx-image
   docker push my-dockerhub-username/my-nginx-image

Step 3: Deploy NGINX on EKS
1. Apply the Deployment to the EKS Cluster: Deploy the NGINX service to EKS:
   kubectl apply -f nginx.yaml

2. Verify NGINX Deployment: Check the status of your service and get the external DNS (if using LoadBalancer):
   kubectl get svc nginx-service
   Access the DNS shown in the output to view your custom NGINX page.


Conclusion
Following this guide, you will have:

Created an AWS EKS cluster and deployed Prometheus on the EKS cluster using Helm with Terraform.
Built and pushed a custom NGINX Docker image.
Deployed NGINX with a custom static page on EKS.

This process ensures that your infrastructure is provisioned and managed as code, making it easy to replicate or modify as needed.


