package com.skilldistillery.mvcrpg.data;

import java.util.List;

import com.skilldistillery.rpg.entities.RPG;

public interface RPGDAO {

	public RPG searchForRPGByID(Integer id);

	public List<RPG> returnRPGList();

	public RPG createRPG(RPG rpg);
	
	public RPG editRPG(Integer id, RPG rpg);
	
	public boolean destroyRPG(RPG rpg);

}
