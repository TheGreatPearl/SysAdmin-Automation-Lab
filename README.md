# Linux SysAdmin Automation & Monitoring Suite

A hands-on Linux administration project containing Bash scripts designed to automate user lifecycle onboarding and perform system health diagnostics in enterprise environments.

---

## 🛠️ Included Tools & Scripts

| Script Name | Category | Description |
| :--- | :--- | :--- |
| `user_onboarding.sh` | Identity & Access Management | Automates new employee setup: creates groups, users, home directories, and configures secure SSH structure. |
| `system_health_check.sh` | Infrastructure Monitoring | Performs automated health checks on root partition disk usage, RAM utilization, and SSH daemon availability. |

---

## 🚀 How to Run

### Prerequisites
* Linux OS (Ubuntu / Debian / RHEL)
* Bash Shell
* `sudo` privileges for onboarding tasks

### 1. User Onboarding Script
```bash
chmod +x user_onboarding.sh
sudo ./user_onboarding.sh <username> <group_name>

