# Create a Redis cluster using Elasticache
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-cluster"        # Cluster ID
  engine               = "redis"                # Engine type
  node_type            = "cache.t2.micro"       # Node type
  num_cache_nodes      = 1                      # Number of cache nodes
  parameter_group_name = "default.redis3.2"     # Parameter group
}
