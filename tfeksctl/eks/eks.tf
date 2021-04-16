data "template_file" "mytfeks6" {
  template = file("cluster.yaml")

  vars = {
    ngname1     = "ng1"
    ngname2     = "ng2"
    privateaz0  = keys(local.subnet_private)[0]
    privateaz1  = keys(local.subnet_private)[1]
    privatesub0 = values(local.subnet_private)[0]
    privatesub1 = values(local.subnet_private)[1]

    publicaz0  = keys(local.subnet_public)[0]
    publicaz1  = keys(local.subnet_public)[1]
    publicsub0 = values(local.subnet_public)[0]
    publicsub1 = values(local.subnet_public)[1]
  }
}

resource "eksctl_cluster" "mytfeks6" {
  eksctl_bin      = "eksctl"
  name            = "mytfeks6"
  region          = "us-east-2"
  version         = "1.18"
  kubeconfig_path = "mytfeks6"

  /*
  assume_role  {
    role_arn = "arn:aws:iam::167855287371:role/aws-infra-ci"
  }
  */
  spec = data.template_file.mytfeks6.rendered
  tags = {
    Team = "mytfeks6"
  }
}
