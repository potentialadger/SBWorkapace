package com.group.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

}
