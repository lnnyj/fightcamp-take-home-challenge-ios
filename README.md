## FightCamp take home (iOS) 🥊

## Summary

#### Initial approach
After reading through the overview of this assignment, my initial thought towards building the product page was to use a UITableViewController to display each package. Each UITableViewCell would represent a single package, and to get the thumbnails to be interactable and displayed next to each other I thought that using a UICollectionView would be very fitting. While I was able to get all of the subviews to show up in each table view cell, I ran into a few major issues: 

* For the scope of this project, the number of files I created were a tad much
* The custom table view cell class was getting too "bloated" with multiple subviews and custom/delegate methods
* Each package in the table view controller was of different sizes, despite wrestling with multiple approaches to manipulate the cell constraints. 

Eventually I decided to scrap the use of cells and the table view controller to work with another approach: using a UIScrollView, which the table view controller subclasses from. In deciding to work with a scroll view, I believed that I would have an easier time working with constraints. 

#### Final approach
Using a scroll view helped me achieve Goal 1, which was to get the first package to display nicely on the screen. 

For the interactive thumbnails: I decided to go with a lighter approach by creating a stack view of UIButtons, and to get the buttons to display the thumbnails I created a helper method that fetches an image based on the current image link and sets a button's image property to it. I also did something similar for the big thumbnail image. To get the thumbnail image to show correctly based on a selected thumbnail, I used a UIButton-based variable that stores the selected button. 

For the included and excluded items: I created a helper method that works with NSMutableAttributedStrings to turn both of their strings into the unique body text as shown in the criteria. I eventually extended most of this process to creating the bottom label that displays the payment details. 

To get each subview to display correctly: I called the data fetching method from the ViewModel class in the PackagesViewController, which would allow me to configure each package via the PackageView class.  

#### Keeping code as clean and readable as possible
I created helper methods for repeated processes and added comments and pragma marks that indicate the tasks for each section. For helper methods that leverage a specific UI component like UIImageView, UILabel, or UIButton, I stored them into helper files (see Labels.swift and Images.swift). 

Hey! Congratulations on making it to the next step in the interview process. We look forward to having you potentially join the FightCamp family!
