/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.entities;

import javax.persistence.*;

/**
 *
 * @author DIENMAYXANH
 */
@Entity
@Table(name = "image")
public class ImageEntity {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private int id;
   @Column(name = "image_name")
   private String name;
   @Column(name = "file_image")
   @Lob
   private Byte[] file;
   @ManyToOne(cascade = CascadeType.ALL)
   @JoinColumn(name = "book_id")
   private BookEntity book;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Byte[] getFile() {
        return file;
    }

    public void setFile(Byte[] file) {
        this.file = file;
    }

    public BookEntity getBook() {
        return book;
    }

    public void setBook(BookEntity book) {
        this.book = book;
    }
   
   
}
