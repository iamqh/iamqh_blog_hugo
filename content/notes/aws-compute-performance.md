+++
date = 2022-05-04T03:00:00Z
draft = true
tags = ["AWS"]
title = "AWS Storage Performance"

+++
Things need to consider:

* Sharing

  Will the data have to be shared between different instances
* Latency

  How quickly this data that needs to be accessible
* Throughput

  How fast data can move from side of our process to the next
* Persistence

  Must know the data is persistence or if it could be volatile or we can lose it at any time
* File size
* Access Method

  Sequentially or ramdomly
* Availability
* Durability
* Frequency
  * Access
  * Update

# S3

Shared access object

Low latency

High throughput

Highly available

Data durability

Encrypted fashion

Access management

# S3 Glacier

# EBS - Block Storage

## ESB Volume

An EBS Volume is a network drive you can attach to your instances while they run

It allows your instances to persist data, even after their termination

They can only be mounted to one instance at a time (at the CCP level)

They are bound to a specific availability zone

=> Analogy: Think of them as a "network USB stick"

Free tier: 30GB of free EBS storage of type General Purpose (SSD) or Magnetic per month

It's a network drive (i.e. not a physical drive)

* It uses the network to communicate the instance => there might be a bit of latency
* It can be detached from an EC2 instance and attached to another one quickly

It locked to an AZ

* An EBS Volume in zone a cannot be attached to zone b
* To move a volume across, you first need to snapshot it

Have a provisioned capcity (size in GBs, and IOPS)

## EBS Volume Types

EBS Volumes come in 6 types:

* gp2 / gp3 (SSD): General purpose SSD Volume that balances price and performance for a wide variety of workloads
* io1 / io2 (SSD): Highest-performance SSD volume for mission-critical low-latency or high-throughput workloads
* st1 (HDD): low cost HDD volume for frequently accessed, throughput-intensive workloads
* sc1 (HDD): lowest cost HDD for less frequently accessed workloads

EBS Volumes are characterized in Size | Throughput | IOPS (I/O Ops Per Sec)

**Only gp2/gp3 and io1/io2 can be used as boot volumes**

# EFS - Elastic File System