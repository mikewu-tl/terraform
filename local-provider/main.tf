terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.3.0"
    }
  }
}

locals {
  file_count = "${length(var.file_list)}"
  # depends_on = count.index == 0 ? "" : local_file.files[count.index-1].id
}

resource "local_file" "files" {
  count = local.file_count
  filename = format("%s/%s-%s.txt","${path.module}",count.index, timestamp()) 
  content = "test content"
}