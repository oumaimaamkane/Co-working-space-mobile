/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

// const {onRequest} = require("firebase-functions/v2/https");
// const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const functions = require("firebase-functions");
const admin = require("firebase-admin");
const mysql = require("mysql");

admin.initializeApp();

const pool = mysql.createPool({
    host: "your_mysql_host",
    user: "your_mysql_username",
    password: "your_mysql_password",
    database: "your_mysql_database",
});

exports.createUserProfile = functions.auth.user().onCreate(async (user) => {
    try {
        let role = 'user'; // Default role for Firestore
        if (user.customClaims && user.customClaims.role) {
            role = user.customClaims.role;
        }

        // Convert role to integer for MySQL
        let roleId = 2; // Default role ID for MySQL (user)
        if (role === 'admin') {
            roleId = 1;
        }

        // Firestore
        await admin.firestore().collection('users').doc(user.uid).set({
            name: user.displayName,
            email: user.email,
            role: role
        });

        // MySQL
        pool.query('INSERT INTO users (name, email, role_id) VALUES (?, ?, ?)', [user.displayName, user.email, roleId], (error, results, fields) => {
            if (error) {
                console.error('Error inserting user into MySQL:', error);
                return;
            }
            console.log('User inserted into MySQL successfully');
        });

        console.log('User profile created successfully');
    } catch (error) {
        console.error('Error creating user profile:', error);
    }
});


