#!/bin/bash
PORT=8080
DATA_FILE="data.txt"
touch "$DATA_FILE"
start_web_server() {
 echo "Web sever on $PORT..."
 while true; do
 echo -e "HTTP/1.1 200 OK\n\n$(cat $DATA_FILE)" | nc -l -p $PORT -q 1
 done
}
save_user_data() {
 echo "Name:"
 read -r name
 echo "Surname"
 read -r surname
 echo "User email address:"
 read -r email
 echo "Password:"
 read -r pass
 echo "Name: $name, Surname: $surname, Email: $email, Password: $pass" >> "$DATA_FILE"
 echo "Datele au fost salvate. :D"
}
send_data_to_server() {
 echo "Enter the IP address of the target server:"
 read -r target_ip
 echo "Enter the port of the target server"
 read -r target_port
 echo "Enter the message:"
 read -r message
 echo "$message" | nc "$target_ip" "$target_port"
 echo "Message sent :)."
}
receive_data_from_server() {
 echo "Enter the port you want to listen:"
 read -r listen_port
 echo "Server listening on port $listen_port..."
 nc -l -p "$listen_port" | while read -r line; do
 echo "Message received: $line"
 echo "Message sent: $line" >> "$DATA_FILE"
 done
}
clear_data() {
 echo "Enter the port you want to delete data from:"
 read -r port
 > "$DATA_FILE"
 echo "Data has been deleted from port $port."
}
while true; do
 echo "Menu:"
 echo "1. Start the web server."
 echo "2. Save user data."
 echo "3. Send data to another server."
 echo "4. Receive data from another server."
 echo "5. Delete data from a port."
 echo "6. Exit."
 echo "Choose an option:"
 read -r option
 case $option in
 1) start_web_server ;;
 2) save_user_data ;;
 3) send_data_to_server ;;
 4) receive_data_from_server ;;
 5) clear_data ;;
 6) echo "Bye!"; exit 0 ;;
 *) echo "Invalid option. Try again! :()" ;;
 esac
done
