# 🤖 AI Lead Agent - Salesforce

[![Deployed on](https://img.shields.io/badge/Deployed%20on-Salesforce-00A1E0?logo=salesforce&logoColor=white)](https://developer.salesforce.com/)
[![API Integration](https://img.shields.io/badge/Integrated%20with-OpenAI-000000?logo=openai&logoColor=white)](https://openai.com/api)
[![Built With](https://img.shields.io/badge/Built%20With-Apex%20%26%20LWC-1798c1?logo=salesforce&logoColor=white)](https://developer.salesforce.com/docs/component-library/overview/components)
[![Backend](https://img.shields.io/badge/Backend-Apex-blue?logo=java&logoColor=white)]()
[![Frontend](https://img.shields.io/badge/Frontend-LWC-yellow?logo=javascript&logoColor=white)]()
![License: Proprietary](https://img.shields.io/badge/License-Proprietary-red.svg)

---

### A Salesforce + OpenAI integration that brings AI-Powered Lead Management Assistant into Salesforce ⚡  

A full-stack app built with **Apex**, **Lightning Web Components**, and the **OpenAI API**.  
Predicts lead quality (0–100), ranks prospects, and enhances CRM intelligence for marketing and sales teams.

---

## 🧩 Tech Highlights
- 🧠 **AI Scoring** — GPT-4 Turbo assigns predictive scores based on lead data  
- 🧩 **Full-Stack Salesforce App** — Apex backend + LWC frontend  
- 🔒 **Secure API Auth** — Managed through Salesforce Named Credentials  
- ⚙️ **SOQL + REST Integration** — Seamless CRM + AI data pipeline  
- 📊 **Dynamic UI** — Real-time lead updates with reactive Lightning components  

---

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/Cossra/AI.salesforce.agent.git
cd AI.salesforce.agent

# Authenticate your Salesforce Developer Org
sfdx auth:web:login -a DevOrg

# Deploy backend classes
sfdx force:source:deploy -p force-app/main/default/classes

# Deploy Lightning Web Component
sfdx force:source:deploy -p force-app/main/default/lwc/aiLeadScoring

# Open Salesforce
sfdx force:org:open
