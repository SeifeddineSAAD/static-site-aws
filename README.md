# Static Site on AWS — Terraform + CI/CD

A production-ready static website hosted on AWS, fully provisioned with Terraform and automatically deployed via GitHub Actions.

## Architecture
```
User → CloudFront (HTTPS) → S3 Bucket (private)
                ↑
         GitHub Actions (CI/CD)
```

## Stack

| Tool | Role |
|------|------|
| **AWS S3** | Static file storage |
| **AWS CloudFront** | CDN + HTTPS + caching |
| **Terraform** | Infrastructure as Code |
| **GitHub Actions** | CI/CD pipeline |

## Project Structure
```
static-site-aws/
├── website/
│   └── index.html        # Static site files
├── terraform/
│   ├── main.tf           # S3, CloudFront, OAC, Bucket Policy
│   ├── variables.tf      # Input variables
│   ├── outputs.tf        # CloudFront URL, bucket name
│   └── terraform.tfvars  # Variable values
└── .github/
    └── workflows/
        └── deploy.yml    # Auto-deploy on git push
```

## How It Works

1. Developer pushes code to `main` branch
2. GitHub Actions triggers automatically
3. Files are synced to S3 via `aws s3 sync`
4. CloudFront cache is invalidated
5. Site is live within seconds

## Deploy from Scratch

### Prerequisites
- AWS CLI configured
- Terraform >= 1.0
- GitHub repository with secrets configured

### GitHub Secrets Required

| Secret | Description |
|--------|-------------|
| `AWS_ACCESS_KEY_ID` | AWS access key |
| `AWS_SECRET_ACCESS_KEY` | AWS secret key |
| `CLOUDFRONT_DISTRIBUTION_ID` | CloudFront distribution ID |

### Provision Infrastructure
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### Destroy Infrastructure
```bash
cd terraform
terraform destroy
```

## Live Demo

��� https://d1esw0hux41qa1.cloudfront.net

## Author

**Seifeddine Saad** — [GitHub](https://github.com/SeifeddineSAAD)  
AWS Certified | Terraform Associate | PMP
