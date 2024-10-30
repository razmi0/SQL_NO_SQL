# SQL NO SQL

![sql](./cours/sql.jpeg)

## Notes

You can open a mariadb session in terminal with :

```bash
mysql -h 127.0.0.1 -P 3306 -u root  db_camping
```

## Scripts

Run those utilitary scripts in your mariadb session with :

```bash
mysql -h 127.0.0.1 -P 3306 -u root  db_camping < path\to\file.sql
```

- [init_db](./sql/init_db.sql) initialise les tables de la db
- [migrate_dummy](./sql/migrate_dummy.sql) peuple la db
- [truncate_db](./sql/truncate_db.sql) vide la db

## Liens

- Exercice 1 :
  - [consigne](./exercices/1/consigne.md)
  - [devoir](./exercices/1/devoir.sql)

## Repo structure

```plaintext
📁 SQL_NO_SQL
    📁 cours
        ─ pdf_conception_camping_TP.pdf
        ─ sql.jpeg
    📁 exercices
        📁 1
            ─ consigne.md
            ─ devoir.sql
        ─ 2
    📁 sql
        ─ init_db.sql
        ─ migrate_dummy.sql
    ─ .gitignore
    ─ README.md
```
