+++
date = 2022-04-28T17:00:00Z
draft = true
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