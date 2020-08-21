/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.AccountEntity;
import com.mycompany.spring_project_final.entities.BookEntity;
import com.mycompany.spring_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_project_final.entities.OrderEntity;
import com.mycompany.spring_project_final.repositories.OrderRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DIENMAYXANH
 */
@Service
public class OrderService {
   @Autowired
   private OrderRepository orderRepository;
   @Autowired
   private BookService bookService;
   @Autowired OrderDetailService orderDetailService;

   public OrderEntity findOrderById(int id){
      return orderRepository.findOne(id);
   }
   public OrderEntity findOrderByAccount(AccountEntity account){
     return orderRepository.findByAccount(account);
   }
   public void saveOrder(OrderEntity order){
       List<OrderDetailEntity> orderDetails = order.getOrderDetails();
       if(!orderDetails.isEmpty()){
       for(OrderDetailEntity detail : orderDetails){
           detail.setOrder(order);
       }
       order.setOrderDetails(orderDetails);
       }
       orderRepository.save(order);
   } 
  
}
