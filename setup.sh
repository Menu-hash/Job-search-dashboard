#!/bin/bash

# Job Search Dashboard Setup Script
echo "🚀 Setting up Job Search Dashboard..."
echo "======================================"

# Check dependencies
echo "Checking dependencies..."
for cmd in sqlite3 curl git python3; do
    if command -v $cmd >/dev/null 2>&1; then
        echo "✅ $cmd found"
    else
        echo "❌ $cmd not found - please install"
    fi
done

# Create directory structure
echo "Creating directory structure..."
mkdir -p src/{modules,utils,config}
mkdir -p data/{database,exports,logs}
mkdir -p docs/{api,setup}

# Create basic configuration
echo "Creating config files..."
cat > src/config/config.example.sh << 'EOL'
#!/bin/bash
# Job Search Dashboard Configuration
export DB_PATH="./data/database/jobs.db"
export LOG_PATH="./data/logs/dashboard.log"
export API_KEYS="./config/api_keys.sh"

# Indeed API Settings (Pending Approval)
export INDEED_API_VERSION="2"
export INDEED_COUNTRY="za"
export INDEED_MAX_RESULTS="100"

# Application Settings
export CHECK_INTERVAL="3600" # 1 hour
export MAX_JOBS_DAILY="500"
EOL

# Create basic module structure
echo "Creating core modules..."
cat > src/modules/indeed_api.py << 'EOL'
"""
Indeed API Integration Module
Handles authentication and job data retrieval from Indeed API
"""
import requests
import json
import time

class IndeedAPI:
    def __init__(self, publisher_id):
        self.publisher_id = publisher_id
        self.base_url = "http://api.indeed.com/ads/apisearch"
        self.version = "2"
        
    def search_jobs(self, query, location="South Africa", limit=25):
        """
        Search for jobs using Indeed API
        """
        params = {
            'publisher': self.publisher_id,
            'q': query,
            'l': location,
            'sort': 'date',
            'format': 'json',
            'v': self.version,
            'limit': limit,
            'latlong': 1
        }
        
        try:
            response = requests.get(self.base_url, params=params)
            response.raise_for_status()
            return response.json()
        except requests.RequestException as e:
            print(f"API Request failed: {e}")
            return None

# Example usage (commented out until API approval)
# indeed = IndeedAPI("YOUR_PUBLISHER_ID")
# jobs = indeed.search_jobs("technical support")
EOL

# Create database schema
echo "Creating database schema..."
cat > src/utils/database.py << 'EOL'
"""
Database management for job applications
"""
import sqlite3
import json
from datetime import datetime

class JobDatabase:
    def __init__(self, db_path):
        self.db_path = db_path
        self.init_database()
        
    def init_database(self):
        """Initialize database with required tables"""
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()
        
        # Jobs table
        cursor.execute('''
        CREATE TABLE IF NOT EXISTS jobs (
            id INTEGER PRIMARY KEY,
            job_key TEXT UNIQUE,
            title TEXT NOT NULL,
            company TEXT NOT NULL,
            location TEXT,
            url TEXT NOT NULL,
            source TEXT NOT NULL,
            description TEXT,
            date_posted DATE,
            date_added DATE DEFAULT CURRENT_DATE,
            status TEXT DEFAULT 'new',
            match_score INTEGER
        )
        ''')
        
        # Applications table
        cursor.execute('''
        CREATE TABLE IF NOT EXISTS applications (
            id INTEGER PRIMARY KEY,
            job_id INTEGER,
            date_applied DATE,
            status TEXT,
            notes TEXT,
            FOREIGN KEY (job_id) REFERENCES jobs (id)
        )
        ''')
        
        conn.commit()
        conn.close()

    def add_job(self, job_data):
        """Add a new job to the database"""
        # Implementation would go here
        pass

# Example usage
if __name__ == "__main__":
    db = JobDatabase("./data/database/jobs.db")
    print("Database initialized successfully")
EOL

# Make scripts executable
chmod +x setup.sh
chmod +x src/config/config.example.sh

echo "Setup complete! 🎉"
echo "Next steps:"
echo "1. Configure API keys in src/config/api_keys.sh"
echo "2. Run the dashboard with: python src/main.py"
echo "3. Check documentation in docs/ for detailed setup"
