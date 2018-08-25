package com.skilldistillery.mvcrpg.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.rpg.entities.RPG;

@Transactional
@Component
public class RPGDAOImpl implements RPGDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<RPG> index() {
		String qs = "SELECT r FROM RPG r";
		return em.createQuery(qs, RPG.class).getResultList();
	}

}
