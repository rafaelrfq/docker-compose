package edu.pucmm.dockercompose.services;

import edu.pucmm.dockercompose.entities.security.User;
import edu.pucmm.dockercompose.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServices {
    @Autowired
    UserRepository userRepository;

    @Transactional()
    public User createUser(User user){
        userRepository.save(user);
        return user;
    }

    public void activateUser(String username) {
        User user = userRepository.findByUsername(username);
        user.setActive(true);
        userRepository.save(user);
    }

    public void deactivateUser(String username) {
        User user = userRepository.findByUsername(username);
        user.setActive(false);
        userRepository.save(user);
    }

    public User findUserByUsername(String username) { return userRepository.findByUsername(username); }

    public List<User> usersWithUsername(){
        return userRepository.findAllByUsernameNotNull();
    }

    public List<User> usersAll(){
        return userRepository.findAll();
    }

}