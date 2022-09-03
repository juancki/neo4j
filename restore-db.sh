NEO4J_VERSION=4.4.10
docker run --interactive --tty --rm \
    -v $PWD/fraud-detection/fraud-neo4j-v44.dump:/dumps/fraud-detection.dump \
    -v $PWD/internal/data:/data \
    neo4j/neo4j-admin:$NEO4J_VERSION \
    neo4j-admin load --from=/dumps/fraud-detection.dump --database=neo4j --force		 
