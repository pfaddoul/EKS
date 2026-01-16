# task1
Create a 6 node EKS cluster using terraform that does not scale lower than 50% of its size (minimum size=3 nodes). The cluster should be created in it’s own VPC, allow inbound connections only to the cluster API, and should have argocd installed.
Steps to proceed:
1.  Create a new VPC for the cluster (public + private subnets).

2.  Create an EKS cluster with a managed node group of 6 desired nodes, and autoscaling min_size = 50% of desired (for 6 → min 3). The min is computed from var.node_count so you can change node count later and the min will remain at 50%.

3.  Keep the node group in private subnets (no direct inbound from Internet to nodes).

4.  Restrict inbound traffic so only the EKS control plane (API) is exposed — worker nodes are not reachable from the Internet.

5.  Install Argo CD via Helm after cluster creation.
