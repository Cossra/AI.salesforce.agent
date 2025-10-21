# 🤖 AI Lead Agent - Salesforce

[![Deployed on](https://img.shields.io/badge/Deployed%20on-Salesforce-00A1E0?logo=salesforce&logoColor=white)](https://developer.salesforce.com/)
[![API Integration](https://img.shields.io/badge/Integrated%20with-OpenAI-000000?logo=openai&logoColor=white)](https://openai.com/api)
[![Built With](https://img.shields.io/badge/Built%20With-Apex%20%26%20LWC-1798c1?logo=salesforce&logoColor=white)](https://developer.salesforce.com/docs/component-library/overview/components)
![License: Proprietary](https://img.shields.io/badge/License-Proprietary-red.svg)

---

### A Salesforce + OpenAI integration that brings AI-Powered Lead Management Assistant into Salesforce ⚡  

Built with **Apex**, **Lightning Web Components**, and the **OpenAI API**, it predicts lead quality (0–100), ranks prospects, and enhances CRM intelligence for marketing and sales teams.

---

## 🧩 Tech Highlights
- 🔗 **OpenAI API Integration** — Connects Salesforce to GPT-4 Turbo for real-time AI insights and predictive lead scoring
- 🧩 **Full-Stack Salesforce App** — Apex backend + Lightning Web Components frontend
- 🔒 **Secure API Auth** — Managed through Salesforce Named Credentials  
- ⚙️ **SOQL + REST Integration** — Seamless CRM + AI data pipeline  
- 📊 **Dynamic UI** — Real-time lead updates with responsive Lightning components  

---

🖼️ **Demo**  
<img width="1721" height="862" alt="Screenshot 2025-10-21 at 5 00 57 PM" src="https://github.com/user-attachments/assets/91358b49-bc76-4876-97c8-cf3ec63f1f15" />

---

<img width="1717" height="865" alt="Screenshot 2025-10-21 at 5 00 29 PM" src="https://github.com/user-attachments/assets/dc749c47-714d-414f-855a-2423805efe60" />

---

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/Cossra/AI.salesforce.agent.git
cd AI.salesforce.agent

# Log in to your Salesforce Developer Org
sf org login web --alias DevOrg

# Deploy backend Apex classes
sf project deploy start --source-dir force-app/main/default/classes

# Deploy Lightning Web Component
sf project deploy start --source-dir force-app/main/default/lwc/aiLeadScoring

# Open the org
sf org open

