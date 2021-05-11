# PostgreSQL JSON schema validation POC

[JSON Schema](https://json-schema.org/) validation is based on [is_jsonb_valid](https://github.com/furstenheim/is_jsonb_valid) PostgreSQL extension.

```sh
$ docker-compose up -d
$ ./scripts/load-seed.sh
$ ./scripts/load-fixtures.sh
```

Some useful resources:

- [Understanding JSON Schema](https://json-schema.org/understanding-json-schema/)
