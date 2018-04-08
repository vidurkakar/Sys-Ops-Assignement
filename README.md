# Sys-Ops-Assignement (Virginina Tech Cyber Range)

Usage Format: ./run_script [key.pub] [ip_address.txt]

The run_script.sh script  SSHs into the remote machines whose IP is mentioned in ip_address.txt, gathers the required information and adds another key to the SSH authorized key file.

This script is written using the assumption that the user already has trust established to the remote device.

ip_address.txt can be modified to add required IP Addresses and key.pub can be modiefied to add your own key.
