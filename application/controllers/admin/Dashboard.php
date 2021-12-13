<?php

class Dashboard extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->Auth_model->current_user()) {
            redirect('auth/login');
        }
    }

    public function index()
    {
        $data = [
            "current_user" => $this->Auth_model->current_user(),
            "article_count" => $this->Article_model->count(),
            "feedback_count" => $this->Feedback_model->count()
        ];

        $this->load->view('admin/dashboard.php', $data);
    }
}
