# Assignment 5 — Bash Script Automation Drill (OPS Checklist)

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will practice Bash scripting by building a series of small automation scripts covering environment setup, variables, arrays, loops, file conditionals, if-else logic, and functions. These scripts form the foundation of real-world Linux automation used in DevOps, cloud, and production support environments.

---

# Task 1 — Bash Environment & Workspace Setup

## Goal

Verify that Bash is available on your system and create a clean workspace for this assignment.

### Evidence

#### Screenshot 1 — Output of `echo $SHELL` and `bash --version`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/039e8caa-e62f-4d8b-aa16-12542df83104" />


---

#### Screenshot 2 — Output of `pwd` and `ls -lah` showing the scripts directory

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/a166809a-a2db-468a-aaad-d981b2f0cee6" />


---

### Notes

Answer the following in your own words:

**1. What is Bash?**

Bash is a command-line shell used in Linux and other Unix-like systems. It allows users to run commands, manage files and directories, execute programs, and automate tasks using shell scripts. Bash is commonly used in DevOps for system administration, automation, deployment, and server management.

---

**2. What is the difference between shell and Bash?**

A shell is a general program that provides an interface between the user and the operating system. Bash is one specific type of shell. Other shells include Zsh, Fish, and Dash. Therefore, shell is the general concept, while Bash is a particular shell implementation.

---

**3. Why is it important to confirm the Bash version before writing scripts?**

Bash versions can support different features and syntax. Checking the Bash version helps ensure that the commands and features used in a script are supported by the system. This reduces compatibility problems and makes the script more reliable when it is executed.

---

# Task 2 — Your First Bash Script

## Goal

Create your first Bash script, make it executable, and run it from the terminal.

### Evidence

#### Screenshot 1 — Content of `first-script.sh`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/541b9e3b-6b25-45a9-97bb-8dd73f7c2252" />


---

#### Screenshot 2 — Output of `./first-script.sh`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4daecc57-4ed1-44b2-be63-77e40010722c" />


---

#### Screenshot 3 — Output of `ls -l first-script.sh` showing executable permission

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ff3b352f-c2ca-4ad8-a7bc-be3d8e0244ef" />


---

### Notes

Answer the following in your own words:

**1. What is the purpose of `#!/bin/bash`?**

#!/bin/bash is called a shebang. It tells the operating system to use the Bash shell to interpret and execute the commands in the script.

---

**2. Why do we use `chmod +x` before running a script?**

chmod +x gives the script execute permission. Without execute permission, we cannot normally run the script directly using ./first-script.sh.

---

**3. What is the difference between running a script using `./script.sh` and `bash script.sh`?**
./script.sh runs the script as an executable file and uses the interpreter specified by the shebang. bash script.sh explicitly tells Bash to run the script, so execute permission is not required.

---

# Task 3 — Variables: User Information Script

## Goal

Use variables to store and display user-related information.

### Evidence

#### Screenshot 1 — Content of `user-info.sh`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0cd8b9bd-d47e-4769-b43a-172a573320bf" />


---

#### Screenshot 2 — Output of `./user-info.sh`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4fbc8528-47f0-4ceb-80dd-e21b6e646788" />


---

### Notes

Answer the following in your own words:

**1. What is a variable in Bash?**

A variable in Bash is a named place used to store a value such as text, numbers, or other information. Variables make scripts easier to manage because we can store information once and use it multiple times in the script.

---

**2. Why should we avoid spaces around the `=` sign when creating variables?**

Bash uses the = sign directly for variable assignment. Spaces around it make Bash interpret the statement as a command and its arguments instead of a variable assignment. For example, name="Spoorthi" is correct, while name = "Spoorthi" is incorrect.

---

**3. How do you access the value stored inside a Bash variable?**

We use the $ symbol followed by the variable name. For example, if we create name="Spoorthi", we can display its value using echo "$name".

---

# Task 4 — Arrays & Loops: Tools Checklist Script

## Goal

Use arrays and loops to print a checklist of tools used in Bash scripting.

### Evidence

#### Screenshot 1 — Content of `tools-checklist.sh`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/bf36dab7-691e-4a82-91d8-5ca6e63095d7" />


---

#### Screenshot 2 — Output of `./tools-checklist.sh`
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/aa1a68d9-b831-4c73-a965-4cc9d39b1bed" />


---

### Notes

Answer the following in your own words:

**1. What is an array in Bash?**

An array in Bash is a variable that can store multiple values under one name. Each value is stored as an element of the array and can be accessed individually.

---

**2. Why are arrays useful in scripts?**

Arrays are useful because they allow us to store and manage a list of related values easily. Instead of creating separate variables for each tool, we can store all the tools in one array and process them using a loop.

---

**3. What does `"${tools[@]}"` mean?**

"${tools[@]}" expands to all the elements stored in the tools array. The double quotes preserve each array element as a separate value, which is useful when working with loops.

---

**4. What is the purpose of the `for` loop in this script?**

The for loop goes through each tool in the tools array one by one and prints it as a checklist item. This avoids writing the same echo command separately for every tool

---

# Task 5 — Loops: Number Counter Script

## Goal

Use loops to repeat a task multiple times.

### Evidence

#### Screenshot 1 — Content of `counter.sh`
<img width="1920" height="1080" alt="Screenshot (441)" src="https://github.com/user-attachments/assets/90c9eab3-f44e-4546-95cb-49aa0c7ae1d7" />



---

#### Screenshot 2 — Output of `./counter.sh`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/df9ac3b8-cc55-41df-8bb5-6761f57cd684" />


---


---

### Notes

Answer the following in your own words:

**1. What is a loop?**

A loop is a programming structure that repeats a set of commands multiple times until the required condition or range is completed.

---

**2. Why do we use loops in Bash scripting?**

We use loops to repeat tasks automatically without writing the same commands again and again. This makes Bash scripts shorter, easier to manage, and more efficient.

---

**3. How many times did the loop run in your script?**

The loop ran 5 times, from number 1 to number 5.

---

**4. What would you change if you wanted the loop to run 10 times?**

for i in {1..5}
to
for i in {1..10}

---

# Task 6 — Files & Conditionals: File Validation Script

## Goal

Use file checks and conditionals to verify whether files and directories exist.

### Evidence

#### Screenshot 1 — Output of `ls -lah ../test-folder`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/c55d9c6e-cf87-4f92-bea0-cc65ab52b231" />



---

#### Screenshot 2 — Content of `file-check.sh`
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/2a2ae410-0cd1-4ff6-a160-5e8e93ae04d2" />


---

#### Screenshot 3 — Output of `./file-check.sh`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e03af4a1-0adf-427a-941d-3fabf6319a8e" />


---

### Notes

Answer the following in your own words:

**1. What does `-d` check in Bash?**

-d checks whether a given path exists and is a directory.

---

**2. What does `-f` check in Bash?**

-f checks whether a given path exists and is a regular file.

---

**3. Why should file and directory paths be stored in variables?**

Storing paths in variables makes the script easier to read, reuse, and update. If the path changes, we only need to change it in one place.

---

**4. What happens if the file does not exist?**
If the file does not exist, the -f condition becomes false, so the script runs the else block and displays a message saying that the file does not exist.

---

# Task 7 — Conditionals: Pass or Retry Script

## Goal

Use if-else conditionals to make decisions based on a variable value.

### Evidence

#### Screenshot 1 — Content of `score-check.sh` with `score=85`
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/3db0c277-a1e1-4c6d-b320-7b15471687b1" />


---

#### Screenshot 2 — Output showing `Result: Pass`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/76cd3ae6-c52c-468c-adf9-1fed52899556" />


---

#### Screenshot 3 — Content of `score-check.sh` with `score=55`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/68b95580-5dce-4c05-a488-469ef512171d" />


---

#### Screenshot 4 — Output showing `Result: Retry`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/61b3717e-865d-4fd5-abd2-1cb142b741f7" />


---

### Notes

Answer the following in your own words:

**1. What is the purpose of if-else in Bash?**
if-else is used to make decisions in a Bash script. It checks a condition and runs one set of commands if the condition is true and another set if it is false.


---

**2. What does `-ge` mean?**

-ge means greater than or equal to. For example, [ "$score" -ge 60 ] checks whether the score is 60 or higher.

---

**3. Why should conditions be tested with different values?**

Testing different values helps confirm that the script works correctly in both situations. In this task, 85 checks the Pass condition and 55 checks the Retry condition.

---

**4. How can conditionals help in automation scripts?**

Conditionals allow automation scripts to make decisions automatically based on different situations. For example, a script can check whether a service is running and take different actions depending on the result.

---

# Task 8 — Functions: Final Bash Automation Script

## Goal

Create a final Bash script using functions to organize reusable code.

### Evidence

#### Screenshot 1 — Content of `final-automation.sh`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/90cb3520-89db-44da-b266-b4ee1b53480f" />


---

#### Screenshot 2 — Output of `./final-automation.sh`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/80b6d757-9087-417c-9e37-b28b5bd8c840" />


---

#### Screenshot 3 — Output of `ls -lah` showing all created scripts

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/25903756-0951-4826-9ad6-72f04a9f28e1" />


---

### Notes

Answer the following in your own words:

**1. What is a function in Bash?**

A function is a named group of commands that performs a specific task. We can call the function whenever we need to perform that task.

---

**2. Why are functions useful in scripts?**

Functions make scripts more organized and reusable. They reduce repeated code and make the script easier to understand, maintain, and update.

---

**3. Which functions did you create in this script?**

I created three functions:

show_user — displays my name and task information.
check_files — checks whether the required directory and file exist.
show_tools — uses a loop to display the DevOps tools checklist.

---

**4. How does this final script combine variables, arrays, loops, conditionals, files, and functions?**

The script uses variables to store my name and file paths, an array to store DevOps tools, a loop to display each tool, conditionals to check whether the directory and file exist, and functions to organize these tasks into reusable sections.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

https://www.linkedin.com/posts/spoorthi-dudati-33aa09421_devops-bash-linux-share-7513610649902645248-9lOD/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAGsdRp4BJno

---

#### Screenshot — Published LinkedIn post

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/93db22b4-43c3-4b21-98e0-a15988b61166" />


---

# Submission Instructions

- Add all required screenshots in your submission
- Full name must be visible in required screenshots
- All script files must be created and run successfully
- Required notes must be answered clearly for every task
- Do not expose sensitive information (keys, passwords, credentials)

---

# Completion Checklist

- [ ] Task 1: Environment setup verified, workspace created (Screenshots 1–2, Notes answered)
- [ ] Task 2: First script created, executed, permissions verified (Screenshots 1–3, Notes answered)
- [ ] Task 3: Variables script created and run (Screenshots 1–2, Notes answered)
- [ ] Task 4: Arrays and loops script created and run (Screenshots 1–2, Notes answered)
- [ ] Task 5: Counter loop script created and run (Screenshots 1–2, Notes answered)
- [ ] Task 6: File validation script created and run (Screenshots 1–3, Notes answered)
- [ ] Task 7: Pass/Retry conditional script tested with both values (Screenshots 1–4, Notes answered)
- [ ] Task 8: Final automation script created and run (Screenshots 1–3, Notes answered)
- [ ] All scripts run without errors
- [ ] Full Name visible in all required screenshots
- [ ] LinkedIn post published and URL submitted
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
