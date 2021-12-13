<?php

class Post extends CI_Controller
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
        $data['current_user'] = $this->Auth_model->current_user();
        $data['articles'] = $this->Article_model->get();
        if (count($data['articles']) <= 0) {
            $this->load->view('admin/post_empty.php', $data);
        } else {
            $this->load->view('admin/post_list.php', $data);
        }
    }

    public function new()
    {
        $data['current_user'] = $this->Auth_model->current_user();
        $this->load->library('form_validation');
        if ($this->input->method() === 'post') {
            // Lakukan validasi sebelum menyimpan ke model
            $rules = $this->Article_model->rules();
            $this->form_validation->set_rules($rules);

            if ($this->form_validation->run() === FALSE) {
                return $this->load->view('admin/post_new_form.php', $data);
            }

            // generate unique id and slug
            $id = uniqid('', true);
            $slug = url_title($this->input->post('title'), 'dash', TRUE) . '-' . $id;

            $article = [
                'id' => $id,
                'title' => $this->input->post('title'),
                'slug' => $slug,
                'content' => $this->input->post('content'),
                'draft' => $this->input->post('draft')
            ];

            $saved = $this->Article_model->insert($article);

            if ($saved) {
                $this->session->set_flashdata('message', 'Article was created');
                return redirect('admin/post');
            }
        }

        $this->load->view('admin/post_new_form.php', $data);
    }

    public function edit($id = null)
    {
        $data['current_user'] = $this->Auth_model->current_user();
        $data['article'] = $this->Article_model->find($id);
        $this->load->library('form_validation');

        if (!$data['article'] || !$id) {
            show_404();
        }

        if ($this->input->method() === 'post') {
            // lakukan validasi data seblum simpan ke model
            $rules = $this->Article_model->rules();
            $this->form_validation->set_rules($rules);

            if ($this->form_validation->run() === FALSE) {
                return $this->load->view('admin/post_edit_form.php', $data);
            }

            $article = [
                'id' => $id,
                'title' => $this->input->post('title'),
                'content' => $this->input->post('content'),
                'draft' => $this->input->post('draft')
            ];
            $updated = $this->Article_model->update($article);
            if ($updated) {
                $this->session->set_flashdata('message', 'Article was updated');
                redirect('admin/post');
            }
        }

        $this->load->view('admin/post_edit_form.php', $data);
    }

    public function delete($id = null)
    {
        if (!$id) {
            show_404();
        }

        $deleted = $this->Article_model->delete($id);
        if ($deleted) {
            $this->session->set_flashdata('message', 'Article was deleted');
            redirect('admin/post');
        }
    }
}
