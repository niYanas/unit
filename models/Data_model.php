<?php

use LDAP\Result;

class Data_model extends CI_Model{

    public function get_data(){
        $this->db->select('*');
        $this->db->from('indikator');
        $this->db->join('indikator_child', 'id = indikator_id');
        $this->db->join('unit', 'id = unit_id');
        $query = $this->db->get();
        return $query->result();
    }

    public function tambah(){
        $this->db->trans_start();
        $id = $this->db->insert_id();
        
        $indikator = [
            'id' => $id,
            'standar' => $this->input->post('standar', true),
            'pencapaian' => $this->input->post('pencapaian', true),
            'ket' => $this->input->post('ket', true),
        ];
        $this->db->insert('indikator', $indikator);
        
        $indikatorChild = [
            'ind_data_id' => $id,
            'judul'=> $this->input->post('judul', true),
            'numerator'=> $this->input->post('numerator', true),
            'denumerator'=> $this->input->post('denumerator', true),
            'indikator_id' => $indikator['id'],
        ];
        $this->db->insert('indikator_child', $indikatorChild);
        return $id;
            
        $this->db->trans_complete();

        if ($this->db->trans_status() === FALSE){
            echo 'rollback';

        }else{
            echo 'commited';
        }
    }
}
?>