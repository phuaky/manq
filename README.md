# WDI5 - Project 3 - ManQ

## <span style="color:blue">Our Target Users</span>

### As a normal user:

- I should be able to join a queue without having to stay there physically. I can shop, walk around and run errands while waiting and only need to return when it is almost my turn.
- I should be able to see in advance whether there is a queue at the place I am heading to, and if so, reserve in advance if need be so that I can minimize my waiting time when I've reached.

### As a business owner:

- I should be able to use the system without the need to invest in specialized hardware or software.
- The system should allow me to manage my queue on system automatically which is much more efficient and will reduce the need for manpower.

## Features For Normal Users

### Core

- Free to use
- Join a queue and return only when it's your turn!
- Check out the status of the queue (remaining number of people in front and estimated waiting time) online without having to return to the place.
- See in advance whether the place you're heading to has a queue, how many people are waiting in line and the estimated waiting time.
- ~~Be Kiasu~~ :sweat: Exercise effective time management and reserve in advance if necessary :anguished:.


### Additional

- Suss out new food places by seeing which are the places that people are willing to ~~kill~~ queue for.


## Features For Business Owners

### Core

- Free to use
  - Specialized hardware and software designed specially to make you part with your hard-earned money? Nah, totally unnecessary.
- Reduce the physical queue and free up space
  - Long snaking queues tend to invite complaints from ~~jealous~~ neighbouring tenants :grin:.
- Free up manpower to focus on the business
  - No more having to answer questions like "Eh, how long more do I have to wait?", customers can check out the queue status online as well as estimated remaining waiting time.
  - Just hired someone to manage the customer queues? You can ~~sack them~~ :cold_sweat: redeploy them and put them to better use with automated queue management. Customers get notified via phone when it's almost their turn and again when it's their turn.
- Improve customer experience
  - Customers are less frustrated if they do not have to wait physically in line. Let them do their shopping, errands and other stuff while they're waiting. You don't need them around to show off their grumpy faces :angry:.

### Additional

- Long queues are a good sign sometimes
  - We think so too. Show them off online to the whole world then. Users can sort businesses by <i>number in queue</i> and <i>estimated remaining queue time</i>. There's always many foodies who think that a long queue means the food must be good.
- Improve your business with our analytics
  - Find out your customer average waiting times, and average number of waiting customers.
  - Identify peak periods within the day, throughout the week and even seasonal trends across the year to better schedule your employees to cope with the fluctuation in demand.
- Reduce business risk and improve turnover
  - Suffering from frequent cases of no-show reservations? Customers need to provide their phone number when making advance reservations. Nothing new, except our system has perfect memory and knows exactly how many times the particular customer has no-showed, not just on you, but across many other businesses as well. Our system allows you to decide how many chances you wish to give your customers before you blacklist them from making reservations.
  - Still feeling vulnerable? Set a required reservation fee if you must. You get to keep this reservation fee if the customer doesn't show up. You decide the amount. Refund them the fee if it turns out to be just a huge misunderstanding :anguished:.


## <span style="color:blue">Technologies Employed</span>

- App built on Ruby on Rails and Active Record with 8 models.
  - user
  - user_type
  - biz_user
  - registered_user
  - customer
  - historical_customer
  - store
  - status
- All major CRUD functions included in the main models biz_user & store.
- Authentication added to restrict access to the biz_users & store_users.
- Use cloudinary to render and post pictures.
- Use seeding to control and manage the database models revision.
- Inform users about queue status using SMS on Twilio platform.
- Layout & Styling using Semantic UI.
- Employed the Feature Branch model for Git Workflow.
- Entity-Relationship Diagrams.

![Imgur](http://i.imgur.com/O23LpwG.jpg)


## <span style="color:blue">Our General Approach</span>

- Brainstorm on ideas for our project 3.
- Final decision to do the on-line queue management system and named our app as ManQ.
- Plan and WireFrame:-
  - the app overview.
  - the users & biz_users role differentiation.
  - the queue management system.
  - the CRUD design on the Biz_User model. 
  - the Biz_User Page design.
  - the Queue Status Display design. 
  - the List of All Major Tasks.
  - the Breakdown of Assignments.
- Plan to use the Feature Branch model for Git Workflow.
- Plan to have authentication to restrict access to the biz_users & store_users.
- Plan to inform users about queue status using SMS.
- Plan to layout & styling using Semantic UI.


## <span style="color:blue">Our WireFrames</span>

- WireFrame #1 - App Overview
![Imgur](http://i.imgur.com/hycfFz2.jpg)

- WireFrame #2 - Users & Biz_Users Role Differentiation
![Imgur](http://i.imgur.com/C4rL2k9.jpg)

- WireFrame #3 - Queue Management System
![Imgur](http://i.imgur.com/hknLx1t.jpg)

- WireFrame #4 - CRUD Design for Biz_User Model
![Imgur](http://i.imgur.com/EgSqwV8.jpg)

- WireFrame #5 - Biz_User Page Design
![Imgur](http://i.imgur.com/MTyDTrU.jpg)

- WireFrame #6 - Queue Status Display Design
![Imgur](http://i.imgur.com/tNHCF6B.jpg)

- WireFrame #7 - List of All Major Tasks
![Imgur](http://i.imgur.com/4g6tDeg.jpg)

- WireFrame #8 - Breakdown of Assignments
![Imgur](http://i.imgur.com/cFaUqnq.jpg)


## <span style="color:blue">Our Major Hurdles/Unsolved Problems</span>

- Due to the lack of real data available, we are unable to complete the data analytics for
  - determining the actual queue dynamics.
  - determining the actual waiting times and queue sizes.
  - identifications of the off or peak periods.

- We are also lacking the feedbacks from the actual users and biz_users to determine
  - how well our app will perform.
  - any short-falls to overcome.
  - any enhancements to be made.
 