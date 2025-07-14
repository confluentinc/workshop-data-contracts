# LAB 6: Workshop Cleanup and Summary

## 🗺️ Overview

Complete your data contracts **proof-of-concept** journey by safely cleaning up cloud resources and reviewing your achievements. This lab ensures you won't incur unexpected costs while preserving key learnings about shift-left data governance.

### What You'll Accomplish

By the end of this lab, you will have:

1. **Manual UI Cleanup**: Remove resources created through web interfaces (connectors, notebooks, integrations)
2. **Automated Terraform Cleanup**: Destroy infrastructure provisioned through Infrastructure as Code

### Why Proper Cleanup Matters

- **Cost Control**: Prevent unexpected cloud charges
- **Security**: Remove temporary credentials and access
- **Best Practices**: Follow Infrastructure as Code teardown procedures
- **Professional Hygiene**: Clean workspace for future projects

## 👣 Steps

These resources were created through web interfaces and need to be manually removed before running Terraform destroy:

### Step 1: Manual Resource Removal

#### Confluent

##### Remove Oracle XStream Connector

1. Navigate to your Confluent Cloud environment and cluster
2. Click on *Connectors* in the left sidebar
3. Find your Oracle XStream CDC Source connector
4. Click on the connector name
5. Click *Settings* → *Delete connector*
6. Type the connector name to confirm deletion

#### Databricks

##### Remove Service Principal (Optional)

Since the service principal was created manually in LAB1, you may want to clean it up:

1. Navigate to your Databricks workspace
2. Click on your username in the top right and select *Settings*
3. Click on *Identity and access*
4. Click *Manage* next to *Service principals*
5. Find the service principal you created (e.g., "workshop-tableflow-databricks")
6. Click on it and select *Delete*
7. Confirm the deletion

> [!NOTE]
> **Service Principal Cleanup**
>
> This step is optional since the service principal doesn't incur costs. However, removing it follows security best practices by cleaning up unused credentials.

### Step #2: Automatic Cloud Resource Removal

Now that manual resources are cleaned up, use Terraform to efficiently destroy the remaining cloud infrastructure:

1. Open your preferred command-line interface
2. Navigate to the workshop's *terraform* directory
3. Remove the provider integration from Terraform state

```sh
terraform state rm confluent_provider_integration.s3_tableflow_integration
```

> [!NOTE]
> **State Removal Only**
>
> This removes the resource from Terraform's tracking but doesn't delete it from Confluent Cloud. It will be cleaned up when the environment is destroyed in the next step.

4. Destroy all remaining infrastructure:


```sh
terraform destroy -auto-approve
```

You should see output similar to:

```sh
Destroy complete! Resources: XX destroyed.
```

> [!NOTE]
> **Cleanup Duration**
>
> Terraform destroy typically takes 5-10 minutes to complete all resource removal across both AWS and Confluent Cloud.

### Step 3: Clean Up Local Environment

Remove local files and configurations that are no longer needed.

For example, the Confluent Cloud API keys and secrets that you may have downloaded.

### Step 4: Verify Complete Cleanup

Confirm all resources are properly removed to avoid unexpected charges.

> [!NOTE]
> **Cleanup Summary**
>
> Most resources are automatically removed by Terraform destroy. Items marked "(handled by Terraform)" are cleaned up automatically. Only the Oracle XStream connector requires manual removal, and the Databricks service principal cleanup is optional.

#### Confluent Cloud Checklist

- [ ] Oracle XStream CDC connector deleted (**manual step** - see above)
- [ ] Workshop environment deleted (handled by Terraform)
- [ ] Kafka cluster terminated (handled by Terraform)
- [ ] Schema Registry and data contracts removed (handled by Terraform)
- [ ] Flink compute pool deleted (handled by Terraform)
- [ ] API keys revoked (handled by Terraform)

#### AWS Checklist

- [ ] EC2 instances (Oracle database) terminated (handled by Terraform)
- [ ] VPC and associated subnets removed (handled by Terraform)
- [ ] Security groups deleted (handled by Terraform)
- [ ] IAM roles and policies cleaned up (handled by Terraform)
- [ ] S3 bucket and contents removed (handled by Terraform)
- [ ] EBS volumes deleted (handled by Terraform)
- [ ] Key pairs removed (handled by Terraform)

#### Databricks Checklist

- [ ] Service principal deleted (optional - created **manually** in LAB1)
- [ ] External location removed (handled by Terraform)
- [ ] Storage credentials removed (handled by Terraform)
- [ ] Unity Catalog permissions revoked (handled by Terraform)
- [ ] S3 bucket access grants removed (handled by Terraform)

#### Local Environment Checklist

- [ ] Terraform state files removed (optional)
- [ ] Configuration files cleaned up
- [ ] API keys deleted (optional)
- [ ] Downloaded credentials removed (recommended)

## What's Next

You've successfully completed your data contracts proof-of-concept and cleaned up all workshop resources. Now head to the [RECAP](./recap.md) to review your key achievements, learning outcomes, and discover the next steps for implementing data contracts in your production environment.

## 🔧 Troubleshooting

If you encounter issues during cleanup:

1. **Terraform Destroy Fails**: Check the [troubleshooting guide](./troubleshooting.md#terraform-destroy-issues)
2. **Resources Still Running**: Manually verify and remove through cloud consoles
3. **Billing Questions**: Contact your cloud provider support
4. **Access Issues**: Ensure your API keys are still valid

For additional support, refer to the [troubleshooting guide](./troubleshooting.md) or reach out to your workshop facilitator.
