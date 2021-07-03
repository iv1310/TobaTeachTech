resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "tumbur-tf" {
  name             = var.db_name
  database_version = var.database_version
  region           = var.region
   
  replica_configuration {
    username                  = "postgres"
    password                  = "tunaiku123"
   }

  settings {
    tier = var.db_tiar
    disk_size = var.disk_size
    disk_type = var.disk_type
    database_flags{
        name = "max_connections"
        value = "400"
    }
    backup_configuration {
        binary_log_enabled             = false
        enabled                        = false
        point_in_time_recovery_enabled = false
        start_time                     = "01:00"
        transaction_log_retention_days = 7
        backup_retention_settings {
            retained_backups = 7
            retention_unit   = "COUNT"
        }
    }
    
    location_preference {
        zone = "asia-southeast2-a"
    }

  }
}


