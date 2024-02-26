# Getting started
To get started with the app, run below commands:

```
git clone https://github.com/hemangini-gohel/blogify.git
cd blogify
bundle install
rails db:setup
rails assets:precompile
rails s
```

visit https://localhost:3000 to access the application

# Demo Video Link
https://vimeo.com/916438907?share=copy

# Prerequisites
* Ruby 3.0.2
* Rails 7.0.8
* PostgreSQL

<h2> Note:</h2>
<b> Please refer the seeds.rb to create records with command line(rails console)</b>

Use below credential for login

email: 'user1@example.com'<br>
pwd: 'password'

# Features

User can create account with application
User can create/update/delete blogs with application
User can view other user's blogs
User can add comments on self/other user's blogs
User can delete comments
User can use CKEditor to generate blog contents 
Pagination is applied for lazy loading

# Tools:
1.For Authentication - Devise<br>
2.For TDD - Rspec<br>
3.For Pagination - will paginate<br>
4.For CSS - Tailwind CSS <br>
5.For Post Content Editing - CKeditor <br>
