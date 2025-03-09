# Sentry Self Hosted Setup

## Setup

1. Install Sentry
2. Create a new project
3. Create a new organization
4. Create a new project in the organization
5. Create a new API key
6. Create a new project in the organization
7. Create a new project in the organization
8. Create a new project in the organization
9. Create a new project in the organization
10. Create a new project in the organization


### Install Sentry on Server with Docker compose
- Download and extract the tar.gz file
```
curl -L -C - --progress-bar --retry 3 --retry-delay 5 https://github.com/getsentry/self-hosted/archive/refs/tags/24.11.2.tar.gz -o sentry.tar.gz
```

- Extract the tar.gz file
```
tar -xzf sentry.tar.gz
```

- Navigate to the extracted directory
```
cd self-hosted-24.11.2
```

- Run the install script
```
./install.sh
```

- Run the docker compose file
```
docker compose up -d
```