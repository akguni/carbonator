# capstone


- Undo functionality - Decided against 'confirm'
- Localization, thousands separator. 'humanize' template filters
- random data generator
- CSRF token for fetch
- Unit Testing
  - Testing with Chromium
- Github Actions
- Docker


In order to use Docker postgresql, need to stop service running on local machine as follows:
```
sudo ss -lptn 'sport = :5432'

kill <port>
```
