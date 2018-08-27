package com.skilldistillery.mvcrpg.controllers;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
			@RequestParam("updateID") Integer id, RedirectAttributes redir) {

		redir.addFlashAttribute("wasEditRPGButtonClicked", true);
		redir.addFlashAttribute("updateID", id);

		// boolean model value; true if edit succeeded, otherwise, false
		redir.addFlashAttribute("successfulEdit", dao.editRPG(id, rpgToUpdate));

		return "redirect:displayList.do";
	}
	// == End Edit Paths ==

	// == Start Add Paths ==
	// The purpose of this method is to set a boolean which the index.jsp page
	// will use to decide whether or not to show an input form for adding an RPG
	// to the database
	@RequestMapping("displayAddRPGForm.do")
	public String displayAddRPGForm(Model model) {
		model.addAttribute("wasButtonClickedForAddRPG", true);
		// So that we can get the Spring forms workings (from *index.jsp*)
		model.addAttribute("rpg", new RPG());
		return "index";
	}

	@RequestMapping(path = "addRPG.do", method = RequestMethod.POST)
	public String addRPG(Model model, @ModelAttribute("rpg") @Valid RPG rpg,
			BindingResult result) {

		// boolean to use in conjunction with successfulAddition so that we don't
		// display "Unable to add RPG to database" by default
		model.addAttribute("wasAddRPGButtonClicked", true);

		if (result.hasErrors()) {
			model.addAttribute("wasButtonClickedForAddRPG", true);
			return "index";
		}

		// Add the user-input RPG to the model - add a boolean to model; if the
		// addition was successful, return true, otherwise, return false
		model.addAttribute("successfulAddition", dao.createRPG(rpg));

		return "index";
	}
	// == End Add Paths ==

	@RequestMapping(path = "deleteRPG.do", method = RequestMethod.POST)
	public String deleteRPG(Model model, @RequestParam("deleteID") Integer id) {

		// For use on the index page
		model.addAttribute("wasDeleteButtonClicked", true);

		RPG rpgToDelete = dao.searchForRPGByID(id);
		model.addAttribute("rpgTitle", rpgToDelete.getTitle());

		// boolean return value; true if delete successful, otherwise false
		model.addAttribute("successfulDeletion", dao.destroyRPG(rpgToDelete));

		return "index";
	}

}
