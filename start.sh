mkdir -p internal/data
mkdir -p internal/logs
mkdir -p internal/import
mkdir -p internal/plugins

docker run \
    --name testneo4j \
    -p7474:7474 -p7687:7687 \
    -d \
    -v $PWD/fraud-detection/fraud-neo4j-v44.dump:/dumps/fraud-detection.dump \
    -v $PWD/internal/data:/data \
    -v $PWD/internal/logs:/logs \
    -v $PWD/internal/import:/var/lib/neo4j/import \
    -v $PWD/internal/plugins:/plugins \
    --env NEO4J_AUTH=neo4j/test \
    neo4j:latest
