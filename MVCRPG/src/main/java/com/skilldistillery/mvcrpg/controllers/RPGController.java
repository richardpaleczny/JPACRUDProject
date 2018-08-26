package com.skilldistillery.mvcrpg.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.mvcrpg.data.RPGDAO;

@Controller
public class RPGController {

	@Autowired
	private RPGDAO dao;

	@RequestMapping("index.do")
	public String index(Model model) {
		return "index";
	}

	@RequestMapping("details.do")
	public String details(Model model, @RequestParam("rpgID") Integer id) {

		if (dao.searchForRPGByID(id) != null) {
			model.addAttribute("RPG", dao.searchForRPGByID(id));
		} else {
			model.addAttribute("notFound", true);
		}

		return "details";
	}

	@RequestMapping("displayList.do")
	public String displayList(Model model) {

		model.addAttribute("rpgList", dao.returnRPGList());
		model.addAttribute("wasButtonClicked", true);

		return "index";
	}
}
