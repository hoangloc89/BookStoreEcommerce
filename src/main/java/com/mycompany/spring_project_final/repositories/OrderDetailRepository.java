/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.BookEntity;
import com.mycompany.spring_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_project_final.entities.OrderEntity;
import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author DIENMAYXANH
 */
@Repository
public interface OrderDetailRepository extends CrudRepository<OrderDetailEntity, Integer>{
    public List<OrderDetailEntity> findByOrder(OrderEntity order);
    public OrderDetailEntity findByBook(BookEntity book);
}
