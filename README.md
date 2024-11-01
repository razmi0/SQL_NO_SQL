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

- [init_db](./utils/sql/init_db.sql) initialise all tables
- [migrate_dummy_db](./utils/sql/migrate_dummy_db.sql) populate all tables with dummy data
- [truncate_db](./utils/sql/truncate_db.sql) empty all tables
- [reset_db](./utils/sql/reset_db.sql) drop and recreate the db

Exemple :

```bash
mysql -h 127.0.0.1 -P 3306 -u root  db_camping < ./utils/sql/init_db.sql
```

## Liens

- Exercice 1 :
  - [consigne](./exercices/1/consigne.md)
  - [devoir](./exercices/1/devoir.sql)
  - [procedures](./exercices/1/procs.sql)
  - [appeler les procédures](./exercices/1/run_procs.php)
  - [api](./exercices/1/api/)
    - [emplacement libre](./exercices/1/api/free_emp.php)
    - [facture](./exercices/1/api/invoice.php)

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
        ─ migrate_dummy_db.sql
        ─ reset_db.sql
        ─ truncate_db.sql
    ─ .DS_Store
    ─ .gitignore
    ─ README.md
```
