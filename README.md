# springboot-docker-demo
Basic Kotlin SpringBoot app using docker 
After serving the app, going to `localhost:8080/hello` will display a msg

Also includes instructions on how to deploy this image to AWS.

## Docker Commands  
`docker build -t sb-docker-demo .`
`docker run -p 8080:8080 sb-docker-demo` 

# How to use this docker image in AWS   
## Push the image onto AWS ECR
1. Upload this code onto your source (e.g Github, CodeCommit, S3)
2. Create an ECR repository in your AWS account (No special settings needed)
3. Create a CodeBuild project on the console, using standard settings and also setting environment variables. (The cli is even more hassle) 
   https://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html
4. Create a new IAM policy with the following statement. Attach this policy to the service role you gave the Codebuild project in Step 3.
   {
   "Action": [
   "ecr:BatchCheckLayerAvailability",
   "ecr:CompleteLayerUpload",
   "ecr:GetAuthorizationToken",
   "ecr:InitiateLayerUpload",
   "ecr:PutImage",
   "ecr:UploadLayerPart"
   ],
   "Resource": "*",
   "Effect": "Allow"
   }
   
5. Run the CodeBuild project, and the image will be created in ECR!  


## Deploying the ECR image onto EC2 and serve it on the web
1. Create an ec2 instance 
2. ssh onto it 
3. Install docker
4. Start docker `sudo service docker start`
5. Pull the ecr image into the ec2
   `aws ecr get-login-password --region ap-northeast-1 | sudo docker login --username AWS --password-stdin <account_id>.dkr.ecr.ap-northeast-1.amazonaws.com`
   `docker pull ${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${hello-repository}:latest`
6. `docker run -p 443:8080 image-name` 
7. Go to the instance's "${Public IPv4 DNS}/hello" and access the APIs!


##  Deploying the ECR image onto EKS or ECS
TBD
