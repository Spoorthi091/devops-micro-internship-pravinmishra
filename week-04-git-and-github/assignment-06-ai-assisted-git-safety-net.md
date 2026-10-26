# Assignment 6 — Building an AI-Assisted Git Safety Net (PR Ready Check)

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In Week 2 you built Claude Code hooks that block a dangerous action *before* it happens (`PreToolUse`), and a restricted skill that could look but not touch (`allowed-tools` without `Write`). In this assignment you will discover that Git has the exact same idea, decades older: a **pre-commit hook** that blocks a commit before it's created.

You will build both halves of a real "PR Ready" workflow:

1. A **Git hook that follows fixed rules** — scans staged changes for hardcoded secrets and oversized files and refuses the commit. No AI involved, no guessing, just a rule that gives the same answer every time.
2. A **restricted Claude Code skill** (`/pr-ready`) that reads your staged diff and drafts a Pull Request title, description, and a short list of things worth a second look — the kind of judgment a fixed rule can't make (mixed changes, missing context, unclear intent). The skill never commits, pushes, or opens the PR. You do that yourself, using its draft as a starting point.

This mirrors the Agentic Loop from Week 3's Linux triage assignment: **Gather → Analyze → Human Act → Verify**. The hook and the skill both gather and analyze; only you act.

---

# Task 0 — Confirm Your Fork and Create a Feature Branch

## Goal

Confirm you are working in your own fork, then create a dedicated branch for this assignment.

### Evidence

#### Screenshot 1 — Output of git remote -v and git branch showing the new branch

<img width="1920" height="1080" alt="Screenshot (573)" src="https://github.com/user-attachments/assets/91a254f0-8c4a-41d5-8723-8aa2ffee951b" />


---

### Notes

**1. Why create a dedicated branch instead of doing this work on main?**

Creating a dedicated feature branch keeps my Assignment 6 changes separate from the main branch. It allows me to develop and test the Git safety hook and AI-assisted PR Ready skill without affecting existing work. If something goes wrong, I can fix or discard the changes more safely. Once everything is tested, I can submit the changes through a Pull Request for review.

---

# Task 1 — Stage a Change With Realistic Risk

## Goal

On your own fork of this repository (the one you've been submitting your DMI work in since onboarding), create a new branch and stage a change that a real reviewer should catch: a hardcoded-looking secret and a leftover debug statement.

### Evidence

#### Screenshot 1 — Output of  `git status` showing the staged file on feature/ai-pr-ready

<img width="1920" height="1080" alt="Screenshot (574)" src="https://github.com/user-attachments/assets/5015a81e-f840-433d-9596-f1fb40f70644" />


---

### Notes

**1. Why does this assignment use an obviously fake key instead of a real one?**

We use an obviously fake API key to safely test the pre-commit hook without exposing real credentials. A real key could be stolen or misused if committed to GitHub. The fake key helps us verify that the hook detects potential secrets and blocks risky commits without compromising security.

---

# Task 2 — Write a Real Git Pre-Commit Hook

## Goal

Create a tracked, shareable pre-commit hook that blocks a commit containing secret-like patterns or files over 1MB.

### Evidence

#### Screenshot 2 — `hooks/pre-commit` open in VS Code showing the full script

<img width="1920" height="1080" alt="Screenshot (576)" src="https://github.com/user-attachments/assets/03f47fa5-717b-4447-931c-b7fe3b6a821c" />


---

#### Screenshot 3 — Output of `git config core.hooksPath` confirming it points to `hooks`

<img width="1920" height="1080" alt="Screenshot (577)" src="https://github.com/user-attachments/assets/cf7c7287-27db-4419-b1af-bef26731e8f6" />


---

### Notes

**1. Why is `hooks/pre-commit` tracked in the repo instead of living only in `.git/hooks/`?**

hooks/pre-commit is tracked in the repository so that all team members can access, review, and share the same hook. The .git/hooks/ folder is local to each user's computer and is not tracked by Git. By configuring core.hooksPath to hooks, the project uses the shared hook, making it easier to maintain consistent checks across the team.

---

**2. Compare this to `PreToolUse` from Week 2 Assignment 6. What does each one intercept, and what do they have in common?**

The Git pre-commit hook runs before a Git commit is created. It checks staged changes for possible secrets and files larger than 1 MB, blocking the commit if a problem is found.

The PreToolUse hook in Claude Code runs before a tool is executed. It can inspect or restrict tool actions according to configured rules.

Both act as preventive safety checks: they inspect an action before it happens and can block it when it violates a rule. The main difference is that pre-commit protects the Git commit process, while PreToolUse controls tool execution in Claude Code.

---

# Task 3 — Prove the Hook Blocks the Risky Commit

## Goal

Attempt to commit the staged file from Task 1 and show the hook rejecting it.

### Evidence

#### Screenshot 4 — Terminal showing `git commit` rejected with the hook's "BLOCKED" message naming the exact file

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ece03058-20f8-4b62-935d-a36cafa4fda3" />


---

### Notes

**1. Which line in `hooks/pre-commit` matched your fake key, and why did it match?**

The following line matched my fake API key:grep -Ein '(api[_-]?key|secret|password|token)[[:space:]]*[:=][[:space:]]*["\x27]?[A-Za-z0-9_./+=-]{8,}'
It matched because the variable name API_KEY contains the keyword key, followed by an equals sign and a string containing more than eight allowed characters. The hook detected the pattern and blocked the commit.

---

**2. Could this hook have caught a poorly-named variable that stores a secret without the `AKIA` prefix? What does that tell you about the limits of a fixed rule like this?**

Not always. If a secret is stored in a poorly named variable, such as my_value, the hook might not detect it because the variable name does not contain keywords like key, secret, password, or token. The AKIA prefix is not required by this particular rule. This shows that fixed rules can miss secrets that do not match their patterns and can sometimes flag harmless values. Therefore, we should combine such hooks with dedicated secret-scanning tools and code reviews.

---

# Task 4 — Build the `/pr-ready` Skill

## Goal

Create a manually invoked Claude Code skill that reads your staged changes and produces a PR-readiness report and a draft PR description — without writing, committing, or pushing anything itself.

### Evidence

#### Screenshot 5 — `SKILL.md` frontmatter showing `allowed-tools: Bash, Read, Grep` (no `Write`) and `disable-model-invocation: true`

<img width="1920" height="1080" alt="Screenshot (579)" src="https://github.com/user-attachments/assets/34f5dc77-540a-4fae-b366-b78f9c54b512" />


---

#### Screenshot 6 — `/pr-ready` output while the risky file is still staged, showing it flagged the secret and/or debug statement

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0debe72e-265c-4334-a075-3b0bba52b613" />


---

### Notes

**1. Why does `/pr-ready` have `Bash` and `Read` but not `Write`?**

The /pr-ready skill has Bash and Read permissions so it can inspect the Git status, staged changes, and relevant files. It does not have Write permission because its purpose is only to review changes and prepare a PR readiness report. This helps prevent accidental modifications to files and keeps the review process safe and read-only.

---

**2. The pre-commit hook and `/pr-ready` both looked at the same staged diff. Did they flag the same things? What did one catch that the other didn't?**

They detected some of the same issues, including the possible hardcoded API key and the oversized test file. However, they served different purposes. The pre-commit hook automatically blocked the commit when it found these problems. The /pr-ready review also identified the debug output, missing tests or documentation, and the Git hook configuration issue. This shows that automated rules are useful for blocking specific risky changes, while an AI review can identify broader issues and suggest improvements.

---

# Task 5 — Fix the Issues and Re-Verify

## Goal

Remove the secret and debug statement, then prove both gates now pass clean.

### Evidence

#### Screenshot 7 — `git commit` succeeding after the fix (no BLOCKED message)

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/32c9cf52-aea9-41f1-8964-754a2c513893" />


---

#### Screenshot 8 — Second `/pr-ready` run showing a clean risk report and a drafted PR title + description
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4699a165-f79c-4783-9c23-323746781619" />


---

### Notes

**1. What exactly did you change to satisfy the pre-commit hook?**

1. Removed the fake API key: Changed the value in examples/app-config.py from a fake key string to an empty placeholder, API_KEY = "".
2. Removed the debug output: Deleted print("DEBUG: dumping configuration") and the startup print("Application started") statement.
After these changes, I staged the updated file and committed it. The pre-commit hook ran successfully and displayed All pre-commit checks passed.

---

# Task 6 — Push and Open a Pull Request Using the AI Draft

## Goal

Push your branch and open a real Pull Request, using `/pr-ready`'s drafted title and description as your starting point — read it critically and edit before you use it.

**Important:** Open this Pull Request with base repository set to **your own fork** — not the shared upstream `pravinmishraaws/devops-micro-internship-pravinmishra` repository. This assignment's hook and skill files are your own practice work, not a change meant for the shared class repo.

### Evidence

#### Screenshot 9 — Your Pull Request showing the base repository is your own fork, plus the title and description, with the `/pr-ready` draft visible for comparison (paste it in the PR conversation or your notes below)

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/9128c236-74b9-4e3b-a4f2-e7e0f150c854" />


---

#### PR Link
https://github.com/Spoorthi091/devops-micro-internship-interviews/pull/1

---

### Notes

**1. What, if anything, did you edit in the AI's drafted PR description before using it? Why?**

I reviewed the AI-generated PR description and checked whether the summary, changes, and testing details matched my actual work. I used the description after checking it because I wanted the PR to be clear and accurate.

---

**2. If you had blindly copy-pasted the AI's draft without reading it, what could go wrong?**
The AI might include incorrect information, claim that tests passed when they did not, or mention changes I never made. This could confuse reviewers and reduce trust in my work. Therefore, I should always review AI-generated content before using it.

---

**3. Why does this PR need to target your own fork instead of the shared upstream repository?**

The PR should target my own fork because this is an internship practice assignment. It allows me to submit and demonstrate my work without directly changing the shared upstream repository. The project maintainers can review my work safely before deciding whether to accept it.

---

# Task 7 — Map the Workflow to the Agentic Loop

## Goal
Explain this assignment's workflow using the same Gather → Analyze → Human Act → Verify structure from Week 3.

### Notes

**1. Which step(s) represent Gather?**

Add your answer here.

---

**2. Which step(s) represent Analyze?**

Add your answer here.

---

**3. Which step is Human Act, and why must a human — not Claude — run `git commit`, `git push`, and open the PR?**

Add your answer here.

---

**4. Which step is Verify?**

Add your answer here.

---

**5. In one or two sentences: why do you need *both* the fixed-rule pre-commit hook and the AI skill? Isn't one enough?**

Add your answer here.

---

# Task 8 — LinkedIn Post

## Goal

Publish a LinkedIn post summarizing what you built and what you learned about combining fixed-rule safety checks with AI-assisted review.

### Evidence

#### LinkedIn Post URL

Add your LinkedIn post URL here...

---

## Key Learnings

Add 3-5 bullet points on what you learned this week.

-
-
-

---

# Submission Instructions

- Ensure `hooks/pre-commit` and `.claude/skills/pr-ready/SKILL.md` are committed to your GitHub repository
- Add all required screenshots to your submission
- All written answers must be in your own words
- Do not use a real secret or credential anywhere in your submission — the fake key in Task 1 is intentional and must stay clearly fake
- Open your Pull Request against your own fork, not the shared upstream repository
- Push your final changes to your forked repository
- Include your PR link and LinkedIn post URL

---

## GitHub Repository URL

Paste your forked repository URL here:

`Add your URL here`

---

# Completion Checklist

- [ ] Branch `feature/ai-pr-ready` created with a staged file containing a fake secret and a debug statement
- [ ] `hooks/pre-commit` created and tracked in the repo (not only in `.git/hooks/`)
- [ ] `core.hooksPath` configured to point at `hooks/`
- [ ] Pre-commit hook shown blocking the risky commit
- [ ] `.claude/skills/pr-ready/SKILL.md` created with correct `allowed-tools` (no `Write`) and `disable-model-invocation: true`
- [ ] `/pr-ready` run against the risky diff and shown flagging issues
- [ ] Risky file fixed; `git commit` succeeds cleanly
- [ ] `/pr-ready` re-run showing a clean report and drafted PR title/description
- [ ] Pull Request opened using the AI draft as a starting point, with your own fork as the base repository (not upstream), PR link included
- [ ] Agentic Loop mapping (Task 7) completed in your own words
- [ ] LinkedIn post published and URL submitted
- [ ] All required screenshots added
- [ ] GitHub repository URL provided

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
