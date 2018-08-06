data "aws_vpc" "default" {
    default = true
}

data "aws_subnet_ids" "default" {
    vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_subnet" "default" {
    count = "${length(data.aws_subnet_ids.default.ids)}"
    id    = "${data.aws_subnet_ids.default.ids[count.index]}"
}

output "aws_subnet_ids" {
    value = ["${data.aws_subnet_ids.default.ids}"]
}

output "aws_cidr_blocks" {
    value = ["${data.aws_subnet.default.*.cidr_block}"]
}
