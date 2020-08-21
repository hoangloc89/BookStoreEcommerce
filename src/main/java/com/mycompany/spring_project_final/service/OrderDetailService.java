/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.BookEntity;
import com.mycompany.spring_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_project_final.entities.OrderEntity;
import com.mycompany.spring_project_final.repositories.OrderDetailRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DIENMAYXANH
 */
@Service
public class OrderDetailService {
 @Autowired
 private OrderDetailRepository detailRepository;
 @Autowired BookService bookService;

 public List<OrderDetailEntity> listAll(){
   return (List<OrderDetailEntity>) detailRepository.findAll();
 }
 public List<OrderDetailEntity> findOrderDetailByOrder(OrderEntity order){
     return detailRepository.findByOrder(order);
 }
 public OrderDetailEntity findOrderDetailById(int detailId){
     return detailRepository.findOne(detailId);
 }
 public OrderDetailEntity findOrderDetailByBook(BookEntity book){
     return detailRepository.findByBook(book);
 }
 public void removeOrderDetail(int id){
     detailRepository.delete(id);
 }

}
