Here's how you can set up a simple local server:

1. Install Node.js if you haven't already.
```
https://nodejs.org/en/download
```
2. Install a package called http-server globally using npm. You can do this by running the following command in your terminal or command prompt:
```
npm install -g http-server
```
3. Navigate to your project directory using the terminal or command prompt.
4. Start the local server by running the following command:
```
http-server
```
5. Once the server is running, you'll see a message indicating the address (usually http://127.0.0.1:8080 or http://localhost:8080) where your files are being served.
6. Open your browser and navigate to the address provided by the server. You should be able to access your index.html file and other files without encountering CORS issues.