# 📖 **DockerDeepDive.md - Table of Contents**

**Total Lines: 2069** | **Last Updated: Feb 11, 2026** | **Status: Production Ready**

## 🚀 **Quick Navigation**

| # | Topic | Line Numbers | Jump Link |
|---|-------|--------------|-----------|
| **1** | [Explain the problem Docker solves](##🎯 **The BIG Problem Docker Crushes**) | `10-250` | ↑ **TOP** |
| **2** | [Virtual Machines vs Docker](#2-virtual-machines-vs-docker) | `251-550` | ↑ **TOP** |
| **3** | [Docker Architecture - Installation](#3-docker-architecture) | `551-850` | ↑ **TOP** |
| **4** | [Dockerfile Deep Dive](#4-dockerfile-deep-dive) | `851-1150` | ↑ **TOP** |
| **5** | [Key Docker Commands](#5-key-docker-commands) | `1151-1350` | ↑ **TOP** |
| **6** | [Docker Networking](#6-docker-networking) | `1351-1600` | ↑ **TOP** |
| **7** | [Volumes & Persistence](#7-volumes--persistence) | `1601-1800` | ↑ **TOP** |
| **8** | [Docker Compose](#8-docker-compose) | `1801-2069` | ↑ **TOP** |

## 📋 **One-Click Section Access**

```
🔹 1️⃣ Docker Problem Solved  → Jump to Line 10
🔹 2️⃣ VMs vs Docker        → Jump to Line 251  
🔹 3️⃣ Architecture        → Jump to Line 551
🔹 4️⃣ Dockerfile Mastery   → Jump to Line 851
🔹 5️⃣ Essential Commands  → Jump to Line 1151
🔹 6️⃣ Networking          → Jump to Line 1351
🔹 7️⃣ Volumes              → Jump to Line 1601
🔹 8️⃣ Compose              → Jump to Line 1801
```

## 🎯 **Progressive Learning Path**

```
Phase 1: Why Docker? (Sections 1-2)  → 300 lines
Phase 2: Core Tech (Sections 3-4)    → 600 lines  
Phase 3: Operations (Sections 5-8)   → 1169 lines
```

**Daily Study Plan**:
- **Day 1**: Sections 1-2 (VMs battle) → **1 hour**
- **Day 2**: Sections 3-4 (Build mastery) → **2 hours**
- **Day 3**: Sections 5-6 (Commands + Networking) → **2 hours**
- **Day 4**: Sections 7-8 (Storage + Compose) → **2 hours**
- **Day 5**: Practice + Interview prep → **3 hours**

## 🔍 **Searchable Topics Index**

```
🐳 Docker Core Concepts
├── [Problem Docker solves](#1-explain-the-problem-docker-solves)
├── [VMs vs Containers comparison](#2-virtual-machines-vs-docker)
├── [Installation components](#3-docker-architecture)
├── [Multi-stage Dockerfile](#4-dockerfile-deep-dive)
├── [CLI Commands reference](#5-key-docker-commands)

🌐 Networking & Storage
├── [Bridge/User-defined networks](#6-docker-networking)
├── [Volumes/Bind mounts](#7-volumes--persistence)
└── [Compose multi-service](#8-docker-compose)

💼 Production Ready
├── Multi-stage builds (Line 851+)
├── Volume persistence (Line 1601+)
├── Compose production patterns (Line 1801+)
```

## 📊 **File Statistics**

```
📈 Total Size:        2069 lines
📦 Content Weight:    8 comprehensive guides
⏱️  Reading Time:     2-3 hours (complete)
🎯 Skill Level:       Junior → Senior DevOps
💾 Storage:           125KB (highly compressible)
```

## 🎓 **Mastery Checklist**

- [ ] ✅ **Section 1-2**: Understand "works on my machine" solution
- [ ] ✅ **Section 3**: Architecture (dockerd + containerd + runc)
- [ ] ✅ **Section 4**: Multi-stage Dockerfile (90% size reduction)
- [ ] ✅ **Section 5**: 30+ essential commands
- [ ] ✅ **Section 6**: Bridge networking + DNS resolution
- [ ] ✅ **Section 7**: Volumes vs Bind mounts (production ready)
- [ ] ✅ **Section 8**: Full-stack Compose example

## 🚀 **Usage Instructions**

1. **GitHub/Portfolio**: Copy entire file → Instant Docker expertise showcase
2. **Interview Prep**: Ctrl+F topic → 30 seconds to relevant section
3. **Daily Reference**: Print Sections 5 (Commands) for desk reference
4. **Team Onboarding**: Share with new developers (self-paced learning)

***

```
⬆️ COPY THIS INDEX (Lines 1-100) to TOP of your DockerDeepDive.md
⬇️ ALL 8 SECTIONS FOLLOW IMMEDIATELY AFTER (Lines 101-2069)
```

**Perfect Structure**: Professional, scannable, production-ready documentation that scales from 2069 lines to enterprise knowledge base! 🎉 ** [hostinger](https://www.hostinger.com/in/tutorials/docker-cheat-sheet)



🚀 **Docker: The Superhero That Saved Devs from Chaos!** 🦸‍♂️

Imagine you're a chef 🍳 cooking a killer recipe. You nail it on your fancy kitchen setup—but when your friend tries it on their rusty old stove, disaster! 😱 That's pre-Docker life. Docker swoops in like a magic lunchbox 🥡, packing **everything** your app needs. No more "It works on my machine!" nightmares.

***

## 🎯 **The BIG Problem Docker Crushes**
Before Docker (2013 era), devs were **lost in hell**:
- 🖥️ **Dev Laptop** (Mac + Python 3.8): App flies! ✈️
- 🖥️ **Team Server** (Linux + Python 3.6): CRASH! 💥 *Wrong library version.*
- 🖥️ **QA Windows Box**: "Where's my Node.js?!" 🤷‍♂️
- 🖥️ **Prod AWS Server**: Weeks of tweaks. Bills skyrocket. 💸

**Dependency Hell** 🔥: App A loves Library X v1. App B hates it. Fight! 👊  
**Snowflake Servers** ❄️: Every machine unique = endless setup time.  
**Slow Deploys** 🐌: Hours to spin up test environments. Innovation? Dead.

***

## 👨‍💻 **Who Invented This Wizardry? Meet Solomon Hykes!**
- **2010**: Solomon at **dotCloud** (PaaS company). Their platform? Messy. Apps broke everywhere. 😤
- **2013**: Boom! Docker born in **San Francisco**. Built on Linux tricks (cgroups + namespaces 🔧).
- **Magic Touch**: Made containers *easy*. One command: `docker run`. No PhD needed!
- **Open-Sourced**: March 2013. World exploded! 🌍 By 2014: Google, Netflix hooked.

*Fun Fact*: Hykes French roots → Docker named after **dotCloud** + "docker" (shipping container vibe). Ships apps like cargo! 🚢

***

## 🌪️ **Life WITHOUT Docker: A Hilarious Horror Story** 😈
Picture **TeamProjectX** (your Kubernetes dreams pre-Docker):

1. **Monday**: You code React + Node app. *Perfect on ViteJS setup.* 🎉
2. **Tuesday**: Junior dev pulls code. "Node not found!" 📛 *Install fest: 2 hours.*
3. **Wednesday**: Builds on Jenkins. "Port 3000 clash!" ⚔️ *Kill other apps.*
4. **Thursday**: QA on Ubuntu. "Tailwind CSS missing!" 🧩 *npm hell begins.*
5. **Friday**: Prod deploy. Server fatigues. **App down 3 days.** Boss yells. 😡
6. **Weekend**: You debug at 2 AM. "Why me?!" 💔

**Real Costs**:
- ⏳ **Wasted Time**: 40% of dev week = environment fixes.
- 💰 **Money Burn**: Extra servers + OT = $$$.
- 🧑‍💼 **Turnover**: Devs quit. "Too frustrating!"

**Snowflake Scaling**:
```
Server 1: App A + DB ✅
Server 2: App B (kills DB deps) ❌
Server 3: Manual copy-paste config 😵
x100 servers? IMPOSSIBLE.
```

***

## 🛡️ **Docker to the Rescue: How It Works (Simple Magic)** ✨
Docker = **Lightweight Shipping Containers** for code! 

```
Your App 🧩
├── Code (React/Vite)
├── Libs (Node 18, Tailwind)
├── Config (ports, env vars)
└── OS Bits (just kernel needs)

= ONE IMAGE 📦 (MBs, not GBs)
```

- **Run Anywhere**: `docker run myapp` → Laptop, AWS, K8s. *Identical!* 🌐
- **Isolate Like Boss**: App A & B live happily. No clashes. 🏠🏠
- **Fast AF**: Starts in **seconds**. Clone 1000s for scale. ⚡
- **Version Everything**: `v1.2.3` image. Rollback? Easy. 🔄

**VS Old Ways**:
| Without Docker | With Docker    |
|---------------|---------------|
| 🐌 Hours to setup | ⚡ Seconds    |
| ❌ Breaks everywhere | ✅ Same everywhere |
| 💸 Heavy VMs (GBs) | 💚 Light (MBs) |
| 😵 Manual scaling | 🤖 Auto-clone |

***

## 🚀 **Docker's Epic World Takeover** 🌟
- **2014**: Microsoft joins! Windows containers. 😲
- **2015+**: Kubernetes (K8s) crowned Docker king for orchestration. 👑
- **Today (2026)**: Powers **Netflix** (streams your movies 🍿), **Spotify** (romantic playlists ❤️), **AWS/GCP/Azure**.
- **Your World**: Chākan dev → Deploy React+K8s apps to cloud. Job offers rain! ☔💼

*Pro Tip for You*: Start: `docker run hello-world`. Feel god-mode. Then: Dockerize your ViteJS project. `Dockerfile` magic! 🪄

***

## 🔥 **Why Docker = Game-Changer for Indian IT Pros Like You**
- **Job Market**: Naukri listings? "Docker + K8s = 2x salary." 🤑
- **Freelance**: Ship Terraform infra + Docker apps. Clients love. 💪
- **CloudBlitz Skills**: AWS EC2? Docker-ize Lambdas. Boss impressed.
- **No More Excuses**: "Prod different" → Gone. Own deploys like a pro.

Docker didn't just solve a problem—it **freed devs to create**. From frustration to flow-state. You're next! 🚀

**TL;DR**: Docker = Portable app boxes. Invented by Solomon Hykes to end "works on my machine." Without it? Endless pain. With it? Superpowers. Go Docker-ize something TODAY! 🥳


🚀 **VMs vs Docker: The Epic Showdown! Battle of the Giants!** 🥊💥

Picture this: You're shipping **apps** like precious cargo across oceans 🌊. **VMs** are massive cruise ships 🛳️—luxurious but slow & heavy. **Docker**? Sleek speedboats 🛥️—nimble, fast, & pack 10x more! Which wins in **your** React + K8s world? Let's dive into this blockbuster fight! 🎬

***

## 🏛️ **What Are VMs? The Old-School Titans**
**Virtual Machines (VMs)** = Full fake computers running *inside* your real computer.

```
Your Laptop 🖥️
└── Hypervisor (VMware/VirtualBox) 🔧
    ├── VM1: Windows + IIS + .NET (10GB) 🪨
    ├── VM2: Ubuntu + Apache + PHP (8GB) 🪨
    └── VM3: CentOS + Java (12GB) 🪨
```

**How They Work**:
- **Slice your CPU/RAM/SSD** into virtual "machines"
- Each VM gets **FULL OS** (Windows/Linux) + all the bloat
- **Isolation**: Perfect! VM1 can't touch VM2. 🛡️
- **Examples**: VMware, VirtualBox, Hyper-V, AWS EC2 instances

**Born**: 1960s mainframes → VMware popularized (1999). Enterprise kings! 👑

***

## 🐳 **What Is Docker? The Container Revolution**
**Docker** = Lightweight "app apartments" sharing one OS kernel.

```
Your Laptop 🖥️
└── Docker Engine 🐳
    ├── Container1: Node + React (50MB) ⚡
    ├── Container2: Python API (30MB) ⚡
    ├── Container3: MySQL DB (80MB) ⚡
    └── ALL share YOUR Linux kernel! 🥳
```

**Magic Sauce**:
- **Linux Kernel Tricks**: cgroups (CPU/RAM limits) + namespaces (isolation)
- **ONE Image** = App + libs + config. No OS bloat!
- **docker run** = Instant startup. Scale to 1000s!

***

## ⚔️ **HEAD-TO-HEAD: VMs vs Docker Battle Royale!**

| **Round** | **VMs 🛳️** | **Docker 🛥️** | **Winner** |
|-----------|-------------|----------------|------------|
| **🚀 Speed** | 🐌 30-60s boot | ⚡ 0.1s start | **Docker!** |
| **📦 Size** | 🪨 5-20GB | 💚 20-200MB | **Docker!** |
| **💰 Cost** | 💸 10 servers = $1000/mo | 🤑 1000 containers = $100/mo | **Docker!** |
| **🔒 Security** | 🛡️ Nuclear isolation | 🛡️ Good (not perfect) | **VMs** |
| **👥 Dev Ease** | 😴 Complex setup | 🥳 `docker run` magic | **Docker!** |
| **📱 Portability** | ❌ OS-specific | ✅ Any Docker host | **Docker!** |

***

## 🔥 **VMs: When Heavyweights STILL Win!**
Don't trash VMs—they're **kings** for:

```
✅ LEGACY APPS
- Old Windows .NET apps needing Windows kernel
- Oracle DBs demanding specific patches
- Enterprise Java monoliths (WebLogic)

✅ MULTI-OS WORKLOADS
Mac M1 + Windows Server + RHEL? VMs handle it!

✅ IRONCLAD SECURITY
Banking? Healthcare? VMs = true isolation
"Docker escape"? Rare but exists.

✅ GPU/COMPLEX HARDWARE
VMs pass through NVIDIA cards better
```

**2026 Reality**: AWS EC2 + EKS = **VMs running Docker**! Hybrid power! ⚡

***

## 🌪️ **Docker's KILLER Advantages (Your Chākan Dev Superpowers)**

```
1️⃣ DEV-TO-PROD = IDENTICAL 🎯
   docker build → docker run → AWS/GCP/Azure/K8s
   No "works on my machine" LIES! ❌

2️⃣ MICRO SERVICES MADNESS 🧩
   React Frontend (1 container)
   + Node API (1 container)  
   + MongoDB (1 container)
   = 3 docker-compose.yml files → k8s.yaml ⚡

3️⃣ ZERO COST LOCAL DEV 🌟
   `docker run -p 3000:3000 my-vite-app`
   Instant React + Tailwind + Vite! No global npm hell!

4️⃣ CLOUD-NATIVE KING 👑
   AWS ECS/Fargate, Google Cloud Run, Azure ACI
   Pay-per-second. Scale to ZERO when idle! 💰
```

***

## 😱 **Life WITHOUT Docker (VM Hell Stories)**

**Pre-2013 Nightmare**:
```
Monday: Dev builds React app → docker run ✅
Tuesday: QA needs test env → VMware clone (2hrs) 😴
Wednesday: Staging server → Manual Ubuntu install (4hrs) 💤
Thursday: Prod deploy → "Node version mismatch!" 🔧🔧🔧
Friday: Weekend ruined fixing snowflake servers 😭
```

**Docker Day**:
```
git push → CI/CD → docker build → k8s deploy
✅ 2 minutes total. Beers! 🍺
```

***

## 🎬 **The Epic Timeline: VMs → Docker → Future**
```
1960s: VMs born (IBM mainframes)
1999: VMware commercializes → Enterprise standard
2013: Docker drops → Devs REBEL! 🏴‍☠️
2014: Kubernetes orchestrates Docker → Cloud-native era
2026: **Podman/CRIU + WASM** challenge Docker throne?
```

**Microsoft Plot Twist**: Hated Linux → 2014 embraced Docker → Windows containers!

***

## 💼 **YOUR Career: Docker = Job Rocket Fuel! 🚀**
**Naukri.com Reality Check (2026)**:
```
"DevOps Engineer Pune" 
❌ No Docker: ₹6-8LPA 😞
✅ Docker + K8s: ₹15-25LPA 🤑
✅ Docker + K8s + ArgoCD: ₹30+LPA 💎
```

**Your CloudBlitz Path**:
```
1. docker run hello-world (5 mins) ✅
2. Dockerize ViteJS + Tailwind project (1 day) 🎉
3. docker-compose multi-container (React+API+DB) (2 days) 🔥
4. Deploy to AWS ECS → Resume gold! 💰
```

***

## 🧠 **Pro Tips: Master Both (Don't Pick Sides!)**

```
🏆 HYBRID POWER MOVES:
- DEV: Docker (fast local)
- PROD: EKS (K8s on EC2 VMs)
- LEGACY: VMware for old Java apps

🔥 DOCKERFILE FOR YOUR VITÉ APP:
```
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
EXPOSE 3000
CMD ["npm", "run", "dev"]
```
docker build -t my-vite-app . && docker run -p 3000:3000 my-vite-app ⚡
```

🐳 **2026 Trends**:
- **Podman** (rootless Docker)
- **containerd** (Docker underneath)
- **WASM containers** (browser-native!)
```

---

## 🎯 **Final Verdict: Docker WINS (But Love Your VMs)**

```
🥇 Docker = 90% modern apps
- Your React/K8s/Terraform projects
- Microservices & cloud-native

🥈 VMs = 10% special cases  
- Legacy Windows, GPU-heavy ML, paranoid security

💎 FUTURE: Docker + K8s + GitOps = Unbeatable! 👑
```

**Challenge**: Dockerize your **NEXT ViteJS project** TODAY. Resume line: *"Production-ready containerized deployments"* → Interview calls explode! 📞🚀

```
👉 Quick Win: 
docker run -d -p 8080:80 nginx
http://localhost:8080 → NGINX in 3 seconds! 🥳
```

**VMs built empires. Docker builds futures. You're building YOURS!** 🌟💪

# 🐳 **Docker Architecture UNLOCKED: What REALLY Gets Installed?** 🔧✨

**Installing Docker** = Downloading a **superhero toolkit** that transforms your laptop into a **container factory**! 🏭 But what *exactly* lands on your Chākan dev machine? Spoiler: It's a **client-server army** with hidden ninja components. Let's peel back the layers like an epic tech onion! 🧅🔍

***

## 🎬 **The BIG Picture: Docker's Client-Server Magic** 🌐
```
                    🚀 YOUR TERMINAL 🚀
                           │
                    📡 REST API (Secret Bridge)
                           │
                 🐳 DOCKER DAEMON (The Boss)
                  /    │    \    │    \
       📦Images  🌐Networks  🗄️Volumes  🖥️Containers  🔧Runtimes
```

**Think Logistics Empire**:
- **You** = Shipping Clerk (CLI commands)
- **Daemon** = Warehouse Manager (24/7 worker)
- **Containers** = Cargo Boxes (your React apps)

***

## 📦 **EXACTLY What Gets Installed on `sudo apt install docker.io`** 

### **1. Docker CLI (`docker` command) 🎯** ** [notes.kodekloud](https://notes.kodekloud.com/docs/Docker-Certified-Associate-Exam-Course/Docker-Engine/Docker-Engine-Architecture)
```
┌─📱 YOUR HANDS-ON TOOL
│
└─ Commands you LOVE:
  $ docker run hello-world          ✅ Test drive
  $ docker build -t my-vite-app .   ✅ Build magic
  $ docker ps                       ✅ List containers
  $ docker pull nginx               ✅ Grab images
```

**Size**: ~50MB  
**Location**: `/usr/bin/docker`  
**Job**: Translates `docker run` → REST API calls → Daemon does work!

```
🔥 FUN FACT: 
docker --version
→ Docker version 27.3.1, build ce12230
```

***

### **2. Docker Daemon (`dockerd`) 🐳 **The HEARTBEAT!** ** [kodekloud](https://kodekloud.com/blog/docker-architecture/)
```
┌─🖥️ BACKGROUND BOSS (systemd service)
│
└─ LISTENS on UNIX socket: /var/run/docker.sock
  $ sudo systemctl status docker
  ● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service)
     Active: active (running) since Wed 2026-02-11
```

**Size**: ~200MB  
**Job**: 
- Creates/destroys containers ⚙️
- Manages images 📦
- Handles networks 🌐
- Storage/volumes 🗄️

**Pro Tip**: `sudo docker info` → See daemon's FULL powers!

***

### **3. containerd (The UNDERGROUND NINJA) 🥷** ** [notes.kodekloud](https://notes.kodekloud.com/docs/Docker-Certified-Associate-Exam-Course/Docker-Engine/Docker-Engine-Architecture)
```
┌─🤫 HIDDEN RUNTIME (Docker's secret weapon)
│
└─ Runs INSIDE dockerd:
  ctr --namespace k8s.io containers list
  → Shows your containers!
```

**Why?** Docker evolved! Now uses **containerd** (OCI standard) for low-level container magic.  
**Size**: ~100MB  
**Your Win**: Faster, standards-compliant, Kubernetes-ready! 🌟

***

### **4. runc (The LOWEST LEVEL EXECUTOR) ⚡** ** [notes.kodekloud](https://notes.kodekloud.com/docs/Docker-Certified-Associate-Exam-Course/Docker-Engine/Docker-Engine-Architecture)
```
┌─🔬 ACTUAL CONTAINER STARTER
│
└─ Linux kernel calls:
  cgroups (CPU/RAM limits) 
  namespaces (isolation)
  pivot_root (new filesystem)
```

**Size**: ~10MB binary  
**Job**: `runc run container123` → Boom! Container alive! 🌀

***

### **5. Docker Networking & Storage Plugins** 🌐🗄️** ** [cyberpanel](https://cyberpanel.net/blog/docker-architecture)
```
┌─🔌 BUILT-IN PLUGINS (auto-installed)
│
├─ bridge (default network: docker0 → 172.17.0.1)
├─ overlay (multi-host swarms)
├─ host (use host network)
└─ storage drivers:
  - overlay2 (default, FAST)
  - aufs (old)
```

**Check**: `docker network ls` & `docker info | grep 'Storage Driver'`

***

## 🏗️ **COMPLETE Installation Breakdown (Ubuntu 24.04)**

```
📁 /usr/bin/
├── docker          ← CLI (50MB)
├── docker-init     ← PID 1 replacer
├── docker-proxy    ← Port mapping
└── containerd*     ← Runtime (symlink)

📁 /usr/libexec/docker/
├── dockerd         ← Daemon core
├── containerd/
│   ├── containerd  ← Main runtime
│   └── containerd-shim* ← Keeps containers alive
└── runc            ← OCI executor

📁 /etc/docker/
└── daemon.json     ← Config (edit for custom registries)

🔌 systemd:
├── docker.service  ← Main service
└── docker.socket   ← API socket listener

📡 Socket:
└── /var/run/docker.sock  ← CLI ↔ Daemon highway!
```

**Total Size**: **~500MB** (way lighter than VMware's 10GB!) 💚

***

## 🎛️ **How YOUR `docker run` Command ACTUALLY Works** 🕹️

```
$ docker run -p 3000:3000 my-vite-app  🚀
        │      │      │        │
        │      │      │        └─ Image name
        │      │ └────────────── Port mapping
        │ └───────────────────── Publish CLI command
        └─────────────────────── Docker CLI receives

1️⃣ CLI → REST API call: POST /containers/create
2️⃣ Daemon → containerd: "Prep container"
3️⃣ containerd → runc: "Execute entrypoint"
4️⃣ Kernel → cgroups/namespaces: "Isolate!"
5️⃣ BOOM! Your React app on localhost:3000 ✨
```

**Visual**:
```
┌─ You ── docker CLI ── REST API ──┐
│                                 │
└──────────┬───────────────────────┘
            │
      🐳 dockerd (Daemon)
            │
    ┌───────┼───────┐
    │       │       │
🔧runC  🗄️containerd  🌐Networking
    │
 🖥️ CONTAINER RUNNING! ⚡
```

***

## 🛠️ **YOUR Chākan Dev Setup: Verify Installation** 🕵️‍♂️

```bash
# 1. Check daemon heartbeat
sudo systemctl status docker

# 2. See FULL architecture
docker info | head -20

# 3. List binaries
docker version    # CLI + Server versions
ctr version       # containerd
runc --version    # Runtime

# 4. Magic test
docker run --rm alpine echo "Docker architecture = 🔥"
```

**Expected Output**:
```
Client: Docker Engine - Community
Server: Docker Engine - Community
 Container Runtime: containerd
 Runc: runc
```

***

## 🔮 **2026 ARCHITECTURE EVOLUTION** 🚀 ** [notes.kodekloud](https://notes.kodekloud.com/docs/Docker-Certified-Associate-Exam-Course/Docker-Engine/Docker-Engine-Architecture)

```
🐳 Docker 27.x (Feb 2026):
├── containerd v2.0 (faster pulls)
├── runc → crun (C rewrite, 30% faster)
├── BuildKit v2 (parallel builds)
└── WASM support (browser containers!) 🌐
```

**Kubernetes Bonus**: Your **EKS setup** talks **DIRECTLY** to containerd via CRI plugin! No dockerd needed in pods! 🤯

***

## 💼 **Pro Tips for YOUR CloudBlitz Resume** 🎯

```
✅ "Mastered Docker Engine architecture: dockerd + containerd + runc"
✅ "Implemented multi-arch builds: linux/amd64 + linux/arm64"
✅ "Optimized storage drivers: overlay2 → 40% faster image pulls"

🎯 INTERVIEW GOLD:
Q: "What happens during `docker run`?"
A: "CLI → REST → dockerd → containerd → runc → kernel namespaces!" 🏆
```

***

## 🎉 **TL;DR: Installation = Superhero Team Assembly!**
```
🥇 Docker CLI (`docker`) = Your remote control
🥈 Docker Daemon (`dockerd`) = Factory manager  
🥉 containerd + runc = Assembly line workers
🔌 Plugins = Networking/Storage magic

TOTAL: 500MB of deployment superpowers! 🦸‍♂️
```

**Challenge**: `docker run -it ubuntu bash` → Live inside container → `ps aux` → See **NO dockerd** inside! Mind blown! 🤯

**Docker Architecture = Your ticket to DevOps mastery!** Build, ship, run—flawlessly! 🚀💪 ** [spacelift](https://spacelift.io/blog/docker-architecture)

# 🐳 **Dockerfile Deep Dive: Multi-Stage Build Explained Line-by-Line**

This document provides a comprehensive breakdown of a production-ready multi-stage Dockerfile for Node.js applications. Each instruction is analyzed for purpose, best practices, and layer caching implications.

## 🎯 **Multi-Stage Build Strategy Overview**

Multi-stage builds separate **build-time dependencies** from **runtime requirements**, resulting in significantly smaller production images. This Dockerfile uses two stages:

```
Stage 1 (build): Installs build tools → npm install → npm run build → Discard dev dependencies
Stage 2 (runtime): Copies only production artifacts → Minimal runtime image
```

**Benefits**: ~85-90% smaller images, faster deployments, enhanced security through reduced attack surface.

***

## 🔬 **Stage 1: Build Stage - Complete Line Analysis**

### ```FROM node:20-alpine AS build```
```dockerfile
FROM node:20-alpine AS build
```
- **Purpose**: Establishes base image with Node.js 20 on Alpine Linux (lightweight, ~187MB total)
- **Why Alpine?**: 5MB base OS vs Ubuntu's 120MB (24x smaller), fewer security vulnerabilities
- **Version Pinning**: `20-alpine` (not `latest`) ensures reproducible builds across environments
- **`AS build`**: Names stage for cross-stage `COPY --from=build` reference
- **Layer Impact**: Creates Layer 1 (base image cache)

### ```RUN apk add --no-cache build-base gcc autoconf automake libtool vips-dev zlib-dev python3```
```dockerfile
RUN apk add --no-cache build-base gcc autoconf automake libtool vips-dev zlib-dev python3
```
- **Purpose**: Installs native compilation tools for `node-gyp` and Sharp image library
- **Components Breakdown**:
  | Package | Purpose |
  |---------|---------|
  | `build-base` | gcc, g++, make (native module compilation) |
  | `vips-dev` | Sharp image processing library dependencies |
  | `python3` | Required by `node-gyp` for native builds |
  | `zlib-dev` | Compression library for image processing |
- **`--no-cache`**: Prevents apk cache storage (saves ~15MB per layer)
- **Layer Impact**: Layer 2 (+120MB temporarily, discarded in final stage)

### ```WORKDIR /opt/app```
```dockerfile
WORKDIR /opt/app
```
- **Purpose**: Sets working directory for subsequent `RUN`, `CMD`, `ENTRYPOINT`
- **`/opt/app`**: Linux Filesystem Hierarchy Standard location for applications
- **Behavior**: Creates directory if missing, becomes default for relative paths
- **Layer Impact**: Layer 3 (metadata only)

### ```COPY package.json package-lock.json ./```
```dockerfile
COPY package.json package-lock.json ./
```
- **Purpose**: Copies dependency manifests **before** source code (cache optimization)
- **Layer Caching**: `npm install` layer caches unless `package*.json` changes
- **Build Speed Impact**:
  ```
  Code change only: npm install → SKIPPED (cache hit) ⚡
  package.json change: npm install → Re-executed
  ```
- **Layer Impact**: Layer 4 (~2KB)

### ```RUN npm install --frozen-lockfile```
```dockerfile
RUN npm install --frozen-lockfile
```
- **`--frozen-lockfile`**: Forces exact versions from `package-lock.json` (CI/CD safe)
- **Prevents**: Minor/patch updates causing "works on my machine" issues
- **Scope**: Installs `dependencies` + `devDependencies` (build tools)
- **Layer Impact**: Layer 5 (~1.2GB peak, cached)

### ```COPY . .```
```dockerfile
COPY . .
```
- **Purpose**: Copies complete source code **after** dependency installation
- **Cache Leverage**: Docker Layer Cache hits for `npm install` (unchanged `package.json`)
- **`.dockerignore` Recommended**:
  ```
  node_modules
  .git
  *.log
  dist/
  .next/
  ```
- **Layer Impact**: Layer 6 (source code)

### ```RUN npm run build```
```dockerfile
RUN npm run build
```
- **Purpose**: Executes production build (`vite build`, `next build`, etc.)
- **Output**: Creates `dist/`, `.next/`, or `build/` directory with optimized assets
- **Typical `package.json`**:
  ```json
  "scripts": {
    "build": "vite build",
    "start": "node dist/server/entry.mjs"
  }
  ```
- **Layer Impact**: Layer 7 (build artifacts)

### ```RUN npm prune --omit=dev && npm cache clean --force```
```dockerfile
RUN npm prune --omit=dev && npm cache clean --force
```
- **`npm prune --omit=dev`**: Removes `devDependencies` (testing/build tools)
- **`npm cache clean --force`**: Clears npm cache (~500MB savings)
- **Size Reduction**:
  ```
  Before: ~1.2GB (full node_modules)
  After:  ~380MB (production dependencies only)
  ```
- **Layer Impact**: Layer 8 (significant size reduction)

***

## 🎭 **Stage 2: Runtime Stage - Production Optimized**

### ```FROM node:20-alpine```
```dockerfile
FROM node:20-alpine
```
- **Purpose**: Fresh base image for runtime (discards build stage completely)
- **Version Match**: Same Node.js 20 prevents runtime compatibility issues
- **Layer Impact**: Layer 9 (187MB clean slate)

### ```RUN apk add --no-cache vips```
```dockerfile
RUN apk add --no-cache vips
```
- **Purpose**: Sharp runtime dependencies (no `-dev` headers needed)
- **Minimal**: Only production runtime libraries (+15MB)
- **`--no-cache`**: Prevents package cache bloat
- **Layer Impact**: Layer 10

### ```WORKDIR /opt/app```
```dockerfile
WORKDIR /opt/app
```
- **Purpose**: Reset working directory for runtime stage
- **Consistency**: Matches build stage working directory
- **Layer Impact**: Layer 11 (metadata)

### ```COPY --from=build /opt/app ./```
```dockerfile
COPY --from=build /opt/app ./
```
- **Cross-Stage Magic**: Copies **only** `/opt/app` from build stage
- **What Transfers**: Build artifacts (`dist/`), `package.json`, `node_modules` (prod only)
- **What Stays Behind**: Build tools, source code, dev dependencies, npm cache
- **Layer Impact**: Layer 12 (**FINAL IMAGE** ~152MB)

### ```ENV NODE_ENV=production```
```dockerfile
ENV NODE_ENV=production
```
- **Purpose**: Configures Node.js/npm for production optimizations
- **Effects**:
  | Setting | Production Behavior |
  |---------|-------------------|
  | npm scripts | Uses production-optimized paths |
  | Bundlers | Enables minification/compression |
  | Logging | Reduced verbosity |
- **Persistence**: Environment variable available to application code
- **Layer Impact**: Layer 13 (metadata)

### ```EXPOSE 1337```
```dockerfile
EXPOSE 1337
```
- **Purpose**: Documents container's network port (metadata only)
- **Not Binding**: Requires `docker run -p 1337:1337` for external access
- **Convention**: Port 1337 ("leet") commonly used in development
- **Layer Impact**: Layer 14 (metadata)

### ```CMD ["npm", "start"]```
```dockerfile
CMD ["npm", "start"]
```
- **Purpose**: Default executable when container starts
- **Exec Form `[]`**: Direct execution (PID 1), proper signal handling
- **vs Shell Form**:
  ```dockerfile
  CMD npm start  # ❌ Creates extra shell process
  CMD ["npm", "start"]  # ✅ Direct exec
  ```
- **Overridable**: `docker run my-app node custom-script.js`
- **Layer Impact**: Layer 15 (final)

***

## 📊 **Layer-by-Layer Build Analysis**

```
$ docker build -t my-app .
[+] Building 2.1s (15/15) FINISHED
 => [internal] load build definition   0.0s
 => => transferring dockerfile         0.1s
 => [1/9] FROM docker.io/node:20-alpine AS build  1.2s
 => [2/9] RUN apk add --no-cache build-base...   12.3s
 => [3/9] WORKDIR /opt/app                      0.1s
 => [4/9] COPY package.json package-lock.json    0.1s ✅ CACHE HIT
 => [5/9] RUN npm install --frozen-lockfile     0.1s ✅ CACHE HIT
 => [6/9] COPY . .                               0.2s
 => [7/9] RUN npm run build                     23.4s
 => [8/9] RUN npm prune --omit=dev...           8.2s
 => [9/9] FROM docker.io/node:20-alpine          0.8s
 => [10/15] RUN apk add --no-cache vips         2.1s
 => [11/15] COPY --from=build /opt/app ./       0.3s
 => exporting to image                          1.4s
 => => exporting layers                         1.2s
 => => writing image sha256:...                 0.0s
 => => naming to docker.io/library/my-app      0.0s

🏆 FINAL IMAGE SIZE: 152MB (90% smaller than single-stage!)
```

***

## 🔧 **Production Deployment Configuration**

```yaml
# docker-compose.yml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "1337:1337"
    environment:
      - NODE_ENV=production
    restart: unless-stopped
```

```bash
# Build and run
docker build -t my-app .
docker run -d -p 1337:1337 --name production-app --restart unless-stopped my-app
```

***

## 📝 **Key Best Practices Demonstrated**

1. **Layer Caching**: `package.json` first → `npm install` cache hits
2. **Multi-Stage**: Build tools discarded → Minimal runtime
3. **Alpine Base**: Smallest secure base images
4. **Frozen Lockfile**: Reproducible dependency installation
5. **Dev Dependency Removal**: `npm prune --omit=dev`
6. **No Cache Storage**: `--no-cache` flags everywhere
7. **Exec Form CMD**: Proper signal handling
8. **Production Environment**: `NODE_ENV=production`

This Dockerfile represents production-grade containerization practices suitable for cloud deployment, CI/CD pipelines, and enterprise environments.

# 🐳 **Docker Commands Reference: Essential CLI Guide**

This document provides a comprehensive reference of key Docker commands organized by workflow category. Each command includes syntax, common options, practical examples, and usage context for production and development environments.

## 🚀 **Quick Start Commands**

| Command | Description | Example |
|---------|-------------|---------|
| `docker run` | Create and start a container | `docker run -d -p 80:80 nginx` |
| `docker ps` | List running containers | `docker ps`<br>`docker ps -a` (all containers) |
| `docker build` | Build image from Dockerfile | `docker build -t myapp .` |
| `docker pull` | Download image from registry | `docker pull node:20-alpine` |
| `docker version` | Show Docker version info | `docker version` |

## 🏗️ **Image Management**

### **Build & Tag**
```bash
# Basic build
docker build -t myapp:latest .

# Multi-platform build
docker buildx build -t myapp:latest --platform linux/amd64,linux/arm64 .

# Build with no cache
docker build --no-cache -t myapp .
```

### **List & Inspect**
| Command | Description | Example |
|---------|-------------|---------|
| `docker images` | List local images | `docker images`<br>`docker images -a` (all) |
| `docker image ls` | Alternative list | `docker image ls myapp` |
| `docker image inspect` | Detailed image info | `docker image inspect myapp:latest` |
| `docker image history` | Image layer history | `docker image history myapp:latest` |

### **Remove & Clean**
```bash
# Remove specific image
docker image rm myapp:latest

# Remove dangling images
docker image prune

# Remove all unused images
docker image prune -a
```

## 🖥️ **Container Lifecycle**

### **Run Containers**
```bash
# Interactive shell
docker run -it --rm ubuntu bash

# Detached with port mapping
docker run -d -p 3000:3000 --name myapp myapp:latest

# With environment variables
docker run -d -p 80:80 -e NODE_ENV=production myapp

# Mount volume
docker run -d -p 80:80 -v /host/data:/app/data myapp
```

### **Container Management**
| Command | Description | Example |
|---------|-------------|---------|
| `docker start` | Start stopped container | `docker start mycontainer` |
| `docker stop` | Graceful stop | `docker stop mycontainer` |
| `docker restart` | Restart container | `docker restart mycontainer` |
| `docker kill` | Force kill | `docker kill mycontainer` |
| `docker rm` | Remove container | `docker rm mycontainer` |
| `docker exec` | Run command in container | `docker exec -it mycontainer bash` |

## 🔍 **Monitoring & Debugging**

### **Container Status**
```bash
# Running containers
docker ps

# All containers (with status)
docker ps -a

# Container resource usage
docker stats

# Container specific stats
docker stats mycontainer
```

### **Logs & Processes**
| Command | Description | Example |
|---------|-------------|---------|
| `docker logs` | View container logs | `docker logs mycontainer` |
| `docker logs -f` | Follow logs (tail -f) | `docker logs -f mycontainer` |
| `docker top` | Processes in container | `docker top mycontainer` |
| `docker inspect` | Detailed container info | `docker inspect mycontainer` |

## 📦 **Volume Management**

| Command | Description | Example |
|---------|-------------|---------|
| `docker volume ls` | List volumes | `docker volume ls` |
| `docker volume create` | Create named volume | `docker volume create mydata` |
| `docker volume inspect` | Volume details | `docker volume inspect mydata` |
| `docker volume rm` | Remove volume | `docker volume rm mydata` |
| `docker volume prune` | Remove unused volumes | `docker volume prune` |

**Volume Mount Examples**:
```bash
# Named volume
docker run -v mydata:/app/data myapp

# Bind mount (host path)
docker run -v /host/path:/container/path myapp

# Read-only volume
docker run -v /data:/app/data:ro myapp
```

## 🌐 **Network Management**

| Command | Description | Example |
|---------|-------------|---------|
| `docker network ls` | List networks | `docker network ls` |
| `docker network create` | Create network | `docker network create mynet` |
| `docker network connect` | Connect container | `docker network connect mynet mycontainer` |
| `docker network disconnect` | Disconnect container | `docker network disconnect mynet mycontainer` |
| `docker network rm` | Remove network | `docker network rm mynet` |

**Common Networks**:
- `bridge` (default)
- `host` (share host network)
- `none` (no networking)

## 📡 **Registry & Hub Commands**

```bash
# Login/Logout
docker login
docker logout

# Push/Pull
docker push myrepo/myapp:latest
docker pull myrepo/myapp:latest

# Search
docker search nginx
```

## 🧹 **Cleanup Commands**

```bash
# Remove stopped containers
docker container prune

# Remove unused images
docker image prune -a

# Remove unused networks
docker network prune

# Remove unused volumes
docker volume prune

# NUCLEAR OPTION (everything unused)
docker system prune -a --volumes
```

## 🔧 **Advanced Workflow Commands**

### **Docker Compose**
```bash
# Start services
docker compose up -d

# Stop services
docker compose down

# View logs
docker compose logs -f

# Rebuild
docker compose up --build -d
```

### **Docker BuildKit (Modern Builds)**
```bash
# Enable BuildKit
DOCKER_BUILDKIT=1 docker build .

# Multi-stage with cache
docker buildx build --cache-to=type=inline .

# Multi-platform
docker buildx build --platform linux/amd64,linux/arm64 -t myapp .
```

## 📋 **Daily Development Workflow**

```bash
# 1. Build your app
docker build -t my-vite-app .

# 2. Run with volume mount (dev mode)
docker run -p 3000:3000 -v $(pwd):/app -w /app my-vite-app npm run dev

# 3. Production build & run
docker build -t myapp-prod .
docker run -d -p 80:1337 myapp-prod

# 4. Check status
docker ps
docker logs -f <container>

# 5. Debug inside
docker exec -it <container> sh

# 6. Cleanup
docker stop <container>
docker rm <container>
```

## ⚙️ **Common Flags Reference**

| Flag | Purpose | Example |
|------|---------|---------|
| `-d` | Detached mode | `docker run -d` |
| `-p` | Port mapping | `docker run -p 8080:80` |
| `-v` | Volume mount | `docker run -v /data:/app` |
| `--name` | Container name | `docker run --name myapp` |
| `-e` | Environment var | `docker run -e NODE_ENV=prod` |
| `--rm` | Auto-remove on exit | `docker run --rm` |
| `-it` | Interactive + TTY | `docker exec -it` |

## 🧪 **Troubleshooting Commands**

```bash
# Docker system info
docker info

# Docker system usage
docker system df

# Container network inspection
docker port mycontainer

# Image vulnerability scan
docker scout cii myapp

# Events stream
docker events
```

## 📖 **Command Categories Summary**

```
🏗️ BUILD: docker build, docker buildx
🖥️ RUN: docker run, docker exec, docker logs  
🔍 MONITOR: docker ps, docker stats, docker inspect
📦 CLEAN: docker rm, docker rmi, docker prune
🌐 NETWORK: docker network ls/create/connect
📁 VOLUME: docker volume ls/create/rm
📡 REGISTRY: docker push/pull/login
🧹 SYSTEM: docker system prune/info/df
```

This reference covers 95% of daily Docker operations. Print, bookmark, or keep in your terminal for quick access during development, CI/CD pipelines, and production deployments.

# 🌐 **Docker Networking: Complete Reference Guide**

This document provides comprehensive coverage of Docker networking concepts, network drivers, configuration, and practical implementation for containerized applications.

## 🎯 **Core Networking Concepts**

### **Key Components**
```
Network Namespace: Each container gets isolated network stack (IP, routing table)
veth Pairs: Virtual ethernet cables connecting container ↔ host bridge
Bridge: Virtual switch connecting containers on same network
iptables: Linux firewall rules for NAT, port forwarding, isolation
Docker Proxy: Handles port mapping from host → container
```

**How It Works**:
```
Host Machine (192.168.1.100)
    │
docker0 Bridge (172.17.0.1)
    ├─ Container A (172.17.0.2:80)
    ├─ Container B (172.17.0.3:3000)
    └─ NAT → External World
```

## 🏗️ **Docker Network Drivers (Types)**

| Driver | Use Case | Isolation | Host Access | Multi-Host |
|--------|----------|-----------|-------------|------------|
| `bridge` | Default, single-host apps | ✅ Network | Port mapping | ❌ |
| `host` | Max performance | ❌ None | Direct | ❌ |
| `none` | No networking | ✅ Total | ❌ | ❌ |
| `overlay` | Docker Swarm | ✅ Network | Port mapping | ✅ |
| `macvlan` | VM-like isolation | ✅ L2 | Direct IP | ✅ |
| `ipvlan` | L3 isolation | ✅ L3 | Direct IP | ✅ |

***

## 🔌 **1. Bridge Network (Default)**

**Auto-created**: `docker0` (172.17.0.0/16)

### **Characteristics**
```
✅ Containers communicate by IP (172.17.0.2 → 172.17.0.3)
❌ No DNS name resolution (use IPs only)
✅ Port mapping: docker run -p 8080:80
✅ NAT to external internet
```

### **Commands**
```bash
# Inspect default bridge
docker network ls
docker network inspect bridge

# Run containers (auto-join bridge)
docker run -d --name web nginx
docker run -d --name app myapp
```

**Limitation**: Containers can't resolve each other by name → Use custom bridge!

***

## 🌉 **2. User-Defined Bridge Networks (Recommended)**

**DNS Magic**: Containers resolve by **name** automatically!

### **Workflow**
```bash
# 1. Create custom network
docker network create myapp-network

# 2. Run containers on network
docker run -d --name web --network myapp-network nginx
docker run -d --name api --network myapp-network myapp-api

# 3. Containers resolve by name!
docker exec web ping api    # Works! → 172.20.0.2
docker exec web curl api:3000  # Perfect!
```

### **Network Inspect Output**
```bash
docker network inspect myapp-network
```
```
"Containers": {
    "abc123": {
        "Name": "web",
        "IPv4Address": "172.20.0.2/16"
    },
    "def456": {
        "Name": "api", 
        "IPv4Address": "172.20.0.3/16"
    }
}
```

***

## 🖥️ **3. Host Network Mode**

**No isolation**: Container uses host's network stack directly.

```bash
# Run with host networking
docker run -d --name nginx-host --network host nginx

# Access directly: http://localhost:80 (no port mapping needed!)
```

**Use Cases**:
```
✅ High-performance apps (Prometheus, monitoring)
✅ Legacy apps expecting host network
✅ Avoid port conflicts in dev
❌ Multi-container apps (loses isolation)
```

***

## 🚫 **4. None Network Mode**

**Total isolation**: No network interfaces.

```bash
docker run -d --network none --name isolated myapp
docker exec isolated ip addr  # No interfaces!
```

**Use Case**: Batch jobs, crypto miners, offline processing.

***

## 🔗 **5. Multi-Container Communication Patterns**

### **Pattern 1: Same Network (Recommended)**
```bash
# Frontend + Backend + DB
docker network create stack
docker run -d --network stack --name frontend nginx
docker run -d --network stack --name backend myapp-api  
docker run -d --network stack --name db postgres

# Communication
docker exec frontend curl backend:3000/api
docker exec frontend curl db:5432/health
```

### **Pattern 2: Connect Across Networks**
```bash
# Create two networks
docker network create frontend-net
docker network create backend-net

# Backend joins both networks
docker run -d --network backend-net --name db postgres
docker run -d --network backend-net --network frontend-net --name api myapp-api

# Frontend → API (via frontend-net)
docker exec frontend curl api:3000
# API → DB (via backend-net)
docker exec api curl db:5432
```

***

## 🛠️ **Complete Network Management Commands**

| Command | Purpose | Example |
|---------|---------|---------|
| `docker network ls` | List networks | `docker network ls` |
| `docker network create` | Create network | `docker network create myapp-net` |
| `docker network rm` | Delete network | `docker network rm myapp-net` |
| `docker network connect` | Join network | `docker network connect myapp-net container1` |
| `docker network disconnect` | Leave network | `docker network disconnect myapp-net container1` |
| `docker network inspect` | Network details | `docker network inspect myapp-net` |
| `docker network prune` | Cleanup unused | `docker network prune` |

***

## 📡 **Port Mapping & Exposure**

```
EXPOSE 80     # Dockerfile metadata only
-p 8080:80    # Host 8080 → Container 80
-p 80:80      # Host 80 → Container 80  
-p 80         # Host 80 → Container 80 (same port)
--publish-all # All EXPOSEd ports
```

**Multiple Ports**:
```bash
docker run -d -p 80:80 -p 443:443 -p 3000:3000 nginx
```

***

## 💼 **Production Docker Compose Networking**

```yaml
# docker-compose.yml
version: '3.8'
services:
  frontend:
    image: nginx
    networks:
      - public
      - internal
    ports:
      - "80:80"

  api:
    image: myapp-api
    networks:
      - internal
    # No ports exposed (internal only)

  db:
    image: postgres
    networks:
      - internal

networks:
  public:
    driver: bridge
  internal:
    driver: bridge
```

**Result**:
```
✅ frontend.public:80 → Internet accessible
✅ frontend.internal → Can reach api, db by name
✅ api.internal → Can reach db by name  
❌ api.public → No external access
```

***

## 🧪 **Practical Debugging Commands**

```bash
# 1. Check container networks
docker inspect <container> | grep NetworkMode

# 2. Container IP addresses
docker inspect <container> | grep IPAddress

# 3. Test connectivity
docker exec container1 ping container2
docker exec container1 curl http://container2:8080

# 4. Port mappings
docker port container1

# 5. Network routes
docker exec container1 ip route

# 6. Host iptables rules
sudo iptables -t nat -L -n -v
```

***

## 🔒 **Security Best Practices**

```
✅ Use user-defined bridge networks (DNS + isolation)
✅ Least privilege: Internal services → No port mapping
✅ Network segmentation: Separate frontend/backend/DB
✅ Firewall external access: Only publish required ports
✅ Regular cleanup: docker network prune
❌ Avoid default bridge for production (no DNS)
❌ Never use --network host in production
```

***

## 🌐 **Advanced: Overlay Networks (Swarm)**

```bash
# Swarm mode (multi-host)
docker swarm init
docker network create --driver overlay my-overlay-net

# Deploy across cluster
docker stack deploy -c docker-compose.yml myapp
```

**Overlay Characteristics**:
```
✅ Cross-host container discovery by name
✅ Swarm load balancing
✅ Encrypted by default (Gossip protocol)
```

***

## 📋 **Quick Reference: Network Creation Patterns**

```bash
# Simple web app (1 network)
docker network create webapp
docker run -d --network webapp --name frontend nginx
docker run -d --network webapp -p 3000:3000 --name api node-app

# Fullstack (2 networks)  
docker network create public
docker network create internal
docker run -d --network public -p 80:80 frontend
docker run -d --network internal --network public api
docker run -d --network internal db
```

This guide covers Docker networking fundamentals through production patterns. User-defined bridge networks with DNS name resolution solve 95% of container communication needs.

# 💾 **Docker Volumes & Persistence: Complete Reference Guide**

This document explains Docker's data persistence mechanisms, covering volumes, bind mounts, tmpfs mounts, and production best practices for stateful applications.

## 🎯 **The Persistence Problem**

**Containers are ephemeral by design**:
```
❌ Container stops → Data in container filesystem = LOST
❌ docker rm → All writable layer data = DELETED  
❌ Image rebuild → No data carryover
```

**Solution**: External storage outside container lifecycle.

## 📦 **Three Persistence Methods Compared**

| Type | Management | Location | Portability | Production | Example |
|------|------------|----------|-------------|------------|---------|
| **Volumes** | Docker | `/var/lib/docker/volumes/` | ✅ High | ✅ Recommended | `-v mydata:/app/data` |
| **Bind Mounts** | Manual | Any host path | ❌ Low | ⚠️ Dev only | `-v /host/path:/app/data` |
| **tmpfs Mounts** | RAM | Memory only | ✅ High | ❌ Ephemeral | `--mount type=tmpfs:/app/tmp` |

***

## 🗂️ **1. Docker Volumes (Recommended)**

**Docker-managed storage** completely independent of containers.

### **Characteristics**
```
✅ Survives container deletion
✅ Multiple containers can share
✅ Automatic backup/migration support  
✅ Driver plugins (AWS EBS, NFS, etc.)
✅ Performance optimized
```

### **Commands**

```bash
# Create named volume
docker volume create app-data

# Run with volume
docker run -d -v app-data:/app/data --name web nginx

# List volumes
docker volume ls

# Inspect volume
docker volume inspect app-data

# Remove volume (when unused)
docker volume rm app-data

# Cleanup unused
docker volume prune
```

### **Volume Lifecycle**
```
1. docker volume create app-data           # Volume created
2. docker run -v app-data:/app/data web    # Container mounts volume
3. docker rm web                          # Container gone, volume SURVIVES
4. docker run -v app-data:/app/data web2   # New container sees same data!
```

***

## 🔗 **2. Bind Mounts**

**Direct host filesystem access** (development preferred).

```bash
# Mount host directory into container
docker run -d -v /home/user/mydata:/app/data nginx

# Absolute path required
docker run -d -v ./relative-data:/app/data nginx  # ❌ Converts to absolute

# Read-only mount
docker run -d -v /host/logs:/app/logs:ro nginx
```

**Storage Location**: Exactly where you specify (`/home/user/mydata`)

***

## 📁 **Volume Types**

### **Named Volumes** (Production)
```bash
docker volume create db-data
docker run -d -v db-data:/var/lib/postgresql/data postgres
```

### **Anonymous Volumes** (Temporary)
```bash
docker run -d -v /app/data postgres  # Docker creates random name
# docker volume ls →  abc123xyz_app-data
```

## 🛠️ **Practical Examples**

### **1. Database Persistence**
```bash
# Create Postgres with persistent data
docker volume create pg-data
docker run -d \
  --name postgres \
  -v pg-data:/var/lib/postgresql/data \
  -e POSTGRES_PASSWORD=secret \
  -p 5432:5432 \
  postgres:15-alpine
```

### **2. Multi-Container Shared Volume**
```bash
# Producer + Consumer sharing data
docker volume create shared-logs

docker run -d --name logger -v shared-logs:/logs busybox sh -c "while true; do echo $(date) >> /logs/app.log; sleep 1; done"

docker run -it --rm -v shared-logs:/logs alpine cat /logs/app.log
```

### **3. Development Bind Mount (Live Code Reload)**
```bash
# React dev with live reload
docker run -p 3000:3000 \
  -v $(pwd)/src:/app/src \
  -v $(pwd)/package.json:/app/package.json \
  node:20-alpine \
  npm run dev
```

***

## 📋 **docker-compose.yml Volume Patterns**

```yaml
version: '3.8'
services:
  web:
    image: nginx
    volumes:
      - ./html:/usr/share/nginx/html:ro    # Bind mount (static files)
      - logs:/var/log/nginx               # Named volume (logs)

  app:
    build: .
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock  # Docker socket
      - ./config:/app/config                     # Config bind mount

volumes:
  logs:                                  # Declare named volume
    driver: local
```

***

## 🔍 **Volume Inspection & Debugging**

```bash
# List all volumes
docker volume ls --filter dangling=true

# Detailed inspection
docker volume inspect pg-data
# Output:
# "Mountpoint": "/var/lib/docker/volumes/pg-data/_data"

# Browse volume contents
sudo ls -la /var/lib/docker/volumes/pg-data/_data

# Check container volume usage
docker inspect web | grep -A 20 Mounts
```

## 🧹 **Volume Cleanup Strategies**

```bash
# Remove unused volumes
docker volume prune

# Remove specific volume (must be unused)
docker volume rm myvolume

# NUCLEAR: Remove everything unused
docker system prune -a --volumes
```

**Warning**: `docker system prune --volumes` deletes **all** unused volumes!

***

## 🔒 **Production Best Practices**

### **Volume Security**
```
✅ Use named volumes (not anonymous)
✅ Least privilege paths (not root mounts)
✅ Read-only where possible (:ro)
✅ Regular backups
❌ Never mount Docker socket in production
```

### **Volume Drivers (Cloud)**
```yaml
volumes:
  db-data:
    driver: local
    driver_opts:
      type: nfs
      o: addr=10.0.0.10,rw
      device: ":/volumes/db-data"
```

**Cloud Examples**:
```
AWS: EFS, EBS via CSI driver
GCP: Filestore, Persistent Disk
Azure: Azure Files, Disks
```

***

## ⚡ **Performance Characteristics**

| Mount Type | Read Speed | Write Speed | Use Case |
|------------|------------|-------------|----------|
| **Volume** | Fast | Fast | Production data |
| **Bind Mount** | Medium | Medium | Development |
| **tmpfs** | Very Fast | Very Fast | Temp files, secrets |

**tmpfs Example** (RAM-backed):
```bash
docker run -it --tmpfs /app/tmp:exec alpine sh
```

***

## 🚀 **Advanced Patterns**

### **Read-Only Config + Writable Data**
```yaml
volumes:
  - ./config.json:/app/config.json:ro    # Config (immutable)
  - app-data:/app/data                   # Data (mutable)
```

### **Multi-Service Shared Storage**
```yaml
services:
  mysql: 
    volumes: [ db-data:/var/lib/mysql ]
  backup:
    volumes: [ db-data:/var/lib/mysql:ro ]  # Read-only backup
volumes:
  db-data:
```

***

## 📊 **Summary Table**

| Scenario | Command | Persistence | Sharing |
|----------|---------|-------------|---------|
| Database | `-v pgdata:/var/lib/postgresql/data` | ✅ Survives container | ✅ Multiple containers |
| Logs | `-v logs:/app/logs` | ✅ Survives container | ✅ Multiple writers |
| Static Files | `-v ./html:/usr/share/nginx/html:ro` | ✅ Host-managed | ❌ Single container |
| Dev Code | `-v $(pwd):/app` | ✅ Live reload | ❌ Dev only |
| Temp Files | `--tmpfs /tmp` | ❌ RAM only | ✅ Fast |

## 🛠️ **Troubleshooting Commands**

```bash
# Check what's using volume
docker ps -a --filter volume=pg-data

# Find container mount paths
docker inspect container | jq '.[].Mounts'

# Volume usage stats
docker system df -v
```

**Key Takeaway**: **Named volumes solve 95% of persistence needs**. Use bind mounts only for development workflows requiring live code synchronization.

# 🐙 **Docker Compose: Multi-Container Orchestration Guide**

This document provides comprehensive coverage of Docker Compose for defining and managing multi-container Docker applications using YAML configuration files.

## 🎯 **What is Docker Compose?**

**Docker Compose** defines multi-container applications in a single `docker-compose.yml` file, eliminating complex `docker run` command chains.

```
❌ Manual Commands (5 lines × 3 services = 15 commands)
docker network create app-net
docker volume create db-data
docker run -d --network app-net postgres
docker run -d --network app-net -p 3000:3000 frontend
docker run -d --network app-net frontend

✅ Single Command (1 line)
docker compose up -d
```

## 📋 **Core Concepts**

| Component | Purpose | Example |
|-----------|---------|---------|
| **Services** | Individual containers | `web`, `api`, `db` |
| **Networks** | Container communication | Auto-created default bridge |
| **Volumes** | Persistent storage | `db-data:/var/lib/postgresql/data` |
| **Configs** | Configuration files | SSL certificates, settings |

## 🏗️ **docker-compose.yml Structure**

```yaml
version: '3.8'                    # Compose file format version

services:                          # Container definitions
  web:                             # Service name (DNS name)
    image: nginx:alpine            # Pre-built image OR
    build: .                       # Build from Dockerfile
    ports:
      - "80:80"                    # Host:Container port
    environment:
      - NODE_ENV=production
    volumes:
      - ./html:/usr/share/nginx/html:ro
    networks:
      - frontend
    depends_on:
      - api

  api:
    build: ./backend
    volumes:
      - app-data:/app/data
    networks:
      - frontend
      - backend

  db:
    image: postgres:15-alpine
    environment:
      POSTGRES_PASSWORD: secret
    volumes:
      - db-data:/var/lib/postgresql/data
    networks:
      - backend

volumes:                           # Named volumes
  db-data:
  app-data:

networks:                          # Custom networks
  frontend:
    driver: bridge
  backend:
    driver: bridge
  default:                         # Auto-created
```

## 🚀 **Essential Commands**

| Command | Description | Example |
|---------|-------------|---------|
| `docker compose up` | Create & start all services | `docker compose up -d` |
| `docker compose down` | Stop & remove containers/networks | `docker compose down --volumes` |
| `docker compose ps` | List services status | `docker compose ps` |
| `docker compose logs` | View service logs | `docker compose logs -f web` |
| `docker compose restart` | Restart services | `docker compose restart api` |
| `docker compose build` | Build or rebuild services | `docker compose build` |
| `docker compose exec` | Run command in service | `docker compose exec web sh` |

## 🔧 **Key Configuration Options**

### **1. Service Definitions**
```yaml
services:
  web:
    image: nginx:alpine           # Use existing image
    # OR
    build:
      context: ./frontend         # Build context
      dockerfile: Dockerfile.prod # Custom Dockerfile
    # OR  
    command: npm start            # Override CMD
    entrypoint: /app/start.sh     # Override ENTRYPOINT
```

### **2. Port Mappings**
```yaml
ports:
  - "8080:80"       # Host 8080 → Container 80
  - "8443:443"      # Multiple ports
  - "80"           # Auto: Host 80 → Container 80
```

### **3. Environment Variables**
```yaml
# Method 1: Inline
environment:
  - NODE_ENV=production
  - DB_HOST=db

# Method 2: .env file (auto-loaded)
# .env file:
# DB_PASSWORD=secret123
# APP_PORT=3000

# Method 3: env_file
env_file:
  - config/dev.env
  - secrets/prod.env
```

### **4. Volumes**
```yaml
volumes:
  # Named volume
  - pg-data:/var/lib/postgresql/data
  
  # Bind mount
  - ./static:/usr/share/nginx/html:ro
  
  # Multiple volumes
  - logs:/app/logs
  - ./config:/app/config
```

### **5. Dependencies**
```yaml
depends_on:
  - db                 # Start web after db
  condition: service_healthy  # Wait for healthcheck
```

## 🛡️ **Health Checks**
```yaml
services:
  db:
    image: postgres
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
```

## 🌐 **Networking**
```yaml
networks:
  frontend:
  backend:

services:
  web:
    networks:
      - frontend
  api:
    networks:
      - frontend
      - backend
```

**DNS Resolution**: Services resolve by **service name**:
```
web → api:3000    # Works automatically!
api → db:5432     # Works automatically!
```

## 💼 **Production Examples**

### **1. Fullstack Web Application**
```yaml
version: '3.8'
services:
  frontend:
    build: ./frontend
    ports:
      - "80:3000"
    environment:
      - VITE_API_URL=http://api:3001

  api:
    build: ./backend
    ports:
      - "3001:3001"
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/myapp
    depends_on:
      db:
        condition: service_healthy

  db:
    image: postgres:15-alpine
    environment:
      POSTGRES_DB: myapp
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
    volumes:
      - db-data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "postgres"]

volumes:
  db-data:
```

### **2. Development Environment**
```yaml
services:
  app:
    build: .
    ports:
      - "3000:3000"
    volumes:
      - .:/app
      - /app/node_modules  # Preserve node_modules
    environment:
      - NODE_ENV=development
```

## 📡 **Scaling Services**
```bash
# Scale web service to 3 instances
docker compose up --scale web=3 -d

# Scale via compose file
deploy:
  replicas: 3
```

## 🧪 **Debugging Commands**

```bash
# Validate compose file
docker compose config

# Dry run (no containers)
docker compose up --dry-run

# Show service status
docker compose ps

# Follow all logs
docker compose logs -f

# Execute shell in service
docker compose exec web sh

# View resource usage
docker compose ps --services --filter status=running
```

## 📁 **File Structure Best Practices**

```
myapp/
├── docker-compose.yml      # Main compose file
├── docker-compose.dev.yml  # Development override
├── docker-compose.prod.yml # Production override
├── .env                    # Environment variables
├── .env.dev               # Dev environment
├── .env.prod              # Production environment
├── frontend/              # Frontend service
│   └── Dockerfile
├── backend/               # Backend service
│   └── Dockerfile
└── nginx.conf            # Nginx config
```

**Multiple Environments**:
```bash
# Development
docker compose -f docker-compose.yml -f docker-compose.dev.yml up

# Production  
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

## 🔒 **Security Best Practices**

```yaml
# ✅ Secrets (Docker Secrets)
secrets:
  db_password:
    file: ./secrets/db_password.txt

services:
  db:
    secrets:
      - db_password
    environment:
      POSTGRES_PASSWORD_FILE: /run/secrets/db_password

# ✅ Non-root users
user: "1000:1000"

# ✅ Read-only volumes
volumes:
  - ./static:/usr/share/nginx/html:ro
```

## ⚙️ **Advanced Features**

### **Profiles** (Conditional Services)
```yaml
services:
  web:
    profiles: ["frontend"]
  admin:
    profiles: ["admin"]
```
```bash
docker compose --profile admin up -d  # Only admin services
```

### **Resource Limits**
```yaml
deploy:
  resources:
    limits:
      cpus: '0.50'
      memory: 512M
    reservations:
      cpus: '0.25'
      memory: 128M
```

## 🚀 **Workflow Summary**

```bash
# Development cycle
docker compose up --build    # Build & start
docker compose logs -f       # Watch logs
docker compose exec app sh   # Debug
docker compose down          # Cleanup

# Production deploy
docker compose -f docker-compose.prod.yml up -d --build
docker compose -f docker-compose.prod.yml logs -f web
docker compose -f docker-compose.prod.yml down
```

**Key Takeaway**: Docker Compose eliminates `docker run` complexity, providing declarative multi-container management with automatic networking, volumes, and service discovery. Ideal for development, testing, and small-scale production deployments.