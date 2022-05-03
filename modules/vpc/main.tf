
#################################################################
# KEY PAIR
#################################################################
resource "aws_key_pair"   "pap2key" {
  key_name                = var.pap2key
  public_key              = file(var.path_to_public_key)
}

##################################################################
# VPC
##################################################################
resource "aws_vpc"        "PACWAADT2_VPC" {
  cidr_block              = var.vpc_cidr
  tags = {
    Name                  = var.PACWAADT2_VPC
  }
}

##################################################################
# PUBLIC SUBNET 1
##################################################################
resource "aws_subnet"     "PACWAADT2_PubSN1" {
  vpc_id                  = aws_vpc.PACWAADT2_VPC.id
  cidr_block              = var.pub_subnet1        
  availability_zone       = var.az_A       

  tags = {
    Name                  = var.PACWAADT2_PubSN1
  }
}

##################################################################
# PUBLIC SUBNET 2
##################################################################
resource "aws_subnet"     "PACWAADT2_PubSN2" {
  vpc_id                  = aws_vpc.PACWAADT2_VPC.id
  cidr_block              = var.pub_subnet2
  availability_zone       = var.az_B          

  tags = {
    Name                  = var.PACWAADT2_PubSN2
  }
}

##################################################################
# PRIVATE SUBNET 1
##################################################################
resource "aws_subnet"   "PACWAADT2_PvtSN1" {
  vpc_id                = aws_vpc.PACWAADT2_VPC.id
  cidr_block            = var.prv_subnet1     
  availability_zone     = var.az_A            

  tags = {
    Name                = var.PACWAADT2_PvtSN1
  }
}

##################################################################
# PRIVATE SUBNET 2
##################################################################
resource "aws_subnet"   "PACWAADT2_PvtSN2" {
  vpc_id                = aws_vpc.PACWAADT2_VPC.id
  cidr_block            = var.prv_subnet2    
  availability_zone     = var.az_B   

  tags = {
    Name                = var.PACWAADT2_PvtSN2
  }
}

##################################################################
# PRIVATE SUBNET 3
##################################################################
resource "aws_subnet"   "PACWAADT2_PvtSN3" {
  vpc_id                = aws_vpc.PACWAADT2_VPC.id
  cidr_block            = var.prv_subnet3            
  availability_zone     = var.az_A            

  tags = {
    Name                = var.PACWAADT2_PvtSN3
  }
}

##################################################################
# PRIVATE SUBNET 4
##################################################################
resource "aws_subnet"   "PACWAADT2_PvtSN4" {
  vpc_id                = aws_vpc.PACWAADT2_VPC.id
  cidr_block            = var.prv_subnet4    
  availability_zone     = var.az_B 

  tags = {
    Name                = var.PACWAADT2_PvtSN4
  }
}

##################################################################
# INTERNET GATEWAY (IGW)
##################################################################
resource "aws_internet_gateway" "PACWAADT2_IGW" {
  vpc_id                = aws_vpc.PACWAADT2_VPC.id
  tags = {
    Name                = var.PACWAADT2_IGW
  }
}

##################################################################
# NAT GATEWAY (NAT-GW)
##################################################################
resource "aws_nat_gateway" "PACWAADT2_NAT-GW" {
  allocation_id         = aws_eip.PACWAADT2_EIP.id
  subnet_id             = aws_subnet.PACWAADT2_PubSN1.id

  tags = {
    Name                = var.PACWAADT2_NAT-GW
  }

  # To ensure proper ordering, it is recommended to add an
  # explicit dependency on the Internet Gateway for the VPC.
  
  depends_on            = [aws_internet_gateway.PACWAADT2_IGW]
}

##################################################################
# ELASTIC IP
##################################################################
resource "aws_eip"      "PACWAADT2_EIP" {
  vpc                   = true

  tags = {
    Name                = var.PACWAADT2_EIP
  }
}
 
##################################################################
# ROUTE TABLE FOR PUBLIC SUBNET
##################################################################
resource "aws_route_table" "PACWAADT2_RT_Pub" {
  vpc_id               = aws_vpc.PACWAADT2_VPC.id
  route {
    cidr_block         = var.all_cidr
    gateway_id         = aws_internet_gateway.PACWAADT2_IGW.id
  }

  tags = {
    Name               = var.PACWAADT2_RT_Pub
  }
}

##################################################################
# ROUTE TABLE ASSOCIATIONS FOR PUBLIC SUBNET 1
##################################################################
resource "aws_route_table_association" "PACWAADT2_RT_Pub_Assoc1" {
  subnet_id             = aws_subnet.PACWAADT2_PubSN1.id
  route_table_id        = aws_route_table.PACWAADT2_RT_Pub.id
}

##################################################################
# ROUTE TABLE ASSOCIATIONS FOR PUBLIC SUBNET 2
##################################################################
resource "aws_route_table_association" "PACWAADT2_RT_Pub_Assoc2" {
  subnet_id             = aws_subnet.PACWAADT2_PubSN2.id
  route_table_id        = aws_route_table.PACWAADT2_RT_Pub.id
}

##################################################################
# ROUTE TABLE FOR PRIVATE SUBNET
##################################################################
resource "aws_route_table" "PACWAADT2_RT_Pvt" {
  vpc_id                = aws_vpc.PACWAADT2_VPC.id
  route {
    cidr_block          = var.all_cidr
    nat_gateway_id      = aws_nat_gateway.PACWAADT2_NAT-GW.id
  }

  tags = {
    Name               = var.PACWAADT2_RT_Pvt
  }
}

##################################################################
# ROUTE TABLE ASSOCIATIONS FOR PRIVATE SUBNET 1
##################################################################
resource "aws_route_table_association" "PACWAADT2_RT_Pvt_Assoc1" {
  subnet_id             = aws_subnet.PACWAADT2_PvtSN1.id
  route_table_id        = aws_route_table.PACWAADT2_RT_Pvt.id
}

##################################################################
# ROUTE TABLE ASSOCIATIONS FOR PRIVATE SUBNET 2
##################################################################
resource "aws_route_table_association" "PACWAADT2_RT_Pvt2_Assoc2" {
  subnet_id             = aws_subnet.PACWAADT2_PvtSN2.id
  route_table_id        = aws_route_table.PACWAADT2_RT_Pvt.id
}

##################################################################
# ROUTE TABLE ASSOCIATIONS FOR PRIVATE SUBNET 3
##################################################################
resource "aws_route_table_association" "PACWAADT2_RT_Pvt_Assoc3" {
  subnet_id             = aws_subnet.PACWAADT2_PvtSN3.id
  route_table_id        = aws_route_table.PACWAADT2_RT_Pvt.id
}

##################################################################
# ROUTE TABLE ASSOCIATIONS FOR PRIVATE SUBNET 4
##################################################################
resource "aws_route_table_association" "PACWAADT2_RT_Pvt_Assoc4" {
  subnet_id             = aws_subnet.PACWAADT2_PvtSN4.id
  route_table_id        = aws_route_table.PACWAADT2_RT_Pvt.id
}
