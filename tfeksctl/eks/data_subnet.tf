data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    "tfeksctl:subnet-type" = "Private"
  }
}
data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    "tfeksctl:subnet-type" = "Public"
  }
}
data "aws_subnet" "private" {
  count = length(data.aws_subnet_ids.private.ids)
  id    = tolist(data.aws_subnet_ids.private.ids)[count.index]
}

data "aws_subnet" "public" {
  count = length(data.aws_subnet_ids.public.ids)
  id    = tolist(data.aws_subnet_ids.public.ids)[count.index]
}

locals {
  subnet_public  = zipmap(data.aws_subnet.public.*.availability_zone, data.aws_subnet.public.*.id)
  subnet_private = zipmap(data.aws_subnet.private.*.availability_zone, data.aws_subnet.private.*.id)
}
