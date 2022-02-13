# Broken Link Checker
Check the broken links on a website.

# Why?
Websites usually have many external links on their pages, and there is no way to know if an external has changed. The author is notified about the issue that happens when a visitor messages him about the broken link. It would be great to have something that does the job for you, and the only thing you have to do is update the link to a valid one. I currently have this issue on my personal blog.

# Description
This project aims to build a Web service that takes the URL, browse all the website pages to retrieve hyperlinks, and check if they are broken or not. When the verification is completed, the author will receive an email with all the broken links that need an update. It will be possible to schedule the frequency to check broken links on a website. The service should be easily configurable and deployable.

# Labels
This is a console project that will run as a cron job.

# Running the Project Locally

First, clone the repository to your local machine:

```bash
git clone hhttps://github.com/osscameroon/broken_link_checker.git
```

Create a virtual env:

```bash
python3 -m venv blc_venv
```

Active the virtual env:
## Linux
```bash
source blc_venv/bin/activate
```
## Windows
```cmd
blc_venv\Scripts\activate.bat
```

Install dependency:

```bash
pip install --upgrade pip
pip install -r broken_link_checker/requirements.txt
```

Finally, run:

```bash
cd broken_link_checker
python broken_link_checker/main.py https://example.com --delay 1
```

# License
MIT
