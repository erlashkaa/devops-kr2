# KR2 deployment

Variant 4 publishes the Flask counter through Nginx at
`https://kv.devops.local`. Docker Compose runs the application together with
Redis 7 in a private network. The application port is bound only to
`127.0.0.1:8004`, and Redis is not published on the host.

Create `.env` only on the server from `.env.example`, generate a new password,
and set mode `600`. Start the stack with:

```bash
docker compose up -d --build
```
