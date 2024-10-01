variable "aws_access_key" {
  # set aws access key
  default = ""
}

variable "aws_secret_key" {
  # set aws secret key
  default = ""
}

variable "region" {
  # set aws region
  default = "us-east-1"
}


// lambda.default
variable "lambda_runtime" {
  default = "java17"
}


// lambda.authentication
variable "lambda_authentication_payload_filename" {
  default = "output/terraform-authentication-lambda-java-1.0.jar"
}
variable "lambda_authentication_function_handler" {
  default = "br.com.techchallenge.lambda.creator.LambdaJwtCreatorHandler::handleRequest"
}
// lambda.authorization.rds
variable "rds-user" {
  default = ""
}
variable "rds-passwd" {
  default = ""
}
variable "rds-url" {
  default = ""
}


// lambda.authorization
variable "lambda_authorization_payload_filename" {
  default = "output/terraform-authorization-lambda-java-1.0.jar"
}
variable "lambda_authorization_function_handler" {
  default = "br.com.techchallenge.lambda.autorizer.LambdaAuthorizer::handleRequest"
}



// apigateway
variable "api_path" {
  default = "{proxy+}"
}

variable "api_env_stage_name" {
  default = "terraform-lambda-java-stage"
}



