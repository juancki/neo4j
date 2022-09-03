# README

#### Start the container with the script 
```bash
./start.sh
```

- Open http://localhost:7474
- Username: neo4j
- Password: test

- Set default admin user to neo4j
```bash
docker exec testneo4j /var/lib/neo4j/bin/neo4j-admin set-default-admin neo4j 
```

#### Fraud detection blog post: `./fraud-detection`.
- Load the data from dump, without Enterprise edition is currently not possible to restore with the DB on:
```bash
docker stop testneo4j #stoping the container altogether
./restore-db.sh
docker start testneo4j
```

- Load dependencies:
```
pipenv install
pipenv shell
```

- Open the Jupiter Note that is the `fraud-detection` folder.
```
(neo4j):$ jupyter notebook
```

## Stop

```bash
docker stop testneo4j
docker rm testneo4j
```
