# RailsBook

A Ruby on Rails project from The Odin Project.

## Getting Started

### Prerequisites
Make sure you have the following installed:
- Ruby (check version in `.ruby-version` if present)
- Rails (`gem install rails`)
- Bundler (`gem install bundler`)
- Node.js and Yarn (for JavaScript dependencies)
- SQLite3 (or the database specified in `config/database.yml`)

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/msmith1114/railsbook.git
   cd railsbook
   ```

2. **Install dependencies**
   ```bash
   bundle install
   yarn install
   ```

3. **Setup the database**
   ```bash
   rails db:create
   rails db:migrate
   ```

4. *(Optional)* **Seed the database**
   ```bash
   rails db:seed
   ```

### Run the Application

Start the Rails server:
```bash
rails server
```

Visit [http://localhost:3000](http://localhost:3000) in your browser.

---

## Notes
- Adjust the Ruby and Rails versions if specified in the repository.
- If you're using a different database (PostgreSQL/MySQL), update your `config/database.yml`.
- Environment variables (if needed) should be set in `.env` or via `rails credentials:edit`.
