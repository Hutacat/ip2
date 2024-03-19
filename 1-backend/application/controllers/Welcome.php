<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	
	public function index()
	{
		$this->load->model("Product_Category_Model");
		$items = $this->Product_Category_Model->getAll();

		$this->load->model("Branch_Model");
		$branches = $this->Branch_Model->getAll();

		$viewData= new stdClass();
		$viewData->items=$items;
		$viewData->branches=$branches;

		$this->load->view('welcome_message',$viewData);
	}
}
