/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.BookEntity;
import com.mycompany.spring_project_final.entities.CategoryEntity;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author DIENMAYXANH
 */
@Repository
public interface BookRepository extends CrudRepository<BookEntity, Integer>{
    public List<BookEntity> findByNameContaining(String name);
    public List<BookEntity> findByAuthorContaining(String author);
    public List<BookEntity> findByCategory(CategoryEntity category);
}
