package com.skilldistillery.rpg.test;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.rpg.entities.RPG;

class RPGTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private RPG rpg;

	@BeforeEach
	public void setUp() throws Exception {

		emf = Persistence.createEntityManagerFactory("RPG");
		em = emf.createEntityManager();
		rpg = em.find(RPG.class, 1);

	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	void test_rpg_mappings() {

		assertEquals("Diablo", rpg.getTitle());

	}

}
