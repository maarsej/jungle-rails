# Jungle
## By: Jacob Maarse

An e-commerce application built in Ruby on Rails 4.2 where users can view and add products, complete purchases, review products and observe other reviews. Users with admin access can manipulate certain data, that the users will not have access to through the use of http authetication. Passwords are stored through the use of bcrypt in order to ensure security. The data is persisted through the use of postgreSQL and the session is maintained for a seamless user experience through the use of cookies. 

### Getting Started

1. Clone
2. Run `bundle install` to install dependencies
3. Create a `config/database.yml` and a `config/secrets.yml`
5. Run `bin/rake db:reset` to create, load and seed db
7. Sign up for a Stripe account
6. Create .env file based on .env.example
9. Run `bin/rails s -b 0.0.0.0` to start the server

Upon completing the above setup change into the directory of the project and run `bin/rails s -b 0.0.0.0`. Then navigate to http://localhost:3000/ in your browser.


### Final Product

A brief look at the page:
#### The Landing
!["Screenshot of the home page"](https://github.com/maarsej/chatty/blob/master/docs/Screen%20Shot%202018-04-17%20at%202.18.18%20PM.png?raw=true)

#### The Registration
!["Screenshot of the sign up page"](https://github.com/maarsej/chatty/blob/master/docs/Screen%20Shot%202018-04-17%20at%202.18.18%20PM.png?raw=true)

#### A product
!["Screenshot of the single product view"](https://github.com/maarsej/chatty/blob/master/docs/Screen%20Shot%202018-04-17%20at%202.18.18%20PM.png?raw=true)

#### The Cart
!["Screenshot of the filled cart"](https://github.com/maarsej/chatty/blob/master/docs/Screen%20Shot%202018-04-17%20at%202.18.18%20PM.png?raw=true)

#### The Payment
!["Screenshot of the stripe api"](https://github.com/maarsej/chatty/blob/master/docs/Screen%20Shot%202018-04-17%20at%202.18.18%20PM.png?raw=true)

#### The Order
!["Screenshot of the the completed order"](https://github.com/maarsej/chatty/blob/master/docs/Screen%20Shot%202018-04-17%20at%202.18.18%20PM.png?raw=true)

#### The Admin Authentication
!["Screenshot of the http auth"](https://github.com/maarsej/chatty/blob/master/docs/Screen%20Shot%202018-04-17%20at%202.18.18%20PM.png?raw=true)

#### The Admin Example Page
!["Screenshot of the admin categories page"](https://github.com/maarsej/chatty/blob/master/docs/Screen%20Shot%202018-04-17%20at%202.18.18%20PM.png?raw=true)