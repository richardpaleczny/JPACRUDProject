package com.skilldistillery.mvcrpg.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.mvcrpg.data.RPGDAO;
import com.skilldistillery.rpg.entities.RPG;

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
		model.addAttribute("wasButtonClickedForListRPGs", true);
		return "index";
	}

	// == Start Edit Paths ==
	@RequestMapping("goToEditPage.do")
	public String displayEditPage(Model model) {
		return "edit";
	}

	@RequestMapping(path = "editRPG.do", method = RequestMethod.POST)
	public String editRPG(Model model) {

		return "edit";
	}
	// == End Edit Paths ==

	// == Start Add Paths ==
	// The purpose of this method is to set a boolean which the index.jsp page
	// will use to decide whether or not to show an input form for adding an RPG
	// to the database
	@RequestMapping("displayAddRPGForm.do")
	public String displayAddRPGForm(Model model) {
		model.addAttribute("wasButtonClickedForAddRPG", true);
		return "index";
	}

	@RequestMapping(path = "addRPG.do", method = RequestMethod.POST)
	public String addRPG(Model model, RPG rpg) {
		dao.createRPG(rpg);
		return "index";
	}
	// == End Add Paths ==
}
