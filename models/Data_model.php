<?php

use LDAP\Result;

class Data_model extends CI_Model{

    public function get_data(){
        $this->db->select('*');
        $this->db->from('unit');
        $this->db->join('indikator', 'unit.id = indikator.unit_id  ');
        $this->db->join('indikator_unit', 'indikator_id = indikator.id');
        $query = $this->db->get();
        return $query->result();
    }

    public function tambahIndikator(){

    $indikator = [
        'unit_id' => $this->input->post('unit_id'),
        'standar' => $this->input->post('standar'),
        'pencapaian' => $this->input->post('pencapaian'),
        'ket' => $this->input->post('ket'),
    ];
    $this->db->insert('indikator', $indikator);
    
    $last_id = $this->db->insert_id();

    $indikatorParam = ['judul'=> $this->input->post('judul')];

    $indikatorCount = count($indikatorParam);

    for ($i=0; $i < $indikatorCount; $i++) {
        $datas[$i] = [
            'judul'=> $this->input->post('judul'),
            'numerator'=> $this->input->post('numerator'),
            'denumerator'=> $this->input->post('denumerator'),
            'indikator_id' => $last_id,
        ];
        $this->db->insert('indikator_unit', $datas[$i]);
        }
    }

    public function tambahNilai()
    {
        $nilai = [
            'n_judul' => $this->input->post('nJudul'),
            'n_num' => $this->input->post('nNum'),
            'n_denum' => $this->input->post('nDenum'),
            'unit_id' => $this->input->post('unit_id'),
            'indikator_id' => $this->input->post('indikator_id'),
            'tanggal' => date($this->input->post('tanggal')),
        ];
        $this->db->insert('data', $nilai);
    }

}
?>
