# Terraform Modules & Jenkins exercise

1. Write Terraform code that provisions a VPC using the official AWS Terraform module. Set your code to use an S3 bucket as its backend.
   VPC specs:
   - 3 public subnets (have them tagged as "frontend").
   - 3 private subnets (have them tagged as "backend").
   - Provision *a single* NAT Gateway.
2. Prepare a variables file for configuring various options such as main CIDR block, etc.
3. Make a Jenkins pipeline that provisions the Terraform securely (work with credentials) to AWS.
4. Add a choice (boolean) parameter to the pipeline code, allowing the user to **Destroy** the Terraform instead of applying it.
5. Add string parameters to the pipeline code, allowing the user to adjust Terraform variables.


## Note:
> Remember to destroy your AWS resources at the end of the day - they cost money! ;)
