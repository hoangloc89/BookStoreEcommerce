/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.CategoryEntity;
import com.mycompany.spring_project_final.repositories.CategoryRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DIENMAYXANH
 */
@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    public List<CategoryEntity> listCategory(){
        return (List<CategoryEntity>) categoryRepository.findAll();
    }
    public CategoryEntity findCategoryById(int id){
        return categoryRepository.findOne(id);
    }
    public CategoryEntity findCategoryByName(String name){
        return categoryRepository.findByName(name);
    }
}
