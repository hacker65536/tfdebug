terraform {
  required_version = ">=0.15.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    eksctl = {
      //source = "mumoshu/eksctl"
      source  = "example.com/myorg/eksctl"
      version = "0.15.3"
    }
    //helmfile = {
    //  source = "mumoshu/helmfile"
    //}
  }

}
