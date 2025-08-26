#!/usr/bin/env python3
"""
Job Search Dashboard Demo
This script demonstrates the core functionality of the dashboard.
"""

import sqlite3
from datetime import datetime, timedelta
import os
import random

class DashboardDemo:
    def __init__(self):
        self.db_path = "./data/database/demo.db"
        os.makedirs(os.path.dirname(self.db_path), exist_ok=True)
        self.setup_demo_database()
        
    def random_recent_date(self, days_back=30):
        """Generate a random date within the last `days_back` days"""
        today = datetime.today()
        random_days = random.randint(0, days_back)
        return (today - timedelta(days=random_days)).strftime("%Y-%m-%d")
        
    def setup_demo_database(self):
        """Setup a demo database with sample data"""
        with sqlite3.connect(self.db_path) as conn:
            cursor = conn.cursor()
            
            # Create table
            cursor.execute('''
            CREATE TABLE IF NOT EXISTS jobs (
                id INTEGER PRIMARY KEY,
                title TEXT NOT NULL,
                company TEXT NOT NULL,
                location TEXT,
                url TEXT,
                source TEXT,
                date_posted TEXT,
                status TEXT
            )
            ''')
            
            # Clear old demo data
            cursor.execute("DELETE FROM jobs")
            
            # Add sample data with random recent dates
            sample_jobs = [
                ("Senior Technical Support Specialist", "MTN South Africa", "Johannesburg", "https://mtn.co.za/careers/123", "MTN Careers", self.random_recent_date(), "new"),
                ("IT Operations Manager", "Vodacom", "Midrand", "https://vodacom.co.za/careers/456", "Company Website", self.random_recent_date(), "applied"),
                ("Network Support Engineer", "Telkom", "Centurion", "https://telkom.co.za/careers/789", "CareerJunction", self.random_recent_date(), "new"),
                ("IT Buyer Specialist", "Dimension Data", "Sandton", "https://dimensiondata.com/careers/101", "Indeed", self.random_recent_date(), "interested"),
                ("Technical Sales Consultant", "Vox Telecom", "Cape Town", "https://vox.co.za/careers/202", "LinkedIn", self.random_recent_date(), "applied")
            ]
            
            cursor.executemany('''
            INSERT INTO jobs (title, company, location, url, source, date_posted, status)
            VALUES (?, ?, ?, ?, ?, ?, ?)
            ''', sample_jobs)
            
            conn.commit()
        
    def show_demo_stats(self):
        """Display demo statistics"""
        with sqlite3.connect(self.db_path) as conn:
            cursor = conn.cursor()
            
            print("📊 Job Search Dashboard Demo")
            print("=" * 40)
            
            # Total jobs
            cursor.execute("SELECT COUNT(*) FROM jobs")
            total_jobs = cursor.fetchone()[0]
            print(f"Total Jobs Tracked: {total_jobs}")
            
            # Jobs by status
            cursor.execute("SELECT status, COUNT(*) FROM jobs GROUP BY status ORDER BY status")
            print("\n📈 By Status:")
            for status, count in cursor.fetchall():
                print(f"  {status.capitalize()}: {count}")
            
            # Recent jobs
            cursor.execute("SELECT title, company, status, date_posted FROM jobs ORDER BY date_posted DESC LIMIT 3")
            print("\n🆕 Recent Opportunities:")
            for title, company, status, date_posted in cursor.fetchall():
                print(f"  • {title} ({company}) - {status} [{date_posted}]")

if __name__ == "__main__":
    demo = DashboardDemo()
    demo.show_demo_stats()
