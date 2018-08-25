package com.skilldistillery.mvcrpg.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.mvcrpg.data.RPGDAO;
import com.skilldistillery.rpg.entities.RPG;

@Controller
public class RPGController {

	@Autowired
	private RPGDAO dao;

	@RequestMapping("index.do")
	public String index(Model model) {
		List<RPG> rpgList = dao.index();
		model.addAttribute("rpgList", rpgList);
		return "index";
	}

	@RequestMapping("details.do")
	public String details(Model model) {

		List<RPG> rpgList = dao.index();
		model.addAttribute("rpgList", rpgList);
		return "details";

	}

}
