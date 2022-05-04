+++
date = 2022-04-28T17:00:00Z
tags = ["AWS"]
title = "VPC (cont)"

+++
# DNS Resolution

Domain Name System is a standard by which names used on the internet are resolved to their corresponding IP addresses.

**_enableDNSSupport (= DNS Resolution setting)_**

![](https://miro.medium.com/max/1096/1*2OUyyasHqUQUd8HDtsNiCw.png =548x163)

Decides if DNS resolution from Route 53 Resolver server is supported for the VPC

* True (default): it queries the Amazon Provider DNS Server at **169.254.169.253** or the reserved IP address at the base of VPC IPv4 network range plus two (xx.xx.xx.2)

![](/dns_resolution.png)

**_enableDNSHostname (= DNS Hostname setting)_**

![](https://miro.medium.com/max/1400/1*7293RNlcnLI_8xvOqA44qA.png =700x234)

By default,

* True => default VPC
* False => newly created VPCs

Won't do anything unless enableDNSSupport=true

# Connectivity Options

## Direct Connect

Low-latency connection to an AWS region

Bypasses the Internet

2 types:

* Delicated

Physical connection that terminates at a Direct Connection location

1 or 10 Gbps

* Hosted

"last-mile" connection provided by a Direct Connect partner

50 Mbps to 10 Gbps

## Virtual private network (VPN)

Encrypted IPsec connection over the internet

Unpredictable latency

Can be implemented in 2 ways:

* Virtual private gateway
* Transit gateway

### Virtual Private Gateway

Enables you to establish a VPN tunnel with only one VPC

Doesn't scale well

### Transit gateway

Connects VPCs and on-premises networks

* Terminates multiple VPN connections
* Supports Direct Connect

Connects multiple VPCs together

Transit Gateway Route Tables

* Control how traffic is routed between subnets
* Can block (blackhole) traffic

**Trasit gateway supports multicast!!!**