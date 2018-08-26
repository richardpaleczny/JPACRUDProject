package com.skilldistillery.mvcrpg.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String details(Model model,
			@RequestParam(value = "rpgID", defaultValue = "0") Integer id) {

		// This will only happen if id is given the default value, which is 0. If
		// this is the case, then it must mean that the redirect from
		// *displayEditPage()* method has occurred. In that case, it also means that
		// the redirect provided a flash attribute to take the place of the id
		// value, which means that we can use that flash attribute to set the id
		// field.
		//
		// But why is this happening? Because I have it such that the user can edit
		// the RPG either from the drop down film list or from the details page. If
		// using the latter, then the flash attribute id for the RPG on the details
		// page is provided, otherwise, use the id of the RPG from the list (on
		// index.jsp)
		Map<String, Object> modelMap = model.asMap();
		if (id == 0 && modelMap.get("detailsEditID") != null) {
			id = (Integer) modelMap.get("detailsEditID");
		}

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
	@RequestMapping("displayEdit.do")
	public String displayEditPage(RedirectAttributes redir,
			@RequestParam(value = "listEditID",
					defaultValue = "0") Integer listEditID,
			@RequestParam(value = "detailsEditID",
					defaultValue = "0") Integer detailsEditID) {

		if (listEditID != 0) {
			redir.addFlashAttribute("wasButtonClickedForEditRPG", true);
			redir.addFlashAttribute("listEditID", listEditID);
			return "redirect:displayList.do";
		} else if (detailsEditID != 0) {
			redir.addFlashAttribute("wasButtonClickedForEditRPG", true);
			redir.addFlashAttribute("detailsEditID", detailsEditID);
			return "redirect:details.do";
		} else {
			return "index";
		}

	}

	@RequestMapping(path = "editRPG.do", method = RequestMethod.POST)
	public String editRPG(Model model, RPG rpgToUpdate,
			@RequestParam("updateID") Integer id) {
		dao.editRPG(id, rpgToUpdate);
		return "index";
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

	@RequestMapping(path = "deleteRPG.do", method = RequestMethod.POST)
	public String deleteRPG(Model model, RPG rpg) {
		dao.destroyRPG(rpg);
		return "index";
	}
}
