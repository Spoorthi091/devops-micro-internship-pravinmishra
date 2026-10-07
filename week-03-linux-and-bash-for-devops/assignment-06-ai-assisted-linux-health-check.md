# Assignment 6 — Build an AI-Assisted Linux Health Check (AI-Assisted Linux Incident Triage)

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will build a read-only Bash triage script that checks the health of your Ubuntu server and Nginx application, connect it to Claude Code as a reusable `/linux-triage` skill, simulate a controlled Nginx incident, use the skill to gather and analyze evidence, recover the service manually, and verify recovery. The workflow follows the Agentic Loop: Gather → Analyze → Human Act → Verify.

---

# Task 1 — Confirm the Healthy Baseline and Create the Workspace

## Goal

Confirm that Nginx and the React application are healthy before building the automation.

### Evidence

#### Screenshot 1 — Output of `systemctl is-active nginx`, `ss -ltn | grep ':80'`, and `curl -I http://localhost`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/a58d216b-edde-414a-9e77-fef213fbb80a" />


---

#### Screenshot 2 — Output of `pwd` and `find . -maxdepth 4 -type d | sort` showing the workspace folder structure

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/44240856-387c-4ec1-a328-bc603ef6ba8e" />


---

### Notes

Answer the following in your own words:

**1. What proves that Nginx is running?**

The command systemctl is-active nginx returned active, which proves that the Nginx service is currently running.

---

**2. What proves that the server is listening for HTTP traffic?**

The command ss -ltn | grep ':80' showed LISTEN on port 80, which is the standard HTTP port. This proves that the server is listening for HTTP connections.

---

**3. Why must you capture a healthy baseline before simulating an incident?**

A healthy baseline gives us a known working state to compare against after an incident. It helps us identify what changed, understand the cause of the problem, and verify that the system was successfully restored.

---

# Task 2 — Create Project Context and Safety Rules in CLAUDE.md

## Goal

Tell Claude exactly what this project does and what it is not allowed to do.

### Evidence

#### Screenshot 3 — CLAUDE.md open in VS Code showing all four sections (Project Overview, Incident Workflow, Safety Rules, Output Rules)
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/7bd3d4fd-f0a6-47a2-84a1-1d1d2c32c592" />


---

### Notes

Answer the following in your own words:

**1. Why should Claude receive project-specific operational rules?**

Project-specific operational rules give Claude clear information about the system, its purpose, and the actions it is allowed or not allowed to perform. This helps Claude provide safer and more relevant recommendations during incident investigation.

---

**2. Why is the human required to execute the recovery command?**

The human is required to execute the recovery command because recovery actions can affect services or system configuration. Requiring human approval prevents accidental changes and keeps the operator in control of potentially risky operations.

---

**3. Which rule prevents Claude from making an unsupported diagnosis?**

The rule that prevents unsupported diagnosis is: **“Show the evidence that supports the finding.”** This requires Claude to base its diagnosis on actual system evidence instead of making assumptions.


---

# Task 3 — Use Agentic AI to Plan Before Writing the Script

## Goal

Use Claude Code to inspect the environment and produce a read-only plan before creating any Bash code.

### Evidence

#### Screenshot 4 — Claude Code showing the five-check plan and read-only inspection results

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/abf0838f-5bb2-458a-812e-ff47fe24f85a" />


---

### Notes

Answer the following in your own words:

**1. Which part of this task represents the Gather phase?**

The Gather phase is the part where Claude reads the project context and collects system information using read-only commands, such as Nginx status, port 80, HTTP response, error logs, and web files.

---

**2. Did Claude follow the instruction not to create files? How did you verify this?**

Yes. Claude did not create or modify any files. I verified this because the commands it used were read-only inspection commands, and its conclusion explicitly stated that no recovery command was executed.

---

**3. Why is planning before coding useful in DevOps automation?**

Planning before coding helps identify the required checks, understand the system, and avoid unnecessary or unsafe changes. It also makes the automation more organized and reduces the chance of mistakes.

---

# Task 4 — Build the Linux Triage Bash Script

## Goal

Create one Bash script that gathers consistent Linux and Nginx health evidence.

### Evidence

#### Screenshot 5 — Top section of `linux-triage.sh` showing variables, thresholds, and the checks array

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/dd563b80-85cf-410d-bde4-a478d759bd72" />


---

#### Screenshot 6 — Middle section showing check functions and conditionals
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/63e6554e-3d2e-4238-a8ed-d8828e54ea12" />


---

#### Screenshot 7 — Bottom section showing the loop, summary function, and exit behavior

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4ad61d53-7e5a-42db-8378-211179f9ff74" />


---

#### Screenshot 8 — Output of `bash -n scripts/linux-triage.sh` (no syntax errors) and `ls -l scripts/linux-triage.sh` showing executable permission

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/a1b5e07c-92af-40a4-905f-dee4bc3360e0" />


---

### Notes

Answer the following in your own words:

**1. What is stored in the checks array?**

nginx
port80
http
error_log
web_files

---

**2. How does the `for` loop use that array?**

The for loop goes through each item in the checks array one by one. For every item, it calls run_check to perform the corresponding health check.

---

**3. Why are the health checks separated into functions?**

Each function handles one specific check. This keeps the script organized, easier to understand, test, and maintain. It also makes it easier to change one check without affecting the others.

---

**4. What is the purpose of `$(...)` in this script?**

$(...) is command substitution. It runs a command and stores its output in a variable.

For example:

http_status=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

---

**5. Why does the script use different exit codes for HEALTHY, WARN, and FAIL?**

Different exit codes allow the script to clearly communicate the result:

0 → HEALTHY
1 → WARN
2 → FAIL

This is useful because other automation tools can check the exit code and understand whether the system is healthy, needs attention, or has a failure.

---

# Task 5 — Run and Understand the Healthy-State Report

## Goal

Run the Bash script against the healthy server and verify that it creates a report.

### Evidence

#### Screenshot 9 — Output of `./scripts/linux-triage.sh` showing your Full Name and all five check results


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/c17fd952-38f7-4a38-a7c5-e57b76db720a" />


---

#### Screenshot 10 — Output showing the captured exit code and final summary


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5b372bcc-80e6-40d2-a4d2-2cf305e50505" />


---

### Notes

Answer the following in your own words:

**1. What is the overall status of your healthy baseline?**

The overall status is WARN. The server itself is working correctly, but the Nginx error log contains one recent error entry. There are no failed health checks.

---

**2. Which exact Linux evidence proves the application is serving traffic?**

The strongest evidence is curl http://localhost returning HTTP 200, which shows that Nginx is responding successfully to an HTTP request. The listening port check also shows that port 80 is accepting connections.

---

**3. Did your script return exit code 0 or 1? Explain why.**

The script returned exit code 1 because one health check produced a warning. The Nginx error-log check found one recent error entry, so the final status became WARN. There were no failures.

---

**4. What is the difference between a warning and a failure in this script?**

A warning means the system is still working but there is something that needs attention. A failure means an important health check did not pass, such as Nginx being inactive, port 80 not listening, HTTP not returning 200, or the web files being missing.

---

# Task 6 — Create and Run the /linux-triage Skill

## Goal

Turn the Bash script into a reusable, manually invoked Agentic AI workflow.

### Evidence

#### Screenshot 11 — `SKILL.md` showing the frontmatter, allowed tool restrictions, and safety rules


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f177f454-f326-47df-aaad-9a298488d071" />


---

#### Screenshot 12 — `/linux-triage` output for the healthy server


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/13a4ee7c-5b49-472d-9291-86d88b5b43f9" />


---

### Notes

Answer the following in your own words:

**1. Why does this skill have Bash, Read, and Grep, but not Write?**

The skill needs Bash to run the Linux triage script and collect system information. Read and Grep can inspect files and search for relevant information. Write is not included because this skill should only investigate the system and must not modify files.

---

**2. Why is `disable-model-invocation: true` useful for this skill?**

It makes the skill manually invoked by the human using /linux-triage. This gives the operator control over when the health check runs instead of allowing Claude to automatically invoke the skill.

---

**3. What part is performed by Bash, and what part is performed by Claude?**

Bash performs the actual Linux and Nginx health checks and collects the evidence. Claude reads the results, organizes the evidence, explains the health status, and summarizes the findings without performing recovery actions.

---

**4. Why is this better than asking Claude "Is my server healthy?" without giving it evidence?**

The Bash script provides real system evidence such as Nginx status, port 80, HTTP response, error logs, and web files. Claude can then make its summary based on that evidence instead of guessing or making an unsupported diagnosis.

---

# Task 7 — Simulate an Nginx Incident and Let the Skill Diagnose It

## Goal

Create a controlled service failure, gather evidence through Bash, and let Claude analyze the evidence without taking recovery action.

### Evidence

#### Screenshot 13 — Output showing Nginx is inactive and the HTTP request fails


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/8db3b01a-465f-4448-b174-1d41170b6426" />


---

#### Screenshot 14 — `/linux-triage` output showing failed evidence, most likely cause, and a suggested recovery command


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/104ce06d-f8e6-4c0d-8ffb-1fdef0c86bfb" />


---

#### Screenshot 15 — `incident-failure-report.txt` showing the failed checks and your Full Name

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e2eb9446-620b-408f-8439-c3ca7472a87e" />


---

### Notes

Answer the following in your own words:

**1. Which three checks failed?**
The three failed checks were the Nginx service, port 80 listening status, and HTTP response.

---

**2. What evidence supports the conclusion that Nginx is unavailable?**

systemctl is-active nginx showed that Nginx was inactive. Port 80 was not listening, and curl -I http://localhost failed to connect to port 80. These three pieces of evidence show that the web service was unavailable.

---

**3. Did Claude execute the recovery command? Why is that important?**

No. Claude only suggested sudo systemctl start nginx. It did not execute the command. This is important because restarting a service can change the system, so the human operator should decide whether recovery is appropriate.

---

**4. Which phase of the Agentic Loop is represented by the Bash report?**

The Bash report represents the Gather phase because the script collects system health evidence such as service status, port status, HTTP response, logs, and web files.

---

**5. Which phase is represented by Claude's explanation?**

Claude's explanation represents the Reason phase because Claude analyzes the collected evidence, identifies the likely cause, and recommends a possible recovery action.

---

# Task 8 — Recover Manually, Verify Again, and Write the Incident Summary

## Goal

Recover the service as the human operator and prove that the system is healthy again.

### Evidence

#### Screenshot 16 — Output showing Nginx is active and `curl -I http://localhost` returns 200 OK


<img width="1920" height="1080" alt="Screenshot (470)" src="https://github.com/user-attachments/assets/32a7d38a-5d36-4d61-9321-37267147a1be" />


---

#### Screenshot 17 — Second `/linux-triage` output showing successful recovery with no FAIL results


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e9fc31a4-0d40-4fe1-9a5e-653b5623ca7b" />


---

#### Screenshot 18 — Output of `ls -lah reports` showing both `incident-failure-report.txt` and `recovery-report.txt`


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0fd67d3e-1545-491c-a0b2-8f5a2bede9e8" />


---

#### Screenshot 19 — `incident-summary.md` showing all required sections and your Full Name


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/bf6c3bbd-8138-4a37-8923-d827bdb5d2e4" />


---

### Notes

Answer the following in your own words:

**1. What action did you execute manually?**
I manually executed sudo systemctl start nginx as the human operator to recover the stopped Nginx service.

---

**2. What evidence proves that the service recovered?**

systemctl is-active nginx returned active, curl -I http://localhost returned HTTP/1.1 200 OK, and port 80 was listening. The second triage also showed 0 FAIL results.

---

**3. Why is the second triage run necessary?**

The second triage run is necessary to verify that the recovery actually worked and that the system is healthy after the recovery action.

---

**4. What could go wrong if an AI agent automatically restarted every failed service?**

An automatic restart could interrupt a production service, hide the real cause of a problem, cause downtime, or restart a service when it is unsafe or not appropriate to do so.

---

**5. In one sentence, explain the difference between using AI as a chatbot and using AI in this agentic workflow.**

A chatbot mainly answers questions, while an agentic workflow uses AI to gather evidence, reason about the problem, recommend an action, and verify the result while keeping important actions under human control.

---

# Incident Summary

Fill in all seven sections below in your own words.

**Full Name:** Add your full name here

**Date:** DD/MM/YYYY

---

**1. Reported Symptom**

Add your answer here.

---

**2. Evidence Collected**

Add your answer here.

---

**3. Most Likely Cause**

Add your answer here.

---

**4. Human-Approved Recovery Action**

Add your answer here.

---

**5. Verification**

Add your answer here.

---

**6. Safety Decision**

Add your answer here.

---

**7. Agentic Loop Mapping**

Add your answer here.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

`Add your URL here`

---

#### Screenshot — Published LinkedIn post

Add your screenshot here.

---

# GitHub Repository URL

Paste the URL of your GitHub folder or repository containing the assignment files here:

`Add your URL here`

---

# Submission Instructions

- Add all required screenshots in your submission
- Full Name must be visible in required screenshots and the Bash report
- All written answers must be in your own words
- Do not expose sensitive information (keys, passwords, AWS account IDs, tokens)
- GitHub URL must be included in this document

---

# Completion Checklist

- [ ] Task 1: Healthy baseline confirmed, workspace created (Screenshots 1–2, Notes answered)
- [ ] Task 2: CLAUDE.md created with all four sections (Screenshot 3, Notes answered)
- [ ] Task 3: Five-check plan produced by Claude using read-only tools (Screenshot 4, Notes answered)
- [ ] Task 4: `linux-triage.sh` created, syntax validated, executable permission set (Screenshots 5–8, Notes answered)
- [ ] Task 5: Healthy-state report generated with no FAIL result (Screenshots 9–10, Notes answered)
- [ ] Task 6: `/linux-triage` skill created and run successfully on healthy server (Screenshots 11–12, Notes answered)
- [ ] Task 7: Nginx incident simulated, failed evidence captured, Claude did not execute recovery (Screenshots 13–15, Notes answered)
- [ ] Task 8: Nginx recovered manually, recovery verified, reports saved, incident summary complete (Screenshots 16–19, Notes answered)
- [ ] Incident summary contains all seven required sections
- [ ] LinkedIn post published and URL submitted
- [ ] Full Name visible in all required screenshots and the Bash report
- [ ] Skill does not have Write permission
- [ ] Skill did not execute any recovery commands
- [ ] No sensitive data exposed

---

## 📌 About DMI & CloudAdvisory

DevOps Micro Internship (DMI) is a project-based DevOps program run by Pravin Mishra (The CloudAdvisory) focused on real-world execution, systems thinking, and career readiness.

It helps learners build strong DevOps foundations with hands-on experience.

---

## 📌 Resources

- 🌐 DMI Official Website: https://dmi.pravinmishra.com?utm_source=github&utm_medium=readme  
- 🎓 University: https://university.pravinmishra.com?utm_source=github&utm_medium=readme  
- 💬 Discord Community: https://discord.pravinmishra.com?utm_source=github&utm_medium=readme  
- 📝 Blog: https://dmi.pravinmishra.com/blog?utm_source=github&utm_medium=readme  
- ▶️ YouTube Playlist: https://www.youtube.com/playlist?list=PLFeSNDtI4Cho  
- 🔗 Pravin Mishra (LinkedIn): https://www.linkedin.com/in/pravin-mishra-aws-trainer/  
- 🏢 CloudAdvisory (LinkedIn): https://www.linkedin.com/company/thecloudadvisory/

---

*This submission is part of DevOps Micro Internship (DMI) Cohort 3 — Agentic AI Track.*
