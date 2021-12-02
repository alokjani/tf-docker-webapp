# tf-docker-webapp

Example for deploying local container using terraform as IaC.

Build Docker image:

```
$ docker build -t webapp .
$ docker images | grep webapp
webapp                           latest                 7fd13bc28651   15 seconds ago   937MB
```

Deploy with Terraform IaC:

```
$ terraform init && terraform plan
$ terraform apply
```

Validate:

```
$ curl localhost:8080
Hello, World!
```

Environment:

```
Terraform v1.0.11, Docker 20.10.11
```
