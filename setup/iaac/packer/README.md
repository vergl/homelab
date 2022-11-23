# Usage

0. Install [Packer](https://developer.hashicorp.com/packer/downloads)
1. Create a file with an extension *.auto.pkrvars.hcl* with variable values. Example data is stored in the file *example-credentials.pkrvars.hcl*
2. Edit data in *ubuntu-server.pkr.hcl* if necessary (for example, disk configuration)
3. Edit data in *http/user-data* with personal preferences (timezone, user, etc.)
4. Validate templates with `packer validate .`
5. Execute template creation with `packer build .`