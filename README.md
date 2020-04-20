# GCP Node Instance Provision

Build an Image using Packer
```
packer validate ./packer/node.json

packer build ./packer/node.json
```

To provision a single nodejs instance
```
terraform init

terraform plan

terraform apply
```

To provision multiple nodejs instances
add the count field above name and change the name filed as given below

```
  count        = 2
  name         = "nodejs-instance-${count.index}"
```
