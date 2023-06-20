# PostgreSQL

PostgreSQL is a powerful, open source object-relational database system with over 35 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.

## Configuration

This Ansible playbook installs PostgreSQL 14 on a Ubuntu machine and configures users with ident authentication.

## Installation

1. Export environment variable with test user's password: `export POSTGRESQL_USER_PASSWORD=supersecretpasswd`
2. Run Ansible playbook: `ansible-playbook postgresql.yml`