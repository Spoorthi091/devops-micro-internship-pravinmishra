# Assignment 5 — Open-Source Collaboration: Fork, Clone, Sync & Pull Request

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will contribute one small documentation change to a shared repository using a standard open-source collaboration workflow: fork, clone, configure remotes, branch, commit, sync with upstream, push, and open a Pull Request. This is a different, separate practice repository from the one you submit your DMI work in.

---

# Task 0 — Fork the Upstream Repository

## Goal

Fork `pravinmishraaws/devops-micro-internship-interviews` into your own GitHub account.

### Evidence

#### Screenshot 1 — Your fork page with your username and `devops-micro-internship-interviews` visible in the browser URL

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/243da99a-afbf-412b-a787-818517f946b4" />


---

# Task 1 — Authenticate GitHub from the Terminal

## Goal

Configure one authentication method — HTTPS with a Personal Access Token, or SSH — so you can push to your fork. Use only one method.

### Evidence

#### Screenshot 2 — Output of `git config --global --get credential.helper` (HTTPS) or `ssh -T git@github.com` (SSH) showing successful authentication — never show your token or private key

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/1911cddd-2d46-47b4-802d-52b13f3b4035" />


---

# Task 2 — Clone Your Fork and Configure Remotes

## Goal

Clone your fork locally, then add the original repository as `upstream`.

### Evidence

#### Screenshot 3 — Output of `git remote -v` showing `origin` pointing to your fork and `upstream` pointing to `pravinmishraaws/devops-micro-internship-interviews`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/79dc0961-2e7b-491d-9f0f-ed4233bcd078" />

---

# Task 3 — Create a Feature Branch and Make Your Change

## Goal

Create the branch `feature-readme-update`, add only your own entry (`Full Name — Group <Group Name/Number>`) to the Student List at the end of `pull_request.md`, and commit it with the message `docs: add my name to student list`.

### Evidence

#### Screenshot 4 — Output of `git status` showing `pull_request.md` modified before staging

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d7803fcc-d9bf-49ec-b899-312db6a39afb" />


---

#### Screenshot 5 — Output of `git commit`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/3494607d-4936-4300-86cc-8fabdcdea9bd" />


---

# Task 4 — Synchronize with Upstream and Push to Your Fork

## Goal

Fetch and merge `upstream/main` into your local default branch, rebase your feature branch onto it, then push `feature-readme-update` to your fork.

### Evidence

#### Screenshot 6 — Output of `git push -u origin feature-readme-update` showing a successful push

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ee7a2a9a-0ba6-448f-a162-a933a6ee5b1a" />


---

#### Screenshot 7 — Your fork on GitHub showing `feature-readme-update` in the branch selector or a "Compare & pull request" banner

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b76f6657-d7ea-4d39-ba68-1f0523bc43a5" />


---

# Task 5 — Create a Pull Request to Upstream

## Goal

Open a Pull Request from `feature-readme-update` on your fork to `main` on the upstream repository, using the title `docs: add my name to student list`.

### Evidence

#### Screenshot 8 — Pull Request creation page showing the correct base repository, base branch, head repository, compare branch, and title

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e2309119-a4d0-41c6-85dc-5d22da933a82" />


---

#### Screenshot 9 — Successfully created Pull Request page with the PR number visible

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/95669e95-a4e6-4aee-9272-82fec679baeb" />


---

#### Pull Request URL

Paste your Pull Request URL here:

https://github.com/pravinmishraaws/devops-micro-internship-interviews/pull/501?utm_source=chatgpt.com

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

https://www.linkedin.com/posts/spoorthi-dudati-33aa09421_devops-git-github-share-7520383461958778880-ciVp/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAGsdRp4BJnoD-iY2UI4dRgCNcyoR7WfiwW4

---

#### Screenshot — LinkedIn post showing your successfully created Pull Request

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/063df28d-e12c-421a-b246-753e2d984d46" />


---

# Submission Instructions

- Add all required screenshots in your submission
- Do not expose a Personal Access Token, SSH private key, password, or authentication secret
- Only your own entry in `pull_request.md` may be added — do not edit or delete another student's entry
- Include your fork URL and Pull Request URL

---

## Fork URL

Paste your fork URL here:
https://github.com/Spoorthi091/devops-micro-internship-interviews

---

# Completion Checklist

- [ ] Upstream repository forked to your GitHub account (Screenshot 1)
- [ ] GitHub authentication configured securely (Screenshot 2)
- [ ] Fork cloned locally with `origin` and `upstream` configured (Screenshot 3)
- [ ] Only `pull_request.md` modified, with your own entry added (Screenshots 4–5)
- [ ] Local default branch synchronized with `upstream/main`, feature branch rebased and pushed (Screenshots 6–7)
- [ ] Pull Request opened against the correct upstream repository and branch (Screenshots 8–9)
- [ ] Fork URL and Pull Request URL included
- [ ] LinkedIn post published and URL submitted
- [ ] No PAT, password, private key, or authentication secret exposed

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
