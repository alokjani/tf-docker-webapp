terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "webapp" {
  name         = "webapp:latest"
  keep_locally = false
}

resource "docker_container" "webapp" {
  image = docker_image.webapp.latest 
  name  = "webapp"
  restart = "always"
  volumes {
    container_path  = "/myapp"
    host_path = "/home/ubuntu/app" 
    read_only = false
  }
  ports {
    internal = 8080
    external = 8080
  }
}

output "container_id" {
  description = "ID of docker container"
  value       = docker_container.webapp
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.webapp
}
