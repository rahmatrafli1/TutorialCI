<?php

class Feedback extends CI_Controller
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
        $data['feedbacks'] = $this->Feedback_model->get();
        $data['current_user'] = $this->Auth_model->current_user();
        if (count($data['feedbacks']) <= 0) {
            $this->load->view('admin/feedback_empty', $data);
        } else {
            $this->load->view('admin/feedback_list', $data);
        }
    }

    public function delete($id = null)
    {
        if (!$id) {
            show_404();
        }

        $this->Feedback_model->delete($id);

        $this->session->set_flashdata('message', 'Data was deleted');
        redirect(site_url('admin/feedback'));
    }
}
