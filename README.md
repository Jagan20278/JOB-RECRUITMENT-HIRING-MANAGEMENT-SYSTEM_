
# JOB RECRUITMENT & HIRING MANAGEMENT SYSTEM

![Salesforce](https://img.shields.io/badge/Platform-Salesforce-blue.svg?style=for-the-badge&logo=salesforce)
![LWC](https://img.shields.io/badge/UI-LWC-orange.svg?style=for-the-badge)
![Apex](https://img.shields.io/badge/Code-Apex-green.svg?style=for-the-badge)
![SFDX](https://img.shields.io/badge/Tools-SFDX%20&%20VS%20Code-lightgrey.svg?style=for-the-badge)

> A comprehensive, enterprise-grade Recruitment & Hiring Management System built on the Salesforce Platform. This capstone project showcases a full development lifecycle, from initial design and data modeling to backend Apex logic, custom UI, integration, and deployment.

---

## 📋 Project Summary

This application was developed to solve the common inefficiencies found in manual hiring processes. It replaces disconnected spreadsheets and emails with a single, centralized platform that provides robust automation, clear visibility, and a secure environment for managing sensitive recruitment data.

## ✨ Features & Technologies

| Feature Implemented | Salesforce Technology Used |
| :--- | :--- |
| **Data Model** | Custom Objects, Master-Detail & Lookup Relationships |
| **Security & Sharing** | Profiles, Permission Sets, OWD (Private), Record Ownership |
| **Business Logic** | Validation Rules, Approval Processes, Salesforce Flow |
| **Backend Development** | Apex Triggers (Handler Pattern), Batch Apex, Schedulable Apex |
| **Frontend Development** | Lightning App Builder, Lightning Web Components (LWC) |
| **Integration** | Apex Callouts, Remote Site Settings |
| **Data Management** | Salesforce Data Loader, CSV Import |
| **Deployment** | SFDX, Visual Studio Code, `package.xml` Manifest |
| **Analytics** | Custom Reports & Dashboards (Funnel & Gauge Charts) |

---
## 🚀 The Development Journey (All 10 Phases)

### Phase 1 & 2: Foundation & Configuration
Established the project's business requirements and prepared a secure Salesforce environment.
* **Defined** the business process map for the end-to-end hiring lifecycle.
* **Created** user personas for the Recruiter and Hiring Manager.
* **Configured** the Organization-Wide Defaults (OWD) for key objects to **Private**.

### Phase 3: Data Modeling
Built the core database schema for the application.
* **Created** four custom objects: `Job__c`, `Candidate__c`, `Application__c`, and `Interview__c`.
* **Implemented** a many-to-many relationship using `Application__c` as a junction object with two Master-Detail relationships.
* **Established** lookup relationships to the standard User object for fields like `Hiring_Manager__c`.

### Phase 4: Process Automation
Automated key business processes using declarative tools.
* **Built** a **Validation Rule** to enforce that every application is linked to a candidate with a resume.
* **Created** a **Record-Triggered Flow** that automatically generates an `Interview` record when an `Application` status changes.
* **Implemented** a formal **Approval Process** to route new `Job` records to the correct Hiring Manager for sign-off.

### Phase 5: Apex Programming
Implemented complex business logic with custom code.
* **Wrote** an **Apex Trigger** on the `Application` object to prevent the creation of duplicate records, using a best-practice handler pattern.
* **Developed** a **Batch Apex** class to process all "in-progress" applications and send automated follow-up emails.
* **Created** a **Schedulable Apex** class to invoke the batch job on a recurring weekly schedule.

### Phase 6: User Interface Development
Created a custom, branded user experience.
* **Built** the **"Recruitment Manager" Lightning App** with a custom navigation bar.
* **Designed** a tabbed layout for the Job record page using the Lightning App Builder.
* **Developed** two interactive **Lightning Web Components (LWCs)** for searching jobs and displaying API data.

### Phase 7: Integration
Connected Salesforce to an external system via an **Apex Callout**.
* **Configured** a **Remote Site Setting** to securely whitelist the external API endpoint.
* **Wrote** an Apex class with an `@AuraEnabled` method to make an HTTP `GET` request.
* **Triggered** the callout from a button in an LWC and displayed the live JSON response on the page.

### Phase 8: Data Management & Deployment
Mastered the tools for professional development.
* **Used** **Data Loader** to perform bulk `Insert` operations from CSV files.
* **Handled** lookup relationships in data loads by using 18-digit Salesforce IDs.
* **Managed** all project metadata using **SFDX** and a `package.xml` manifest to retrieve and deploy the application.

### Phase 9: Reporting & Security
Created analytical tools and verified the application's security.
* **Built** a "Hiring Funnel" **Report** with a funnel chart to visualize the candidate pipeline.
* **Created** a "Hiring Dashboard" with Funnel and Gauge components for executive-level insights.
* **Tested** the **Private** sharing model by logging in as a test user to prove that **Record Ownership** correctly restricted data access.

### Phase 10: Final Presentation
Prepared a comprehensive, persona-driven demonstration of the finished application.
* **Developed** a step-by-step demo script that tells a story from multiple user perspectives.
* **Prepared** sample data to ensure a smooth and visually compelling presentation.
* **Summarized** the business value and technical skills demonstrated in each phase of the project.

