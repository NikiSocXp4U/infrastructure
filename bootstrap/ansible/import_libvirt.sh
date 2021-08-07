#!/bin/bash

# Read from the outer network's dhcp
bongus_ip=`cat /var/lib/libvirt/dnsmasq/virbr-outer.status | jq '.[0]["ip-address"]' -r`
cat << EOF | tee inventory/bongus.gen.yaml
ephemeral:
  hosts:
    bongus_fresh:
      # Change as necessary
      ansible_host: $bongus_ip
      ansible_user: debian
      ansible_ssh_pass: devpassword
      ansible_become_pass: devpassword
EOF