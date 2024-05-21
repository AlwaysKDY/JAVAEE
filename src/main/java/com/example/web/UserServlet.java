package com.example.web;

import com.example.model.User;
import com.example.service.UserService;
import com.example.util.PasswordEncryptor;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.UUID;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

    @EJB
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("register".equals(action)) {
            registerUser(req, resp);
        } else if ("login".equals(action)) {
            loginUser(req, resp);
        } else if ("update".equals(action)) {
            updateUser(req, resp);
        } else if ("recover".equals(action)) {
            recoverPassword(req, resp);
        }
    }

    private void registerUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String phoneNumber = req.getParameter("phoneNumber");

        StringBuilder errorMsg = new StringBuilder();

        if (username == null || username.isEmpty()) {
            errorMsg.append("用户名不能为空。<br>");
        }

        if (password == null || password.isEmpty()) {
            errorMsg.append("密码不能为空。<br>");
        } else if (!password.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")) {
            errorMsg.append("密码必须为至少8个字符，并包含字母和数字。<br>");
        }

        if (email == null || email.isEmpty()) {
            errorMsg.append("邮箱不能为空。<br>");
        }

        if (phoneNumber == null || phoneNumber.isEmpty()) {
            errorMsg.append("电话号码不能为空。<br>");
        }

        if (userService.findUserByUsername(username) != null) {
            errorMsg.append("用户名已存在。<br>");
        }

        if (userService.findUserByEmail(email) != null) {
            errorMsg.append("邮箱已存在。<br>");
        }

        if (userService.findUserByPhoneNumber(phoneNumber) != null) {
            errorMsg.append("电话号码已存在。<br>");
        }

        if (errorMsg.length() > 0) {
            req.setAttribute("errorMsg", errorMsg.toString());
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        String recoveryKey = UUID.randomUUID().toString();

        User user = new User();
        user.setUsername(username);
        user.setPassword(PasswordEncryptor.encrypt(password));
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setRecoveryKey(recoveryKey);
        user.setRegistrationDate(new Timestamp(System.currentTimeMillis()));

        userService.registerUser(user);

        // 重定向到包含密钥提示信息的页面
        req.setAttribute("recoveryKey", recoveryKey);
        req.getRequestDispatcher("registerSuccess.jsp").forward(req, resp);
    }

    private void loginUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (userService.verifyUser(username, password)) {
            req.getSession().setAttribute("user", userService.findUserByUsername(username));
            resp.sendRedirect("index.jsp");
        } else {
            req.setAttribute("errorMsg", "用户名或密码无效。");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String newPhoneNumber = req.getParameter("newPhoneNumber");
        String newUsername = req.getParameter("newUsername");

        StringBuilder errorMsg = new StringBuilder();

        User user = userService.findUserByEmail(email);

        if (user == null) {
            errorMsg.append("未找到对应的邮箱账户。<br>");
        } else if (!PasswordEncryptor.verify(password, user.getPassword())) {
            errorMsg.append("密码不正确。<br>");
        } else {
            if (userService.findUserByPhoneNumber(newPhoneNumber) != null) {
                errorMsg.append("电话号码已存在。<br>");
            }
            if (userService.findUserByUsername(newUsername) != null) {
                errorMsg.append("用户名已存在。<br>");
            }
        }

        if (errorMsg.length() > 0) {
            req.setAttribute("errorMsg", errorMsg.toString());
            req.getRequestDispatcher("profile.jsp").forward(req, resp);
            return;
        }

        user.setPhoneNumber(newPhoneNumber);
        user.setUsername(newUsername);
        userService.updateUser(user);

        req.setAttribute("message", "信息更新成功。");
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }

    private void recoverPassword(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String email = req.getParameter("email");
        String recoveryKey = req.getParameter("recoveryKey");
        String newPassword = req.getParameter("newPassword");

        User user = userService.findUserByEmailAndRecoveryKey(email, recoveryKey);

        if (user != null) {
            if (!newPassword.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")) {
                req.setAttribute("errorMsg", "密码必须为至少8个字符，并包含字母和数字。");
                req.getRequestDispatcher("recover.jsp").forward(req, resp);
                return;
            }
            user.setPassword(PasswordEncryptor.encrypt(newPassword));
            userService.updateUser(user);
            req.setAttribute("message", "密码已成功更新，请使用新密码登录。");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            req.setAttribute("errorMsg", "邮箱或密码密钥无效。");
            req.getRequestDispatcher("recover.jsp").forward(req, resp);
        }
    }
}
