package com.arshil.springbootdemo.studentfee.service.implementation;

import com.arshil.springbootdemo.studentfee.entity.Student;
import com.arshil.springbootdemo.studentfee.entity.User;
import com.arshil.springbootdemo.studentfee.repository.StudentRepository;
import com.arshil.springbootdemo.studentfee.repository.UserRepository;
import com.arshil.springbootdemo.studentfee.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Optional;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private UserRepository userRepository;

    StudentServiceImpl() { }

    @Override
    public List<Student> findAll() {
        return studentRepository.findAllByOrderByRoll();
    }

    @Override
    public List<Student> findByRollInStudents(String roll) {
        return studentRepository.findByRoll(roll);
    }
    @Override
    public Student findById(int theId) {
        Optional<Student> result = studentRepository.findById(theId);
        return result.orElse(null);
    }

    @Override
    public void save(Student student) {
        studentRepository.save(student);
    }

    @Override
    public void deleteById(int theId) {
        studentRepository.deleteById(theId);
    }

    @Override
    public User findByRoll(String roll) {
        Optional<User> user = Optional.ofNullable(userRepository.findByUsername(roll));
        return user.orElse(null);
    }

    @Override
    public void save(User user) {
        userRepository.save(user);
    }

}
