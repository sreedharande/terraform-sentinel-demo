In this project, I have created a terraform plan, sentinel policy, and other required files under one project and in the same root directory[1].

Main.tf: it’s the main terraform configuration file where I have written terraform code to create an AWS S3 bucket.

Variable.tf: all the terraform variable information defined in this file.

S3-bucket.sentinel: This is a sentinel policy file for S3. It has a code that will check for any policy violation.

Sentinel.hcl: you can define the enforcement level in this file. 

There are 3 enforcement levels in sentinel i.e.

Hard-Mandatory requires that the policy passes. If a policy fails, the run is halted and may not be applied until the failure is resolved.
Soft-Mandate is much like hard-mandatory but allows an administrator to override policy failures on a case-by-case basis.
Advisory will never interrupt the run and instead will only surface policy failures as information to the user.