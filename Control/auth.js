const fetchAuth = async () => {
    try {
        const authResponse = await fetch('http://192.168.7.2/users/current');
        const authJsonData = await authResponse.json();
        console.log('Authentication Token',authJsonData.user.authentication_token.toString());
        // Save the authentication token to variable
        const authToken = 'Bearer ' + authJsonData.user.authentication_token.toString();
        // Set authentication get headers
        const headers = new Headers();
        headers.append('Authorization', authToken);
        headers.append('Content-Type', 'application/json');
        return { headers };
    }
    catch (error) {
        console.log(error);
        // return false;
        return null;
    }
};
export { fetchAuth };