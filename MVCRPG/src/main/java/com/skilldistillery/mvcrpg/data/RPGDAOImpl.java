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
	public boolean createRPG(RPG rpg) {

		if (rpg.getUrlImage() == null || rpg.getUrlImage() == "") {
			rpg.setUrlImage("images/default.jpeg");
		}

		if (rpg.getUrlReview() == null || rpg.getUrlReview() == "") {
			rpg.setUrlReview("http://www.metacritic.com/");
		}

		em.persist(rpg);
		em.flush();

		if (em.find(RPG.class, rpg.getId()) != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean editRPG(Integer id, RPG rpg) {

		RPG rpgToUpdate = em.find(RPG.class, id);
		rpgToUpdate.setTitle(rpg.getTitle());
		rpgToUpdate.setDescription(rpg.getDescription());
		rpgToUpdate.setDeveloper(rpg.getDeveloper());
		rpgToUpdate.setPublisher(rpg.getPublisher());
		rpgToUpdate.setReleaseYear(rpg.getReleaseYear());

		if (rpg.getUrlImage() != null && rpg.getUrlImage() != "") {
			rpgToUpdate.setUrlImage(rpg.getUrlImage());
		} else {
			rpgToUpdate.setUrlImage("images/default.jpeg");
		}

		if (rpg.getUrlReview() != null && rpg.getUrlReview() != "") {
			rpgToUpdate.setUrlReview(rpg.getUrlReview());
		} else {
			rpgToUpdate.setUrlReview("http://www.metacritic.com/");
		}

		if (em.find(RPG.class, rpgToUpdate.getId()) != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean destroyRPG(RPG rpg) {

		em.remove(em.contains(rpg) ? rpg : em.merge(rpg));
		em.flush();

		if (em.find(RPG.class, rpg.getId()) == null) {
			return true;
		} else {
			return false;
		}

	}

}
