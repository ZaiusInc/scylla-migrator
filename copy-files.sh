#!/bin/bash
aws s3 cp s3://zaius-sagemaker/ZAIUS-21260/config-staging-1663-customers.yaml /mnt1/config.yaml
aws s3 cp s3://zaius-sagemaker/ZAIUS-21260/scylla-migrator-assembly.jar /mnt1/scylla-migrator-assembly.jar