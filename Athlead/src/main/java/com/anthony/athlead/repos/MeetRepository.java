package com.anthony.athlead.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.anthony.athlead.models.Meet;

public interface MeetRepository extends CrudRepository<Meet, Long> {
	List<Meet> findAll();
}
