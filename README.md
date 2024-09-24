# Demo Deployment
Repository contains deployment resources for the `demo` application

# Gettings started
## ArgoCD
- ArgoCD is used to manage application deployment
- Application is registered on ArgoCD using the Application Manifest represented by the `./application.yaml` file. Apply the application manifest using `kubectl apply -n argocd -f application.yaml`

# Best Practices
## Separate of Application source code and Kubernetes manifests
We have separated our application source code and Kubernetes manifests into different Git repositories for the following reasons:

- **Separation of Concerns**: This approach allows us to modify configuration files without triggering a full CI build, providing a clear distinction between application code and configuration.
- **Cleaner Audit Logs**: By isolating configuration changes, we maintain a cleaner Git history focused solely on configuration updates, free from the noise of regular development activity.
- **Support for Multi-Repo Applications**: Our application consists of services from multiple Git repositories, each with its own versioning scheme and release cycle. Storing manifests separately ensures a cohesive deployment process.
- **Access Control**: Different access permissions can be set for developers and production deployment, preventing unauthorized changes to production environments.
- **Avoiding CI Loops**: This separation prevents infinite loops of build jobs and Git commit triggers, ensuring a more stable and efficient CI pipeline.
