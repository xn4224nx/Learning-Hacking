/* Find all the user data and output to a file. */
SELECT Host, User, Password, authentication_string FROM mysql.user;
