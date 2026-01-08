# Docker enviroment for Laravel

This repository provides a ready-to-use **development environment** for Laravel, including:

-   PHP (Laravel)
-   MySQL
-   Redis
-   GitHub Actions workflow for running tests

---

## Getting started

1. **Clone the repository and enter the folder**

```bash
git clone <repo-url>
cd <your-repo-folder>

cp .env.example .env                                         **set your .env**

docker compose -f docker-compose.dev.yaml build              **build image**
docker compose -f docker-compose.dev.yaml up -d              **run containers**
docker exec -f laravel_app_php_container php artisan migrate **run migration**
```
