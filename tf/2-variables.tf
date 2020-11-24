/*
// Common variables
*/

variable "region" {
  type        = string
  description = "Region to work on."
  default     = "us-east-1"
}

variable "env" {
  type        = string
  description = "Stage to work on (dev/stg/prod)."
  default     = "dev"
}

variable "tags" {
  type        = map(string)
  description = "Tags to add to all resources."
  default     = {}
}

/*
// ACM variables
*/



/*
// ALB variables
*/



/*
// AutoScalling variables
*/



/*
// Backup variables
*/

variable "backup_name" {
  type        = string
  description = "Name of your AWS Backup"
}

/*
// Client VPN variables
*/



/*
// CloudTrail variables
*/

variable "cloudtrail_name" {
  type        = string
  description = "Solution name, e.g. 'app' or 'jenkins'"
  default     = "app"
}

variable "cloudtrail_s3_name" {
  type        = string
  description = "S3 name, e.g. 'app' or 'jenkins'"
  default     = "app"
}

variable "cloudtrail_log_file_validation" {
  type        = bool
  description = "Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs"
  default     = true
}

variable "cloudtrail_include_global_service_events" {
  type        = bool
  description = "Specifies whether the trail is publishing events from global services such as IAM to the log files"
  default     = true
}

variable "cloudtrail_is_multi_region_trail" {
  type        = bool
  description = "Specifies whether the trail is created in the current region or in all regions"
  default     = false
}

variable "cloudtrail_enable_logging" {
  type        = bool
  description = "Enable logging for the trail"
  default     = true
}

variable "cloudtrail_account_id" {
  type        = string
  description = "The account ID where the bucket S3"
  default     = ""
}

/*
// CodeBuild variables
*/



/*
// CodeCommit variables
*/



/*
// CodeDeploy variables
*/



/*
// Cognito variables
*/

variable "user_pool_name" {
  type        = string
  description = "The User Pool Name"
  default     = "userpool-name"
}

variable "cognito_alias_attributes" {
  type        = list(string)
  description = "Attributes supported as an alias for this user pool. Possible values: phone_number, email, or preferred_username. Conflicts with username_attributes"
  default = [
    "email",
    "phone_number"
  ]
}

variable "cognito_auto_verified_attributes" {
  type        = list(string)
  description = "The attributes to be auto-verified. Possible values: email, phone_number"
  default = [
    "email"
  ]
}

variable "cognito_schemas" {
  type        = list(any)
  description = "A container with the schema attributes of a user pool. Maximum of 50 attributes"
  default     = []
}

variable "cognito_string_schemas" {
  type        = list(any)
  description = "A container with the string schema attributes of a user pool. Maximum of 50 attributes"
  default     = []
}

variable "cognito_client_name" {
  type        = string
  description = "The name of the application client"
  default     = "client-name"
}

/*
// CodePipeline variables
*/



/*
// EC2 variables
*/

variable "ec2_name" {
  type        = string
  description = "Name to be used on all resources as prefix"
  default     = "test-ec2"
}

variable "ec2_instance_count" {
  type        = number
  description = "Number of instances to launch"
  default     = 1
}

variable "ec2_ami" {
  type        = string
  description = "ID of AMI to use for the instance"
  default     = "ami-0ff8a91507f77f867"
}

variable "ec2_instance_type" {
  type        = string
  description = "The type of instance to start"
  default     = "t2.micro"
}

variable "ec2_key_name" {
  type        = string
  description = "The key name to use for the instance"
  default     = ""
}

variable "monitoring" {
  type        = bool
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = true
}

/*
// ECR variables
*/

variable "ecr_name" {
  type        = string
  description = "The Name of the application or solution (e.g. bastion or portal)"
  default     = "ecr"
}

variable "ecr_attributes" {
  type        = list(string)
  description = "Additional attributes (e.g. policy or role)"
  default     = []
}

variable "ecr_image_names" {
  type        = list(string)
  description = "List of Docker local image names, used as repository names for AWS ECR"
  default     = []
}

variable "ecr_image_tag" {
  type        = string
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
  default     = "MUTABLE"
}

variable "ecr_max_image" {
  type        = number
  description = "How many Docker Image versions AWS ECR will store"
  default     = 500
}

variable "ecr_scan_images_on_push" {
  type        = bool
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not (false)"
  default     = false
}

/*
// EKS variables
*/

variable "eks_cluster_name" {
  type        = string
  description = "Name of your Kubernetes cluster"
  default     = "kubernetes-cluster"
}

variable "eks_instance_type" {
  type        = string
  description = "Size of your cluster nodes"
  default     = "m5.large"
}

variable "eks_asg_min_size" {
  type        = number
  description = "Min node count"
  default     = 1
}

variable "eks_asg_max_size" {
  type        = number
  description = "Max node count"
  default     = 1
}

/*
// ElastiCache variables
*/

variable "redis_name" {
  type        = string
  description = "Name of the application"
  default     = "redis-name"
}

variable "redis_availability_zones" {
  type        = list(string)
  description = "Availability zone IDs"
  default     = ["us-east-1a"]
}

variable "redis_zone_id" {
  type        = string
  description = "Route53 DNS Zone ID"
  default     = ""
}

variable "redis_cluster_size" {
  type        = number
  description = "Number of nodes in cluster. *Ignored when cluster_mode_enabled == true*"
  default     = 1
}

variable "redis_cluster_mode_enabled" {
  type        = bool
  description = "Flag to enable/disable creation of a native redis cluster. automatic_failover_enabled must be set to true. Only 1 cluster_mode block is allowed"
  default     = false
}

variable "redis_cluster_mode_num_node_groups" {
  type        = number
  description = "Number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications"
  default     = 1
}

variable "redis_cluster_mode_replicas_per_node_group" {
  type        = number
  description = "Number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource"
  default     = 1
}

variable "redis_instance_type" {
  type        = string
  description = "Elastic cache instance type"
  default     = "cache.t2.micro"
}

variable "redis_engine_version" {
  type        = string
  description = "Redis engine version"
  default     = "4.0.10"
}

variable "redis_family" {
  type        = string
  description = "Redis family"
  default     = "redis4.0"
}

variable "redis_at_rest_encryption_enabled" {
  type        = bool
  description = "Enable encryption at rest"
  default     = false
}

variable "redis_transit_encryption_enabled" {
  type        = bool
  description = "Enable TLS"
  default     = true
}

variable "redis_allowed_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks that are allowed ingress to the cluster's Security Group created in the module"
  default     = []
}

variable "redis_attributes" {
  type        = list(string)
  description = "Additional attributes (_e.g._ '1')"
  default     = []
}

variable "redis_auth_token" {
  type        = string
  description = "Auth token for password protecting redis, transit_encryption_enabled must be set to true. Password must be longer than 16 chars"
  default     = "123456789ABCDEFG"
}

variable "redis_dns_subdomain" {
  type        = string
  description = "The subdomain to use for the CNAME record. If not provided then the CNAME record will use var.name."
  default     = "d"
}

variable "elasticache_subnet_group_name" {
  type        = string
  description = "Subnet group name for the ElastiCache instance"
  default     = "subnet-group"
}

variable "redis_enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "redis_port" {
  type        = number
  description = "Redis port"
  default     = 6379
}

variable "redis_replication_group_id" {
  type        = string
  description = "Replication group ID with the following constraints: A name must contain from 1 to 20 alphanumeric characters or hyphens. The first character must be a letter. A name cannot end with a hyphen or contain two consecutive hyphens."
  default     = "replication-group"
}

variable "redis_use_existing_security_groups" {
  type        = bool
  description = "Flag to enable/disable creation of Security Group in the module. Set to true to disable Security Group creation and provide a list of existing security Group IDs in existing_security_groups to place the cluster into"
  default     = false
}

/*
// ElasticSearch variables
*/

/*
//  Amazon EMR variables
*/
variable "emr_name" {
  type        = string
  description = "Name of the Amazon EMR App"  
}

variable "emr_namespace" {
  type        = string
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"  
  default = "company"
}

variable "emr_ebs_root_volume_size" {
  type        = number
  description = "Size in GiB of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later"  
  default = 10
}

variable "emr_visible_to_all_users" {
  type        = bool
  description = "Whether the job flow is visible to all IAM users of the AWS account associated with the job flow"  
  default = true
}

# https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-5x.html
variable "emr_release_label" {
  type        = string
  description = "The release label for the Amazon EMR release. "  
  default = "emr-5.31.0"
}

variable "emr_applications" {
  type        = list(string)
  description = "A list of applications for the cluster. Valid values are: Flink, Ganglia, Hadoop, HBase, HCatalog, Hive, Hue, JupyterHub, Livy, Mahout, MXNet, Oozie, Phoenix, Pig, Presto, Spark, Sqoop, TensorFlow, Tez, Zeppelin, and ZooKeeper (as of EMR 5.25.0). Case insensitive"  
  default = ["Hadoop"]
}

# More details https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html
variable "emr_configurations_json" {
  type        = string
  description = "A JSON string for supplying list of configurations for the EMR cluster."  
  default = ""
}

variable "emr_core_instance_group_instance_type" {
  type        = string
  description = "EC2 instance type for all instances in the Core instance group"  
  default = "on-demand"
}

variable "emr_core_instance_group_instance_count" {
  type        = number
  description = "Target number of instances for the Core instance group. Must be at least 1"
  default = 1
}

variable "emr_core_instance_group_ebs_size" {
  type        = number
  description = "Core instances volume size, in gibibytes (GiB)"  
  default = 64
}

variable "emr_core_instance_group_ebs_type" {
  type        = string
  description = "Core instances volume type. Valid options are gp2, io1, standard and st1"  
  default = "standard"
}

variable "emr_core_instance_group_ebs_volumes_per_instance" {
  type        = number
  description = "The number of EBS volumes with this configuration to attach to each EC2 instance in the Core instance group"  
  default = 1
}

variable "emr_master_instance_group_instance_type" {
  type        = string
  description = "EC2 instance type for all instances in the Master instance group"  
  default = "t2.micro"
}

variable "emr_master_instance_group_instance_count" {
  type        = number
  description = "Target number of instances for the Master instance group. Must be at least 1"  
  default = 1
}

variable "emr_master_instance_group_ebs_size" {
  type        = number
  description = "Master instances volume size, in gibibytes (GiB)"  
  default = 10
}

variable "emr_master_instance_group_ebs_type" {
  type        = string
  description = "Master instances volume type. Valid options are gp2, io1, standard and st1"  
  default = "standard"
}

variable "emr_master_instance_group_ebs_volumes_per_instance" {
  type        = number
  description = "The number of EBS volumes with this configuration to attach to each EC2 instance in the Master instance group"  
  default = 1
}

# https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-master-core-task-nodes.html
# https://www.terraform.io/docs/providers/aws/r/emr_instance_group.html
variable "emr_create_task_instance_group" {
  type        = bool
  description = "Whether to create an instance group for Task nodes."  
  default = false
}

variable "emr_aws_key_pair_name" {
  type        = string
  description = "Amazon EC2 key pair that can be used to ssh to the master node as the user called hadoop"
  default     = null
}

/*
// GuardDuty variables
*/



/*
// Lambda variables
*/

variable "lambda_name" {
  type        = string
  description = "Name of the lambda"
  default     = ""
}

variable "lambda_desc" {
  type        = string
  description = "Description of the lambda"
  default     = ""
}

variable "lambda_handler" {
  type        = string
  description = "Lambda Function entry point in your code"
  default     = ""
}

# See for available runtimes: https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html
variable "lambda_runtime" {
  type        = string
  description = "Lambda Function runtime"
  default     = ""
}

variable "lambda_publish" {
  type        = bool
  description = "Whether to publish creation/change as new Lambda Function Version."
  default     = false
}

variable "lambda_at_edge" {
  type        = bool
  description = "Set this to true if using Lambda@Edge, to enable publishing, limit the timeout, and allow edgelambda.amazonaws.com to invoke the function"
  default     = false
}

variable "lambda_source" {
  type        = any
  description = "The absolute path to a local file or directory containing your Lambda source code"
  default     = null
}

variable "lambda_s3_store" {
  type        = bool
  description = "Whether to store produced artifacts on S3 or locally."
  default     = false
}

variable "lambda_s3_name" {
  type        = string
  description = "S3 bucket to store artifacts"
  default     = null
}

variable "lambda_create_package" {
  type        = bool
  description = "Controls whether Lambda package should be created"
  default     = true
}

variable "lambda_local_package" {
  type        = string
  description = "The absolute path to an existing zip-file to use"
  default     = null
}

variable "api_gateway_arn" {
  type        = string
  description = "APIGateway to allow APIGatewayAny to be triggered by the lambda"
  default     = null
}

variable "api_gateway_source_arn" {
  type        = string
  description = "APIGateway arn to allow APIGatewayDevPost to be triggered by the lambda"
  default     = null
}

variable "lambda_principal" {
  type        = string
  description = "Principal of the lambda"
  default     = null
}

variable "lambda_rule_source_arn" {
  type        = string
  description = "ARN of the rule"
  default     = null
}

variable "lambda_s3_bucket" {
  type        = string
  description = "S3 Bucket destination of the lambda"
  default     = null
}

variable "lambda_s3_source" {
  type        = string
  description = "The absolute path to a local file or directory containing your Lambda source code"
  default     = null
}

variable "lambda_s3layer" {
  type        = bool
  description = "Controls whether Lambda Layer resource should be created"
  default     = null
}

variable "lambda_s3layer_name" {
  type        = string
  description = "Name of Lambda Layer to create"
  default     = ""
}

variable "lambda_s3layer_desc" {
  type        = string
  description = "Description of your Lambda Function (or Layer)"
  default     = ""
}

variable "lambda_s3layer_compatible_runtimes" {
  type        = list(string)
  description = "A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified."
  default     = null
}

variable "lambda_s3layer_source" {
  type        = any
  description = "The absolute path to a local file or directory containing your Lambda source code (or Layer)"
  default     = null
}

variable "lambda_s3layer_store" {
  type        = bool
  description = "Whether to store produced artifacts on S3 or locally."
  default     = null
}

variable "lambda_bucket_layer_name" {
  type        = string
  description = "S3 bucket to store artifacts"
  default     = null
}

variable "lambda_layer" {
  type        = bool
  description = "Controls whether Lambda Layer resource should be created"
  default     = null
}

variable "lambda_layer_name" {
  type        = string
  description = "Name of Lambda Layer to create	"
  default     = null
}

variable "lambda_layer_desc" {
  type        = string
  description = "Description of your Lambda Function (or Layer)"
  default     = null
}

variable "lambda_layer_compatible_runtimes" {
  type        = list(string)
  description = "A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified."
  default     = null
}

variable "lambda_layer_source" {
  type        = any
  description = "The absolute path to a local file or directory containing your Lambda source code (or Layer)"
  default     = null
}

variable "lambda_attach_ntw_policy" {
  type        = bool
  description = "Controls whether VPC/network policy should be added to IAM role for Lambda Function"
  default     = null
}

/*
// RDS variables
*/

variable "rds_identifier" {
  type        = string
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  default     = "rds-boilerplate"
}

variable "rds_availability_zone" {
  type        = string
  description = "The Availability Zone of the RDS instance"
  default     = "us-east-1a"
}

variable "rds_engine" {
  type        = string
  description = "The database engine to use"
  default     = "mysql"
}

variable "rds_engine_version" {
  type        = string
  description = "The engine version to use"
  default     = "5.7.19"
}

variable "rds_instance" {
  type        = string
  description = "The instance type of the RDS instance"
  default     = "db.t2.large"
}

variable "rds_storage" {
  type        = string
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  default     = 5
}

variable "rds_name" {
  type        = string
  description = "The DB name to create. If omitted, no database is created initially"
  default     = "demodb"
}

variable "rds_username" {
  type        = string
  description = "Username for the master DB user"
  default     = "user"
}

variable "rds_password" {
  type        = string
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  default     = "YourPwdShouldBeLongAndSecure!"
}

variable "rds_port" {
  type        = string
  description = "The port on which the DB accepts connections"
  default     = "3306"
}

variable "rds_maintenance" {
  type        = string
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  default     = "Mon:00:00-Mon:03:00"
}

variable "rds_backup" {
  type        = string
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  default     = "03:00-06:00"
}

variable "rds_monitoring_interval" {
  type        = number
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  default     = 0
}

variable "rds_monitoring_role_name" {
  type        = string
  description = "Name of the IAM role which will be created when create_monitoring_role is enabled."
  default     = "MyRDSMonitoringRole"
}

variable "rds_monitoring_role_arn" {
  type        = string
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero."
  default     = ""
}

variable "rds_family" {
  type        = string
  description = "The family of the DB parameter group"
  default     = "mysql5.7"
}

variable "rds_major_engine_version" {
  type        = string
  description = "Specifies the major version of the engine that this option group should be associated with"
  default     = "5.7"
}

variable "final_snapshot_identifier" {
  type        = string
  description = "The name of your final DB snapshot when this DB instance is deleted."
  default     = "demodb"
}

/*
// Route53 variables
*/



/*
// S3 variables
*/

variable "s3_name" {
  type        = string
  description = "Name of the bucket. If omitted, Terraform will assign a random, unique name."
  default     = null
}

variable "s3_acl" {
  type        = string
  description = "ACL of the bucket."
  default     = "private"
}

variable "s3_versioning" {
  type        = bool
  description = "Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket."
  default     = false
}

/*
// VPC variables
*/

variable "vpc_cidr" {
  type        = string
  description = "CIDR of your VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Name of your VPC"
  default     = "terraform-vpc"
}

variable "vpc_private_cidrs" {
  type        = list(string)
  description = "Your private subnets"
  default     = ["10.0.100.0/24", "10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_public_cidrs" {
  type        = list(string)
  description = "Your public subnets"
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_database_cidrs" {
  type        = list(string)
  description = "Your database subnets"
  default     = ["10.0.200.0/24", "10.0.201.0/24", "10.0.202.0/24"]
}

variable "vpc_azs" {
  type        = list(string)
  description = "Your VPC availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
