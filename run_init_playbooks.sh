#!/bin/bash

ansible all -m ping
ansible-playbook clone.yaml
