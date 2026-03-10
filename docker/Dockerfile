FROM postgres:15

ENV POSTGRES_DB=studentcourse
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin123

COPY init.sql /docker-entrypoint-initdb.d/

| Line              | Meaning                 |
| ----------------- | ----------------------- |
| postgres:15       | official postgres image |
| POSTGRES_DB       | database name           |
| POSTGRES_USER     | database user           |
| POSTGRES_PASSWORD | password                |
| COPY init.sql     | startup pe SQL run hoga |
