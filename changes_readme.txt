Implementing Answers:

1. Answer model : added associations
            a) belongs_to user
            b) belongs_to question

2. Answer controller: implement new, create

3. Removed nested resources for users/questions
    a) only nested resource is question/answer (routes.rb)

4. Answer views: new.html.erb

5. User views: added show.html.erb (to improve user profile to add
questions and answers)

6. Seeded the database with Faker gem

7. _nav.html.erb : changed question paths (because of change in nested resources)

