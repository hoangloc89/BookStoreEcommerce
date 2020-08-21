/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.BookEntity;
import com.mycompany.spring_project_final.entities.CategoryEntity;
import com.mycompany.spring_project_final.repositories.BookRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DIENMAYXANH
 */
@Service
public class BookService {

    @Autowired
    private BookRepository bookRepository;
    @Autowired
    private CategoryService categoryService;

    public List<BookEntity> listAllBook() {
        return (List<BookEntity>) bookRepository.findAll();
    }

    public BookEntity findBookById(int id) {
        return bookRepository.findOne(id);
    }
    public List<BookEntity> findBookByCategory(CategoryEntity category){
       return bookRepository.findByCategory(category);
    }

    public List<BookEntity> searchBook(String searchWord) {
     searchWord = searchWord.toLowerCase();
     List<BookEntity> resultList = new ArrayList<>();
     for(BookEntity book : listAllBook()) {
         if(book.getName().toLowerCase().contains(searchWord)
             || book.getAuthor().toLowerCase().contains(searchWord)
             || book.getIsbn().toLowerCase().contains(searchWord)
             || book.getCategory().getName().toLowerCase().contains(searchWord)) {
             resultList.add(book);              
         }
        
     }
     return resultList;
 }
}
