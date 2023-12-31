import React from "react";

const ButtonGoBack = ({ history }) => {
    const handleClick = () => {
        history.goBack();
    };

    return (
        <button onClick={handleClick} className="btn btn-warning btn-lg mb-2">
            Go Back
        </button>
    );
};

export default ButtonGoBack;
