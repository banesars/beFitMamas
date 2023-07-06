const messageContainer = document.getElementById('message-container');
const messageInput = document.getElementById('message-input');
const sendButton = document.getElementById('send-button');
const mysql = require('mysql');
const pool = require('./db.js');

//user id
const loggedInUserId = '';

//function to get the username of the logged-in user
function getUsername(userId)    {
    const sql = 'SELECT username FROM users WHERE id = ?';

    pool.getConnection((err, connection) => {
        if (err) {
            console.error('Error getting database connection: ', err);
            return;
        }

        connection.query(sql, {userId}, (err, results) => {
            connection.release(); // Release the connection back to the pool

            if (err) {
                console.error('Error executing query: ', err);
                return;
            }

            if (results.lenth > 0)  {
                const username = results[0].username;
                //Display the username in the message box or perform any other action
                console.log('Logged-in as: ', username);
            }
        });
    });
}

getUsername(loggedInUserId)

//event listener for the send button
sendButton.addEventListener('click', sendMessage);

//function to handle sending message
function sendMessage() {
    //get the message from the input field

        //get the message from the input
        const message = messageInput.value

        //create a new message element and append it to the container
        const newMessage = document.createElement('div');
        newMessage.textContent = message;

        messageContainer.appendChild(newMessage);

            //clear the input field
            messageInput.value = '';
    }
