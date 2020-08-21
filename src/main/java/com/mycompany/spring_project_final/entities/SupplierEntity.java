
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.entities;

import java.util.List;
import javax.persistence.*;

/**
 *
 * @author DIENMAYXANH
 */
@Entity
@Table(name = "supplier")
public class SupplierEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;
  @Column(name = "supplier_name")
  private String name;
  @Column(name = "supplier_phone")
  private String phoneNumber;
  @Column(name = "supplier_email")
  private String email;
  @Column(name = "supplier_address")
  private String address;
  @OneToMany(fetch = FetchType.LAZY, mappedBy = "supplier")
  private List<BookEntity> books;

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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<BookEntity> getBooks() {
        return books;
    }

    public void setBooks(List<BookEntity> books) {
        this.books = books;
    }
  
  
}
