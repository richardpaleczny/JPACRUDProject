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
	public RPG searchForRPGByID(Integer id) {

		// This ensures that the id entered is valid, otherwise, we will return null
		// and the *RPGController* will set a boolean stating that the RPG was not
		// found
		Integer maxId = (Integer) em.createQuery("SELECT MAX(r.id) FROM RPG r")
				.getSingleResult();

		if (id <= maxId && (!(id <= 0))) {
			try {
				return em.createQuery("SELECT r FROM RPG r WHERE r.id = :id", RPG.class)
						.setParameter("id", id).getSingleResult();
			}
			// This is useful for when we delete an entry and try to grab a row from
			// the database in which that id no longer exists
			catch (Exception e) {
				return null;
			}
		} else {
			return null;
		}

	}

	@Override
	public List<RPG> returnRPGList() {
		return em.createQuery("SELECT r FROM RPG r", RPG.class).getResultList();
	}

	@Override
	public RPG createRPG(RPG rpg) {
		em.persist(rpg);
		em.flush();
		return rpg;
	}

}
