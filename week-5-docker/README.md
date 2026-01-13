# Week 5: Docker Fundamentals

## Build Instructions
```bash
docker build -t sre-welcome:v1 .
```

## Deployment to AWS ECR
1. Authenticate: `aws ecr get-login-password --region us-east-1 | docker login...`
2. Tag: `docker tag sre-welcome:v1 <REPO_URI>:v1`
3. Push: `docker push <REPO_URI>:v1`
