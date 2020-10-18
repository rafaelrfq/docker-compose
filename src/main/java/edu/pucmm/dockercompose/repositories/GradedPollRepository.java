package edu.pucmm.dockercompose.repositories;

import edu.pucmm.dockercompose.entities.GradedPoll;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface GradedPollRepository extends JpaRepository<GradedPoll, Long> {
    GradedPoll findById(long id);
    List<GradedPoll> findByDateCreated(LocalDate date);
    List<GradedPoll> findAll();
}
