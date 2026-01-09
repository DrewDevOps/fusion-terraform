#Create terraform user in Proxmox

A step-by-step guide using the GUI and API Tokens for better security:
Part 1: Create the User & Role in Proxmox (GUI/SSH)
Log in: Access your Proxmox web UI as root or an admin user.
Create User:
Navigate to Datacenter > Permissions > Users.
Click Add, create a user (e.g., terraform-user), set a strong password, and select the default pve realm.
Create Role:
Go to Datacenter > Permissions > Roles.
Click Add and name it TerraformProvision (or similar).
Assign essential permissions (e.g., VM.Allocate, VM.Config.*, VM.PowerMgmt, Datastore.AllocateSpace, Sys.Audit, Sys.Console).
Assign Role:
In Users, select terraform-user, go to Permissions, click Add, and assign the TerraformProvision role to the user on the / (root) path for full control, or restrict to specific nodes if needed.
Create API Token:
Select terraform-user, go to API Tokens, click Add Token, give it a name (e.g., tf-token), and click Add. Copy the Token ID and Token Secret – you'll need these. 

# fusion-terraform
Provision VM for fusion setup
