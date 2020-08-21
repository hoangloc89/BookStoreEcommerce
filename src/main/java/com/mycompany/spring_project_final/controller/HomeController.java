
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.controller;

import com.mycompany.spring_project_final.entities.BookEntity;
import com.mycompany.spring_project_final.entities.CategoryEntity;
import com.mycompany.spring_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_project_final.entities.OrderEntity;
import com.mycompany.spring_project_final.entities.Personal;
import com.mycompany.spring_project_final.service.BookService;
import com.mycompany.spring_project_final.service.CategoryService;
import com.mycompany.spring_project_final.service.OrderDetailService;
import com.mycompany.spring_project_final.service.OrderService;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author AnhLe
 */
@Controller
public class HomeController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private BookService bookService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String viewHome(HttpSession session, Model model, @RequestParam(value = "message", required = false) String message,
            @RequestParam(value = "status", required = false) String status) {

        List<BookEntity> books = bookService.listAllBook();

        model.addAttribute("books", books);
        model.addAttribute("message", message);
        model.addAttribute("status", status);
        return "home-template";
    }

    @RequestMapping("/login")
    public String viewLogin(Model model,
            @RequestParam(value = "error", required = false) boolean isError) {
        if (isError) {
            model.addAttribute("message", "login fail.");
        }
        return "login";
    }

    @RequestMapping("/list-book")
    public String viewProduct(Model model) {
        model.addAttribute("books", bookService.listAllBook());
        model.addAttribute("categories", categoryService.listCategory());
        return "list-book";
    }

    @RequestMapping("/searchBook")
    public String searchBook(Model model, @ModelAttribute("searchWord") String searchWord) {
        List<BookEntity> book = bookService.searchBook(searchWord);
        if (!book.isEmpty()) {
            model.addAttribute("result", book);
            model.addAttribute("categories", categoryService.listCategory());

        } else {
            model.addAttribute("result", bookService.listAllBook());
            model.addAttribute("categories", categoryService.listCategory());
        }
        return "list-book";
    }

    @RequestMapping("/detail/{bookId}")
    public String viewBookDetail(Model model, @PathVariable("bookId") int bookId) {
        BookEntity book = bookService.findBookById(bookId);
        CategoryEntity category = book.getCategory();
        model.addAttribute("book", book);
        model.addAttribute("bookRelated", bookService.findBookByCategory(category));
        model.addAttribute("category", categoryService.listCategory());
        return "book-detail";
    }

    @RequestMapping("/addCart/{id}")
    public String addCart(HttpSession session, HttpServletRequest request, @PathVariable("id") int id) {
        BookEntity book = bookService.findBookById(id);
        Double sumTotal = 0.0;
        Double sumDiscountAmount = 0.0;
        int quantityItems = 0;
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        if (book != null) {
            if (order == null) {
                order = new OrderEntity();
                List<OrderDetailEntity> listOrderDetail = new ArrayList<>();
                OrderDetailEntity orderDetail = new OrderDetailEntity();
                orderDetail.setQuantity(1);
                orderDetail.setBook(book);
                orderDetail.setAmount(book.getPrice());
                orderDetail.setDiscountAmount(book.getPrice() * book.getPromotion().getDiscount());
                listOrderDetail.add(orderDetail);
                order.setOrderDetails(listOrderDetail);
                order.setTotalAmount(book.getPrice());
                order.setTotalDiscountAmount(book.getPrice() * book.getPromotion().getDiscount());
            } else {
                List<OrderDetailEntity> listOrderDetail = order.getOrderDetails();
                if (!CollectionUtils.isEmpty(listOrderDetail)) {
                    boolean isExist = false;
                    for (OrderDetailEntity detail : listOrderDetail) {
                        if (detail.getBook().getId() == book.getId()) {
                            int newQuantity = detail.getQuantity() + 1;
                            detail.setQuantity(newQuantity);
                            detail.setAmount(newQuantity * book.getPrice());
                            detail.setDiscountAmount(newQuantity * book.getPrice() * book.getPromotion().getDiscount());
                            isExist = true;
                            break;
                        }
                    }
                    if (!isExist) {
                        OrderDetailEntity newDetail = new OrderDetailEntity();
                        newDetail.setBook(book);
                        newDetail.setQuantity(1);
                        newDetail.setAmount(book.getPrice());
                        newDetail.setDiscountAmount(book.getPrice() * book.getPromotion().getDiscount());
                        newDetail.setOrder(order);
                        listOrderDetail.add(newDetail);
                    }

                } else {
                    OrderDetailEntity newDetail = new OrderDetailEntity();
                    newDetail.setBook(book);
                    newDetail.setQuantity(1);
                    newDetail.setAmount(book.getPrice());
                    newDetail.setDiscountAmount(book.getPrice() * book.getPromotion().getDiscount());
                    newDetail.setOrder(order);
                    listOrderDetail.add(newDetail);
                }
                order.setOrderDetails(listOrderDetail);

                for (OrderDetailEntity quan : order.getOrderDetails()) {
                    quantityItems = quantityItems + quan.getQuantity();
                    sumTotal = sumTotal + quan.getAmount();
                    sumDiscountAmount = sumDiscountAmount + quan.getDiscountAmount();
                }
                order.setTotalAmount(sumTotal);
                order.setTotalDiscountAmount(sumDiscountAmount);

            }
            order.setOrderDate(new Date());
            session.setAttribute("order", order);
            session.setAttribute("quantityItems", quantityItems);
        }
        return "redirect:" + request.getHeader("Referer");
    }

    @RequestMapping("/removeDetail/{bookId}")
    public String removeBookFromCart(HttpSession session, HttpServletRequest request, @PathVariable("bookId") int bookId) {
        Double sumTotal = 0.0;
        Double sumDiscount = 0.0;
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        BookEntity book = bookService.findBookById(bookId);
        if (order != null && book != null) {
            List<OrderDetailEntity> listDetail = order.getOrderDetails();
            if (!listDetail.isEmpty()) {
                for (OrderDetailEntity detail : listDetail) {
                    if (detail.getBook().getId() == bookId) {
                        listDetail.remove(detail);
                        break;
                    }
                }
            }

            order.setOrderDetails(listDetail);
            for (OrderDetailEntity quan : listDetail) {
                sumTotal = sumTotal + quan.getAmount();
                sumDiscount = sumDiscount + quan.getDiscountAmount();
            }
            order.setTotalAmount(sumTotal);
            order.setTotalDiscountAmount(sumDiscount);
            session.setAttribute("order", order);
            session.setAttribute("quantityItems", order.getOrderDetails().size());
        }
        return "redirect:" + request.getHeader("Referer");
    }

    @RequestMapping("/order-detail")
    public String viewOrderDetail(HttpSession session) {
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        if (order != null) {
            List<OrderDetailEntity> listDetail = order.getOrderDetails();
            order.setOrderDetails(listDetail);
        }
        session.setAttribute("order", order);
        return "order-detail";
    }

    @RequestMapping("/update-cart")
    public String updateCart(HttpSession session, HttpServletRequest request, @RequestParam("bookId") int bookId,
            @RequestParam("quantity") int quantity) {
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        BookEntity book = bookService.findBookById(bookId);
        if (order != null) {
            List<OrderDetailEntity> listDetail = order.getOrderDetails();
            for (OrderDetailEntity detail : listDetail) {
                if (detail.getBook().getId() == bookId) {
                    detail.setQuantity(quantity);
                    detail.setAmount(book.getPrice() * quantity);
                    detail.setDiscountAmount(book.getPrice() * book.getPromotion().getDiscount() * quantity);
                    break;
                }
            }
            order.setOrderDetails(listDetail);
            Double sumTotal = 0.0;
            Double sumDiscount = 0.0;
            for (OrderDetailEntity quan : listDetail) {
                sumTotal = sumTotal + quan.getAmount();
                sumDiscount = sumDiscount + quan.getDiscountAmount();
            }
            order.setTotalAmount(sumTotal);
            order.setTotalDiscountAmount(sumDiscount);
        }
        session.setAttribute("order", order);
        return "redirect:/order-detail";
    }

    @RequestMapping("/checkOut")
    public String viewCheckOut(HttpSession session, HttpServletRequest request) {
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        if (order != null) {
            session.setAttribute("order", order);
        }
        return "check-out";
    }

    @RequestMapping("/do-checkOut")
    public String doCheckOut(HttpSession session, HttpServletRequest request, @ModelAttribute("order-info") Personal person) throws MessagingException, IOException {
        DecimalFormat format = new DecimalFormat("###, ###");
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        if (order != null) {
            order.setAddress(person.getAddress());
            order.setBirthDate(person.getBirthDate());
            order.setEmail(person.getEmail());
            order.setGender(person.getGender());
            order.setName(person.getName());
            order.setPhoneNumber(person.getPhoneNumber());
            orderService.saveOrder(order);

            List<OrderDetailEntity> listDetail = orderDetailService.findOrderDetailByOrder(order);

            MimeMessage message = mailSender.createMimeMessage();
            boolean multipart = true;
            MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "UTF-8");
            String link = request.getRequestURL().toString().replace("do-checkOut", "mail-sender/" + order.getOrderId());
            String data = "";
            Double sumTotal = 0.0;
            Double sumDiscount = 0.0;
            for (int i = 0; i < listDetail.size(); i++) {
                sumTotal = sumTotal + listDetail.get(i).getAmount();
                sumDiscount = sumDiscount + listDetail.get(i).getDiscountAmount();
                Double unitPrice = listDetail.get(i).getAmount() - listDetail.get(i).getDiscountAmount();
                data = data + "<tr>\n"
                        + "                    <td>" + listDetail.get(i).getBook().getName() + "</td>\n"
                        + "                    <td>" + format.format(listDetail.get(i).getBook().getPrice()) + " VNĐ" + "</td>\n"
                        + "                    <td>" + listDetail.get(i).getBook().getPromotion().getDiscount() * 100 + " %" + "</td>\n"
                        + "                    <td>" + listDetail.get(i).getQuantity() + "</td>\n"
                        + "                    <td>" + format.format(unitPrice) + " VNĐ" + "</td>\n"
                        + "                </tr>";
            }
            Double amountMoneyPay = sumTotal - sumDiscount;

            String htmlMsg = "<html>\n"
                    + "    <head>\n"
                    + "        <title>email-sender</title>\n"
                    + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n"
                    + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                    + "    </head>\n"
                    + "    <body>\n"
                    + "        <div>" + "<h3>Dear " + order.getName() + " !</h3>" + "<p>Thank you for order at BookStore! We have received your order.</p>"
                    + "<p>This is your order details :</p>"
                    + "<table border style=\"background-color: #d4edda\">\n"
                    + "            <tr style=\"background-color: #4297d7\">\n"
                    + "                    <th>Book Name</th>\n"
                    + "                    <th>Price</th>\n"
                    + "                    <th>Discount</th>\n"
                    + "                    <th>Quantity</th>\n"
                    + "                    <th>Unit Price</th>\n"
                    + "                </tr>\n" + data + "<tr style=\"background-color: #007bff\">\n"
                    + "                    <td colspan=\"4\" style=\"text-align: right\">Sum Total</td>\n"
                    + "                    <td>" + format.format(sumTotal) + " VNĐ" + "</td>\n"
                    + "                </tr>" + "<tr style=\"background-color: #007bff\">\n"
                    + "                    <td colspan=\"4\" style=\"text-align: right\">Discount Amount</td>\n"
                    + "                    <td>" + format.format(sumDiscount) + " VNĐ" + "</td>\n"
                    + "                </tr>" + "<tr style=\"background-color: #007bff\">\n"
                    + "                    <td colspan=\"4\" style=\"text-align: right\">Amount To Pay</td>\n"
                    + "                    <td>" + format.format(amountMoneyPay) + " VNĐ" + "</td>\n"
                    + "                </tr>"
                    + "            </table>"
                    + "           <p style='color: blue'> You can see more detail at my website : " + link + "</p>" + "</div>\n"
                    + "    </body>\n"
                    + "</html>";
            helper.setText(htmlMsg, true);
            helper.setTo(order.getEmail());
            helper.setSubject("Thank you for order");
            this.mailSender.send(message);
        }
        session.setAttribute("order", null);
        return "redirect:/home?message=Thank you for your order. Detailed order information has been sent to your email. Please check your email&&status=Order Success !";
    }

    @RequestMapping("/mail-sender/{orderId}")
    public String viewInfoMailResponse(Model model, @PathVariable("orderId") int orderId) {
        OrderEntity order = orderService.findOrderById(orderId);
        if (order != null) {
            List<OrderDetailEntity> orderDetails = orderDetailService.findOrderDetailByOrder(order);
            model.addAttribute("orders", order);
            model.addAttribute("orderDetails", orderDetails);
        }

        return "mail-sender";
    }

}
