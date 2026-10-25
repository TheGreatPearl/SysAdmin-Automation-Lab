# Linux SysAdmin Automation & Monitoring Suite


A hands-on Linux administration project containing Bash scripts designed to automate user lifecycle onboarding and perform system health diagnostics in enterprise environments.

---

## Repository Structure

```text
.
├── README.md
├── user_onboarding.sh        # Identity & Access Management automation script
└── health_check.sh    # Automated host health diagnostics script
```

---

## Included Tools & Scripts

| Script Name | Category | Description |
| :--- | :--- | :--- |
| `user_onboarding.sh` | Identity & Access Management | Automates new employee setup: creates groups, users, home directories, and configures secure SSH structure. |
| `system_health_check.sh` | Infrastructure Monitoring | Performs automated health checks on root partition disk usage, RAM utilization, and SSH daemon availability. |

---

## How to Run

### Prerequisites
* Linux OS (Ubuntu / Debian / RHEL)
* Bash Shell
* `sudo` privileges for onboarding tasks

### 1. User Onboarding Script
Automates the creation of a user, assigns them to their primary group, provisions the home directory, and sets permissions for SSH access.

```bash
# Make script executable
chmod +x user_onboarding.sh

# Run with target username and group
sudo ./user_onboarding.sh <username> <group_name>
```

### 2. System Health Check Script
Monitors critical system thresholds including root partition storage, memory consumption, and SSH daemon uptime.

```bash
# Make script executable
chmod +x system_health_check.sh

# Execute health check
./system_health_check.sh
```

---

## Cloud Identity & Device Management (JumpCloud MDM)

Integrated a local **Linux (Ubuntu)** virtual environment with a cloud-based **Identity and Access Management (IAM)** and **Mobile Device Management (MDM)** platform (**JumpCloud**) to practice modern enterprise IT administration.

### Key Implementation Steps:
1. **Agent Deployment:** Provisioned and installed the secure **JumpCloud system agent (`jcagent`)** on an **Ubuntu VM**, establishing real-time cloud-to-device communication and monitoring.
2. **User Lifecycle & Synchronization:** Created remote **cloud user identities** and synchronized them directly down to the local **Linux host**, verifying user provisioning via system diagnostics (`id` and `getent`).
3. **Security Policy Enforcement (MDM):** Applied remote security compliance policies (such as **Linux Lock Screen timeout**) via cloud MDM and verified policy execution locally using `gsettings` and system diagnostics.
4. **Hybrid Architecture Practice:** Simulated a modern **cloud-first corporate IT** environment where machine access, security policies, and user permissions are managed centrally from the cloud.

### Diagnostics & Verification Commands:
```bash
# 1. Verify cloud user synchronization on local host
id <username>
getent passwd <username>

# 2. Check JumpCloud agent service status
sudo systemctl status jcagent

# 3. Verify applied MDM lock screen policy (idle timeout in seconds)
gsettings get org.gnome.desktop.session idle-delay
```
