import React, { useEffect } from "react";

const OrderInfo = ({ productsInOrder, total, setTotal }) => {
    const totalItems = (productsIn) => {
        return productsIn.reduce((acc, item) => acc + item.quantity, 0);
    };

    useEffect(() => {
        setTotal(totalPrice(productsInOrder));
    }, [productsInOrder]);

    const totalPrice = (productsIn) => {
        return productsIn
            .reduce((acc, item) => acc + item.quantity * item.price, 0)
            .toFixed(2);
    };

    return (
        <div className="small-box bg-dark">
            <div className="inner">
                <h3>TOTAL $ {total}</h3>
                <p>
                    {productsInOrder.length > 0
                        ? totalItems(productsInOrder)
                        : 0}{" "}
                    Items in Order
                </p>
            </div>
            <div className="icon">
                <i className="fas fa-shopping-cart" />
            </div>
        </div>
    );
};

export default OrderInfo;
