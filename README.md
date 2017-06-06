# Hot Links ReadMe

This is a companion application to the Turing final assessment main application, called URL LockBox. This app interacts with that one, which can be found here: (https://salty-peak-54308.herokuapp.com/)

Primarily, the application structure has two pathways. First, it exposes an API endpoint which accepts POST requests from the main application, sending link urls and their "read status" to be created in the Hot Reads database.

After that, it performs an analysis function which ranks the top URLs read (regardless of the user) from the main application and displays them in ranked order on the Hot Reads homepage. 

When the application receives a POST request, it returns two booleans along with the link information, one which says if the url is the "top link" and one if it is within the "top ten" of all links. The main application appends this information to the URLs on it's website, so the user knows if their URL is among the most read.

Production URL is here: (https://arcane-eyrie-99827.herokuapp.com/)

