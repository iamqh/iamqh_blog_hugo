---
title: VPC
date: 2022-04-28T11:15:41+07:00
tags:
  - AWS
---
## Overall

VPC contains one or more subnets

* A subnet exist in only one availability zone
* A instance exist in only one subnet

\=> Create instances in different availability zones

a VPC is only exist in 1 AWS region

3 ways to access resources in VPC

* Directly over the internet
* Over a virtual private network
* Over a direct connect link

If you want to connect from another VPC or on-premise, you can use Transit Gateway

Transit Gateway is a highly available resource => don't have to create multiple transit gateways for redundancy

## Elastic IP Address

Allocate an EIP to your account and keep it as long as you want

EIP allows an instance to retain the same public IP address

EIP is bound to an ENI, which is attached to an instance

You can move an EIP to different ENI

> If an instance has a public IP address, allocating an EIP to the instace will replace the public IP address

2 types of EIP Addresses

* Amazon owned

  * Tied to an AWS region
  * AWS pick for you
* Customer owned

  * Bring your own IP
  * Pick any address you want

EIP is for use in a specific Region only, cannot move to a different One

## Gloabal accelerator

Provides two anycast IPv4 addresses

> Anycast: All servers have same IP address, client will request to nearest server
>
> Unicast: Each server has a different IP address

Not tied to any AWS region

Advertised from points-off-presence (POPs) around the world

Connections to a Global Accelerator address can be forwarded to resources in any AWS region

### Cloudfront vs Global Accelerator

Both use network system and edge location globally

Both can integrate AWS Shield for DDos

| Cloudfront                                                                                                           | Global Accelerator                   |
| -------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| Improve performance with caching content in Edge locations                                                           | Improve performance with TCP and UDP |
| Client send request first time, content will be cached in Edge. For next requests, content will get from cached edge |                                      |

## VPC

![VPC Architecture](/vpc_architecture.png)

Public subnet:

* Will have full access to the internet
* Can reach the internet & can be reachable from the internet

Private subnet:

* Completely isolated from the internet
* Cannot reach the internet & the internet can't reach them

NAT gateway

provide instances in the private subnet outbound-only internet access

## Internet gateway

## NAT gateway