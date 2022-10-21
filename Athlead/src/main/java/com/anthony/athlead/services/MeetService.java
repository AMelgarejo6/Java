package com.anthony.athlead.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anthony.athlead.models.Meet;
import com.anthony.athlead.repos.MeetRepository;

@Service
public class MeetService {
	@Autowired
	private MeetRepository meetRepo;
	
	public List<Meet> allMeets(){
		return meetRepo.findAll();
	}
	
	public Meet createMeet(Meet m) {
		return meetRepo.save(m);
	}
	
	public Meet findMeet(Long id) {
		Optional<Meet> optionalMeet = meetRepo.findById(id);
		if(optionalMeet.isPresent()) {
			return optionalMeet.get();
		}
		else {
			return null;
		}
	}
	
	public void deleteMeet(Long id) {
		meetRepo.deleteById(id);
	}
	
	public Meet update(Meet meet) {
		return meetRepo.save(meet);
	}
}
