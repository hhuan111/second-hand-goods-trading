package com.second.hand.trading.server.service;

import com.second.hand.trading.server.model.OrderAddressModel;

public interface OrderAddressService {

    /**
     * 为订单添加地址信息
     * @param orderAddressModel
     * @return
     */
    boolean addOrderAddress(OrderAddressModel orderAddressModel);

    /**
     * 更新订单的地址信息
     * @param orderAddressModel
     * @return
     */
    boolean updateOrderAddress(OrderAddressModel orderAddressModel);

    /**
     * 获取订单的地址信息
     * @param orderId
     * @return
     */
    OrderAddressModel getOrderAddress(Long orderId);
}
