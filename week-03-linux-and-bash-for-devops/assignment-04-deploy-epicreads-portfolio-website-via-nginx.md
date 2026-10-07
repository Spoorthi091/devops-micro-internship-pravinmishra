# Assignment 4 — Deploy EpicReads Portfolio Website via Nginx

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will deploy a static portfolio website on an Ubuntu VM using Nginx. You will download the website template, add your ownership proof in the footer, deploy the files to the Nginx web root, and verify the website is publicly accessible via a browser.

---

# Task 0 — Pre-flight Check

## Goal

Verify the Ubuntu VM and Nginx are ready for deployment.

### Evidence

#### Screenshot 0 — Output of `sudo systemctl status nginx --no-pager` showing Active (running)


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/fe7ccc5b-664f-4bcc-a9c6-f1320383d74a" />


---

# Task 1 — Get the Website Source Code

## Goal

Download and extract the portfolio website template.

### Evidence

#### Screenshot 1 — Output of `ls -la` showing the extracted project folder


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/c13915f9-1f81-4166-9928-757856fc4265" />


---

# Task 2 — Add Ownership Proof (Anti-Copy Change)

## Goal

Update the website footer with your deployment details.

### Evidence

#### Screenshot 2 — Nano editor open with the updated footer showing your Full Name, Group, Week, and Date

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f038ec1a-1264-40aa-aaa2-bf4ca7bb26f1" />


---

# Task 3 — Deploy Website via Nginx

## Goal

Deploy the portfolio website to the Nginx web root.

### Evidence

#### Screenshot 3 — Output of `sudo nginx -t` showing configuration test successful

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/01675b72-7511-49bf-b813-9f37a7ad5a77" />


---

#### Screenshot 4 — Output of `ls /var/www/html` showing deployed website files

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/c8cf75c5-f5a9-4ab1-8896-77859c7c5e36" />


---

# Task 4 — Verify Website is Live

## Goal

Verify the deployed website is publicly accessible and the footer contains your details.

### Evidence

#### Screenshot 5 — Output of `curl ifconfig.me` showing the server's public IP address

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e95bb25b-63d6-4ea3-8ab3-381d745f3909" />


---

#### Screenshot 6 — Browser showing the live website with your Full Name and deployment details in the footer

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/30a11d08-37eb-4973-9d6b-94df4d57cf0e" />


---

# Task 5 — Mini Real DevOps Operational Check

## Goal

Verify the deployed website and Nginx service are healthy.

### Evidence

#### Screenshot 7 — Output of `systemctl is-enabled nginx`

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/2a63aff8-4d73-4253-9d82-6da5876cd392" />


---

#### Screenshot 8 — Output of `curl -I http://localhost` showing 200 OK

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f5d2a905-6c1d-4518-abcf-de7ced5726a7" />


---

# LinkedIn Post (Mandatory)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

https://www.linkedin.com/posts/spoorthi-dudati-33aa09421_devops-nginx-linux-share-7513596497586782208-WGXj/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAGsdRp4BJnoD-iY2UI4dRgCNcyoR7WfiwW4

---

#### Screenshot — Published LinkedIn post showing the live website with your Full Name in the footer

Add your screenshot here.

---

# Submission Instructions

- Add all required screenshots in your submission
- Full name must be visible in required screenshots
- Ownership proof in the footer is mandatory
- Do not expose sensitive information (keys, passwords, account IDs)

---

# Completion Checklist

- [ ] Screenshot 0: Nginx service status (active/running)
- [ ] Screenshot 1: Website files downloaded and extracted
- [ ] Screenshot 2: Footer updated with Full Name, Group, Week, and Date
- [ ] Screenshot 3: Nginx configuration test successful
- [ ] Screenshot 4: Website files deployed to /var/www/html
- [ ] Screenshot 5: Public IP retrieved
- [ ] Screenshot 6: Live website accessible in browser with footer details
- [ ] Screenshot 7: Nginx enabled on boot
- [ ] Screenshot 8: Local HTTP response returns 200 OK
- [ ] LinkedIn post published and URL submitted
- [ ] Full Name visible in all required screenshots
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
