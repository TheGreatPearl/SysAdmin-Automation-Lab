# Linux SysAdmin Automation & Monitoring Suite

A hands-on Linux administration project containing Bash scripts designed to automate user lifecycle onboarding and perform system health diagnostics in enterprise environments.

---

##  Included Tools & Scripts

| Script Name | Category | Description |
| :--- | :--- | :--- |
| `user_onboarding.sh` | Identity & Access Management | Automates new employee setup: creates groups, users, home directories, and configures secure SSH structure. |
| `system_health_check.sh` | Infrastructure Monitoring | Performs automated health checks on root partition disk usage, RAM utilization, and SSH daemon availability. |

---

##  How to Run

### Prerequisites
* Linux OS (Ubuntu / Debian / RHEL)
* Bash Shell
* `sudo` privileges for onboarding tasks

### 1. User Onboarding Script
```bash
chmod +x user_onboarding.sh
sudo ./user_onboarding.sh <username> <group_name>



##  Cloud Identity & Device Management (JumpCloud MDM)

Integrated a local Linux (Ubuntu) virtual environment with a cloud-based Identity and Access Management (IAM) and Mobile Device Management (MDM) platform (**JumpCloud**) to practice modern enterprise IT administration.

### Key Implementation Steps:
1. **Agent Deployment:** Provisioned and installed the secure JumpCloud system agent (`jcagent`) on an Ubuntu virtual machine, establishing real-time cloud communication and monitoring.
2. **User Lifecycle & Synchronization:** Created remote cloud user identities and synchronized them directly down to the local Linux host, verifying user provisioning via system diagnostics (`id` and `getent`).
3. **Hybrid Architecture Practice:** Simulated a modern cloud-first corporate IT environment where machine access and user permissions are managed centrally from the cloud rather than locally.
