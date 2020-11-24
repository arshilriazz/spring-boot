package com.arshil.springbootdemo.studentfee.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PasswordChecker {
    private String roll;
    private String oldPassword;
    private String newPassword;
    private String newPasswordChecker;
    public PasswordChecker() {
        //empty constructor
    }
}
