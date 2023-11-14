export const isAuthenticated = () => {
    if(typeof window == 'undefined'){ // this is used for user authentication
        return false;
    }
    if(localStorage.getItem('userInfo')){
        return JSON.parse(localStorage.getItem('userInfo'));
    }else{
        return false;
    }
}