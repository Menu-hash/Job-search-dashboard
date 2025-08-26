# Job Search Dashboard 🇿🇦

The Job Search Dashboard is a centralized, automated tool built to simplify the job hunting process in South Africa. Instead of wasting hours browsing scattered job boards, company websites, and social platforms, this dashboard brings everything together in one place — making it easier to find, track, and apply for opportunities.  

This project is designed with **townships and rural areas in mind**, where access to jobs is often limited and fragmented. By focusing on **technical and diverse job markets**, we aim to level the playing field for job seekers who are at a disadvantage because of geography, limited internet access, or lack of reliable resources.

## 🚀 Current Status
- **Phase:** Active Development & API Integration  
- **Focus:** Technical & operations jobs in the South African market  

## 🎯 Mission
Our mission is to reduce the friction of job searching by providing a unified platform that:  
- Aggregates listings from top job boards and company career pages  
- Matches candidates to jobs based on their skills and experience  
- Tracks application progress across multiple platforms  
- Sends automated alerts for new opportunities  
- Gives disadvantaged communities (especially in **townships and rural areas**) a fair chance to access technical careers  

## 🌍 Social Impact
In many South African communities, talented individuals struggle to find work simply because opportunities are hidden behind multiple platforms or require heavy data usage.  

The Job Search Dashboard is designed to:  
- Work in **low-data, mobile-first environments**, making it accessible even with basic smartphones  
- Highlight **technical job opportunities** to open doors for upskilling and career growth  
- Bridge the gap between urban and rural job seekers by centralizing opportunities in one dashboard  
- Support a **diverse job market**, from entry-level technical support to IT specialists and operations management roles  

## 🤝 Why Indeed API
The **Indeed API** is essential to making this project a reality. Indeed is one of the largest and most trusted job platforms in South Africa, and its API provides:  
- **Comprehensive listings** that ensure job seekers in townships and rural areas don’t miss opportunities hidden across the web  
- **Reliable, structured data** that can be aggregated with other sources for a complete view of the job market  
- **Fresh and timely updates**, which are critical for job seekers who need to apply quickly in competitive markets  
- **Scalability** — allowing us to start in South Africa and expand into other African countries where Indeed has a presence  

By integrating the Indeed API, we can reduce inequality in job access and empower underserved communities with the same opportunities available in urban centers.

## 🛠️ Tech Stack
- **Automation:** Bash, Python, n8n workflows  
- **Database:** SQLite for application tracking  
- **APIs:** Indeed (pending), CareerJunction RSS, company career pages  
- **Monitoring:** Custom scraping scripts with rate limiting  
- **Platform:** Mobile-first (Android via UserLAnd) and web-ready  

## 📋 Core Features
- [ ] Indeed API integration for comprehensive job listings  
- [ ] Multi-source aggregation (job boards, company pages, RSS feeds)  
- [ ] Personalized matching algorithm based on CV analysis  
- [ ] Application tracker with reminders  
- [ ] Export functionality for applications  
- [ ] Mobile-friendly interface for job hunting on the go  
- [ ] Optimized for **township and rural users** with limited data access  

## 🗺️ Roadmap
1. **Phase 1:** Indeed API integration & basic dashboard (Current)  
2. **Phase 2:** Multi-source aggregation engine  
3. **Phase 3:** Personalized matching algorithm  
4. **Phase 4:** Mobile app interface  
5. **Phase 5:** Expansion into broader African markets  

## 📊 Target Metrics
- **Initial Launch Goal:** 500–1000 monthly active users (South Africa)  
- **Primary Audience:** Technical support, operations, and IT job seekers  
- **Growth Strategy:** Grassroots growth through township hubs, rural community networks, and partnerships with local job seeker groups  

## 🔧 Installation & Setup
```bash
# Clone the repository
git clone https://github.com/your-username/job-search-dashboard.git

# Set up environment
cd job-search-dashboard
chmod +x setup.sh
./setup.sh
