# UTS-Showcase

App URL : https://github.com/ryanpratamap/UTS-Showcase  
App Name : UTS Student Showcase Finder  
App Description : iOS mobile application to reserve student showcase events at UTS\
\
\
Created by:  
**Team 404 - 42889/02**
 - 14229518 - Adrian Crespo Sanjines (adrian.cresposanjines@student.uts.edu.au)
   - Event View Controller - a list of all student showcase events in chronological order, contains:
     - Table view
     - Custom cells
   - Event Detail View Controller - specific event information, contains:
     - Labels for event name, date, time, location, description, number of tickets
     - Ticket quantity stepper
     - Reservation button
   - Reservations View Controller - a list of all reserved events, contains: 
     - Table view
     - Custom cells
     - Refreshed every time user goes to this page
   - User defaults event list including functions to read, write, and update a single event attribute
   - Commented all swift files
 
 - 13080799 - Ryan Pratama Pangestu Lo (ryanpratamapangestu.lo@student.uts.edu.au)
   - Setup Github repository
   - Implement initial layout
     - Navigation Controller
     - Tab Bar Controller
     - Connect to every controller classes
   - Research and try to use CocoaPods Firebase
     - But at the end, it is not implemented currently due to some technical issues
   - QR Code generation feature
     - Usage of CIFilter
   - Cancel reservation feature
   - Comment and code cleaning
 
 - 14066397 - Michele Paulosky (michele.paulosky@student.uts.edu.au)
   - Event Details and information
   - Reservation function implementation
   - User Interviews 
 
 - 12947545 - Elizabeth (Won Jean) Kim (won.j.kim@student.uts.edu.au)
   - Model Folder (Account struct and Event struct)
   - Login View Controller 
     - User name and student number validation 
     - notAStudent function with Toggle Switch
   - Profile View Controller  
   - Set all constraints
