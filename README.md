<h1> Introduction </h1>
This project involves designing and implementing a relational database system for an online auction website called OAS/BuyMe. The system is intended to support users buying and selling items in an online auction similar to eBay.

The project requires the implementation of a user interface using HTML, CSS a MySQL database server, and connectivity between the user interface and the database server using Java, Javascript, and JDBC.

<h1>Installation</h1>
To use the system, a local web server that will host the web application (Tomcat) as well as a MySQL server must be installed.

<h1>OAS</h1>
OAS is a company that lets users buy and sell items in an online auction. Each team's BuyMe site will be restricted to a specific category of items with at least 3 hierarchical subcategories, which require specific fields to be filled for those kinds of items.

<h1>Features</h1>
The online auction system will have three classes of users: end-users, customer representatives, and administrative staff members.

<h1>End-users</h1>
End-users can create and delete accounts, search for items on auction, set alerts for items they are interested in, view auction histories, and participate in auctions. They should also be able to view the list of auctions a specific buyer or seller has participated in and the list of "similar" items on auction in the preceding month.

<h1>Customer representatives </h1>
Customer representatives can answer questions and modify information as long as it is reasonable, including resetting passwords and removing bids. They must be able to perform such actions as well as removing illegal auctions.

<h1>Administrative staff member</h1>
Administrative staff members can create accounts for customer representatives and generate summary sales reports, including total earnings, earnings per item, earnings per item type, and best-selling items and end-users.

<h1>Auctions</h1>
Auctions involve a seller posting an item for sale, starting an auction, which will close at a specified date and time. The seller also posts an initial price, an increment for bids, and a (secret) minimum price. Potential buyers post bids as part of the auction, and the user with the highest bid at closing time gets to buy the item. Automatic bidding, which involves the buyer setting a secret upper limit on how much they are willing to pay, is also a feature of the system.

<h1>Requirements</h1>
To use this system, you need to have a web server (Tomcat), MySQL server, Java, Javascript, and JDBC installed. You also need to clone the project repository and set up the database schema and tables. Detailed instructions on how to set up and use the system are provided in the project documentation.






