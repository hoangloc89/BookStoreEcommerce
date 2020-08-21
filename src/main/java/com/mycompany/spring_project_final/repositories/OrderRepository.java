/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.AccountEntity;
import com.mycompany.spring_project_final.entities.OrderEntity;
import java.util.Date;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author DIENMAYXANH
 */
@Repository
public interface OrderRepository extends CrudRepository<OrderEntity, Integer>{
    public OrderEntity findByAccount(AccountEntity account);
}
