data "archive_file" "this" {
  source_dir       = "${path.module}/source/"
  output_path      = "${var.name}.zip"
  output_file_mode = "0666"
  type             = "zip"
}

resource "aws_lambda_layer_version" "this" {
  layer_name       = var.name
  filename         = data.archive_file.this.output_path
  source_code_hash = data.archive_file.this.output_base64sha256
}