mkdir -p internal/data
mkdir -p internal/logs
mkdir -p internal/import

PLUGIN_PATH=internal/plugins
rm -r $PLUGIN_PATH
mkdir -p $PLUGIN_PATH

GDS_VERSION=2.1.11
NEO4J_VERSION=4.4.10

cp "fraud-detection/neo4j-graph-data-science-$GDS_VERSION.jar" $PLUGIN_PATH


docker run \
    --name testneo4j \
    -p7474:7474 -p7687:7687 \
    -d \
    -v $PWD/fraud-detection/fraud-neo4j-v44.dump:/dumps/fraud-detection.dump \
    -v $PWD/internal/data:/data \
    -v $PWD/internal/logs:/logs \
    -v $PWD/internal/import:/var/lib/neo4j/import \
    -v $PWD/$PLUGIN_PATH:/plugins \
    --env "NEO4J_AUTH=neo4j/test" \
    --env "NEO4J_dbms_security_procedures_unrestricted=gds.*" \
    --env "NEO4J_dbms_security_procedures_whitelist=gds.*" \
    --env "NEO4J_dbms_security_procedures_allowlfst=gds.*" neo4j:$NEO4J_VERSION
