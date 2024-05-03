package com.group.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group.model.OrderDetail;

public interface OrderDetailReopsitory extends JpaRepository<OrderDetail, Integer> {

}
